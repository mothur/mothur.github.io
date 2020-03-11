---
title: 'Homova'
---
Homogeneity of molecular variance (HOMOVA) is a nonparametric analog of
Bartlett's test for homo- geneity of variance, which has been used in
population genetics to test the hypothesis that the genetic diversity
within two or more populations is homogeneous (Stewart and Excoffier,
1996); this test has not been used in the microbial ecology litera-
ture. The HOMOVA statistic is calculated by

$$B=\frac{\left (N-P\right)\ln\left(\frac{SS_W}{N-P}\right)-\sum_{i=1}^P\left(N_i-1\right)\ln\left(\frac{SS_{Wi}}{N_i-1}\right)}{1+ \frac{1}{3\left(P-1\right)}\left(\sum_{i=1}^P\frac{1}{N_i-1}-\frac{1}{N-P}\right)}$$

where N is the total number of sequences in the study, P is the number
of treatments, Ni is the number of sequences in treatment i, and SSWi is
the amount of SSW contributed by treatment i. The P-value of the
observed B is determined by measuring the fraction of 1000
randomizations of the rows and columns in the distance matrix, where the
observed B is greater than or equal to the randomized B-values. Those
P-values less than 0.05 were considered significant.

To run the tutorial below please download the [
files](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazonamovadata.zip) and follow along\...

## Default Settings

The phylip and design parameter are required. The phylip option allow
you to enter your phylip formatted distance matrix. The design parameter
allows you to assign your samples to groups when you are running homova.

    mothur > homova(phylip=amazon.dist, design=amazon.design)

opening the amazon.homova file you will see:

    HOMOVA BValue  P-value SSwithin_values
    A-B    0.000158784 0.979   2.36007 2.36871

## Options

### alpha

The default for the alpha parameter is 0.05.

### iters

The default for iters is 1000.

### sets

The sets parameter allows you to specify which of the sets in your
design file you would like to analyze. The set names are separated by
dashes. The default is all sets in the design file.

## Revisions

-   1.28.0 Added sets parameter -
    [https://forum.mothur.org/viewtopic.php?f=3&t=1777](https://forum.mothur.org/viewtopic.php?f=3&t=1777)
-   1.29.0 Bug Fix:
    [https://forum.mothur.org/viewtopic.php?f=1&t=1919](https://forum.mothur.org/viewtopic.php?f=1&t=1919)
-   1.40.0 Bug Fix: Fixes pvalue bug for Windows.
    [\#408](https://github.com/mothur/mothur/issues/408)

[Category:Commands](Category:Commands)
