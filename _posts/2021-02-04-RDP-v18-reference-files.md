---
layout: post
title: "README for the RDP v18 reference files"
author: "Patrick D. Schloss"
date: "February 4, 2021"
---

The good people at the [RDP](http://rdp.cme.msu.edu) have released a new version of the RDP database. A little bit of tweaking is needed to get their files to be compatible with mothur. This README document describes the process that I used to generate the [mothur-compatible reference files](http://mothur.org/wiki/RDP_reference_files). The original files are available from the RDPs [sourceforge server](http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/) and were used as the starting point for this README.

The [release notes](https://sourceforge.net/p/rdp-classifier/news/2020/07/rdp-classifier-213-july-2020-release-note/) indicate the following:

> The Bacteria and Archaea hierarchy model used by RDP Classifier has been updated to training set No. 18. The new version has over 800 new genera and 4000 new species added. Major rearrangements for Classifier training set No. 18 include the following: (go check out the release notes that are linked above for the list of changes).


Let's get going...


{% highlight bash %}
rm -rf RDPClassifier_16S_trainsetNo18_rawtrainingdata*

wget -N http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/RDPClassifier_16S_trainsetNo18_rawtrainingdata.zip
unzip -o RDPClassifier_16S_trainsetNo18_rawtrainingdata.zip
mv RDPClassifier_16S_trainsetNo18_rawtrainingdata/* ./
{% endhighlight %}

Now we'd like to start to form the taxonomy file and the fasta file that will be our reference. Again, using bash commands...

{% highlight bash %}
mv trainset18_062020.fa trainset18_062020.rdp.fasta
grep ">" trainset18_062020.rdp.fasta | cut -c 2- > trainset18_062020_rmdup.tax
{% endhighlight %}


Next, we'd like to get our taxonomy file properly formatted. First we'll read in the taxonomy data. The following steps are done in R...


{% highlight r %}
tax_file <- scan(file="trainset18_062020_rmdup.tax", what="", sep="\n", quiet=TRUE)

accession <- gsub("^(\\S*).*", "\\1", tax_file) #some are separated by tabs or spaces or both

taxonomy <- gsub(".*(Root.*)", "\\1", tax_file)
taxonomy <- gsub(" ", "_", taxonomy)	#remove spaces and replace with '_'
taxonomy <- gsub("\t", "", taxonomy)	#remove extra tab characters
taxonomy <- gsub("[^;]*_incertae_sedis$", "", taxonomy)
taxonomy <- gsub('\"', '', taxonomy) #remove quote marks
{% endhighlight %}

The RDP inserts a variety of sub taxonomic levels (e.g. suborder) that will get in the way of us having a consistent number of taxonomic levels for our analyses. Let's use the data in `trainset18_db_taxid.txt` to remove these extra taxonomic levels:


{% highlight r %}
levels <- read.table(file="trainset18_db_taxid.txt", sep="*", stringsAsFactors=FALSE)
subs <- levels[grep("sub", levels$V5),]
sub.names <- subs$V2

tax.split <- strsplit(taxonomy, split=";")

remove.subs <- function(tax.vector){
	return(tax.vector[which(!tax.vector %in% sub.names)])
}

no.subs <- lapply(tax.split, remove.subs)
no.subs.str <- unlist(lapply(no.subs, paste, collapse=";"))
no.subs.str <- gsub("^Root;(.*)$", "\\1;", no.subs.str)
{% endhighlight %}

Finally, we can output the taxonomy data to a file we'll call `trainset18_062020.rdp.tax` to have a consistent naming scheme with previous versions of those files:


{% highlight r %}
write.table(cbind(as.character(accession), no.subs.str), "trainset18_062020.rdp.tax", row.names=F, col.names=F, quote=F, sep="\t")
{% endhighlight %}

The RDP training sets do not include mitochondria or sequences from eukaryotes. We find that it is helpful to have these sequences because we can get non-specific amplification at times and would like to be able to remove these lineages. Let's go ahead and pull down the pds version of training set v.9 and copy those sequences over to our new training set. The following steps will be done in bash:

{% highlight bash %}
wget -N https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset10_082014.pds.tgz
tar xvzf trainset10_082014.pds.tgz
mv trainset10_082014.pds/trainset10_082014* ./
rm -rf trainset10_082014.pds trainset10_082014.pds.tgz
{% endhighlight %}

Now let's run a mothur command to pull out the extra sequences that are in the pds files:


{% highlight bash %}
mothur "#get.lineage(fasta=trainset10_082014.pds.fasta, taxonomy=trainset10_082014.pds.tax, taxon=Eukaryota-Mitochondria)"
{% endhighlight %}

This last command gets us the extra "pds" sequences that we can now use to paste on to the end of the normal RDP training set


{% highlight bash %}
cat trainset18_062020.rdp.tax trainset10_082014.pds.pick.tax > trainset18_062020.pds.tax
cat trainset18_062020.rdp.fasta trainset10_082014.pds.pick.fasta > trainset18_062020.pds.fasta
{% endhighlight %}

While we've got the old version of the training set, it might be nice to see what the differences are. It would have been nice for them to provide a README indicating what changed, but, well, no, they didn't.


{% highlight bash %}
wc -l *.pds.tax
{% endhighlight %}




{% highlight text %}
## 10773 trainset10_082014.pds.tax
## 21318 trainset18_062020.pds.tax
## 32091 total
{% endhighlight %}

Now we're ready to compress the taxonomy files. First we do the RDP files...


{% highlight bash %}
mkdir trainset18_062020.rdp
cp README.* trainset18_062020.rdp.fasta trainset18_062020.rdp.tax trainset18_062020.rdp
tar cvzf trainset18_062020.rdp.tgz  trainset18_062020.rdp/*

## a trainset18_062020.rdp/README.md
## a trainset18_062020.rdp/trainset18_062020.rdp.fasta
## a trainset18_062020.rdp/trainset18_062020.rdp.tax
{% endhighlight %}

... and then the pds files...


{% highlight bash %}
mkdir trainset18_062020.pds
cp README.* trainset18_062020.pds.fasta trainset18_062020.pds.tax trainset18_062020.pds
tar cvzf trainset18_062020.pds.tgz  trainset18_062020.pds/*

## a trainset18_062020.pds/README.md
## a trainset18_062020.pds/trainset18_062020.pds.fasta
## a trainset18_062020.pds/trainset18_062020.pds.tax
{% endhighlight %}
