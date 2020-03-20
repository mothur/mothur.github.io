---
title: 'Esophageal community analysis'
redirect_from: '/wiki/Esophageal_community_analysis'
---
In this tutorial we will complete a fairly comprehensive [esophageal
community analysis](/wiki/esophageal_community_analysis) using
greengenes, ARB, and the tools available in mothur. To complete this
analysis, you need to download the folder compressed in the [
Esophagus.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/esophagus.zip) archive. These sequences
were originally published by [Pei et al.
(2004)](https://www.ncbi.nlm.nih.gov/pubmed/15016918?ordinalpos=6&itool=EntrezSystem2.PEntrez.Pubmed.Pubmed_ResultsPanel.Pubmed_DefaultReportPanel.Pubmed_RVDocSum).


## Getting started

We need to generate a distance matrix and phylogenetic tree to perform
most of the analyses we would like to do in mothur. First, we need to
generate an alignment of the 710 16S rRNA gene sequences. For this
tutorial we will use mothur. Be sure that you are in the "Esophagus"
folder and get a copy of your favorite [alignment
database](/wiki/alignment_database) and put it in the same folder
as well. Go ahead and fire up mothur. First, we will [ align the
sequences](/wiki/align.seqs), with one processor this should take
about 40 seconds:

    mothur > align.seqs(fasta=esophagus.fasta, reference=core_set_aligned.imputed.fasta)

or

    mothur > align.seqs(fasta=esophagus.fasta, reference=core_set_aligned.imputed.fasta, processors=2)

Next, we want to make sure that our sequences overlap over the same
region of the 16S rRNA gene. First let's take a look at a [
summary](/wiki/summary.seqs) basic statistics of our sequence
collection:

    mothur > summary.seqs(fasta=esophagus.align)

           Start   End NBases  Ambigs  Polymer
    Minimum:   140 4456    831 0   4
    2.5%-tile: 187 4477    840 0   4
    25%-tile:  187 4512    855 0   5
    Median:    187 4532    865 0   5
    75%-tile:  187 4554    870 0   5
    97.5%-tile:    204 4610    900 5   7
    Maximum:   486 6720    1378    20  8
    # of Seqs: 710

Being sticklers for good quality sequence data, we shouldn't be
satisfied with sequences that have any ambiguous bases, much less 5! So
let's remove any sequences that have more than 5 ambiguous bases. While
we're at it, let's remove any sequences where the alignment doesn't
start by position 204 or end by position 4456 using the
[screen.seqs](/wiki/screen.seqs) command. These correspond to E.
coli positions 67 and 873. We also want to remove the problematic
sequences from the group file:

    mothur > screen.seqs(fasta=esophagus.align, group=esophagus.groups, start=204, end=4456, maxambig=5)

Again summarizing the output of screen.seqs shows us:

    mothur > summary.seqs(fasta=esophagus.good.align)

           Start   End NBases  Ambigs  Polymer
    Minimum:   140 4470    840 0   4
    2.5%-tile: 187 4477    840 0   4
    25%-tile:  187 4512    857 0   5
    Median:    187 4532    866 0   5
    75%-tile:  187 4554    870 0   5
    97.5%-tile:    189 4609    900 2   7
    Maximum:   204 4664    907 5   8
    # of Seqs: 677

We see that we've lost about 33 sequences from our dataset with that
screen. Now we want to make sure that we are only considering the same
region of the alignment (i.e. positions 204 through 4470). We also want
to remove any columns from the alignment that only contain gap
characters. To do this we will use the
[filter.seqs](/wiki/filter.seqs) command:

    mothur > filter.seqs(fasta=esophagus.good.align, trump=., vertical=T)

This will yield the following output:

Length of filtered alignment: 1085 Number of columns removed: 6597
Length of the original alignment: 7682 Number of sequences used to
construct filter: 677

Now we need to generate a phylip-formatted distance matrix so we can run
some of the hypothesis testing procedures. We will do this using the
[dist.seqs](/wiki/dist.seqs) command:

    mothur > dist.seqs(fasta=esophagus.good.filter.fasta, output=lt)

