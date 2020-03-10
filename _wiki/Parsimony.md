---
title: 'Parsimony'
---
The **parsimony** command implements the [parsimony
method](parsimony_method) (aka P-test), which was previously
implemented in TreeClimber and is also available in MacClade and on the
UniFrac website. The **parsimony** method is a generic test that describes
whether two or more communities have the same structure. The
significance of the test statistic can only indicate the probability
that the communities have the same structure by chance. The value does
not indicate a level of similarity. The files that we discuss in this
tutorial can be obtained by downloading the [
AbRecovery.zip](Media:AbRecovery.zip) file and decompressing
it.


## Default settings

By default, the parsimony() command will carry out the **parsimony** test on
each tree in the tree file and will perform a global test. The global
test determines whether any of the groups within the group file have a
significantly different structure than the other groups. Execute the
command with default settings:

    mothur > parsimony(tree=abrecovery.paup.nj, group=abrecovery.groups)

or with a [ count file](Count_File):

    mothur > parsimony(tree=abrecovery.paup.nj, count=abrecovery.count_table)

This will produce:

    Tree#  Groups  ParsScore   ParsSig
    1  A-B-C   49      <0.001

This means that the tree had a score of 49 and that the significance of
the score (i.e. p-value) was less than 1 in 1,000. These data are also
in the abrecovery.paup.nj.psummary file. Looking at the file
abrecovery.phylip.nj.parsimony you will see a table with the score of
your tree and the distribution information for the 1,000 random-joining
trees that were constructed:

    A-B-CScore A-B-CUserFreq   A-B-CUserCumul  A-B-CRandFreq   A-B-CRandCumul
    51     1.000000    1.000000    0.000000    0.000000
    102        0.000000    1.000000    0.001000    0.001000
    103        0.000000    1.000000    0.001000    0.002000
    104        0.000000    1.000000    0.003000    0.005000
    105        0.000000    1.000000    0.003000    0.008000
    106        0.000000    1.000000    0.014000    0.022000
    107        0.000000    1.000000    0.017000    0.039000
    108        0.000000    1.000000    0.029000    0.068000
    109        0.000000    1.000000    0.034000    0.102000
    110        0.000000    1.000000    0.044000    0.146000
    111        0.000000    1.000000    0.073000    0.219000
    112        0.000000    1.000000    0.080000    0.299000
    113        0.000000    1.000000    0.066000    0.365000
    114        0.000000    1.000000    0.079000    0.444000
    115        0.000000    1.000000    0.089000    0.533000
    116        0.000000    1.000000    0.088000    0.621000
    117        0.000000    1.000000    0.086000    0.707000
    118        0.000000    1.000000    0.077000    0.784000
    119        0.000000    1.000000    0.064000    0.848000
    120        0.000000    1.000000    0.042000    0.890000
    121        0.000000    1.000000    0.035000    0.925000
    122        0.000000    1.000000    0.031000    0.956000
    123        0.000000    1.000000    0.020000    0.976000
    124        0.000000    1.000000    0.014000    0.990000
    125        0.000000    1.000000    0.003000    0.993000
    126        0.000000    1.000000    0.002000    0.995000
    127        0.000000    1.000000    0.003000    0.998000
    128        0.000000    1.000000    0.002000    1.000000

As the output to the screen indicated, this file tells you that you had
one tree with a score of 49 and that none of the 1,000 random trees had
a score of 51. Alternatively, if your tree had a score of 110, this
table would tell you that 44 of the 1,000 random trees (i.e. P=0.044)
had a score of 110 and that 146 of the 1,000 random trees (i.e. P=0.146)
had a score of 110 or smaller.

If instead of loading abrecovery.paup.nj you had instead loaded
abrecovery.paup.bnj and run parsimony():

    mothur > parsimony(tree=abrecovery.paup.bnj, group=abrecovery.groups)

