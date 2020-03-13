---
title: 'Ace'
redirect_from: '/wiki/Ace'
---
The **ace** calculator returns the ACE richness estimate
for an OTU definition. This calculator can be used in the
[summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands. The
calculations for the ACE richness estimator are implemented as described
by Chao in the user manual for her program
[spade](https://chao.stat.nthu.edu.tw/SPADE_UserGuide.pdf) and modified
by Colwell in his program
[estimates](https://viceroy.eeb.uconn.edu/estimates). Note that this
implementation uses a bias-corrected version of γ when the coefficient
of variation is too large.

$$S_{ACE} = \begin{cases}
    S_{abund} + \frac {S_{rare}}{C_{ACE}} + \frac{n_1}{C_{ACE}}{ {\hat{\gamma}}_{ACE}^2}\mbox{, for }\hat{\gamma}_{ACE}<\mbox{0.80} 
    S_{abund} + \frac {S_{rare}}{C_{ACE}} + \frac{n_1}{C_{ACE}}{ {\tilde{\gamma}}_{ACE}^2}\mbox{, for }\hat{\gamma}_{ACE}\geqslant\mbox{0.80}
\end{cases}$$

where,

$$N_{rare} = \sum_{i=1}^{abund}{in_i}$$

$$C_{ACE} = 1 - \frac {n_1}{N_{rare}}$$

$${ {\hat{\gamma}}_{ACE}^2} = max \left[ \frac {s_{rare}}{c_{ace}} \frac{\sum_{i=1}^{abund} i \left ( i-1 \right ) n_i }{n_{rare} \left( n_{rare} - 1 \right )} - 1,0 \right ]$$

$$\tilde{\gamma}_{ACE}^2 = max \left[\hat{\gamma}_{ace}^2 \left\{1+\frac{n_{rare}\left(1-c_{ace}\right)\sum_{i=1}^{abund} i \left ( i-1 \right ) n_i }{n_{rare}\left(n_{rare}-c_{ace}\right)}\right\}\mbox{, 0}\right]$$

$$var \left( S_{ACE} \right ) {\approx} \sum_{j=1}^{n} \sum_{i=1}^{n} \frac{ {\partial}S_{ACE}}{ {\partial}n_i} \frac{ {\partial}S_{ACE}}{ {\partial}n_j}$$

$$cov \left( f_i, f_j \right) = f_i \left(1-f_i / S_{ACE} \right ), i = j$$

$$cov\left ( f_i, f_j \right) = -f_i f_j / {S_{ACE}}, i\ne j$$

$$n_{i}$$ = The number of OTUs with i individuals

$$S_{rare}$$ = The number of OTUs with \'abund\' or fewer individuals

$$S_{abund}$$ = The number of OTUs with more than \'abund\' individuals

$$abund$$ = the threshold to be considered an \'abundant\' OTU; this is
set to 10 by default and can be changed with the \'abund\' parameter in
[ summary.single](summary.single#The_abund_option), [
collect.single](collect.single%27s_curves#The_abund_option),
and [
rarefaction.single](rarefaction.single#The_abund_option).

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
OTU. The ACE estimator is then calculated using the values found in the
subsequent columns. By default ACE is calculated using an abundance
threshold of 10. This value was empirically selected in the original
publications, but can be altered. You may wish to increase or decrease
this value. For demonstration we will calculate the ACE estimator with
an abundance threshold of 5 and an OTU definition of 0.10:

$$S_{rare} = 34 + 13+3+2+0 =52$$

$$S_{abund} = 3$$

$$N_{rare} = \sum_{i=1}^{5}{in_i} = 1\left(34\right)+2\left(13\right)+3\left(3\right)+4\left(2\right)+5\left(0\right) = 77$$

$$C_{ACE} = 1 - \frac {34}{77} = 0.558442$$

$${ {\gamma}_{ACE}^2} = max \left[ \frac {52}{0.558442} \frac{ 1 \left ( 1-1 \right ) 34 + 2 \left ( 2-1 \right ) 13 + 3 \left ( 3-1 \right ) 3+ 4 \left ( 4-1 \right ) 2+ 5 \left ( 5-1 \right ) 0 }{77 \left( 77 - 1 \right )} - 1,0 \right ] = 0.0820$$

$$S_{ACE} = 3 + \frac {52}{0.558442} + \frac{34}{0.558442}0.0820 = 101.1$$

The code to calculate the confidence intervals was provided by Anne Chao
and is left for masochists to work out on their own.

Running\...

    mothur > summary.single(calc=ace, abund=5)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  ace     ace_lci     ace_hci
    unique 2352.000000 165.123709  73725.382535
    0.00   1551.666667 166.520625  29763.054270
    0.01   911.400000  171.653666  8608.541528
    0.02   1964.419917 1196.763495 3264.045830
    0.03   543.693450  296.302894  1079.361221
    0.04   362.831975  217.072510  664.727469
    0.05   190.203699  131.260760  308.779744
    0.06   155.277262  111.141296  244.566797
    0.07   132.491876  98.445244   202.265564
    0.08   101.208333  78.400541   150.829575
    0.09   102.821244  77.832409   157.784620
    0.10   101.109191  75.477067   158.826271 <---

These are the same values that we found above for a cutoff of 0.10.