or

    mothur > dist.seqs(fasta=esophagus.good.filter.fasta, output=lt, processors=2)

Copy esophagus.good.filter.phylip.dist to a new file named
esophagus.dist.

## OTU-based Analyses

We are now ready to analyze our sequence collection in mothur. You are
encouraged to look through the [mothur manual](/wiki/mothur_manual)
to get a better idea of the options available for each command. Go ahead
and open mothur in your terminal. Our analysis will focus on OTUs
defined at distances less than or equal to 0.10. We will now
[cluster](/wiki/cluster) the sequences using the average neighbor
algorithm:

    mothur > cluster(phylip=esophagus.dist, cutoff=0.10)

This will generate three files: [
esophagus.fn.sabund](/wiki/Sabund_file), [
esophagus.fn.list](/wiki/List_file), and [
esophagus.fn.rabund](/wiki/Rabund_file). The sequences in
esophagus.fasta come from three patients. To parse esophagus.an.list
into these three groups you need to make use of the esophagus.groups
file using the [make.shared](/wiki/make.shared) command. We will be
interested in OTUs defined as a group of unique sequences and those that
are no more than 0.03, 0.05 and 0.10 apart from each other:

    mothur > make.shared(list=esophagus.an.list, group=esophagus.good.groups, label=unique-0.03-0.05-0.10)

This command will generate four files including [
esophagus.fn.shared](/wiki/Shared_file), [
esophagus.fn.B.rabund](/wiki/Rabund_file), esophagus.an.D.rabund,
and esophagus.an.C.rabund.

### Single-sample analyses

We would like to know the richness of each of these rabund files as well
as the richness that is shared between the three communities. As an
example, let's analyze patient B. To generate data for a rarefaction
curve use the [rarefaction.single](/wiki/rarefaction.single)
command:

    mothur > rarefaction.single(rabund=esophagus.an.B.rabund)

This will generate esophagus.an.B.rarefaction.

To generate a collector's curve for the Chao1 estimator and
non-parametric Shannon Index use the
[collect.single](/wiki/collect.single) command:

    mothur > collect.single(calc=chao-npshannon)

This will generate the files esophagus.an.B.chao and
esophagus.an.B.np\_shannon. By plotting these data one can evaluate
whether the parameters are sensitive to sampling.

