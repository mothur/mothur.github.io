---
title: 'Frequently asked questions'
tags: 'commands'
---
If you have any questions, please feel free to email us or to use the
discussion tab. If you have an answer, feel free to contribute!

### How do I cite mothur?

Schloss, P.D., et al., Introducing mothur: Open-source,
platform-independent, community-supported software for describing and
comparing microbial communities. Appl Environ Microbiol, 2009.
75(23):7537-41.

The original tools:

Schloss, PD & Handelsman, J. (2006) Introducing SONS, a tool for
OTU-based comparisons of membership and structure between microbial
communities. Applied and Environmental Microbiology. 72:6773-9.

Schloss, PD & Handelsman, J. (2006). Introducing TreeClimber, a test to
compare community structures. Applied and Environmental Microbiology.
72: 2379-84.

Schloss, PD & Handelsman, J. (2005). Introducing DOTUR, a computer
program for defining operational taxonomic units and estimating species
richness. Applied and Environmental Microbiology. 71:1501-6.

Schloss, PD, Larget, BR, & Handelsman J. (2004). Integration of
microbial ecology and statistics: a test to compare gene libraries.
Applied and Environmental Microbiology. 70:5485-92.

### I don\'t have enough RAM or processing power. What are my options?

Check out this page describing how to run mothur using Amazon resources,
[ Mothur AMI](Mothur_AMI).

### Why does the command window open and close quickly when I double click on the mothur?

This is because you have not given mothur the input files and you will
get an error message quickly followed by the screen closing. Please see
the section on how to run mothur from a command prompt.

### Why doesn't mothur do...?

If you would like to see something added to mothur, please let us know!
It may take me a while to get around to implementing the feature, but we
are generally reasonable and welcome everyone\'s expertise that would
like to contribute source code.

### Do you have an example analysis?

Yes, [Schloss\_SOP](Schloss_SOP) and
[MiSeq\_SOP](MiSeq_SOP) highlight some of the things you can
do with mothur.

### Do you do workshops?

Yes! Please see our [workshops](workshops) page for more
information.

### Why is data missing for some distance levels?

Perhaps the second most commonly asked question is why there isn\'t a
line for distance 0.XX. If you notice the previous example the distances
jump from 0.003 to 0.006. Where are 0.004 and 0.005? mothur only outputs
data if the clustering has been updated for a distance. So if you don\'t
have data at your favorite distance, that means that nothing changed
between the previous distance and the next one. Therefore if you want
OTU data for a distance of 0.005 in this case, you would use the data
from 0.003. But\... many of the commands that use a label option are
smart (e.g. [read.otu](read.otu)). So, if you say you want
data at the 0.03 cutoff, then you can set label=0.03 and mothur will
figure out what data to give you.

### Aren\'t the \'unique\' and \'0.00\' distance levels the same?

Perhaps the most commonly asked question is why the cluster command
produces data for both the \"unique\" and \"0.00\" lines. Aren\'t they
the same? No. The \"unique\" line represents data for the situation
where all of the sequences in an OTU are identical; the \"0.00\" line
represents data for the situation where all of the sequences in an OTU
have pairwise distances less than 0.0049. We made the decision that
because there is error in everything, we should round these distances as
well and not apply a hard cutoff at 0.01, 0.02, etc. But\... if you
don\'t buy into this and want a hard cutoff you can set the hard=T
option in [cluster](cluster).

### Mothur crashes when I read my distance file

There are two common causes for this, file size and format.

File Size:

-   The cluster command load your distance matrix into RAM, and your
    distance file is most likely too large to fit in RAM. There are two
    options to help with this. The first is to use a cutoff. By using a
    cutoff mothur will only load distances that are below the cutoff. If
    that is still not enough, there is a command called cluster.split,
    [cluster.split](cluster.split) which divides the
    distance matrix, and clusters the smaller pieces separately. You may
    also be able to reduce the size of the original distance matrix by
    using the commands outline in the Schloss SOP,
    [Schloss_SOP](Schloss_SOP).

Wrong Format:

