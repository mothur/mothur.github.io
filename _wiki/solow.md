---
title: 'Solow'
tags: 'calculators'
redirect_from: '/wiki/Solow'
---
The **solow** calculator returns the Solow estimate of
the number of additional OTUs that would be observed for an additional
level of sampling. This calculator can be used in the
[summary.single](/wiki/summary.single),
[collect.single](/wiki/collect.single), and
[rarefaction.single](/wiki/rarefaction.single) commands.; however,
it really only makes sense to use it with the
[summary.single](/wiki/summary.single) command.

$$S_{additional}=

\frac{f_1^2}{2f_2}\left[1-\left(1-\frac{2f_2}{nf_1}\right)^m\right]$$

where,

$$f_1$$ = the number OTUs that were observed once

$$f_2$$ = the number OTUs that were observed twice

$$N$$ = the total number of individuals in the sample

$$M$$ = the number of additional individuals to sample

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) with the following
commands:

    mothur > read.dist(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)
    mothur > cluster()

The 98\_lt\_phylip\_amazon.fn.[sabund file](/wiki/sabund_file) is
also outputted to the terminal window when the cluster() command is
executed:

    unique 2   94  2   
    0.00   2   92  3   
    0.01   2   88  5   
    0.02   4   84  2   2   1   
    0.03   4   75  6   1   2   
    0.04   4   69  9   1   2   
    0.05   4   55  13  3   2   
    0.06   4   48  14  2   4   
    0.07   4   44  16  2   4   
    0.08   7   35  17  3   2   1   0   1   
    0.09   7   35  14  3   3   0   0   2   
    0.10   7   34  13  3   2   0   0   3   

The first column is the label for the OTU definition and the second
column is an integer indicating the number of sequences in the dominant
OTU. The Solow estimator is then calculated using the values found in
the subsequent columns. For demonstration we will calculate the Solow
estimator for an OTU definition of 0.03. Therefore the predicted number
of additional OTUs that would be sampled after sampling 50 additional
individuals would be calculated as:

$$S_{additional}=\frac{75^2}{2\left(6\right)}\left[1-\left(1-\frac{2\left(6\right)}{98\left(75\right)}\right)^{50}\right] = 36.8$$

    mothur > summary.single(calc=solow, size=50)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  solow
    unique 47.452506
    0.00   46.181555
    0.01   43.645794
    0.02   42.350883
    0.03   36.773922 <---
    0.04   33.002964
    0.05   24.986966
    0.06   21.235961
    0.07   18.812465
    0.08   15.013238
    0.09   15.614269
    0.10   15.112179

These are the same values that we found above for a cutoff of 0.03. You
can change the size parameter as long as it stays as small or smaller
than the number of individuals you have already sampled. The default for
the size option is the number of sequences that have already been
sampled.
