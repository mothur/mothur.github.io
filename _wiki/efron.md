---
title: 'Efron'
redirect_from: '/wiki/Efron'
---
The **efron** calculator returns the Efron estimate of
the number of additional OTUs that would be observed for an additional
level of sampling. This calculator can be used in the
[summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands; however,
it really only makes sense to use it with the
[summary.single](summary.single) command.

$$S_{additional}=\sum_{i=1}^{f_{max}}\left(-1\right)^{i+1}\left(\frac{M}{N}\right)^i f_i$$

where,

$$S$$ = the number of OTUs sampled in initial sampling

$$f_i$$ = the number OTUs that were observed i times

$$f_{max}$$ = the size of the largest OTU

$$N$$ = the total number of individuals in the sample

$$M$$ = the number of additional individuals to sample

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) with the following
commands:

    mothur > read.dist(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)
    mothur > cluster()

The 98\_lt\_phylip\_amazon.fn.[sabund file](sabund_file) is
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
OTU. The Efron estimator is then calculated using the values found in
the subsequent columns. For demonstration we will calculate the Efron
estimator for an OTU definition of 0.03. Therefore the predicted number
of additional OTUs that would be sampled after sampling 50 additional
individuals would be calculated as:

$$S_{additional}=
\left(-1\right)^{2}\left(\frac{50}{98}\right)^1 75 + \left(-1\right)^{3}\left(\frac{50}{98}\right)^2 6 + \left(-1\right)^{4}\left(\frac{50}{98}\right)^3 1 + \left(-1\right)^{5}\left(\frac{50}{98}\right)^4 2 = 36.7$$

    mothur > summary.single(calc=efron, size=50)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  efron
    unique 47.438567
    0.00   46.157851
    0.01   43.596418
    0.02   42.534387
    0.03   36.700746 <---
    0.04   32.858597
    0.05   24.940128
    0.06   20.840060
    0.07   18.278627
    0.08   14.902015
    0.09   15.589607
    0.10   14.822782

These are the same values that we found above for a cutoff of 0.03. You
can change the size parameter as long as it stays as small or smaller
than the number of individuals you have already sampled. The default for
the size option is the number of sequences that have already been
sampled.
