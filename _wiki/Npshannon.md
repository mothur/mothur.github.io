---
title: 'Npshannon'
---
The **npshannon** calculator returns a
non-parametric estimate of the classical [Shannon](Shannon)
diversity index for an OTU definition. This calculator can be used in
the [summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands. The
calculations for the non-parametric Shannon index are implemented as
described by Chao and Shen.

$$\hat{H}_{shannon}=\sum_{i=1}^{S_t}\frac{\hat{C}\pi_i \ln\left( \hat{C}\pi_i\right)}{1-\left(1-\hat{C}\pi_i\right)^N}$$

$$var \left(\hat{H}_{shannon} \right ) {\approx} \sum_{j=1}^{n} \sum_{i=1}^{n} \frac{ {\partial}\hat{H}}{ {\partial}n_i} \frac{ {\partial}\hat{H}}{ {\partial}n_j}$$

$$cov \left( f_i, f_j \right) = f_i \left(1-f_i / S_{ACE} \right ), i = j$$

$$cov\left ( f_i, f_j \right) = -f_i f_j / {S_{ACE}}, i\ne j$$

where,

$$\hat{C} = 1-\frac{n_1}{N}$$

$$\pi_i = \frac{n_i}{N}$$

n\_i = the number of individuals in the ith OTU

$$N \mbox{ = the number of individuals in the sample}$$

$$S_t \mbox{ = the total number of OTUs}$$

$$S_{ACE}$$ = the richness estimated using the [ace](ace)
calculator

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) with the following
commands:

    mothur > cluster(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)

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
indivdiual, the fourth the number of OTUs with two individuals, etc. The
non-parametric Shannon index is then calculated using the values found
in the subsequent columns. For demonstration we will calculate the
non-parametric Shannon index for an OTU definition of 0.03:

$$\hat{C} = 1-\frac{75}{98} = 0.2347$$

$$\hat{H}_{shannon}=
75\frac{\ 0.2347 \left(\frac{1}{98}\right) \ln\left( 0.2347\left(\frac{1}{98}\right)\right)}{1-\left(1-0.2347\left(\frac{1}{98}\right)\right)^{98}}
+6\frac{\ 0.2347 \left(\frac{2}{98}\right) \ln\left( 0.2347\left(\frac{2}{98}\right)\right)}{1-\left(1-0.2347\left(\frac{2}{98}\right)\right)^{98}}
+1\frac{\ 0.2347 \left(\frac{3}{98}\right) \ln\left( 0.2347\left(\frac{3}{98}\right)\right)}{1-\left(1-0.2347\left(\frac{3}{98}\right)\right)^{98}}
+2\frac{\ 0.2347 \left(\frac{4}{98}\right) \ln\left( 0.2347\left(\frac{4}{98}\right)\right)}{1-\left(1-0.2347\left(\frac{4}{98}\right)\right)^{98}}$$

$$\hat{H}_{shannon}=5.801$$

Running\...

    mothur > summary.single(calc=npshannon)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  NPShannon
    unique 7.768419
    0.00   7.355786
    0.01   6.831284
    0.02   6.344819
    0.03   5.800593<---
    0.04   5.559488
    0.05   5.090494
    0.06   4.853388
    0.07   4.776910
    0.08   4.495760
    0.09   4.390298
    0.10   4.297894

These are the same values that we found above for a cutoff of 0.03. At
this point we have not implemented the 95% confidence interval
calculations. As a point of reference it is worth noting that the
classical [Shannon](Shannon) index gave a value of 4.353.