-   This error can be caused by trying to read a column formatted
    distance matrix using the phylip parameter. By default, the
    [dist.seqs](dist.seqs) command generates a column
    formatted distance matrix. To make a phylip formatted matrix set the
    [dist.seqs](dist.seqs) command parameter output to lt.

### Why do I have such a large distance matrix

This is most often caused by poor overlap of your reads. When reads have
poor overlap, it greatly increases your error rate. Also, sequences that
should cluster together don\'t because the errors appear to be genetic
differences when in fact they are not. The quality of the data you are
processing can not be overstressed. Error filled reads produce error
filled results.

[Mothur Blog - Why do I have such a large distance
matrix?](/blog/2014/Why-such-a-large-distance-matrix/)

\"To take a step back, if you look through our MiSeq SOP, you'll see
that we go to great pains to only work with the unique sequences to
limit the number of sequences we have to align, screen for chimeras,
classify, etc. We all know that 20 million reads will never make it
through the pipeline without setting your computer on fire. Returning to
the question at hand, you can imagine that if the reads do not fully
overlap then any error in the 5' end of the first read will be
uncorrected by the 3' end of the second read. If we assume for now that
the errors are random, then every error will generate a new unique
sequence. Granted, this happens less than 1% of the time, but multiply
that by 20 million reads at whatever length you choose and you've got a
big number. Viola, a bunch of unique reads and a ginormous distance
matrix.\"

### Mothur can\'t find my input files

The most common cause of mothur not finding a file is because you double
clicked on the mothur executable to run mothur. This will open a
terminal or command prompt window in your home directory. Mothur will
then look for the input files in the home directory instead of in the
directory where mothur\'s executable is located. If this is the cause,
you either put the input files in your home directory, give complete
file names, or open a terminal or command prompt window, cd into the
directory where the mothur executable is located and run mothur by using
\"./mothur\" for mac or \"mothur\" for windows.

### I installed the latest version, but I am still running an older version

We often see this issue when you have an older version of mothur
installed in your path. You can find out where by opening a terminal
window and running:

    yourusername$$ which mothur
    path_to_old_version

    for example:

    yourusername$$ which mothur
    /usr/local/bin

When you find the location of the older version, you can delete it or
move it out of your path.

    yourusername$$ mv path_to_old_version/mothur new_location

    for example:
    yourusername$$ mv /usr/local/bin/mothur /Users/yourusername/desktop/old_version_mothur

### Why is my dataset only clustering to \"unique\"?

We typically see this type of thing when sequences are very divergent
from each other (e.g. protein coding sequence) or when the sequences
have not been screened to insure that they overlap the same region
followed by using filter.seqs to make sure that they start and stop in
the same alignment space. Sometimes increasing the cutoff in the
dist.seqs and cluster commands can help with this issue.

### Why does the cutoff change when I cluster with average neighbor?

This is a product of using the average neighbor algorithm with a sparse
distance matrix. When you run cluster, the algorithm looks for pairs of
sequences to merge in the rows and columns that are getting merged
together. Let\'s say you set the cutoff to 0.05. If one cell has a
distance of 0.03 and the cell it is getting merged with has a distance
above 0.05 then the cutoff is reset to 0.03, because it\'s not possible
to merge at a higher level and keep all the data. All of the sequences
are still there from multiple phyla. Incidentally, although we always
see this, it is a bigger problem for people that include sequences that
do not fully overlap.

### How do I make a tree?

Mothur has two commands that create trees:
[clearcut](clearcut) and
[tree.shared](tree.shared).

