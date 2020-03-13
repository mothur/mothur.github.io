---
title: 'Shen'
redirect_from: '/wiki/Shen'
---
The **shen** calculator returns the Shen estimate of the
number of additional OTUs that would be observed for an additional level
of sampling. This calculator can be used in the
[summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands; however,
it really only makes sense to use it with the
[summary.single](summary.single) command.

$$S_{additional}=f_0\left[1-\left(1-\frac{f_1}{nf_0}\right)^m\right]$$

where,

$$f_0$$ = the number OTUs that were observed 0 times; this is estimated as
the result of the ACE estimator minus S~obs~

$$f_1$$ = the number OTUs that were observed 1 times

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
OTU. The Shen estimator is then calculated using the values found in the
subsequent columns. For demonstration we will calculate the Shen
estimator for an OTU definition of 0.03. Using the ACE estimator, the
estimated richness for a cutoff of 0.03 is 543.7. Thus, since there are
84 observed OTUs there are 459.7 unobserved OTUs. We can then predict
the number of additional OTUs that would be sampled after sampling 50
additional individuals:

$$S_{additional}=S_{additional}= 459.7\left[1-\left(1-\frac{75}{98\left(459.7\right)}\right)^{50}\right]=36.7$$

    mothur > summary.single(calc=shen, size=50)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  shen
    unique 47.462990
    0.00   46.205222
    0.01   43.711943
    0.02   42.380741
    0.03   36.745312 <---
    0.04   33.133013
    0.05   25.007797
    0.06   21.406017
    0.07   19.106443
    0.08   15.681580
    0.09   16.097046
    0.10   16.628777

These are the same values that we found above for a cutoff of 0.03. You
can change the size parameter as long as it stays as small or smaller
than the number of individuals you have already sampled. The default for
the size option is the number of sequences that have already been
sampled.
