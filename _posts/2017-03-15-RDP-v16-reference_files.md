---
layout: post
title: "README for the RDP v16 reference files"
author: "Patrick D. Schloss"
date: "March 15, 2017"
---

The good people at the [RDP](http://rdp.cme.msu.edu) have released a new version of the RDP database. A little bit of tweaking is needed to get their files to be compatible with mothur. This README document describes the process that I used to generate the [mothur-compatible reference files](http://mothur.org/wiki/RDP_reference_files). The original files are available from the RDPs [sourceforge server](http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/) and were used as the starting point for this README.

The [release notes](http://rdp.cme.msu.edu/misc/rel10info.jsp#release11_history) indicate the following:

> RDP Release 11.5 consists of 3,356,809 aligned and annotated 16S rRNA sequences and 125,525 Fungal 28S rRNA sequences. The Bacteria and Archaea hierarchy model used by RDP Classifier and RDP Hierarchy Browser have been updated to training set No. 16. This new training set has over 300 new genera and 2000 new sequences added. There are some rearrangements in genera Gp1, Gp3 and Gp4 of the Acidobacteria due to addition of recently proposed new genera.



Let's get going...


{% highlight bash %}
rm -rf RDPClassifier_16S_trainsetNo16_rawtrainingdata*

wget -N http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/RDPClassifier_16S_trainsetNo16_rawtrainingdata.zip
unzip -o RDPClassifier_16S_trainsetNo16_rawtrainingdata.zip
mv RDPClassifier_16S_trainsetNo16_rawtrainingdata/* ./
{% endhighlight %}

Now we'd like to start to form the taxonomy file and the fasta file that will be our reference. Again, using bash commands...

{% highlight bash %}
mv trainset16_022016.fa trainset16_022016.rdp.fasta
grep ">" trainset16_022016.rdp.fasta | cut -c 2- > trainset16_022016_rmdup.tax
{% endhighlight %}


Next, we'd like to get our taxonomy file properly formatted. First we'll read in the taxonomy data. The following steps are done in R...


{% highlight r %}
tax_file <- scan(file="trainset16_022016_rmdup.tax", what="", sep="\n", quiet=TRUE)

accession <- gsub("^(\\S*).*", "\\1", tax_file) #some are separated by tabs or spaces or both

taxonomy <- gsub(".*(Root.*)", "\\1", tax_file)
taxonomy <- gsub(" ", "_", taxonomy)	#remove spaces and replace with '_'
taxonomy <- gsub("\t", "", taxonomy)	#remove extra tab characters
taxonomy <- gsub("[^;]*_incertae_sedis$", "", taxonomy)
taxonomy <- gsub('\"', '', taxonomy) #remove quote marks
{% endhighlight %}

The RDP inserts a variety of sub taxonomic levels (e.g. suborder) that will get in the way of us having a consistent number of taxonomic levels for our analyses. Let's use the data in `trainset16_db_taxid.txt` to remove these extra taxonomic levels:


{% highlight r %}
levels <- read.table(file="trainset16_db_taxid.txt", sep="*", stringsAsFactors=FALSE)
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

Finally, we can output the taxonomy data to a file we'll call `trainset16_022016.rdp.tax` to have a consistent naming scheme with previous versions of those files:


{% highlight r %}
write.table(cbind(as.character(accession), no.subs.str), "trainset16_022016.rdp.tax", row.names=F, col.names=F, quote=F, sep="\t")
{% endhighlight %}

The RDP training sets do not include mitochondria or sequences from eukaryotes. We find that it is helpful to have these sequences because we can get non-specific amplification at times and would like to be able to remove these lineages. Let's go ahead and pull down the pds version of training set v.9 and copy those sequences over to our new training set. The following steps will be done in bash:

{% highlight bash %}
wget -N http://mothur.org/w/images/2/24/Trainset10_082014.pds.tgz
tar xvzf Trainset10_082014.pds.tgz
mv trainset10_082014.pds/trainset10_082014* ./
rm -rf trainset10_082014.pds Trainset10_082014.pds.tgz
{% endhighlight %}

Now let's run a mothur command to pull out the extra sequences that are in the pds files:


{% highlight bash %}
mothur "#get.lineage(fasta=trainset10_082014.pds.fasta, taxonomy=trainset10_082014.pds.tax, taxon=Eukaryota-Mitochondria)"
{% endhighlight %}

This last command gets us the extra "pds" sequences that we can now use to paste on to the end of the normal RDP training set


{% highlight bash %}
cat trainset16_022016.rdp.tax trainset10_082014.pds.pick.tax > trainset16_022016.pds.tax
cat trainset16_022016.rdp.fasta trainset10_082014.pds.pick.fasta > trainset16_022016.pds.fasta
{% endhighlight %}

While we've got the old version of the training set, it might be nice to see what the differences are. It would have been nice for them to provide a README indicating what changed, but, well, no, they didn't.


{% highlight bash %}
wc -l *.pds.tax
{% endhighlight %}




{% highlight text %}
##    10773 trainset10_082014.pds.tax
##    13335 trainset16_022016.pds.tax
##    24108 total
{% endhighlight %}

Now we're ready to compress the taxonomy files. First we do the RDP files...


{% highlight bash %}
mkdir trainset16_022016.rdp
cp README.* trainset16_022016.rdp.fasta trainset16_022016.rdp.tax trainset16_022016.rdp
tar cvzf trainset16_022016.rdp.tgz  trainset16_022016.rdp/*

a trainset16_022016.rdp/README.md
a trainset16_022016.rdp/trainset16_022016.rdp.fasta
a trainset16_022016.rdp/trainset16_022016.rdp.tax
{% endhighlight %}

... and then the pds files...


{% highlight bash %}
mkdir trainset16_022016.pds
cp README.* trainset16_022016.pds.fasta trainset16_022016.pds.tax trainset16_022016.pds
tar cvzf trainset16_022016.pds.tgz  trainset16_022016.pds/*

a trainset16_022016.pds/README.md
a trainset16_022016.pds/trainset16_022016.pds.fasta
a trainset16_022016.pds/trainset16_022016.pds.tax
{% endhighlight %}
