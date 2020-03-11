---
title: 'Chao'
---
The **chao** calculator returns the Chao1 richness
estimate for an OTU definition. This calculator can be used in the
[summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands. The
calculations for the bias-corrected Chao1 richness estimator are
implemented as described by Chao in the user manual for her program
[SPADE](https://chao.stat.nthu.edu.tw/SPADE_UserGuide.pdf) and modified
by Colwell in his program
[EstimateS](https://viceroy.eeb.uconn.edu/estimates).

$$S_{chao1} = S_{obs} + \frac{ {n_1}\left ({n_1}-1 \right )}{2\left ({n_2}+1 \right )}$$

where,

$$S_{chao1}$$ = the estimated richness

$$S_{obs}$$ = the observed number of species

$$n_{1}$$ = the number of OTUs with only one sequence (i.e.
\"singletons\")

$$n_{2}$$ = the number of OTUs with only two sequences (i.e.
\"doubletons\")

To calculate the 95% confidence intervals we assume a lognormal
distribution of the variance:

$$var\left ( S_{chao1} \right ) = \frac{ {n_1}\left ({n_1}-1 \right )}{2\left ({n_2}+1 \right )} + \frac{ {n_1}\left (2{n_1}-1 \right )^2}{4\left ({n_2}+1 \right )^2} + \frac{ {n_1}^2{n_2}\left ({n_1}-1 \right )^2}{4\left ({n_2}+1 \right )^4}$$,
when n1\>0 and n2\>0

$$var\left ( S_{chao1} \right ) = \frac{ {n_1}\left ({n_1}-1 \right )}{2} + \frac{ {n_1}\left (2{n_1}-1 \right )^2}{4} - \frac{ {n_1}^4}{4S_{chao1}}$$,
when n1\>0 and n2=0

$$var\left ( S_{chao1} \right ) = S_{obs}  e^{\left (-N / S_{obs} \right )}\left (1- e^{\left (-N / S_{obs} \right )}\right )$$,
when n1=0 and n2\>=0

If n1\>0, then:

$$C = exp \left (1.96 \sqrt{\ln \left ( 1 + \frac{var\left ( S_{chao1} \right )}{\left ( S_{chao1} - S_{obs}\right )^2 }\right )} \right )$$

$$LCI_{95%} = S_{obs} + \frac {S_{chao1} - S_{obs}}{C}$$

$$UCI_{95%} = S_{obs} + C \left ( {S_{chao1} - S_{obs}}  \right )$$

Otherwise:

$$P = e^{\left (-N/S_{obs}\right)}$$

$$LCI_{95%} = max \left (S_{obs}, \frac{S_{obs}}{1-P}-1.96 \left ( \frac{S_{obs}P}{1-P} \right)^\frac{1}{2}\right )$$

$$UCI_{95%} = \frac{S_{obs}}{1-P} + 1.96 \left ( \frac{S_{obs}P}{1-P} \right)^\frac{1}{2}$$

where,

LCI = Lower bound of confidence interval

UCI = Upper bound of confidence interval

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
OTU. The Chao1 estimator is then calculated using the values found in
the third (the number of singletons)and fourth (the number of
doubletons) columns. For example, **chao** for an OTU definition of 0.10
would be calculated as:

$$S_{chao1} = 55 + \frac{34\left (33 \right )}{2\left (14 \right )} = 95.07$$

$$var\left ( S_{chao1} \right ) = \frac{34\left (33 \right )^2}{2 \left(14 \right)}
+ \frac{34\left (2 \left(34 \right)-1 \right )^2}{4\left (14 \right )^2}
+ \frac{34^2\left ( 13 \right ) \left (33 \right )^2}{ 4\left (14 \right )^4} = 341.2494$$

$$C = exp \left (1.96 \sqrt{\ln \left ( 1 + \frac{341.2494}{\left (95.07 - 55\right )^2 }\right )} \right ) = 2.3641655$$

$$LCI_{95%} = 55 + \frac {95.07 - 55}{2.3641655} = 71.9$$

$$UCI_{95%} = 55 + 2.3641655\left ( {95.07 - 55}  \right ) = 149.7$$

Running\...

    mothur > summary.single(calc=chao)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  Chao        Chao_lci    Chao_hci
    unique 1553.000000 658.490667  3870.016393
    0.00   1141.500000 522.185603  2658.668444
    0.01   731.000000  376.708692  1527.725165
    0.02   1251.000000 533.812860  3124.532743
    0.03   480.428571  262.946610  962.226261
    0.04   315.600000  192.960027  572.578658
    0.05   179.071429  123.996099  293.627620
    0.06   143.200000  103.292208  228.234805
    0.07   121.647059  91.793695   186.052404
    0.08   92.055556   73.303947   135.389388
    0.09   96.666667   74.012067   149.489903
    0.10   95.071429   71.949979   149.732827 <---

These are the same values that we found above for a cutoff of 0.10.
