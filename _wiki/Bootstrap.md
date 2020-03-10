---
title: 'Bootstrap'
---
The **bootstrap** calculator returns the bootstrap
richness estimate for an OTU definition. This calculator can be used in
the [summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands. The
calculations for the **bootstrap** richness estimator are implemented as
described by Smith and Van Belle for a single \"quadrant\".

$$S_{bootstrap} = S_{obs} + \sum_{i=1}^{S_{obs}} \left ( 1 - \frac {S_i}{N}\right )^N$$

where,

$$N$$ = the number of individuals sampled

$$S_{i}$$ = the number of sequences in the ith OTU

$$S_{obs}$$ = the observed number of species

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](Media:AmazonData.zip) with the following
commands:

    mothur > cluster(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)
    mothur > summary.single(calc=boostrap)

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
OTU. The ACE estimator is then calculated using the values found in the
subsequent columns. For demonstration we will calculate the bootstrap
estimator for an OTU definition of 0.03:

$$S_{bootstrap} = 84 + 75 \left( 1 - \frac {1}{98}\right )^{98} + 6 \left( 1 - \frac {2}{98}\right )^{98}  + 1 \left( 1 - \frac {3}{98}\right )^{98}  + 2 \left( 1 - \frac {4}{98}\right )^{98} = 112.33$$

This ACE richness estimate is the same value that is found in
98\_lt\_phylip\_amazon.fn.summary:

    label  Bootstrap
    unique 130.668609
    0.00   129.069184
    0.01   125.870334
    0.02   120.120520
    0.03   112.326160 <---
    0.04   107.527884
    0.05   95.029232
    0.06   87.586010
    0.07   84.387159
    0.08   74.246203
    0.09   71.860150
    0.10   69.345451
