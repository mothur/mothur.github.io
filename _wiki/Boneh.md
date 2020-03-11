---
title: 'Boneh'
---
The **boneh** calculator returns the Boneh estimate of
the number of additional OTUs that would be observed for an additional
level of sampling. This calculator can be used in the
[summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands; however,
it really only makes sense to use it with the
[summary.single](summary.single) command.

$$S_{additional}=\sum_{i=1}^S\left(1-\frac{X_i}{N}\right)^N\left[1-\left(1-\frac{X_i}{N}\right)^M\right]+\nu\left(1-\frac{f_1}{N\nu}\right)^N\left[1-\left(1-\frac{f_1}{N\nu}\right)^M\right]$$

where,

$$S$$ = the number of OTUs sampled in initial sampling

$$X_i$$ = the number individuals in the i^th^ OTU

$$N$$ = the total number of individuals in the sample

$$M$$ = the number of additional individuals to sample

$$\nu$$ is the solution to the equation:

$$\nu\left(1-\left[1-\frac{f_1}{N\nu}\right]^N\right)= \sum_{i=1}^N f_i \left(1-\frac{i}{N}\right)^N$$

provided that:

$$f_1 > \sum_{i=1}^N f_i \exp\left(-i\right)$$

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
OTU. The Boneh estimator is then calculated using the values found in
the subsequent columns. For demonstration we will calculate the Boneh
estimator for an OTU definition of 0.03. Using GoalSeek in Microsoft
Excel, you can find that ν is equal to 31.003. Therefore the predicted
number of additional OTUs that would be sampled after sampling 50
additional individuals would be calculated as:

$$S_{additional}=
75\left(1-\frac{1}{98}\right)^{98}\left[1-\left(1-\frac{1}{98}\right)^{50}\right]
+ 6\left(1-\frac{2}{98}\right)^{98}\left[1-\left(1-\frac{2}{98}\right)^{50}\right]
+ 1\left(1-\frac{3}{98}\right)^{98}\left[1-\left(1-\frac{3}{98}\right)^{50}\right]
+ 2\left(1-\frac{4}{98}\right)^{98}\left[1-\left(1-\frac{4}{98}\right)^{50}\right]
+ 31.003\left(1-\frac{75}{98\left(31.003\right)}\right)^{98}\left[1-\left(1-\frac{75}{98\left(31.003\right)}\right)^50\right]$$

$$S_{additional}=13.5$$

    mothur > summary.single(calc=boneh, size=50)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  boneh
    unique 16.154259
    0.00   15.933878
    0.01   15.494129
    0.02   14.578435
    0.03   13.501034 <---
    0.04   12.847995
    0.05   11.078614
    0.06   10.014746
    0.07   9.599282
    0.08   8.209852
    0.09   7.835304
    0.10   7.563195

These are the same values that we found above for a cutoff of 0.03. You
can change the size parameter as long as it stays as small or smaller
than the number of individuals you have already sampled. The default for
the size option is the number of sequences that have already been
sampled.
