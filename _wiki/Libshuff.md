---
title: 'Libshuff'
---
The **libshuff** command implements the
[libshuff](https://whitman.myweb.uga.edu/libshuff.html) method as
previously implemented in the programs s-libshuff and libshuff. The
libshuff method is a generic test that describes whether two or more
communities have the same structure using the Cramer-von Mises test
statistic. The significance of the test statistic indicates the
probability that the communities have the same structure by chance.
Because each pairwise comparison requires two significance tests, a
correction for multiple comparisons (e.g. Bonferroni\'s correction) must
be applied. The files that we discuss in this tutorial can be obtained
by downloading the [ AmazonData.zip ](https://mothur.s3.us-east-2.amazonaws.com/wiki/_amazondata.zip)
file and decompressing it.

## Default settings

The group file is a tab-deliminated file where the first column contains
the name of the sequence and the second column contains the name of the
group that the sequence belongs to. To start this tutorial enter the
following command:

    mothur > libshuff(phylip=98_lt_phylip_amazon.dist, group=amazon.groups)

By default, the libshuff() command will carry out the integral form of
the Cramer-von Mises statistic for each pair of communities using 10,000
randomizations:

This will produce:

    ********************#****#****#****#****#****#****#****#****#****#****#
    forest-pasture      |||||||||||||||||||||||||||||||||||||||||||||||||||
    ***********************************************************************

    Comparison             dCXYScore   Significance
    forest-pasture         0.00500678  0.0081
    pasture-forest         0.00289973  0.0614

This means that the test statistic for comparing the forest sequences to
the pasture sequences is 0.00500678 and for the pasture vs. forest
comparison the statistic is 0.00289973. The significance of these values
is 0.0081 and 0.0614, respectively. If one desires an experiment-wide
false detection rate of 0.05, then these significance values need to be
less than 0.025 to be considered statistically significant. If either of
the significance values are statistically significant, one can safely
state that the two communities are significantly different. Therefore,
because 0.0081 is smaller than 0.025, the forest and pasture sequence
collections are significantly different.

The libshuff() command will generate two files:
98\_lt\_phylip\_amazon.libshuff.summary and
98\_lt\_phylip\_amazon.libshuff.coverage. The \*.summary file contains
the same output that is outputted to the screen. The \*.coverage file
provides the Good\'s coverage value within a community and between
communities for each distance level.

## Options

### iters

If you run the libshuff() command multiple times, you will notice that
while the significance score doesn\'t change, it\'s significance may
change some. This is because the testing procedure is based on a
randomization process that becomes more accurate as you increase the
number of randomizations. By default, libshuff() will do 10,000
randomizations. You can change the number of iterations with the iters
option as follows:

    mothur > libshuff(phylip=98_lt_phylip_amazon.dist, group=amazon.groups, iters=1000)

### form

There are two forms of the **libshuff** method - the integral and discrete
forms. The discrete form was originally proposed by Singleton et al.
(2001; Applied and Environmental Microbiology) and the more precise
integral form was proposed by Schloss et al. (2004; Applied and
Environmental Microbiology). By default the libshuff() command
implements the integral form of the statistic:

    mothur > libshuff(phylip=98_lt_phylip_amazon.dist, group=amazon.groups, form=integral)

Alternatively the discrete form of the statistic can be used:

    mothur > libshuff(phylip=98_lt_phylip_amazon.dist, group=amazon.groups, form=discrete)

The default step size used in the default form of the statistic is 0.01.

### step

If you use the discrete form, you can set the step size to any value you
desire:

mothur \> libshuff(phylip=98\_lt\_phylip\_amazon.dist,
group=amazon.groups, form=discrete, step=0.001)

If the step size is small enough, it is possible for the discrete and
integral forms of the method to yield the same statistic value; however,
it will be considerably slower than the integral form.

    mothur > libshuff(phylip=98_lt_phylip_amazon.dist, group=amazon.groups, form=discrete, step=0.000001) 

    Comparison             dCXYScore   Significance
    forest-pasture         0.00500679  0.0093
    pasture-forest         0.00289971  0.0599

### cutoff

By default the discrete form will consider distances between 0 and 1. To
change the upper bound of the analysis, a cutoff can be set using the
cutoff option:

    mothur > libshuff(phylip=98_lt_phylip_amazon.dist, group=amazon.groups, form=discrete, cutoff=0.10)

    Comparison             dCXYScore   Significance
    forest-pasture         0.00161599  0.0696
    pasture-forest         0.00149521  0.0854

[Category:Commands](Category:Commands)
