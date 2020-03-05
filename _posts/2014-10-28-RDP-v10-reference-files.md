---
layout: post
title: "README for the RDP v10 reference files"
author: "Patrick D. Schloss"
date: "October 28, 2014"
comments: true
output:
  html_document:
    keep_md: yes
---

The good people at the [RDP](http://rdp.cme.msu.edu) have released a new version of the RDP database. A little bit of tweaking is needed to get their files to be compatible with mothur. This README document describes the process that I used to generate the [mothur-compatible reference files](http://mothur.org/wiki/RDP_reference_files). The original files are available from the RDPs [sourceforge server](http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/) and were used as the starting point for this README.

The [release notes](http://rdp.cme.msu.edu/misc/rel10info.jsp#release11_history) indicate the following:

> The Bacteria and Archaea hierarchy model used by RDP Classifier and RDP Hierarchy Browser has been updated to training set No. 10. The new addition includes 14 new bacterial phyla and 1 new archaeal phylum, and 159 new genera. The former phylum Nitrospira is renamed to Nitrospirae. The former candidate phyla OP11, TM7, OD1, WS3 are now the new bacterial phyla Microgenomates, Candidatus Saccharibacteria, Parcubacteria, Latescibacteria.

Let's get going...


{% highlight bash %}
rm -rf RDPClassifier_16S_trainsetNo10_rawtrainingdata* Trainset9_032012.pds.zip
	
wget -N http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/RDPClassifier_16S_trainsetNo10_rawtrainingdata.zip
unzip -o RDPClassifier_16S_trainsetNo10_rawtrainingdata.zip
mv RDPClassifier_16S_trainsetNo10_rawtrainingdata/* ./
{% endhighlight %}

Now we'd like to start to form the taxonomy file and the fasta file that will be our reference. Again, using bash commands...


{% highlight bash %}
sed 's/\|/_/' trainset10_082014_rmdup.fasta > trainset10_082014.rdp.fasta
grep ">" trainset10_082014.rdp.fasta | cut -c 2- > trainset10_082014_rmdup.tax
{% endhighlight %}

Next, we'd like to get our taxonomy file properly formatted. First we'll read in the taxonomy data...


{% highlight r %}
tax <- read.table(file="trainset10_082014_rmdup.tax", sep="\t")
tax$V2 <- gsub(" ", "_", tax$V2)	#remove spaces and replace with '_'
tax$V2 <- gsub("[^;]*_incertae_sedis$", "", tax$V2)
tax$V2 <- gsub('\"', '', tax$V2) #remove quote marks
{% endhighlight %}

The RDP inserts a variety of sub taxonomic levels (e.g. suborder) that will get in the way of us having a consistent number of taxonomic levels for our analyses. Let's use the data in `trainset10_db_taxid.txt` to remove these extra taxonomic levels:


{% highlight r %}
levels <- read.table(file="trainset10_db_taxid.txt", sep="*", stringsAsFactors=F)
subs <- levels[grep("sub", levels$V5),]
sub.names <- subs$V2

tax.split <- strsplit(tax$V2, split=";")

remove.subs <- function(tax.vector){
	return(tax.vector[which(!tax.vector %in% sub.names)])
}

no.subs <- lapply(tax.split, remove.subs)
no.subs.str <- unlist(lapply(no.subs, paste, collapse=";"))
no.subs.str <- gsub("^Root;(.*)$", "\\1;", no.subs.str)
{% endhighlight %}

Finally, we can output the taxonomy data to a file we'll call `trainset10_082014.rdp.tax` to have a consistent naming scheme with previous versions of those files:


{% highlight r %}
write.table(cbind(as.character(tax$V1), no.subs.str), "trainset10_082014.rdp.tax", row.names=F, col.names=F, quote=F, sep="\t")
{% endhighlight %}

The RDP training sets do not include mitochondria or sequences from eukaryotes. We find that it is helpful to have these sequences because we can get non-specific amplification at times and would like to be able to remove these lineages. Let's go ahead and pull down the pds version of training set v.9 and copy those sequences over to our new training set:


{% highlight bash %}
wget -N http://mothur.org/w/images/5/59/Trainset9_032012.pds.zip
unzip -o Trainset9_032012.pds.zip
{% endhighlight %}

Now let's run a mothur command to pull out the extra sequences that are in the pds files:


{% highlight bash %}
mothur "#get.lineage(fasta=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, taxon=Eukaryota-Mitochondria)"
{% endhighlight %}

This last command gets us the extra "pds" sequences that we can now use to paste on to the end of the normal RDP training set


{% highlight bash %}
cat trainset10_082014.rdp.tax trainset9_032012.pds.pick.tax > trainset10_082014.pds.tax
cat trainset10_082014.rdp.fasta trainset9_032012.pds.pick.fasta > trainset10_082014.pds.fasta
{% endhighlight %}

While we've got the old version of the training set, it might be nice to see what the differences are. It would have been nice for them to provide a README indicating what changed, but, well, no, they didn't.


{% highlight bash %}
wc -l *.pds.tax
{% endhighlight %}




{% highlight text %}
##    10773 trainset10_082014.pds.tax
##    10172 trainset9_032012.pds.tax
##    20945 total
{% endhighlight %}

We see that there are now 601 more sequences in the RDP training set. Now we're ready to compress the taxonomy files. First we do the RDP files...


{% highlight bash %}
mkdir trainset10_082014.rdp
cp README.* trainset10_082014.rdp.fasta trainset10_082014.rdp.tax trainset10_082014.rdp
tar cvzf trainset10_082014.rdp.tgz  trainset10_082014.rdp/*
{% endhighlight %}




{% highlight text %}
## mkdir: trainset10_082014.rdp: File exists
## a trainset10_082014.rdp/README.Rmd
## a trainset10_082014.rdp/trainset10_082014.rdp.fasta
## a trainset10_082014.rdp/trainset10_082014.rdp.tax
{% endhighlight %}

... and then the pds files...


{% highlight bash %}
mkdir trainset10_082014.pds
cp README.* trainset10_082014.pds.fasta trainset10_082014.pds.tax trainset10_082014.pds
tar cvzf trainset10_082014.pds.tgz  trainset10_082014.pds/*
{% endhighlight %}




{% highlight text %}
## mkdir: trainset10_082014.pds: File exists
## a trainset10_082014.pds/README.Rmd
## a trainset10_082014.pds/trainset10_082014.pds.fasta
## a trainset10_082014.pds/trainset10_082014.pds.tax
{% endhighlight %}
