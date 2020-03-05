---
layout: post
title: "README for the RDP v14 reference files"
author: "Patrick D. Schloss"
date: "May 27, 2015"
comments: true
output:
  html_document:
    keep_md: yes
---


The good people at the [RDP](http://rdp.cme.msu.edu) have released a new version of the RDP database. A little bit of tweaking is needed to get their files to be compatible with mothur. This README document describes the process that I used to generate the [mothur-compatible reference files](http://mothur.org/wiki/RDP_reference_files). The original files are available from the RDPs [sourceforge server](http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/) and were used as the starting point for this README.

The [release notes](http://rdp.cme.msu.edu/misc/rel10info.jsp#release11_history) indicate the following:

> The Bacteria and Archaea hierarchy model used by RDP Classifier and RDP Hierarchy Browser has been updated to training set No. 14. Six archaeal phyla (Woesearchaeota, Pacearchaeota, Aigarchaeota, Aenigmarchaeota, Parvarchaeota, Nanohaloarchaeota) were added to the current release to reflect discoveries by recent changes derived from metagenome assemblies or single cell amplified genomes (SAGs). Under archaeal class Halobacteria, recently proposed emendated order Halobacteriales and new orders Haloferacales and Natrialbales have been incorporated.

Let's get going...


{% highlight bash %}
rm -rf RDPClassifier_16S_trainsetNo14_rawtrainingdata* Trainset9_032012.pds.zip

wget -N http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/RDPClassifier_16S_trainsetNo14_rawtrainingdata.zip
unzip -o RDPClassifier_16S_trainsetNo14_rawtrainingdata.zip
mv RDPClassifier_16S_trainsetNo14_rawtrainingdata/* ./
{% endhighlight %}

We noticed that the RDP duplicated the sequence of GL982576_U010303693 in these files and so we need to remove the second copy. Let's just do that in mothur...


{% highlight bash %}
sed 's/[\|]/_/' trainset14_032015.fasta > trainset14_032015.temp.fasta

echo "GL982576_U010303693" > duplicate.accnos
mothur "#get.seqs(accnos=duplicate.accnos, fasta=trainset14_032015.temp.fasta); unique.seqs()"

mothur "#remove.seqs(accnos=duplicate.accnos, fasta=trainset14_032015.temp.fasta)"

cat trainset14_032015.temp.pick.fasta trainset14_032015.temp.pick.unique.fasta > trainset14_032015.rdp.fasta
{% endhighlight %}

Now we'd like to start to form the taxonomy file and the fasta file that will be our reference. Again, using bash commands...


{% highlight bash %}
grep ">" trainset14_032015.rdp.fasta | cut -c 2- > trainset14_032015_rmdup.tax
{% endhighlight %}


Next, we'd like to get our taxonomy file properly formatted. First we'll read in the taxonomy data...


{% highlight r %}
tax_file <- scan(file="trainset14_032015_rmdup.tax", what="", sep="\n", quiet=TRUE)

accession <- gsub("^(\\S*).*", "\\1", tax_file) #some are separated by tabs or spaces or both

taxonomy <- gsub(".*(Root.*)", "\\1", tax_file)
taxonomy <- gsub(" ", "_", taxonomy)	#remove spaces and replace with '_'
taxonomy <- gsub("\t", "", taxonomy)	#remove extra tab characters
taxonomy <- gsub("[^;]*_incertae_sedis$", "", taxonomy)
taxonomy <- gsub('\"', '', taxonomy) #remove quote marks
{% endhighlight %}

The RDP inserts a variety of sub taxonomic levels (e.g. suborder) that will get in the way of us having a consistent number of taxonomic levels for our analyses. Let's use the data in `trainset14_db_taxid.txt` to remove these extra taxonomic levels:


{% highlight r %}
levels <- read.table(file="trainset14_db_taxid.txt", sep="*", stringsAsFactors=FALSE)
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

Finally, we can output the taxonomy data to a file we'll call `trainset14_032015.rdp.tax` to have a consistent naming scheme with previous versions of those files:


{% highlight r %}
write.table(cbind(as.character(accession), no.subs.str), "trainset14_032015.rdp.tax", row.names=F, col.names=F, quote=F, sep="\t")
{% endhighlight %}

The RDP training sets do not include mitochondria or sequences from eukaryotes. We find that it is helpful to have these sequences because we can get non-specific amplification at times and would like to be able to remove these lineages. Let's go ahead and pull down the pds version of training set v.9 and copy those sequences over to our new training set:


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
cat trainset14_032015.rdp.tax trainset10_082014.pds.pick.tax > trainset14_032015.pds.tax
cat trainset14_032015.rdp.fasta trainset10_082014.pds.pick.fasta > trainset14_032015.pds.fasta
{% endhighlight %}

While we've got the old version of the training set, it might be nice to see what the differences are. It would have been nice for them to provide a README indicating what changed, but, well, no, they didn't.


{% highlight bash %}
wc -l *.pds.tax
{% endhighlight %}




{% highlight text %}
##    10773 trainset10_082014.pds.tax
##    10801 trainset14_032015.pds.tax
##    21574 total
{% endhighlight %}

We see that there are now 29 more sequences in the RDP training set. Now we're ready to compress the taxonomy files. First we do the RDP files...


{% highlight bash %}
mkdir trainset14_032015.rdp
cp README.* trainset14_032015.rdp.fasta trainset14_032015.rdp.tax trainset14_032015.rdp
tar cvzf trainset14_032015.rdp.tgz  trainset14_032015.rdp/*
{% endhighlight %}




{% highlight text %}
## mkdir: trainset14_032015.rdp: File exists
## a trainset14_032015.rdp/README.Rmd
## a trainset14_032015.rdp/README.html
## a trainset14_032015.rdp/README.md
## a trainset14_032015.rdp/trainset14_032015.rdp.fasta
## a trainset14_032015.rdp/trainset14_032015.rdp.tax
{% endhighlight %}

... and then the pds files...


{% highlight bash %}
mkdir trainset14_032015.pds
cp README.* trainset14_032015.pds.fasta trainset14_032015.pds.tax trainset14_032015.pds
tar cvzf trainset14_032015.pds.tgz  trainset14_032015.pds/*
{% endhighlight %}




{% highlight text %}
## mkdir: trainset14_032015.pds: File exists
## a trainset14_032015.pds/README.Rmd
## a trainset14_032015.pds/README.html
## a trainset14_032015.pds/README.md
## a trainset14_032015.pds/trainset14_032015.pds.fasta
## a trainset14_032015.pds/trainset14_032015.pds.tax
{% endhighlight %}