The clearcut commands creates a phylogenetic tree that represents how
sequences relate. The clearcut program written by Initiative for
Bioinformatics and Evolutionary Studies (IBEST) at the University of
Idaho. For more information about clearcut please refer to
[https://bioinformatics.hungry.com/clearcut/](https://bioinformatics.hungry.com/clearcut/)

The tree.shared command will generate a newick-formatted tree file that
describes the dissimilarity (1-similarity) among multiple groups. Groups
are clustered using the UPGMA algorithm using the distance between
communities as calculated using any of the calculators describing the
similarity in community [
membership](Calculators#Similarity_in_community_membership)
or [
structure](Calculators#Similarity_in_community_structure).

### How do I know \"who\" is in an OTU in a shared file?

You can run the [get.otulist](get.otulist) command on the [
list](List_file) file you used to generate the [
shared](Shared_file) file. You want to be sure you are
comparing the same distances. ie 98\_lt\_phylip\_amazon.an.0.03.otulist
would relate to the 0.03 distance in your shared file. Also, if you
subsample your data set and want to compare things, be sure to subsample
the list and group file and then create the shared file to make sure you
are working with the same sequences.

[    sub.sample`](sub.sample)`(list=yourListFile, group=yourGroupFile, persample=t)
[    make.shared`](make.shared)`(list=yourSubsampledListFile, group=yourSubsampledGroupFile, label=0.03)
[    get.otulist`](get.otulist)`(list=yourSubsampledListFile, label=0.03)

### How do I know \"who\" is in the OTUs represented in the venn picture?

You can run the [get.sharedseqs](get.sharedseqs) command. Be
sure to pay close attention to the \"unique\" and \"shared\" parameters,
[Get.sharedseqs\#unique\_.26\_shared](Get.sharedseqs#unique_.26_shared).

### What are mothur\'s file types?

Mothur uses and creates many file types. [
Fasta](Fasta_file), [ name](Name_file), [
group](Group_file), [ design](Design_File), [
count](Count_File), [ list](List_file), [
rabund](Rabund_file), [ sabund](Sabund_file), [
shared](Shared_file), [ relabund](Relabund_file),
[ oligos](Oligos_File), [
taxonomy](Taxonomy_outline), [
constaxonomy](Constaxonomy_file), [
phylip](Phylip-formatted_distance_matrix), [
column](Column-formatted_distance_matrix), [
flow](Flow_file), [ qfile](Quality_File), [
file](File_File) and [ tree](Tree_file). You can
find out more here: [File_Types](File_Types).

### How do I select certain sequences or groups of sequences?

Mothur has several \"get\" and \"remove\" commands:
[get.seqs](get.seqs), [get.lineage](get.lineage),
[get.groups](get.groups), [get.otus](get.otus),
[get.dists](get.dists),
[remove.seqs](remove.seqs),
[remove.lineage](remove.lineage),
[remove.otus](remove.otus),
[remove.dists](remove.dists) and
[remove.groups](remove.groups).

### Mothur reports a \"bad\_alloc\" error in the [shhh.flows](shhh.flows) command

This error indicates your computer is running out of memory. The
shhh.flows command is very memory intensive. This error is most commonly
caused by trying to process a dataset too large, using multiple
processors, or failing to run trim.flows before shhh.flows. If you are
using multiple processors, try running the command with processors=1,
the more processors you use the more memory is required. Running
trim.flows with an oligos file, and then shhh.flows with the file option
may also resolve the issue. If for some reason you are unable to run
shhh.flows with your data, a good alternative is to use the trim.seqs
command using a 50-bp sliding window and to trim the sequence when the
average quality score over that window drops below 35. Our results
suggest that the sequencing error rates by this method are very good,
but not quite as good as by shhh.flows and that the resulting sequences
tend to be a bit shorter.

### File Mismatches - \"\[ERROR\]: yourSequence is in fileA but not in fileB, please correct.\"

The most common reason this occurs is because you forgot to include a
name or count file on a command, or accidentally included the wrong one
due to a typo. Mothur has a \"current\" option, which allows you to set
file parameters to \"current\". For example, if fasta=current mothur
will use the last fasta file given or created. The current option was
designed to help avoid typo mistakes due to mothur\'s long filenames.
Another reason this might occur is a process failing when you are using
multiple processors. If a process dies, a file can be incomplete which
would cause a mismatch error downstream.

### Is there a list of all of mothur\'s commands?

Yes! You can find it here,
[Category:Commands](Category:Commands).

### How do I visualize my results from mothur?

To visual your data with R follow Pat\'s tutorial
[here](https://www.riffomonas.org/minimalR/06_line_plots.html).
