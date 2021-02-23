---
layout: post
title: "README for the SILVA v138.1 reference files"
author: "PD Schloss"
date: "February 23, 2021"
---

The good people at [SILVA](http://arb-silva.de) have released a new version of the SILVA v138 database. My understanding is that this is a minor update to correct some taxonomic information. A little bit of tweaking is needed to get their files to be compatible with mothur. This README document describes the process that I used to generate the [mothur-compatible reference files](http://www.mothur.org/wiki/Silva_reference_files).

Curation of references
----------------------

### Getting the data in and out of the ARB database

This README file explains how we generated the silva reference files for use with mothur's `classify.seqs` and `align.seqs` commands. I'll assume that you have a functioning copy of arb installed on your computer. For this README we are using version 6.0. First we need to download the database and decompress it. From the command line we do the following:

    wget -N https://www.arb-silva.de/fileadmin/arb_web_db/release_138_1/ARB_files/SILVA_138.1_SSURef_NR99_12_06_20_opt.arb.gz
    gunzip SILVA_138.1_SSURef_NR99_05_01_20_opt.arb.gz
    arb SILVA_138.1_SSURef_NR99_12_06_20_opt.arb

This will launch us into the arb environment with the ''Ref NR 99'' database opened. This database has 510,508 sequences within it that are not more than 99% similar to each other. The release notes for [this database](http://www.arb-silva.de/documentation/release-1381/) as well as the idea behind the [non-redundant database](http://www.arb-silva.de/projects/ssu-ref-nr/) are available from the silva website. Within arb do the following:

1.  Click the search button
2.  Set the first search field to 'ARB\_color' and set it to 1. Click on the equal sign until it indicates not equal (this removes low quality reads and chimeras)
3.  Click 'Search'. This yielded 446,881 hits
4.  Click the "Mark Listed Unmark Rest" button
5.  Close the "Search and Query" box
6.  Now click on File-\>export-\>export to external format
7.  In this box the `Export` option should be set to `marked`, `Filter` to `none`, and `Compression` should be set to `no`.
8.  In the field for `Choose an output file name make sure the path has you in the correct working directory and enter `silva.full_v138_1.fasta`.
9.  Select a format: fasta\_mothur.eft. This is a custom formatting file that I have created that includes the sequences accession number and it's taxonomy across the top line. To create one for you will need to create `fasta_mothur.eft` in the `$ARBHOME/lib/export/` folder with the following:


	```bash
	SUFFIX          fasta
	BEGIN
	>*(acc).*(name)\t*(align_ident_slv)\t*(tax_slv);
	*(|export_sequence)
	```

1.  Save this as silva.full\_v138\_1.fasta
1.  You can now quit arb.


### Screening the sequences

Now we need to screen the sequences for those that span the 27f and 1492r primer region, have 5 or fewer ambiguous base calls, and that are unique. We'll also extract the taxonomic information from the header line. Run the following commands from a bash terminal:


	mothur "#screen.seqs(fasta=silva.full_v138_1.fasta, start=1044, end=43116, maxambig=5);
	        pcr.seqs(start=1044, end=43116, keepdots=T);
	        degap.seqs();
	        unique.seqs();"

	#identify the unique sequences without regard to their alignment
	grep ">" silva.full_v138_1.good.pcr.ng.unique.fasta | cut -f 1 | cut -c 2- > silva.full_v138_1.good.pcr.ng.unique.accnos

	#get the unique sequences without regard to their alignment
	mothur "#get.seqs(fasta=silva.full_v138_1.good.pcr.fasta, accnos=silva.full_v138_1.good.pcr.ng.unique.accnos)"

	#generate alignment file
	mv silva.full_v138_1.good.pcr.pick.fasta silva.nr_v138_1.align

	#generate taxonomy file
	grep '>' silva.nr_v138_1.align | cut -f1,3 | cut -f2 -d'>' > silva.nr_v138.full


The mothur commands above do several things. First the `screen.seqs` command removes sequences that are not full length and have more than 5 ambiguous base calls. Note: this will remove a number of Archaea since the ARB RN reference database lets in shorter (\>900 bp) archaeal 16S rRNA gene sequences. Second, `pcr.seqs` converts any base calls that occur before position 1044 and after 43116 to `.` to make them only span the region between the 27f and 1492r priming sites. Finally, it is possible that weird things happen in the alignments and so we unalign the sequences (`degap.seqs`) and identify the unique sequences (`unique.seqs`). We then convert the resulting fasta file into an accnos file so that we can go back into mothur and pull out the unique sequences from the aligned file (`get.seqs`).

### Formatting the taxonomy files

Now we want to make sure the taxonomy file is properly formatted for use with mothur. First we want to grab the SILVA taxa mapping file by running the following in `bash`:

```bash
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/taxonomy/tax_slv_ssu_138.1.txt.gz
gunzip tax_slv_ssu_138.1.txt.gz
```

Thanks to [Eric Collins at the University of Alaska Fairbanks](https://forum.mothur.org/t/18s-rdna-classification-issues/2303/14), we have some nice R code to map all of the taxa names to the six Linnean levels (kingdom, phylum, class, order, family, and genus). We'll run the following code from within R:

	map.in <- read.table("tax_slv_ssu_138.1.txt",header=F,sep="\t",stringsAsFactors=F)
	map.in <- map.in[,c(1,3)]
	colnames(map.in) <- c("taxlabel","taxlevel")
	<!-- map.in <- rbind(map.in, c("Bacteria;RsaHf231;", "phylum")) #wasn't in tax_slv_ssu_138.txt -->

	#fix Escherichia nonsense
	<!-- map.in$taxlevel[which(map.in$taxlabel=="Bacteria;Proteobacteria;Gammaproteobacteria;Enterobacteriales;Enterobacteriaceae;Escherichia;")] <- "genus" -->

	taxlevels <- c("root","domain","major_clade","superkingdom","kingdom","subkingdom","infrakingdom","superphylum","phylum","subphylum","infraphylum","superclass","class","subclass","infraclass","superorder","order","suborder","superfamily","family","subfamily","genus")
	taxabb <- c("ro","do","mc","pk","ki","bk","ik","pp","ph","bp","ip","pc","cl","bc","ic","po","or","bo","pf","fa","bf","ge")
	tax.mat <- matrix(data="",nrow=nrow(map.in),ncol=length(taxlevels))
	tax.mat[,1] <- "root"
	colnames(tax.mat) <- taxlevels

	outlevels <- c("domain","phylum","class","order","family","genus")

	for(i in 1:nrow(map.in)) {
		taxname <- unlist(strsplit(as.character(map.in[i,1]), split=';'))
		#print(taxname);

		while ( length(taxname) > 0) {
			#regex to look for exact match

			tax.exp <- paste(paste(taxname,collapse=";"),";",sep="")
			tax.match <- match(tax.exp,map.in$taxlabel)
			tax.mat[i,map.in[tax.match,2]] <- tail(taxname,1)
			taxname <- head(taxname,-1)
		}
	}

	for(i in 1:nrow(tax.mat)) {
		#this fills in the empty gaps by using the closest higher taxonomic level appended with an abbreviation for the current taxonomic level
		#if you don't want this behavior, cut it out
		for(j in 1:ncol(tax.mat)) {
			if(tax.mat[i,j] < 0) { tax.mat[i,j] <- paste(tmptax,taxabb[j],sep="_")}
			else { tmptax <- tax.mat[i,j]}
		}

		#this maps the new name to the input taxonomic levels
		map.in[i,"taxout"] <- paste(paste(tax.mat[i,outlevels],collapse=";"),";",sep="")
	}

	# replace spaces with underscores
	map.in$taxout <- gsub(" ","_",map.in$taxout)

	# bring in the old taxonomic levels from SILVA and remap them using the new levels
	tax.in <- read.table("silva.nr_v138.full",header=F,stringsAsFactors=F,sep="\t")
	colnames(tax.in) <- c("taxid","taxlabel")

	# Following line corrects the Bacteria;Bacteroidetes;Bacteroidia;Flavobacteriales;Flavobacteriaceae;Polaribacter;Polaribacter; problem
	<!-- tax.in$taxlabel <- gsub("Polaribacter;Polaribacter;", "Polaribacter;", tax.in$taxlabel) -->
	tax.in$taxlabel <- gsub(";[[:space:]]+$", ";", tax.in$taxlabel)

	tax.in$id <- 1:nrow(tax.in)

	tax.write <- merge(tax.in,map.in,all.x=T,sort=F)
	tax.write <- tax.write[order(tax.write$id),]


	#we want to see whether everything has 6 taxonomic level (kingdom to genus)
	getDepth <- function(taxonString){
		initial <- nchar(taxonString)
		removed <- nchar(gsub(";", "", taxonString))
		return(initial-removed)
	}

	depth <- getDepth(tax.write$taxout)
	summary(depth) #should all be 6 and there should be no NAs
	bacteria <- grepl("Bacteria;", tax.write$taxout)
	archaea <- grepl("Archaea;", tax.write$taxout)
	eukarya <- grepl("Eukaryota;", tax.write$taxout)

	tax.write[depth > 6 & bacteria,] #if zero, we're good to go
	tax.write[depth > 6 & archaea,]  #if zero, we're good to go
	tax.write[depth > 6 & eukarya,]  #if zero, we're good to go

	write.table(tax.write[,c("taxid","taxout")], file="silva.full_v138_1.tax",sep="\t",row.names=F,quote=F,col.names=F)


### Building the SEED references

The first thing to note is that SILVA does not release their SEED; it is private. By screening through the ARB databases we can attempt to recreate it. Our previous publications show that classify.seqs with the recreated SEED does an excellent job of realigning sequences to look like they would if you used SINA and the true SEED. Now we want to try to figure out which sequences are part of the seed. Earlier, when we exported the sequences from ARB, we included the align\_ident\_slv field from the database in our output. Let's generate an accnos file that contains the names of the sequences with 100% to the SEED database and then use mothur to generate SEED fasta and taxonomy files. While we're at it we'll also generate the nr\_138 taxonomy file as well. The following code will be run from within a bash terminal:

	grep ">" silva.nr_v138_1.align | cut -f 1,2 | grep "\t100" | cut -f 1 | cut -c 2- > silva.seed_v138.accnos
	mothur "#get.seqs(fasta=silva.nr_v138_1.align, taxonomy=silva.full_v138_1.tax, accnos=silva.seed_v138.accnos)"
	mv silva.nr_v138.pick.align silva.seed_v138_1.align
	mv silva.full_v138_1.pick.tax silva.seed_v138_1.tax

	mothur "#get.seqs(taxonomy=silva.full_v138_1.tax, accnos=silva.full_v138_1.good.pcr.ng.unique.accnos)"
	mv silva.full_v138_1.pick.tax silva.nr_v138_1.tax


### Taxonomic representation

Let's look to see how many different taxa we have for each taxonomic level within the `silva.nr_v138_1.tax`, `silva.nr_v138_1.tax`. To do this we'll run the following in R:

	getNumTaxaNames <- function(file, kingdom){
	  taxonomy <- read.table(file=file, row.names=1)
	  sub.tax <- as.character(taxonomy[grepl(kingdom, taxonomy[,1]),])

	  phyla <- as.vector(levels(as.factor(gsub("[^;]*;([^;]*;).*", "\\1", sub.tax))))
	  phyla <- sum(!grepl(kingdom, phyla))

	  class <- as.vector(levels(as.factor(gsub("[^;]*;[^;]*;([^;]*;).*", "\\1", sub.tax))))
	  class <- sum(!grepl(kingdom, class))

	  order <- as.vector(levels(as.factor(gsub("[^;]*;[^;]*;[^;]*;([^;]*;).*", "\\1", sub.tax))))
	  order <- sum(!grepl(kingdom, order))

	  family <- as.vector(levels(as.factor(gsub("[^;]*;[^;]*;[^;]*;[^;]*;([^;]*;).*", "\\1", sub.tax))))
	  family <- sum(!grepl(kingdom, family))

	  genus <- as.vector(levels(as.factor(gsub("[^;]*;[^;]*;[^;]*;[^;]*;[^;]*;([^;]*;).*", "\\1", sub.tax))))
	  genus <- sum(!grepl(kingdom, genus))

	  n.seqs <- length(sub.tax)
	  return(c(phyla=phyla, class=class, order=order, family=family, genus=genus, n.seqs=n.seqs))
	}

	kingdoms <- c("Bacteria", "Archaea", "Eukaryota")
	tax.levels <- c("phyla", "class", "order", "family", "genus", "n.seqs")

	nr.file <- "silva.nr_v138_1.tax"
	nr.matrix <- matrix(rep(0,18), nrow=3)
	nr.matrix[1,] <- getNumTaxaNames(nr.file, kingdoms[1])
	nr.matrix[2,] <- getNumTaxaNames(nr.file, kingdoms[2])
	nr.matrix[3,] <- getNumTaxaNames(nr.file, kingdoms[3])
	rownames(nr.matrix) <- kingdoms
	colnames(nr.matrix) <- tax.levels
	nr.matrix
	#          phyla class order family genus n.seqs
	#Bacteria     87   238   631   1139  3955 128884
	#Archaea      15    33    57     97   222   2846
	#Eukaryota    92   243   644    871  2682  14871


	seed.file <- "silva.seed_v138_1.tax"
	seed.matrix <- matrix(rep(0,18), nrow=3)
	seed.matrix[1,] <- getNumTaxaNames(seed.file, kingdoms[1])
	seed.matrix[2,] <- getNumTaxaNames(seed.file, kingdoms[2])
	seed.matrix[3,] <- getNumTaxaNames(seed.file, kingdoms[3])
	rownames(seed.matrix) <- kingdoms
	colnames(seed.matrix) <- tax.levels
	seed.matrix
	#          phyla class order family genus n.seqs
	#Bacteria     51   123   299    523  1182   5736
	#Archaea       7    17    23     30    44     81
	#Eukaryota    40    98   272    422   855   1824

	seed.matrix / nr.matrix
	#              phyla     class     order    family     genus     n.seqs
	#Bacteria  0.5862069 0.5168067 0.4738510 0.4591747 0.2988622 0.04450514
	#Archaea   0.4666667 0.5151515 0.4035088 0.3092784 0.1981982 0.02846100
	#Eukaryota 0.4347826 0.4032922 0.4223602 0.4845006 0.3187919 0.12265483


The Archaea take a beating and recall they lost a bunch of sequences in the initial steps since many of the arachaeal sequences in SILVA are between 900 and 1200 nt long. If you are interested in analyzing the Archaea and the Eukaryota, I would suggest duplicating my efforts here but modify the `screen.seqs` and `pcr.seqs` steps to target your region of interest.

Finally, we want to compress the resulting alignment and this README file into the full length and SEED archives using commands in the bash terminal:

	tar cvzf silva.nr_v138_1.tgz silva.nr_v138_1.tax silva.nr_v138_1.align README.md
	tar cvzf silva.seed_v138_1.tgz silva.seed_v138_1.tax silva.seed_v138_1.align README.md


Application
-----------

So... which to use for what application? If you have the RAM, I'd suggest using `silva.nr_v138_1.align` in `align.seqs`. It took about 10 minutes to read in the database file and a minute or so to align a 1000 full-length sequences if you only use a single processor. Here is an example workflow for use within mothur that will get you the V4 region of the 16S rRNA gene:

	mothur "#pcr.seqs(fasta=silva.nr_v138_1.align, start=11894, end=25319, keepdots=F);
	        unique.seqs()"

This will get you down to 106,985 unique sequences to then align against. Other tricks to consider would be to use `get.lineage` to pull out the reference sequences that are from the Bacteria, this will probably only reduce the size of the database by ~10%. You could also try using `filter.seqs` with vertical=T; however, that might be problematic if there are insertions in your sequences (can't know *a priori*). It's likely that you can just use the `silva.seed_v138_1.align` reference for aligning. For classifying sequences, I would strongly recommend using the `silva.nr_v138_1.align` and `silva.nr_v138_1.tax` references after running pcr.seqs on `silva.nr_v138_1.align`. I probably wouldn't advise using `unique.seqs` on the output.


Legalese
--------

If you are going to use the files generated in this README, you should be aware that this release is available under [a CC-BY license](https://www.arb-silva.de/silva-license-information).
