---
title: 'unifrac.unweighted'
tags: 'commands'
redirect_from: '/wiki/Unifrac.unweighted.html'
---
The **unifrac.unweighted** comand
implements the [unweighted UniFrac
algorithm](/wiki/unweighted_unifrac_algorithm). The
[unifrac.weighted](/wiki/unifrac.weighted) command implements the
weighted version of the command. The UniFrac methods are generic tests that describes whether two or more
communities have the same structure. The significance of the test
statistic can only indicate the probability that the communities have
the same structure by chance. The value does not indicate a level of
similarity. The files that we discuss in this tutorial can be obtained
by downloading the [ abrecovery.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/abrecovery.zip)
file and decompressing it.


## Default settings

By default, the unifrac.unweighted() command will carry out the
unweighted UniFrac test on each tree in the tree file. This algorithm
can compare more than two treatments at a time. Therefore, this test
will determine whether any of the groups within the group file have a
significantly different structure than the other groups. Execute the
command with default settings:

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups)

This will produce:

    Tree#  Groups  UWScore 
    1  A-B-C   0.703848
    It took 0 secs to run unifrac.unweighted.

or with a [ count](/wiki/Count_File) file:

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, count=abrecovery.count_table)

If you would like the significance score, you must set random=t.

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups, random=t)

    Tree#  Groups  UWScore UWSig
    1  A-B-C   0.703848    <0.001
    It took 8 secs to run unifrac.unweighted.

This means that the tree had a score of 0.703848 and that the
significance of the score (i.e. p-value) was less than 1 in 1,000. These
data are also in the abrecovery.paup.nj.uwsummary file. Looking at the
file abrecovery.paup.nj1.unweighted you will see a table with the score
of your tree with the different possible pairwise comparisons and the
distribution information for the 1,000 randomly labeled trees that were
constructed:

    A-B-CScore A-B-CRandFreq   A-B-CRandCumul  
    0.456599   0.0010  1.0000
    0.462172   0.0010  0.9990
    0.462416   0.0010  0.9980
    ...
    0.500612   0.0010  0.4820
    0.500666   0.0010  0.4810
    0.500733   0.0010  0.4800
    ...
    0.564491   0.0010  0.0030
    0.566979   0.0010  0.0020
    0.569729   0.0010  0.0010

As the output to the screen indicated, this file tells you that if your
comparison between A-B-C had a score 0.703848 then there were no
randomly-labelled trees with a score greater than or equal to 0.703848;
therefore, your p-value would be less than 0.001 (one divided by the
number of randomizations). Alternatively, if your comparison between
A-B-C had a score of 0.500733, this table would tell you that 1 of the
1,000 random trees had a score of 0.500733 and that 480 of the 1,000
random trees (i.e. P=0.4800) had a score of 0.500733 or larger.

If instead of loading abrecovery.paup.nj you had instead loaded
abrecovery.paup.bnj and run unifrac.unweighted():

    mothur > unifrac.unweighted(tree=abrecovery.paup.bnj, group=abrecovery.groups)

This will generate the abrecovery.paup.nj.uwsummary file, but it will
also generate 1,000 \*.unweighted files (one for each tree you supplied)
with contents similar to that observed in
abrecovery.paup.nj1.unweighted.

## Options

### groups

Having demonstrated that the community structure for at least one of the
three groups in the abrecovery.groups file were significantly different
from the other two, you would now like to do pairwise comparisons.
**Note:** You should not do pairwise comparisons if there is not a
significant difference at the global level. A conservative method to
determine the significance of your pairwise p-values you could divide
the overall significance threshold (e.g. typically 0.05) by the number
of comparisons that you will carry out. To do all of the possible
pairwise comparisons you will set the groups option:

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=all)
    Tree#  Groups  UWScore 
    1  A-B 0.715765
    1  A-C 0.726746
    1  B-C 0.75528
    It took 0 secs to run unifrac.unweighted.

or you could enter the following to get the same output:

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=A-B-C)

Alternatively, to only compare two of the three groups you would enter:

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=A-B)
    Tree#  Groups  UWScore 
    1  A-B 0.715765

or

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=A-C)
    Tree#  Groups  UWScore 
    1  A-C 0.726746

or

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=B-C)
    Tree#  Groups  UWScore
    1  B-C 0.75528

### iters

If you run the unifrac.weighted() command multiple times, you will
notice that while the score for your user tree doesn't change, it's
significance may change some. This is because the testing procedure is
based on a randomization process that becomes more accurate as you
increase the number of randomizations. By default, unifrac.weighted()
will do 1,000 randomizations. You can change the number of iterations
with the iters option as follows:

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups, iters=10000)

### random

The random parameter allows you to shut off the comparison to random
trees. The default is false, meaning do not compare your trees with
randomly generated trees.

### distance

The distance parameter allows you to create a distance file from the
results generated. By default no distance file is created, options are
column, lt or square.

    mothur > unifrac.unweighted(tree=abrecovery.paup.nj, group=abrecovery.groups, distance=lt)

### name

The name parameter allows you to enter a namesfile with your tree.

    mothur > unifrac.unweighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, name=abrecovery.names)

### count

The [ count](/wiki/Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > unifrac.unweighted(tree=abrecovery.paup.bnj, count=abrecovery.count_table)

### subsample

The subsample parameter allows you to enter the size pergroup of the
sample or you can set subsample=T and mothur will use the size of your
smallest group.

### consensus

The consensus parameter allows you to indicate you would like trees
built from distance matrices created with the subsampling results, as
well as a consensus tree built from these trees. Default=F.

### root

The root parameter allows you to include the entire root in your
calculations. The default is false, meaning stop at the root for this
comparison instead of the root of the entire tree.

### processors

The processors parameter allows you to specify the number of processors
to use. Default processors=Autodetect number of available processors and
use all available.

### withreplacement

The withreplacement parameter allows you to indicate you want to
subsample your data allowing for the same read to be included multiple
times. Default=f.

## Finer points

If you are missing a name from your tree or groups file mothur will warn
you and return to the mothur prompt. Be sure that you don't have spaces
in your sequence or group names.

## Revisions

-   1.28.0 Added count parameter.
-   1.29.0 Added subsampling parameters.
-   1.31.0 Added multiple processors for Windows.
-   1.33.0 Improved work balance load between processors.
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.0 Improves randomization.
-   1.40.0 Fixes segfault error for commands that use subsampling.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.41.0 Fixes crashes with subsample option.
-   1.42.0 - Adds withreplacement parameter to sub.sample command.
    [\#262](https://github.com/mothur/mothur/issues/262)
