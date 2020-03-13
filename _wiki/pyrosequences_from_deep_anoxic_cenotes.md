---
title: 'Pyrosequences from deep anoxic cenotes'
redirect_from: '/wiki/Pyrosequences_from_deep_anoxic_cenotes'
---
## Study design

This study describes the analysis of 16S rRNA amplicon barcoded
pyrosequences in a multiplex sample run. The purpose of the experiment
is to not only explore the diversity of beautiful microbial biomats,
which coat the walls of deep, water-filled, cenotes in Northeastern
Mexico, but also to see how communities cluster based on the
geochemistry of the system. For this study, I ran mothur on a computer
with 8 processors, 16 gigs of RAM, and running CentOS linux.

## Viewing and trimming sequences

The first thing I like to do is look at my sequence length distribution-
here is a histogram from my pyrosequence dataset:

![](https://mothur.s3.us-east-2.amazonaws.com/wiki/histogram.png)

Work from Mitch Sogin\'s lab suggests that the sequencing error rate
surrounding the normal distribution of sequence length is too high. From
this histogram, I choose to trim sequences \>300nt and \<250nt (270 and
220 trimmed length respectively)

    mothur > trim.seqs(fasta=sahl09.fna, oligos=sahl09.oligos, maxambig=0, minlength=220, maxlength=270, allfiles=T, maxhomop=10)

I don\'t trim by average quality score.

## Using Mothur

I used bacterial primers 8F and 357R (which contains the barcode) on 11
separate DNA templates. I first found the unique sequences in the raw
fasta file [ zac.tgz](https://mothur.s3.us-east-2.amazonaws.com/wiki/zac.tgz):

    mothur > unique.seqs(fasta=ZAC.fas)

### Alignment

I then attempted to align my sequences to the SILVA sequence space.
Specifically, I used Pat\'s [ silva reference
alignment](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.alignment.zip) as my template. The
metadata included in the fasta file title line will throw mothur off. It
needs to be stripped off so only the name field remains. Here is a
script which does this for you: [
namestripper.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/namestripper.zip) I then aligned my
sequences:

    mothur > align.seqs(template=SILVA, candidate=ZAC.unique.fasta, ksize=9, processors=8)

I then checked my alignment in [arb](https://www.arb-home.de/) and a
recent SILVA database and found that my alignment, which should cover E.
coli positions 8-357, was spread out over the length of the 16S rRNA
gene. Pat observed that my sequences weren\'t oriented correctly because
my barcode sequence was on the reverse primer. Therefore, I run:

    mothur > reverse.seqs(fasta=ZAC.unique.fasta)

Once I aligned the reverse complement of my sequences, the alignment
looked great in ARB. I then filtered out empty columns with the
[filter.seqs](filter.seqs) command.

    mothur > filter.seqs(fasta=ZAC.unique.align, vertical=T)

### Distance matrix and clustering

I then created a distance matrix with the
[dist.seqs](dist.seqs) command from my aligned sequences. I
wasn\'t interested in sequences less related than 90%. Our server has 8
processors available and I use all of them for the alignment.

    mothur > dist.seqs(fasta=ZAC.unique.filter.fasta, cutoff=0.1, calc=eachgap, processors=8)

This step took an hour or so. I then read the distance matrix with the
[read.dist](read.dist) command, using the \"names\" file that
I generated during the unique.seqs step:

    mothur > read.dist(column=ZAC.unique.filter.dist, name=ZAC.names, cutoff=0.1)

I then clustered my sequences with:

    mothur > cluster()

I then read the OTUs at 3% distance with:

    mothur > read.otu(list=ZAC.unique.filter.list, label=0.03, group=ZAC.groups)

(to see how I make the \"group\" file, see instructions below)

Part of the study design was to see how the samples cluster- I do this
with:

    mothur > tree.shared(calc=thetayc)

I also like to look at the diversity stats for each sample. The best way
to do this is to run a batch command. Here is an example from one
sample:

    read.otu(list=ZAC.unique.filter.fn.0Mwater.list)
    summary.single(calc=nseqs-sobs-shannon-chao-ace)

I included all of my samples in this batch file.

## Results

### Alignment

For an OTU based approach using pyrosequences, we want an alignment that
works out of the box. While manually editing using ARB is feasible with
small Sanger libraries, it becomes almost impossible with hundreds of
thousands of sequences. I aligned and processed my dataset with 4
different alignment methods.


1\.  The greengenes coreset

2\.  Pat\'s SILVA seed database

3\.  An alignment obtained from the [comparative rRNA web
    site](https://www.rna.ccbb.utexas.edu/)

4\.  [rdp pyrosequencing pipeline](https://pyro.cme.msu.edu/), which uses
    the [infernal aligner](https://infernal.janelia.org/)

Here are the results of OTUs obtained at a 97% identity level for three
libraries. The number of sequences is the same for all 4 method

             GG     SILVA   RDP    comprRNA
  ---------- ------ ------- ------ ----------
  Sample 1   247    268     249    271
  Sample 2   835    831     826    856
  Sample 3   2175   2205    2084   2318

For a conservative estimate, I was looking for the alignment which
provides the fewest number of OTUs. This may indicate that this method
did the best job of aligning the hypervariable V2 region. Based on these
results, I chose the RDP alignment. You do need to modify the alignment
before you create the distance matrix because the RDP alignment contains
internal dots. You need to convert these to dashes, and then not count
the terminal gaps in the distance calculation.

## Making groups file

This is an alternative method to generate the \'group\' file needed by
many Mothur applications: it requires ARB


1\.  Start ARB

2\.  Click \'create and import\'

3\.  Find either your aligned or unaligned fasta file and import it

4\.  Once your sequences are imported, the Search and Query window opens,
    with all of your sequences marked

5\.  Click \'Search species\' (on the left side of the window) and \'that
    are marked\' (on the right side), hit the search button

6\.  Now click on \'Keep species\' (left) \'that match the query\'
    (right), in the search bar, enter specific characters for one
    environment followed by the wild card (\*) in the field below; for
    example, if you have 100 sequences labeled ENV1, ENV2,\....ENV100,
    type ENV\* in the search bar and hit the search button

7\.  Now only sequences from one environment are selected, now click
    \'write to fields of listed\'. Pick an unused field, such as
    \'acc\', and type in your environment name, click on write. DO NOT
    INCLUDE ANY SPACES IN YOUR ENVIRONMENT NAME. Mothur doesn\'t like
    those.

8\.  If you then go back to the Search and Query window, click on
    \'Search species\' \'that are marked\', you should see all of your
    sequences once again. Repeat this procedure for each environment in
    your dataset.

9\.  Under the \'Tree\' heading at the top of the main screen, select
    \'Select visible info (NDS)\'

10\. Make sure only the fields \'name\' and \'acc\' are selected. Close
    window.

11\. Click File-\> Export -\> Export fields using NDS

12\. Name your file, click the \'tab for columns\' button, and hit save.

13\. Voila!
