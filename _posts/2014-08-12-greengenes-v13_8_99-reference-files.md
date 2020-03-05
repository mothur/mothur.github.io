---
layout: post
title: "README for the greengenes v13_8_99 reference files"
author: "PD. Schloss"
date: "August 12, 2014"
comments: true
---
The greengenes developers periodically update their reference files on their ftp server. What follows is our process for generating a mothur-compatible set of files to generate a [greengenes taxonomy reference](http://www.mothur.org/wiki/Greengenes-formatted_databases) of those sequences.  

The original files are available from the greengenes ftp server:


{% highlight bash %}
wget -N ftp://greengenes.microbio.me/greengenes_release/gg_13_5/gg_13_8_otus.tar.gz
tar xvzf gg_13_8_otus.tar.gz

mkdir gg_13_8_99.refalign
cd gg_13_8_99.refalign
mv ../gg_13_8_otus/rep_set_aligned/99_otus.fasta gg_13_8_99.refalign
tar cvzf gg_13_8_99.refalign.tgz  gg_13_8_99.refalign ../README.*
cd ../
  
mkdir gg_13_8_99.taxonomy
cd gg_13_8_99.taxonomy
mv ../gg_13_8_otus/taxonomy/99_otu_taxonomy.txt ./
mv ../gg_13_8_otus/rep_set/99_otus.fasta gg_13_8_99.fasta

{% endhighlight %}

We need to modify the `99_otu_taxonomy.txt` taxonomy file to remove the spaces and labels such as `"p__", "c__", "o__", "f__", "g__", "s__"`. We'll do this with R:


{% highlight r %}
setwd("gg_13_8_99.taxonomy")
tax <- scan(file="99_otu_taxonomy.txt", sep="\t", what="", quiet=T)
nlines <- length(tax)
ids <- tax[1:nlines %% 2 == 1]     #the sequence names will be in the odd slots of the vector
tax.strings <- tax[1:nlines %% 2 == 0]  #the taxonomy strings will be in the even slots of the vector

tax.strings <- paste0(tax.strings, ";")      #make sure every sequence ends in a semi-colon
tax.strings <- gsub("; ", ";", tax.strings)  #remove the spaces from between the taxonomic levels
tax.strings <- gsub(".__;", "", tax.strings) #remove the unclassified taxonomic levels (e.g. "c__")
tax.strings <- gsub(" ", "_", tax.strings)   #if a taxonomic name has a space in it, replace it with an underscore
#tax.strings <- paste0("Root;", tax.strings)  #make every line start with the Root designation

updated.tax <- cbind(ids, tax.strings)
updated.tax <- updated.tax[order(as.numeric(updated.tax[,"ids"])),]  #order taxonomy file numerically
write.table(updated.tax, file="gg_13_8_99.gg.tax", row.names=F, col.names=F, quote=F, sep="\t")
{% endhighlight %}

Now we're ready to compress the taxonomy files:


{% highlight bash %}
cd gg_13_8_99.taxonomy
cp ../README.* ./
tar cvzf gg_13_8_99.taxonomy.tgz gg_13_8_99.* README.*
{% endhighlight %}
