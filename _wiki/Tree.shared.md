---
title: 'Tree.shared'
---
The [tree.shared](tree.shared) command will generate a
newick-formatted tree file that describes the dissimilarity
(1-similarity) among multiple groups. Groups are clustered using the
UPGMA algorithm using the distance between communities as calculated
using any of the calculators describing the similarity in community [
membership](Calculators#Similarity_in_community_membership)
or [
structure](Calculators#Similarity_in_community_structure).
Dissimilarity is calculated as one minus the similarity. This tutorial
uses the data files in [
AbRecovery.zip](Media:AbRecovery.zip).


## Default settings

Using the antibiotic recover data do the following:

    mothur >  cluster(phylip=abrecovery.dist, cutoff=0.10)
    mothur >  make.shared(list=abrecovery.fn.list, group=abrecovery.groups, label=0.03)
    mothur >  tree.shared(shared=abrecovery.fn.shared)

This will generate newick-formatted file for the classical [
Jaccard](jclass) and [ Yue & Clayton
theta](thetayc) values. The tree can be visualized in a
number of programs such as
[TreeViewX](http://darwin.zoology.gla.ac.uk/~rpage/treeviewx/). The
output files are as follows:

**abrecovery.fn.jclass.0.03.tre**

    (C:0.431051,(B:0.366667,A:0.366667):0.064384);

**abrecovery.fn.thetayc.0.03.tre**

    (C:0.473217,(B:0.347275,A:0.347275):0.125942);

## Options

### calc

Using the calc option allows one to select any of the calculators of
similarity of community membership and structure. The different
calculators can be separated with hyphens (i.e. \"-\"). For example the
following command will generate distance matrices for the [ Jaccard
coefficient using richness estimators](jest), the [ Yue &
Clayton theta](thetayc), and the [ Bray-Curtis
index](braycurtis):

    mothur > tree.shared(shared=abrecovery.fn.shared, calc=jest-thetayc-braycurtis)

Keep in mind that these are distances, which are calculated as one minus
the similarity value.

### Raw Distance Matrix

#### phylip

To read in a [phylip-formatted distance
matrix](phylip-formatted_distance_matrix) you need to use the
phylip option:

    mothur > dist.shared(shared=abrecovery.fn.shared, label=0.10)
    mothur > tree.shared(phylip=abrecovery.fn.jclass.0.10.lt.dist)

#### column & name or count

To read in a [column-formatted distance
matrix](column-formatted_distance_matrix) you must provide a
filename for [ the name option](read.dist#The_name_option) or
[ count file](Count_File):

    mothur > tree.shared(column=..., name=...)

or

    mothur > tree.shared(column=..., count=...)

### groups

At this point, if you run the following command:

    mothur > get.group()

You would have seen that there were 3 groups here: A, B, and C. If you
just want the distances between groups A and B, A and C, or B and C
enter the following (this is an admittedly silly example):

    mothur > tree.shared(shared=abrecovery.fn.shared, groups=A-B)
    mothur > tree.shared(shared=abrecovery.fn.shared, groups=A-C)
    mothur > tree.shared(shared=abrecovery.fn.shared, groups=B-C)

Keep in mind that these will output to files with the same name. So, it
is important to change the file name between commands. The following
reverts to the default behavior:

    mothur > tree.shared(shared=abrecovery.fn.shared, groups=all)

This is the same as:

    mothur > tree.shared(shared=abrecovery.fn.shared, groups=A-B-C)

### label

There may only be a couple of lines in your OTU data that you are
interested in summarizing. There are two options. You could: (i)
manually delete the lines you aren\'t interested in from you rabund,
sabund, list, or shared file; (ii) or use the label option. If you only
want to read in the data for the lines labeled unique, 0.03, 0.05 and
0.10 you would enter:

    mothur > tree.shared(shared=abrecovery.fn.shared, label=unique-0.03-0.05-0.10)

### subsample

The subsample parameter allows you to enter the size pergroup of the
sample or you can set subsample=T and mothur will use the size of your
smallest group.

### iters

The iters parameter allows you to choose the number of times you would
like to run the subsample. Default=1000.

### processors

The processors option enables you to accelerate the alignment by using
multiple processors. Default processors=Autodetect number of available
processors and use all available.

### withreplacement

The withreplacement parameter allows you to indicate you want to
subsample your data allowing for the same read to be included multiple
times. Default=f.

## Revisions

-   1.28.0 Added count parameter
-   1.29.0 added subsampling parameters
-   1.29.0 Bug Fix: - if shared file was not in alphabetical order. All
    shared files created by make.shared after 6/10 are sorted.
-   1.29.2 Bug Fix: - subsampling with eliminated groups caused crashes.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.0 - Fixes segfault error for commands that use subsampling.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.41.0 - Fixes results with shared file.
    [\#535](https://github.com/mothur/mothur/issues/535)
-   1.42.0 - Adds withreplacement parameter to sub.sample command.
    [\#262](https://github.com/mothur/mothur/issues/262)

[Category:Commands](Category:Commands)
