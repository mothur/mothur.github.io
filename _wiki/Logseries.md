---
title: 'Logseries'
---
The [logseries](logseries) calculator returns the
Kolmogorov-Smirnov test statistic for the comparison of observed
rank-abundance data to a fitted log series distribution and the critical
values for α equal to 0.01 or 0.05. This calculator can be used in the
summary.single(), collect.single(), and rarefaction.single() commands.

$$n_i=\frac{\alpha x^i}{i}$$

where,

$$\alpha=\frac{N\left(1-x\right)}{x}$$

$$\frac{S_{obs}}{N}=\frac{1-x}{x}\left(-\ln \left(1-x\right)\right)$$ is
used to find <i>x</i>

$$S_{obs}$$ = the number of observed OTUs

$$N$$ = the total number of individuals

$$n_i$$ = the number of species with <i>i</i> individuals

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](Media:AmazonData.zip) with the following
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
OTU. The numbers in the subsequent columns indicate the number of
singletons, doubletons, etc. Here we will calculate the expected number
of individuals in each OTU based on the log series distribution:

$$\frac{55}{98}=\frac{1-x}{x}\left(-\ln \left(1-x\right)\right)$$,
<i>x</i> = 0.654 by Excel

$$\alpha=\frac{98\left(1-0.65428\right)}{0.65428}=51.783$$

$$n_i=\frac{\left(51.783\right) x^i}{i}$$

  Individuals   Obs. OTUs   Expect OTUs
  ------------- ----------- -------------
  1             34          33.9
  2             13          11.1
  3             3           4.8
  4             2           2.4
  5             0           1.2
  6             0           0.7
  7             3           0.4
  <b>Sum</b>    55          54.5

Next we break the table into octaves based on log2, adding 0.5 to the
top boundary for each octave and compare the difference between the
observed and expected frequencies:

  Octave   Upper Bound   Obs. OTUs   Expect OTUs   Cumul. Obs.   F0.5   Cumul. Exp.   Difference
  -------- ------------- ----------- ------------- ------------- ------ ------------- ------------
  1        2.5           47          45.0          47            46.5   45.0          1.5358
  2        4.5           5           7.2           52            51.5   52.2          0.6712
  3        8.5           3           2.3           55            54.5   54.5          0.0303

To determine whether the log series model describes the distribution of
individuals among OTUs as we observed, we will use the
Kolmogorov-Smirnov test statistic ($$D_{max}$$). The statistic is the
maximum difference between the cumulative observed and expected values
plus 0.5 (i.e. 2.04) divided by the total number of species observed
(i.e. 55). So for this case the value was 0.0371. To test this statistic
we can calculate the critical value for α=0.05 as
0.886`{ {math|{ {radical|Sobs}}}}`{=mediawiki} or 0.1195 and α=0.01 as
1.031`{ {math|{ {radical|Sobs}}}}`{=mediawiki} or 0.1390. Because our
calculated value is less than both critical values we have no reason to
reject the hypothesis that the observed data follows the geometric
distribution.

Running\...

    mothur > summary.single(calc=geometric)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  logseries   logseries_lci   logseries_hci
    unique 0.010417    0.090427    0.105226
    0.00   0.010526    0.090902    0.105778
    0.01   0.010753    0.091874    0.106910
    0.02   0.034520    0.093916    0.109286
    0.03   0.023393    0.096671    0.112491
    0.04   0.014553    0.098444    0.114556
    0.05   0.013699    0.103698    0.120669
    0.06   0.015534    0.107443    0.125027
    0.07   0.019353    0.109059    0.126907
    0.08   0.018977    0.115347    0.134225
    0.09   0.017544    0.117354    0.136559
    0.10   0.037017    0.119468    0.139020 <---

In this table the data in the column \"logseries\" are the calculated
statistic value, those in column \"logseries\_lci\" are the critical
values for α=0.01, and those in column \"logseries\_hci\" are the
critical values for α=0.05. These are the same values that we found
above for a cutoff of 0.10.
