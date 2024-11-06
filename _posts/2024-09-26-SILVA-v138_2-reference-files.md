---
layout: post
title: "README for the SILVA v138.2 reference files"
author: "PD Schloss"
date: "September 26, 2024"
---

The good people at [SILVA](http://arb-silva.de) have released a new version of the SILVA v138 (and v138.1) database. [My understanding](https://www.arb-silva.de/documentation/release-1382/) is that this update removed 13 sequences from v138. The biggest change was a number of modifications to the taxonomy including applying 6 taxonomic levels and using "Incertae Sedis" instead of "unclassified". A little bit of tweaking is needed to get their files to be compatible with mothur. This README document describes the process that I used to generate the [mothur-compatible reference files](http://www.mothur.org/wiki/Silva_reference_files).

Curation of references
----------------------

### Getting the data in and out of the ARB database

This README file explains how we generated the silva reference files for use with mothur's `classify.seqs` and `align.seqs` commands. I'll assume that you have a functioning copy of arb installed on your computer. For this README we are using version 6.0. First we need to download the database and decompress it. From the command line we do the following:

    wget -N https://www.arb-silva.de/fileadmin/silva_databases/release_138_2/ARB_files/SILVA_138.2_SSURef_NR99_03_07_24_opt.arb.gz
    gunzip SILVA_138.2_SSURef_NR99_03_07_24_opt.arb.gz
    arb SILVA_138.2_SSURef_NR99_03_07_24_opt.arb

This will launch us into the arb environment with the ''Ref NR 99'' database opened. This database has 510,495 sequences within it that are not more than 99% similar to each other. The release notes for [this database](http://www.arb-silva.de/documentation/release-1382/) as well as the idea behind the [non-redundant database](http://www.arb-silva.de/projects/ssu-ref-nr/) are available from the silva website. Within arb do the following:

1.  Click the search button
2.  Set the first search field to 'ARB\_color' and set it to 1. Click on the equal sign until it indicates not equal (this removes low quality reads and chimeras)
3.  Click 'Search'. This yielded 446,875 hits
4.  Click the "Mark Listed Unmark Rest" button
5.  Close the "Search and Query" box
6.  Now click on File-\>export-\>export to external format
7.  In this box the `Export` option should be set to `marked`, `Filter` to `none`, and `Compression` should be set to `no`.
8.  In the field for `Choose an output file name make sure the path has you in the correct working directory and enter `silva.full_v138_2.fasta`.
9.  Select a format: fasta\_mothur.eft. This is a custom formatting file that I have created that includes the sequences accession number and it's taxonomy across the top line. To create one for you will need to create `fasta_mothur.eft` in the `$ARBHOME/lib/export/` folder with the following:


	```bash
	SUFFIX          fasta
	BEGIN
	>*(acc).*(name)\t*(align_ident_slv)\t*(tax_slv);
	*(|export_sequence)
	```

1.  Save this as silva.full\_v138\_2.fasta
1.  You can now quit arb.


### Screening the sequences

Now we need to screen the sequences for those that span the 27f and 1492r primer region, have 5 or fewer ambiguous base calls, and that are unique. We'll also extract the taxonomic information from the header line. Run the following commands from a bash terminal:

```
#Convert from RNA to DNA sequences...
sed '/^[^>]/s/[Uu]/T/g' silva.full_v138_2.fasta > silva.full_v138_2_dna.fasta

mothur "#screen.seqs(fasta=silva.full_v138_2_dna.fasta, start=1044, end=43116, maxambig=5);
        pcr.seqs(start=1044, end=43116, keepdots=T);
        degap.seqs();
        unique.seqs();"

#identify the unique sequences without regard to their alignment
grep ">" silva.full_v138_2_dna.good.pcr.ng.unique.fasta | cut -f 1 | cut -c 2- > silva.full_v138_2_dna.good.pcr.ng.unique.accnos

#get the unique sequences without regard to their alignment
mothur "#get.seqs(fasta=silva.full_v138_2_dna.good.pcr.fasta, accnos=silva.full_v138_2_dna.good.pcr.ng.unique.accnos)"

#generate alignment file
mv silva.full_v138_2_dna.good.pcr.pick.fasta silva.nr_v138_2.align

#generate taxonomy file
grep '>' silva.nr_v138_2.align | cut -f1,3 | cut -f2 -d'>' > silva.nr_v138.full
```

The mothur commands above do several things. First the `screen.seqs` command removes sequences that are not full length and have more than 5 ambiguous base calls. Note: this will remove a number of Archaea since the ARB RN reference database lets in shorter (\>900 bp) archaeal 16S rRNA gene sequences. Second, `pcr.seqs` converts any base calls that occur before position 1044 and after 43116 to `.` to make them only span the region between the 27f and 1492r priming sites. Finally, it is possible that weird things happen in the alignments and so we unalign the sequences (`degap.seqs`) and identify the unique sequences (`unique.seqs`). We then convert the resulting fasta file into an accnos file so that we can go back into mothur and pull out the unique sequences from the aligned file (`get.seqs`).

### Formatting the taxonomy files

Now we want to make sure the taxonomy file is properly formatted for use with mothur. First we want to grab the SILVA taxa mapping file by running the following in `bash`:

```bash
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138_2/Exports/taxonomy/tax_slv_ssu_138.2.txt.gz
gunzip tax_slv_ssu_138.2.txt.gz
```

We'll run the following code from within R to clean up the taxa names and make sure everything has six levels:

```R
library(tidyverse)

desired_levels <- c("domain", "phylum", "class", "order", "family", "genus")
desired_levels_tbl <- tibble(
  tax_level = factor(desired_levels, desired_levels))

# this is their reference taxonomy with levels for each substring found
# in the database
tax_label_level <- read_tsv("tax_slv_ssu_138.2.txt", col_names = FALSE, 
                            col_type = cols(.default = col_character())) %>%
  select(tax_label = X1, tax_level = X3)


# this is the the full taxonoy for each sequence in the database
database_tax_label <- read_tsv("silva.nr_v138.full",
                               col_names = c("id", "tax_label"),
                               col_type = cols(.default = col_character()))

# these are the unique tax_label values found in database_tax_label
unique_tax_labels <- database_tax_label %>%
  select(tax_label) %>%
  distinct() %>%
  left_join(tax_label_level, by = "tax_label") %>%
  select(tax_label)


# now need to get each of the substrings found in unique_tax_labels and return
# the tax_level for each substring taxonomy
generate_substrings <- function(s) {
  words <- str_replace(s, ";$", "") |>
    str_split(";") |>
    unlist()
  
  substrings <- character(length(words))
  for(w in seq_along(words)){
    substrings[w] <- paste(paste(words[1:w], collapse = ";"), "", sep = ";")
  }
  substrings
}

# replace missing levels with insertae sedis of the previous good name with
# the taxonomic level appended
fill_ss_tbl <- function(ss_tbl) {
  
  if(nrow(ss_tbl) != 6) {
    
    ss_tbl <- ss_tbl %>%
      right_join(desired_levels_tbl, by = "tax_level")
    
    nas <- which(is.na(ss_tbl$substring))
    previous_good_string <- ""
    
    for(n in nas){
      if(!str_detect(ss_tbl[n - 1, "substring"], "_insertae_sedis_")){
        previous_good_string <- n - 1
      }
      
      ss_tbl[n, "substring"] <- paste0(ss_tbl[previous_good_string, "substring"],
                                       "_insertae_sedis_",
                                       ss_tbl[n, "tax_level"])
    }
  }
  
  str_replace_all(paste(paste(ss_tbl$substring, collapse = ";"), "", sep = ";"),
                  " ",
                  "_")
}


clean_tax_labels_lookup <- unique_tax_labels %>%
  mutate(substring = map(tax_label, generate_substrings)) %>% #generate substrs
  unnest(substring) %>%
  inner_join(tax_label_level, by = c("substring" = "tax_label")) %>%
  mutate(substring = str_replace(substring, "^.*?([^;]+);$", "\\1")) %>%
  filter(!str_detect(substring, "^Incertae Sedis$")) %>% 
  select(tax_label, substring, tax_level) %>%
  nest(data = -tax_label) %>%
  mutate(clean_tax_label = map_chr(data, ~fill_ss_tbl(.x))) %>%
  unnest(clean_tax_label) %>%
  select(-data)


left_join(database_tax_label, clean_tax_labels_lookup, by = "tax_label") %>%
  select(id, clean_tax_label) %>%
  write_tsv(file="silva.full_v138_2.tax", quote = "none", col_names = FALSE)
```

### Building the SEED references

The first thing to note is that SILVA does not release their SEED; it is private. By screening through the ARB databases we can attempt to recreate it. Our previous publications show that classify.seqs with the recreated SEED does an excellent job of realigning sequences to look like they would if you used SINA and the true SEED. Now we want to try to figure out which sequences are part of the seed. Earlier, when we exported the sequences from ARB, we included the align\_ident\_slv field from the database in our output. Let's generate an accnos file that contains the names of the sequences with 100% to the SEED database and then use mothur to generate SEED fasta and taxonomy files. While we're at it we'll also generate the nr\_238 taxonomy file as well. The following code will be run from within a bash terminal:

```
grep ">" silva.nr_v138_2.align | cut -f 1,2 | grep "\t100" | cut -f 1 | cut -c 2- > silva.seed_v138.accnos
mothur "#get.seqs(fasta=silva.nr_v138_2.align, taxonomy=silva.full_v138_2.tax, accnos=silva.seed_v138.accnos)"
mv silva.nr_v138_2.pick.align silva.seed_v138_2.align
mv silva.full_v138_2.pick.tax silva.seed_v138_2.tax

cp silva.full_v138_2.tax silva.nr_v138_2.tax
```

### Taxonomic representation

Let's look to see how many different taxa we have for each taxonomic level within the `silva.nr_v138_2.tax`, `silva.nr_v138_2.tax`. To do this we'll run the following in R:

```
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

nr.file <- "silva.nr_v138_2.tax"
nr.matrix <- matrix(rep(0,18), nrow=3)
nr.matrix[1,] <- getNumTaxaNames(nr.file, kingdoms[1])
nr.matrix[2,] <- getNumTaxaNames(nr.file, kingdoms[2])
nr.matrix[3,] <- getNumTaxaNames(nr.file, kingdoms[3])
rownames(nr.matrix) <- kingdoms
colnames(nr.matrix) <- tax.levels
nr.matrix
#           phyla class order family genus n.seqs
# Bacteria     96   249   660   1208  4554 145520
# Archaea      14    32    62    109   251   3744
# Eukaryota   116   343  1077   1863  2694  15032

seed.file <- "silva.seed_v138_2.tax"
seed.matrix <- matrix(rep(0,18), nrow=3)
seed.matrix[1,] <- getNumTaxaNames(seed.file, kingdoms[1])
seed.matrix[2,] <- getNumTaxaNames(seed.file, kingdoms[2])
seed.matrix[3,] <- getNumTaxaNames(seed.file, kingdoms[3])
rownames(seed.matrix) <- kingdoms
colnames(seed.matrix) <- tax.levels
seed.matrix
#          phyla class order family genus n.seqs
#Bacteria     63   148   344    615  1547   6714
#Archaea       8    19    29     38    61    132
#Eukaryota    48   120   311    602   883   1850

seed.matrix / nr.matrix
#              phyla     class     order    family     genus     n.seqs
#Bacteria  0.6562500 0.5943775 0.5212121 0.5091060 0.3397014 0.04613799
#Archaea   0.5714286 0.5937500 0.4677419 0.3486239 0.2430279 0.03525641
#Eukaryota 0.4137931 0.3498542 0.2887651 0.3231347 0.3277654 0.12307078
```

The Archaea take a beating and recall they lost a bunch of sequences in the initial steps since many of the arachaeal sequences in SILVA are between 900 and 1200 nt long. If you are interested in analyzing the Archaea and the Eukaryota, I would suggest duplicating my efforts here but modify the `screen.seqs` and `pcr.seqs` steps to target your region of interest.

Finally, we want to compress the resulting alignment and this README file into the full length and SEED archives using commands in the bash terminal:

```
tar cvzf silva.nr_v138_2.tgz silva.nr_v138_2.tax silva.nr_v138_2.align README.md
tar cvzf silva.seed_v138_2.tgz silva.seed_v138_2.tax silva.seed_v138_2.align README.md
```

Application
-----------

So... which to use for what application? If you have the RAM, I'd suggest using `silva.nr_v138_2.align` in `align.seqs`. It took about 10 minutes to read in the database file and a minute or so to align a 1000 full-length sequences if you only use a single processor. Here is an example workflow for use within mothur that will get you the V4 region of the 16S rRNA gene:

	mothur "#pcr.seqs(fasta=silva.nr_v138_2.align, start=11894, end=25319, keepdots=F);
	        unique.seqs()"

This will get you down to 106,985 unique sequences to then align against. Other tricks to consider would be to use `get.lineage` to pull out the reference sequences that are from the Bacteria, this will probably only reduce the size of the database by ~10%. You could also try using `filter.seqs` with vertical=T; however, that might be problematic if there are insertions in your sequences (can't know *a priori*). It's likely that you can just use the `silva.seed_v138_2.align` reference for aligning. For classifying sequences, I would strongly recommend using the `silva.nr_v138_2.align` and `silva.nr_v138_2.tax` references after running pcr.seqs on `silva.nr_v138_2.align`. I probably wouldn't advise using `unique.seqs` on the output.


Legalese
--------

If you are going to use the files generated in this README, you should be aware that this release is available under [a CC-BY license](https://www.arb-silva.de/silva-license-information).