You would get output that looks something like:

    Tree#  Comb    ParsScore   ParsSig
    1  A-B-C       46  <0.001
    2  A-B-C       51  <0.001
    3  A-B-C       50  <0.001
    4  A-B-C       49  <0.001
    5  A-B-C       49  <0.001
    ...
    997    A-B-C       47  <0.001
    998    A-B-C       50  <0.001
    999    A-B-C       48  <0.001
    1000   A-B-C       51  <0.001

Each line in the output represents one of the 1,000 bootstrap replicates
that are in abrecovery.paup.bnj and this output is provided in the file
abrecovery.paup.bnj.psummary. The file abrecovery.paup.bnj.parsimony
would look like:

    A-B-CScore A-B-CUserFreq   A-B-CUserCumul  A-B-CRandFreq   A-B-CRandCumul
    45     0.002000    0.002000    0.000000    0.000000
    46     0.007000    0.009000    0.000000    0.000000
    47     0.034000    0.043000    0.000000    0.000000
    48     0.086000    0.129000    0.000000    0.000000
    49     0.126000    0.255000    0.000000    0.000000
    50     0.164000    0.419000    0.000000    0.000000
    51     0.186000    0.605000    0.000000    0.000000
    52     0.171000    0.776000    0.000000    0.000000
    53     0.102000    0.878000    0.000000    0.000000
    54     0.067000    0.945000    0.000000    0.000000
    55     0.035000    0.980000    0.000000    0.000000
    56     0.015000    0.995000    0.000000    0.000000
    57     0.004000    0.999000    0.000000    0.000000
    58     0.001000    1.000000    0.000000    0.000000
    100        0.000000    1.000000    0.001000    0.001000
    101        0.000000    1.000000    0.002000    0.003000
    102        0.000000    1.000000    0.003000    0.006000
    103        0.000000    1.000000    0.004000    0.010000
    104        0.000000    1.000000    0.006000    0.016000
    105        0.000000    1.000000    0.010000    0.026000
    106        0.000000    1.000000    0.014000    0.040000
    107        0.000000    1.000000    0.024000    0.064000
    108        0.000000    1.000000    0.034000    0.098000
    109        0.000000    1.000000    0.047000    0.145000
    110        0.000000    1.000000    0.050000    0.195000
    111        0.000000    1.000000    0.056000    0.251000
    112        0.000000    1.000000    0.078000    0.329000
    113        0.000000    1.000000    0.079000    0.408000
    114        0.000000    1.000000    0.077000    0.485000
    115        0.000000    1.000000    0.072000    0.557000
    116        0.000000    1.000000    0.074000    0.631000
    117        0.000000    1.000000    0.091000    0.722000
    118        0.000000    1.000000    0.068000    0.790000
    119        0.000000    1.000000    0.072000    0.862000
    120        0.000000    1.000000    0.053000    0.915000
    121        0.000000    1.000000    0.028000    0.943000
    122        0.000000    1.000000    0.019000    0.962000
    123        0.000000    1.000000    0.014000    0.976000
    124        0.000000    1.000000    0.010000    0.986000
    125        0.000000    1.000000    0.006000    0.992000
    126        0.000000    1.000000    0.004000    0.996000
    127        0.000000    1.000000    0.001000    0.997000
    128        0.000000    1.000000    0.001000    0.998000
    130        0.000000    1.000000    0.002000    1.000000

The difference between this output and that of abrecovery.paup.bnj is
that in this case you have supplied 1,000 user-generated trees via
bootstrapping. This table tells you that you provided 186 trees that had
a score of 51 and that 605 of your 1,000 bootstrap replicates had a
score less than or equal to 51. All of the trees had a score less than
or equal to 58 and thus, they all had a p-value \< 0.001.

## Options

### name

The name option allows you to enter a namefile with your treefile.

     mothur > parsimony(tree=abrecovery.phylip.nj, group=abrecovery.groups, name=abrecovery.names)

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

     mothur > make.table(group=abrecovery.groups, name=abrecovery.names)
     mothur > parsimony(tree=abrecovery.phylip.nj, count=abrecovery.count_table)

### groups

