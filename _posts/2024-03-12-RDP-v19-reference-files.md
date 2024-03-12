---
layout: post
title: "README for the RDP v19 reference files"
author: "Patrick D. Schloss"
date: "March 12, 2024"
---

The good people at the [RDP](http://rdp.cme.msu.edu) have released a new version of the RDP database. A little bit of tweaking is needed to get their files to be compatible with mothur. This README document describes the process that I used to generate the [mothur-compatible reference files](http://mothur.org/wiki/RDP_reference_files). The original files are available from the RDPs [sourceforge server](http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/) and were used as the starting point for this README.

The [release notes](http://rdp.cme.msu.edu/misc/rel10info.jsp#release11_history) indicate the following:

> The Bacteria and Archaea hierarchy model used by RDP Classifier has been updated to training set No. 19. The new version has over 600 new genera and 2500 new species added since last version No. 18 released in July 2020. The information that is used to update the RDP taxonomy to training set version No. 19, and RDP Classifier version 2.14 came from publicly available scientific articles and public sequence repository, mostly from International Journal of Systematic and Evolutionary Microbiology (IJSEM), the All-Species Living Tree Project (LTP) and GenBank.
> 
> It is worth noting that most of the phyla have new names, according to article "
Oren A, Garrity GM. Valid publication of the names of forty-two phyla of prokaryotes. Int J Syst Evol Microbiol. 2021 Oct;71(10). doi: 10.1099/ijsem.0.005056. PMID: 34694987."

Let's get going...

{% highlight bash %}
rm -rf RDPClassifier_16S_trainsetNo19_rawtrainingdata*

wget -N http://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/RDPClassifier_16S_trainsetNo19_rawtrainingdata.zip
unzip -o RDPClassifier_16S_trainsetNo19_rawtrainingdata.zip
mv RDPClassifier_16S_trainsetNo19_rawtrainingdata/* ./
{% endhighlight %}

Now we'd like to start to form the taxonomy file and the fasta file that will be our reference. Again, using bash commands...

{% highlight bash %}
mv trainset19_072023.fa trainset19_072023.rdp.fasta
grep ">" trainset19_072023.rdp.fasta | cut -c 2- > trainset19_072023_rmdup.tax
{% endhighlight %}


Next, we'd like to get our taxonomy file properly formatted. First we'll read in the taxonomy data. The following steps are done in R...


{% highlight r %}
tax_file <- scan(file="trainset19_072023_rmdup.tax", what="", sep="\n", quiet=TRUE)

accession <- gsub("^(\\S*).*", "\\1", tax_file) #some are separated by tabs or spaces or both

taxonomy <- gsub(".*(Root.*)", "\\1", tax_file)
taxonomy <- gsub(" ", "_", taxonomy)	#remove spaces and replace with '_'
taxonomy <- gsub("\t", "", taxonomy)	#remove extra tab characters
taxonomy <- gsub("[^;]*_incertae_sedis$", "", taxonomy)
taxonomy <- gsub('\"', '', taxonomy) #remove quote marks
{% endhighlight %}

The RDP inserts a variety of sub taxonomic levels (e.g. suborder) that will get in the way of us having a consistent number of taxonomic levels for our analyses. Let's use the data in `trainset18_db_taxid.txt` to remove these extra taxonomic levels:


{% highlight r %}
levels <- read.table(file="trainset19_db_taxid.txt", sep="*", stringsAsFactors=FALSE)
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

Finally, we can output the taxonomy data to a file we'll call `trainset19_072023.rdp.tax` to have a consistent naming scheme with previous versions of those files:


{% highlight r %}
write.table(cbind(as.character(accession), no.subs.str), "trainset19_072023.rdp.tax", row.names=F, col.names=F, quote=F, sep="\t")
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
cat trainset19_072023.rdp.tax trainset10_082014.pds.pick.tax > trainset19_072023.pds.tax
cat trainset19_072023.rdp.fasta trainset10_082014.pds.pick.fasta > trainset19_072023.pds.fasta
{% endhighlight %}

While we've got the old version of the training set, it might be nice to see what the differences are. It would have been nice for them to provide a README indicating what changed, but, well, no, they didn't.


{% highlight bash %}
wc -l *.pds.tax
{% endhighlight %}




{% highlight text %}
##   10773 trainset10_082014.pds.tax
##   24765 trainset19_072023.pds.tax
##   35538 total
{% endhighlight %}

Now we're ready to compress the taxonomy files. First we do the RDP files...


{% highlight bash %}
mkdir trainset19_072023.rdp
cp README.* trainset19_072023.rdp.fasta trainset19_072023.rdp.tax trainset19_072023.rdp
tar cvzf trainset19_072023.rdp.tgz  trainset19_072023.rdp/*

##   a trainset19_072023.rdp/README.md
##   a trainset19_072023.rdp/trainset19_072023.rdp.fasta
##   a trainset19_072023.rdp/trainset19_072023.rdp.tax
{% endhighlight %}

... and then the pds files...


{% highlight bash %}
mkdir trainset19_072023.pds
cp README.* trainset19_072023.pds.fasta trainset19_072023.pds.tax trainset19_072023.pds
tar cvzf trainset19_072023.pds.tgz  trainset19_072023.pds/*

##   a trainset19_072023.pds/README.md
##   a trainset19_072023.pds/trainset19_072023.pds.fasta
##   a trainset19_072023.pds/trainset19_072023.pds.tax
{% endhighlight %}
