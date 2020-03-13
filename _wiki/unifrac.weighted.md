---
title: 'unifrac.weighted'
tags: 'commands'
redirect_from: '/wiki/Unifrac.weighted.html'
---
The **unifrac.weighted** comand implements
the [weighted unifrac algorithm](weighted_UniFrac_algorithm).
The [unifrac.unweighted](unifrac.unweighted) command
implements the unweighted version of the command. Both of these methods
are available through the [unifrac](https://bmf2.colorado.edu/unifrac)
website. The UniFrac methods are generic tests that describes whether
two or more communities have the same structure. The significance of the
test statistic can only indicate the probability that the communities
have the same structure by chance. The value does not indicate a level
of similarity. The files that we discuss in this tutorial can be
obtained by downloading the [
AbRecovery.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/abrecovery.zip) file and decompressing
it.


## unifrac.weighted()

By default, the unifrac.weighted() command will carry out the weighted
UniFrac test on each tree in the tree file. Since this version of the
algorithm can only compare two treatments at a time there is no global
test as there is for the parsimony and unweighted UniFrac algorithms.
Therefore, this test will determine whether any of the groups within the
group file have a significantly different structure than the other
groups. Execute the command with default settings:

    mothur > unifrac.weighted(tree=abrecovery.paup.nj, group=abrecovery.groups)

or with a [ count file](Count_File):

    mothur > unifrac.weighted(tree=abrecovery.paup.nj, count=abrecovery.count_table)

This will produce:

    Tree#  Groups  WScore
    1  A-B 0.3660
    1  A-C 0.3817
    1  B-C 0.4184

If you would like to see the significance scores, run:

    mothur > unifrac.weighted(tree=abrecovery.paup.nj, group=abrecovery.groups, random=t)

    Tree#  Groups  WScore  WSig
    1  A-B 0.366001    <0.001
    1  A-C 0.381741    <0.001
    1  B-C 0.418381    <0.001
    It took 54 secs to run unifrac.weighted.

This means that the tree had scores between 0.3630 and 0.4184 for each
of the pairwise comparisons and that the significance of the score (i.e.
p-value) was less than 1 in 1,000. If any of the p-values had been
greater than 0.01667, then that comparison would not be considered
significant. Instead, here all three comparisons are significant. These
data are also in the abrecovery.paup.nj.wsummary file. Looking at the
file abrecovery.paup.nj1.weighted you will see a table with the score of
your tree with the different possible pairwise comparisons and the
distribution information for the 1,000 randomly labelled trees that were
constructed:

    A-BScore   A-BRandFreq A-BRandCumul    A-CRandFreq A-CRandCumul    B-CRandFreq B-CRandCumul
    0.067772   0.000       1.000       0.001       1.000       0.000       1.000
    0.071141   0.000       1.000       0.001       0.999       0.000       1.000
    0.071259   0.000       1.000       0.001       0.998       0.000       1.000
    ...
    0.128733   0.000       0.597       0.001       0.404       0.000       0.618
    0.128744   0.000       0.597       0.001       0.403       0.000       0.618
    0.128749   0.001       0.597       0.000       0.402       0.000       0.618
    0.128816   0.000       0.596       0.001       0.402       0.000       0.618
    0.128875   0.001       0.596       0.000       0.401       0.000       0.618
    ...
    0.240668   0.000       0.002       0.000       0.000       0.001       0.001
    0.244803   0.001       0.002       0.000       0.000       0.000       0.000
    0.265212   0.001       0.001       0.000       0.000       0.000       0.000

As the output to the screen indicated, this file tells you that if your
comparison between A and B had a score 0.3630 then there were no
randomly-labelled trees with a score greater than or equal to 0.3630;
therefore, your p-value would be less than 0.001 (one divided by the
number of randomizations). Alternatively, if your comparison between A
and B had a score of 0.128749, this table would tell you that 1 of the
1,000 random trees had a score of 0.128749 and that 597 of the 1,000
random trees (i.e. P=0.597) had a score of 0.128749 or larger.

If instead of loading abrecovery.paup.nj you had instead loaded
abrecovery.paup.bnj and run unifrac.weighted():

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups)

This will generate the abrecovery.paup.nj.wsummary file, but it will
also generate 1,000 \*.weighted files (one for each tree you supplied)
with contents similar to that observed in abrecovery.paup.nj1.weighted.

### The ***groups*** option

Although the weighted.unifrac() command will do all of the pairwise
comparisons for you by default, you can specify those comparisons that
you are most interested in. For example,

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, groups=A-B)
    Tree#  Groups  WScore  WSig
    1  A-B 0.366   <0.001

or

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, groups=A-C)
    Tree#  Groups  WScore  WSig
    1  A-C 0.3817  <0.001

or

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, groups=B-C)
    Tree#  Groups  WScore  WSig
    1  B-C 0.4184  <0.001

You should notice that these scores and significance levels are the same
as what you would get by running the basic unifrac.weighted() command.
For the sake of keeping command options parallel between
unifrac.weighted(), unifrac.unweighted(), and parsimony(), these two
commands will yield the same output as the default unifrac.weighted():

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, groups=A-B-C)
    Tree#  Groups  WScore  WSig
    1  A-B 0.3660  <0.001
    1  A-C 0.3817  <0.001
    1  B-C 0.4184  <0.001

or

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, groups=all)
    Tree#  Groups  WScore  WSig
    1  A-B 0.3660  <0.001
    1  A-C 0.3817  <0.001
    1  B-C 0.4184  <0.001

### The *iters* option

If you run the unifrac.weighted() command multiple times, you will
notice that while the score for your user tree doesn\'t change, it\'s
significance may change some. This is because the testing procedure is
based on a randomization process that becomes more accurate as you
increase the number of randomizations. By default, unifrac.weighted()
will do 1,000 randomizations. You can change the number of iterations
with the iters option as follows:

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, iters=10000)

### The *random* option

The random parameter allows you to shut off the comparison to random
trees. The default is false, meaning do not compare your trees with
randomly generated trees.

### The *distance* option

The distance parameter allows you to create a distance file from the
results generated. By default no distance file is created, options are
column, lt or square.

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, distance=lt)

### The *name* option

The name parameter allows you to enter a namesfile with your tree.

    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, group=abrecovery.groups, name=abrecovery.names)

### The *count* option

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. For the **unifrac.weighted** command it must
also contain group information.

    mothur > make.table(group=abrecovery.groups, name=abrecovery.names)
    mothur > unifrac.weighted(tree=abrecovery.paup.bnj, count=abrecovery.count_table)

### subsample

The subsample parameter allows you to enter the size pergroup of the
sample or you can set subsample=T and mothur will use the size of your
smallest group.

### iters

The iters parameter allows you to choose the number of times you would
like to run the subsample. Default=1000.

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

## withreplacement

The withreplacement parameter allows you to indicate you want to
subsample your data allowing for the same read to be included multiple
times. Default=f.

## Finer points

If you are missing a name from your tree or groups file mothur will warn
you and return to the mothur prompt. Be sure that you don\'t have spaces
in your sequence or group names.

## Revisions

-   1.28.0 Added count parameter
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