Having demonstrated that the community structure for at least one of the
three groups in the abrecovery.groups file were significant from the
other two, you would now like to do pairwise comparisons. **Note:** You
should not do pairwise comparisons if there is not a significant
difference at the global level. A conservative method to determine the
significance of your pairwise p-values you could divide the overall
significance threshold (e.g. typically 0.05) by the number of
comparisons that you will carry out. To do all of the possible pairwise
comparisons you will set the groups option:

    mothur > parsimony(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=all)
    Tree#  Groups  ParsScore   ParsSig
    1  A-B 33      <0.001
    1  A-C 15      <0.001
    1  B-C 13      <0.001
    1  A-B-C   49      <0.001

or you could enter the following to get the same output:

    mothur > parsimony(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=A-B-C)

Alternatively, to only compare two of the three groups you would enter:

    mothur > parsimony(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=A-B)
    Tree#  Groups  ParsScore   ParsSig
    1  A-B 33  <0.001

or

    mothur > parsimony(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=A-C)
    Tree#  Groups  ParsScore   ParsSig
    1  A-C 15  <0.001

or

    mothur > parsimony(tree=abrecovery.paup.nj, group=abrecovery.groups, groups=B-C)
    Tree#  Groups  ParsScore   ParsSig
    1  B-C 13  <0.001

All of this tells you that the three groups harbor significantly
different community structures from each other since the p-values are
all less than 0.01667 (i.e. 0.05/3).

### iters

If you run the parsimony() command multiple times, you will notice that
while the score for your user tree doesn\'t change, it\'s significance
may change some. This is because the testing procedure is based on a
randomization process that becomes more accurate as you increase the
number of randomizations. By default, parsimony() will do 1,000
randomizations. You can change the number of iterations with the iters
option as follows:

    mothur > parsimony(tree=abrecovery.paup.nj, group=abrecovery.groups, iters=10000)

### random

If you just want to construct a distribution of scores for some number
of random trees you want the random option. To do this type something
like the following where the value given to random (i.e. random) is the
root file name where you will put the output:

    mothur > parsimony(random=random.parsimony)

You will then be guided through a series of interactive questions\...

    Please enter the number of groups you would like to analyze: 2
    Please enter the number of sequences in group 1: 200
    Please enter the number of sequences in group 2: 200

Here I built and scored 1,000 trees for two groups that each had 200
sequences in them. If we open the random.parsimony file we will see the
distribution:

    Score  RandFreq    RandCumul
    8.0000     0.0010      0.0010
    9.0000     0.0070      0.0080
    10.0000        0.0240      0.0320
    11.0000        0.0640      0.0960
    12.0000        0.1440      0.2400
    13.0000        0.1980      0.4380
    14.0000        0.2310      0.6690
    15.0000        0.1940      0.8630
    16.0000        0.0870      0.9500
    17.0000        0.0430      0.9930
    18.0000        0.0070      1.0000

### processors

The processors parameter allows you to specify the number of processors
to use. Default processors=Autodetect number of available processors and
use all available.

## Fine points

### Missing names in tree or group file

If you are missing a name from your tree or groups file mothur will warn
you and return to the mothur prompt. Be sure that you don\'t have spaces
in your sequence or group names.

### Differences in implementation

A minor difference between the mothur/TreeClimber and UniFrac
implementations concerns how the significance is assessed. We test the
significance by generating a large number (e.g. 1,000) of random-joining
trees and score each tree to generate the distribution. The UniFrac web
site\'s implementation uses the input tree topology and randomizes the
labels on the leaves of the tree a large number of times and scores each
tree to generate the distribution. The difference in p-values is next to
nothing; however, the random joining trees were in the original
description of the method by [Maddision & Slatkin
(1990)](http://www.ncbi.nlm.nih.gov/pubmed/2227384)

## Revisions

-   1.28.0 Added count parameter
-   1.28.0 Bug Fix - name file info was not included in the creation of
    the random trees which effected significance values.
-   1.31.0 Added multiple processors for Windows.
-   1.33.0 Improved work balance load between processors.
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.

[Category:Commands](Category:Commands)