For a quick summary of various parameters for each patient you can
execute the following commands: \[To generate the .rabund-file use the
command "get.rabund()"

    mothur > summary.single(rabund=esophagus.an.B.rabund)
    mothur > summary.single(rabund=esophagus.an.C.rabund)
    mothur > summary.single(rabund=esophagus.an.D.rabund)

These commands will result in the generation of three files:
esophagus.an.B.summary, esophagus.an.C.summary, and
esophagus.an.D.summary. The predicted Chao1 richness of these three
communities at a cutoff of 0.03 was 90, 46, and 100. To get a summary of
the overall enter the following commands:

    mothur > summary.single(list=esophagus.an.list, label=unique-0.03-0.05-0.10)

This generates the file esophagus.an.summary. The Chao1 richness for a
cutoff of 0.03 was 136.

### Multiple-sample analyses

Obviously many sequences are shared between the three patients. To
estimate the overlap you can use
[collect.shared](/wiki/collect.shared) and
[summary.shared](/wiki/summary.shared). Here we will read in the
shared file and calculate the shared richness, Jaccard coefficient, and
thetaYC value between the three patients:

    mothur > summary.shared(shared=esophagus.an.shared)

This generates the file esophagus.an.shared.summary. Using a shared Chao
estimator, communities B & C share 30 OTUs, B & D share 61, and C & D
share 23. The Jaccard Index for the same comparisons were 0.33, 0.63,
and 0.22 when using the richness estimates were used to calculate the
Jaccard Index. The thetaYC values were 0.33, 0.61, and 0.11. The Jaccard
Index measures similarity in community membership while thetaYC measures
similarity in community structure.

As a method of visualizing the data you can run the
[venn](/wiki/venn) command using the observed and estimated
richness:

    mothur > venn(label=0.03, calc=sharedsobs-sharedchao)

With this SVG file, you can manually scale the diagram so that the
regions are proportional to the richness represented in the region. If
you had more groups, it would be interesting to try out the
[tree.shared](/wiki/tree.shared) command.

## Hypothesis testing approaches

We have previously shown
[1](https://www.ncbi.nlm.nih.gov/pubmed/18239608?ordinalpos=3&itool=EntrezSystem2.PEntrez.Pubmed.Pubmed_ResultsPanel.Pubmed_DefaultReportPanel.Pubmed_RVDocSum)
that it is not appropriate to apply every possible hypothesis testing
approach. Pick one and stick with it. Otherwise you will run the risk of
identifying differences as being statistically significant that are not.

### libshuff

To execute the [libshuff](/wiki/libshuff) command you will need to
read in the distance matrix with the group file:

    mothur > libshuff(phylip=esophagus.dist, group=esophagus.good.groups)

This will generate the following output:

    Comparison             dCXYScore   Significance
    B-C                    0.00198108  <0.0001
    C-B                    0.00302058  <0.0001
    B-D                    0.00123778  <0.0001
    D-B                    0.00044060  0.0240
    C-D                    0.00553260  <0.0001
    D-C                    0.00155345  <0.0001

These significance values are all below the critical threshold (i.e.

0\.05/6 = 0.0083333). Therefore, the three communities have different
structures.

### Parsimony test

Ideally, you would take the time to generate a "good" phylogeny of
your sequences. We have provided a neighbor-joining tree generated from
esophagus.dist, which is named esophagus.tree. First we will use the
parsimony test. This test was previously implemented in the TreeClimber
programmer and is now available as the [parsimony](/wiki/parsimony)
command. First you need to read in the tree with the group file:

    mothur > parsimony(tree=esophagus.tree, group=esophagus.good.groups)

This will generate the following output:

    Tree#  Groups  ParsScore   ParsSig
    1  B-C-D   127     <0.001

These results indicate that at least one of the three patients harbored
a different community structure. Now we want to know which of the
communities are different from the others:

    mothur > parsimony(tree=esophagus.tree, group=esophagus.good.groups, groups=all)

This will yield the following output:

    Tree#  Groups  ParsScore   ParsSig
    1  B-C 66      <0.001
    1  B-D 56      <0.001
    1  C-D 53      <0.001

Needless to say, the three patients harbored distinctively different
community structures.

### Weighted UniFrac Test

The [ weighted unifrac](/wiki/unifrac.weighted) test measures the
fraction of a tree's branch length that can be ascribed to each
community. A similar analysis was previously available through the Knight Lab
website. Similar to the
parsimony analysis, you first need to read in a tree and group file:

    mothur > unifrac.weighted(tree=esophagus.tree, group=esophagus.good.groups)

This will yield the following output:

    Tree#  Groups  WScore      WSig
    1  B-C 0.200186    <0.001
    1  B-D 0.234404    <0.001
    1  C-D 0.227453    <0.001

Again, all of these significance values are less than the critical
threshold (i.e. 0.05/3 = 0.016667). Therefore the three communities are
significantly different from each other.

### Unweighted UniFrac Test

Similar to the [ weighted unifrac](/wiki/unifrac.weighted) test,
the [ unweighted unifrac](/wiki/unifrac.unweighted) test measures
the fraction of a tree's branch length that is unique to each group
represented in the tree. A similar analysis was previously available through the
Knight Lab website.
Similar to the parsimony analysis, you first need to read in a tree and
group file:

    mothur > unifrac.unweighted(tree=esophagus.tree, group=esophagus.good.groups)

This yields the following output:

    Tree#  Groups  UWScore     UWSig
    1  B-C-D   0.625019    <0.001

Again, at least one of the three communities harbors a significantly
different community. To dissect the relationship between the communities
the following command will look at the pairwise comparisons:

    mothur > unifrac.unweighted(tree=esophagus.tree, group=esophagus.good.groups, groups=all)
    Tree#  Groups  UWScore     UWSig
    1  B-C 0.638774    <0.001
    1  B-D 0.622414    <0.001
    1  C-D 0.679816    <0.001

Again, these three communities clearly harbor distinct community
structures.
