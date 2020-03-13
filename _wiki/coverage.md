---
title: 'Coverage'
redirect_from: '/wiki/Coverage'
---
The **coverage** calculator returns Good\'s coverage
for an OTU definition. This calculator can be used in the
[summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands.

$$C=1-\frac{n_1}{N}$$

where,

$$n_{1}$$ = the number of OTUs that have been sampled once

$$N$$ = the total number of individuals in the sample

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
OTU. The third column indicates the number of OTUs with only one
indivdiual, the fourth the number of OTUs with two individuals, etc.
Good\'s **coverage** is then calculated using the values found in the
subsequent columns. For demonstration we will calculate Good\'s coverage
for an OTU definition of 0.03:

$$C=1-\frac{75}{98} = 0.23$$

Running\...

    mothur > summary.single(calc=coverage)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  coverage
    unique 0.040816
    0.00   0.061224
    0.01   0.102041
    0.02   0.142857
    0.03   0.234694 <---
    0.04   0.295918
    0.05   0.438776
    0.06   0.510204
    0.07   0.551020
    0.08   0.642857
    0.09   0.642857
    0.10   0.653061

These are the same values that we found above for a cutoff of 0.03.
