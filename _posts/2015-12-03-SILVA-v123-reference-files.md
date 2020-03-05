---
layout: post
title: "README for the SILVA v123 reference files"
author: "PD Schloss"
date: "December 3, 2015"
comments: true
---

The good people at [SILVA](http://arb-silva.de) have released a new version of the SILVA database. A little bit of tweaking is needed to get their files to be compatible with mothur. This README document describes the process that I used to generate the [mothur-compatible reference files](http://www.mothur.org/wiki/Silva_reference_files).

Curation of references
----------------------

### Getting the data in and out of the ARB database

This README file explains how we generated the silva reference files for use with mothur's classify.seqs and align.seqs commands. I'll assume that you have a functioning copy of arb installed on your comptuer. For this README we are using version 6.0. First we need to download the database and decompress it. From the command line we do the following:

    wget -N http://www.arb-silva.de/fileadmin/arb_web_db/release_123/ARB_files/SSURef_NR99_123_SILVA_12_07_15_opt.arb.tgz

    tar xvzf *arb.tgz
    arb SSURef_NR99_123_SILVA_12_07_15_opt.arb

This will launch us into the arb environment with the ''Ref NR 99'' database opened. This database has 597,607 sequences within it that are not more than 99% similar to each other. The release notes for [this database](http://www.arb-silva.de/documentation/release-123/) as well as the idea behind the [non-redundant database](http://www.arb-silva.de/projects/ssu-ref-nr/) are available from the silva website. Within arb do the following:

1.  Click the search button
2.  Set the first search field to 'ARB\_color' and set it to 1. Click on the equal sign until it indicates not equal (this removes low quality reads and chimeras)
3.  Click 'Search'. This yielded 526,361 hits
4.  Click the "Mark Listed Unmark Rest" button
5.  Close the "Search and Query" box
6.  Now click on File-\>export-\>export to external format
7.  In this box the `Export` option should be set to `marked`, `Filter` to `none`, and `Compression` should be set to `no`.
8.  In the field for `Choose an output file name enter` make sure the path has you in the `arb_ref_119` folder and enter `silva.full_v123.fasta`.
9.  Select a format: fasta\_mothur.eft. This is a custom formatting file that I have created that includes the sequences accession number and it's taxonomy across the top line. To create one for you will need to create `fasta_mothur.eft` in the `/opt/local/share/arb/lib/export/` folder with the following:


	```bash
	SUFFIX          fasta    
	BEGIN    
	>*(acc).*(name)\t*(align_ident_slv)\t*(tax_slv);    
	*(|export_sequence)    
	```

1.  Save this as silva.full\_v123.fasta  
1.  You can now quit arb.


### Screening the sequences

Now we need to screen the sequences for those that span the 27f and 1492r primer region, have 5 or fewer ambiguous base calls, and that are unique. We'll also extract the taxonomic information from the header line. Run the following commands from a bash terminal:  


	mothur "#screen.seqs(fasta=silva.full_v123.fasta, start=1044, end=43116, maxambig=5, processors=8);
	        pcr.seqs(start=1044, end=43116, keepdots=T);
	        degap.seqs();
	        unique.seqs();"

	grep ">" silva.full_v123.good.pcr.ng.unique.fasta | cut -f 1 | cut -c 2- > silva.full_v123.good.pcr.ng.unique.accnos

	mothur "#get.seqs(fasta=silva.full_v123.good.pcr.fasta, accnos=silva.full_v123.good.pcr.ng.unique.accnos)"

	#generate alignment file
	mv silva.full_v123.good.pcr.pick.fasta silva.nr_v123.align

	#generate taxonomy file
	grep "^>" silva.full_v123.fasta | cut -f 1,3 | cut -c 2- > silva.full_v123.tax.temp


The mothur commands above do several things. First the screen.seqs command removes sequences that are not full length and have more than 5 ambiguous base calls. Note: this will remove a number of Archaea since the ARB RN reference database lets in shorter (\>900 bp) archaeal 16S rRNA gene sequences. Second, pcr.seqs convert any base calls that occur before position 1044 and after 43116 to `.` to make them only span the region between the 27f and 1492r priming sites. Finally, it is possible that weird things happen in the alignments and so we unalign the sequences (degap.seqs) and identify the unique sequences (unique.seqs). We then convert the resulting fasta file into an accnos file so that we can go back into mothur and pull out the unique sequences from the aligned file (`get.seqs`).

### Formatting the taxonomy files

Now we want to make sure the taxonomy file is properly formatted for use with mothur. We'll run the following code from within R:

	tax <- read.table(file="silva.full_v123.tax.temp", sep="\t")
	tax$V2 <- gsub(" ", "_", tax$V2)  #convert any spaces to underscores
	tax$V2 <- gsub("uncultured;", "", tax$V2)   #remove any "uncultured" taxa names
	#tax$V2 <- paste0("Root;", tax$V2)   #pre-empt all classifications with the Root level.

	#we want to see whether everything has 7 (6) taxonomic levesl (Root to genus)
	getDepth <- function(taxonString){
	  initial <- nchar(taxonString)
	    removed <- nchar(gsub(";", "", taxonString))
	    return(initial-removed)
	}

	depth <- getDepth(tax$V2)
	bacteria <- grepl("Bacteria;", tax$V2)
	archaea <- grepl("Archaea;", tax$V2)
	eukarya <- grepl("Eukaryota;", tax$V2)

	tax[depth > 6 & bacteria,] #good to go
	tax[depth > 6 & archaea,]  #good to go
	tax[depth > 6 & eukarya,]  #eh, there's a lot here - will truncate to the pseudo genus level
	tax[depth > 6 & eukarya,2] <- gsub("([^;]*;[^;]*;[^;]*;[^;]*;[^;]*;[^;]*;).*", "\\1", tax[depth > 6 & eukarya,2])
	depth <- getDepth(tax$V2)
	tax[depth > 6 & eukarya,]  #good to go

	write.table(tax, file="silva.full_v123.tax", quote=F, row.names=F, col.names=F)

### Building the SEED references

The first thing to note is that SILVA does not release their SEED; it is private. By screening through the ARB databases we can attempt to recreate it. Our previous publications show that classify.seqs with the recreated SEED does an excellent job of realigning sequences to look like they would if you used SINA and the true SEED. Now we want to try to figure out which sequences are part of the seed. Earlier, when we exported the sequences from ARB, we included the align\_ident\_slv field from the database in our output. Let's generate an accnos file that contains the names of the sequences with 100% to the SEED database and then use mothur to generate SEED fasta and taxonomy files. While we're at it we'll also generate the nr\_123 taxonomy file as well. The following code will be run from within a bash terminal:

	grep ">" silva.nr_v123.align | cut -f 1,2 | grep "\t100" | cut -f 1 | cut -c 2- > silva.seed_v123.accnos
	mothur "#get.seqs(fasta=silva.nr_v123.align, taxonomy=silva.full_v123.tax, accnos=silva.seed_v123.accnos)"
	mv silva.nr_v123.pick.align silva.seed_v123.align
	mv silva.full_v123.pick.tax silva.seed_v123.tax

	mothur "#get.seqs(taxonomy=silva.full_v123.tax, accnos=silva.full_v123.good.pcr.ng.unique.accnos)"
	mv silva.full_v123.pick.tax silva.nr_v123.tax


### Taxonomic representation

Let's look to see how many different taxa we have for each taxonomic level within the `silva.full_v123.tax`, `silva.nr_v123.tax`, `silva.seed_v123.tax`. To do this we'll run the following in R:

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

	full.file <- "silva.full_v123.tax"
	full.matrix <- matrix(rep(0,18), nrow=3)
	full.matrix[1,] <- getNumTaxaNames(full.file, kingdoms[1])
	full.matrix[2,] <- getNumTaxaNames(full.file, kingdoms[2])
	full.matrix[3,] <- getNumTaxaNames(full.file, kingdoms[3])
	rownames(full.matrix) <- kingdoms
	colnames(full.matrix) <- tax.levels
	full.matrix
	#           phyla class order family genus n.seqs
	#Bacteria     66   169   321    654  2553 465754
	#Archaea      19    47    37     68   138  21597
	#Eukaryota    13    29    82    174   474  39010

	nr.file <- "silva.nr_v123.tax"
	nr.matrix <- matrix(rep(0,18), nrow=3)
	nr.matrix[1,] <- getNumTaxaNames(nr.file, kingdoms[1])
	nr.matrix[2,] <- getNumTaxaNames(nr.file, kingdoms[2])
	nr.matrix[3,] <- getNumTaxaNames(nr.file, kingdoms[3])
	rownames(nr.matrix) <- kingdoms
	colnames(nr.matrix) <- tax.levels
	nr.matrix
	#          phyla class order family genus n.seqs
	#Bacteria     64   159   310    622  2446 152308
	#Archaea      16    31    30     58   134   3901
	#Eukaryota    11    23    74    130   398  16209

	seed.file <- "silva.seed_v123.tax"
	seed.matrix <- matrix(rep(0,18), nrow=3)
	seed.matrix[1,] <- getNumTaxaNames(seed.file, kingdoms[1])
	seed.matrix[2,] <- getNumTaxaNames(seed.file, kingdoms[2])
	seed.matrix[3,] <- getNumTaxaNames(seed.file, kingdoms[3])
	rownames(seed.matrix) <- kingdoms
	colnames(seed.matrix) <- tax.levels
	seed.matrix
	#          phyla class order family genus n.seqs
	#Bacteria     52   101   193    387  1722  12083
	#Archaea       7    13    18     30    81    294
	#Eukaryota     7    14    25     47    86   2537

	nr.matrix / full.matrix
	#              phyla     class     order    family     genus    n.seqs
	#Bacteria  0.9696970 0.9408284 0.9657321 0.9510703 0.9580885 0.3270138
	#Archaea   0.8421053 0.6595745 0.8108108 0.8529412 0.9710145 0.1806269
	#Eukaryota 0.8461538 0.7931034 0.9024390 0.7471264 0.8396624 0.4155088

	seed.matrix / full.matrix
	#              phyla     class     order    family     genus    n.seqs
	#Bacteria  0.7878788 0.5976331 0.6012461 0.5917431 0.6745006 0.02594288
	#Archaea   0.3684211 0.2765957 0.4864865 0.4411765 0.5869565 0.01361300
	#Eukaryota 0.5384615 0.4827586 0.3048780 0.2701149 0.1814346 0.06503461

We see that our full-length database retains a significant majority of the taxa that were in the original NR database. The Archaea take a beating. If you are interested in analyzing the Eukaryota, I would suggest duplicating my efforts here but modify the `screen.seqs` and `pcr.seqs` steps to target your region of interest.

Finally, we want to compress the resulting alignment and this README file into the full length and SEED archives using commands in the bash terminal:

	tar cvzf silva.nr_v123.tgz silva.nr_v123.tax silva.nr_v123.align README.*
	tar cvzf silva.seed_v123.tgz silva.seed_v123.tax silva.seed_v123.align README.*

Application
-----------

So... which to use for what application? If you have the RAM, I'd suggest using `silva.nr_v123.align` in `align.seqs`. It took about 10 minutes to read in the database file and a minute or so to align a 1000 full-length sequences. Here is an example workflow for use within mothur that will get you the V4 region of the 16S rRNA gene:

	mothur "#pcr.seqs(fasta=silva.nr_v123.align, start=11894, end=25319, keepdots=F, processors=8);
	        unique.seqs()"

This will get you 104,711 unique sequences to then align against (meh.). Other tricks to consider would be to use `get.lineage` to pull out the reference sequences that are from the Bacteria, this will probably only reduce the size of the database by ~10%. You could also try using `filter.seqs` with vertical=T; however, that might be problematic if there are insertions in your sequences (can't know *a priori*). It's likely that you can just use the `silva.seed_v123.align` reference for aligning. For classifying sequences, I would strongly recommend using the `silva.nr_v123.align` and `silva.nr_v123.tax` references after running pcr.seqs on `silva.nr_v123.align`. I probably wouldn't advise using `unique.seqs` on the output.

Legalese
--------

If you are going to use the files generated in this README, you should be aware of [SILVA's dual use license](https://www.arb-silva.de/silva-license-information). We'll leave it to you to work out the details.
