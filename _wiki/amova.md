---
title: 'amova'
tags: 'commands'
redirect_from: '/wiki/Amova'
---
Analysis of molecular variance is a nonparametric analog of traditional
analysis of variance. This method is widely used in population genetics
to test the hypothesis that genetic diversity within two populations is
not significantly different from that which would result from pooling
the two populations (Excoffier et al., 1992; Anderson, 2001; Martin,
2002). The AMOVA statistic was calculated by

$$SS_{within} = \frac{1}{n}\sum_{i=1}^{N-1} \sum_{j=i+1}^{N}{d_{ij}^2}\epsilon_{ij}$$

$$SS_{total}=\frac{1}{N}\sum_{i=1}^{N-1} \sum_{j=i+1}^{N}{d_{ij}^2}$$

$$SS_{among}=SS_{total}-SS_{within}$$

$$MS_{among}=\frac{SS_{among}}{a-1}$$

$$MS_{within}=\frac{SS_{within}}{N-a}$$

$$F_{statistic}=\frac{MS_{among}}{MS_{within}}$$

where n is the number of samples per treatment
(numSamples/numTreatments), a is the number of treatments, N is the
number of samples, dij is the distance between samples i and j, and eij
is 1 when i and j are from the same treatment and 0 when they are from
different treatments. A P-value is calculated by measuring the fraction
of 1000 randomizations of the rows and columns in a distance matrix
where the observed SSW is less than or equal to the randomized SSW
values.

To run the tutorial below please download the [
files](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazonamovadata.zip) and follow along\...

## Default Settings

The phylip and design parameter are required. The phylip option allow
you to enter your phylip formatted distance matrix. The design parameter
allows you to assign your samples to groups when you are running amova.
The design file is a simple tab-separated text file, with each line
listing a sample ID (corresponding to entries in the distance matrix)
and a group ID.

    mothur > amova(phylip=amazon.dist, design=amazon.design)

opening the amazon.amova file you will see:

    A-B    Among   Within  Total
    SS 0.04869 4.72878 4.77747
    df 1   96  97
    MS 0.04869 0.0492581

    Fs:    0.988466
    p-value: 0.44

## Options

### alpha

The default for the alpha parameter is 0.05.

### iters

The default for iters is 1000.

### sets

The sets parameter allows you to specify which of the sets in your
design file you would like to analyze. The set names are separated by
dashes. The default is all sets in the designfile.

## Revisions

-   1.28.0 Added sets parameter -
    [https://forum.mothur.org/viewtopic.php?f=3&t=1777](https://forum.mothur.org/viewtopic.php?f=3&t=1777)
-   1.29.0 Bug Fix:
    [https://forum.mothur.org/viewtopic.php?f=1&t=1919](https://forum.mothur.org/viewtopic.php?f=1&t=1919)


