---
title: 'Geometric'
---
The **geometric** calculator returns the
Kolmogorov-Smirnov test statistic for the comparison of observed
rank-abundance data to a fitted **geometric** series distribution and the
critical values for α equal to 0.01 or 0.05. This calculator can be used
in the [summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands.

$$S_i=NC_K K\left(1-K\right)^\left(i-1\right)$$

where,

$$C_K=\left(1-\left(1-K \right)^{S_{obs}} \right)^{-1}$$

$$S_i$$ = number of individuals in the ith OTU

$$N$$ = the total number of individuals

To calculate K, the following equation is solved for K

$$\frac{N_{min}}{N}=\left(\frac{k}{1-k}\right)\frac{\left(1-k\right)^{S_{obs}}}{1-\left(1-k\right)^{S_{obs}}}$$

where,

$$N_{min}$$ = the number of individuals in the most rare OTU

$$S_{obs}$$ = total number of observed OTUs

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
of individuals in each OTU based on the **geometric** series distribution:

$$\frac{1}{98}=\left(\frac{K}{1-K}\right)\frac{\left(1-K\right)^{55}}{1-\left(1-K\right)^{55}}$$,
$$K = 0.019424$$, by Excel

$$C_K=\left(1-\left(1-0.019424 \right)^{55} \right)^{-1} = 1.5151$$

$$S_i=\left(98\right)\left(1.5151\right) \left(0.019424\right) \left(1-0.019424\right)^\left(i-1\right) = 2.8841\left(0.9806\right)^\left(i-1\right)$$

  OTU Rank   Indiv. Obs.   Expected   Cum. Obs.   Cum. Exp.   Difference
  ---------- ------------- ---------- ----------- ----------- ------------
  1          7             2.884      7           2.88        4.12
  2          7             2.828      14          5.71        8.29
  3          7             2.773      21          8.49        12.51
  4          4             2.719      25          11.21       13.79
  5          4             2.667      29          13.87       15.13
  6          3             2.615      32          16.49       15.51
  7          3             2.564      35          19.05       15.95
  8          3             2.515      38          21.57       16.43
  9          2             2.466      40          24.03       15.97
  10         2             2.418      42          26.45       15.55
  11         2             2.371      44          28.82       15.18
  12         2             2.325      46          31.15       14.85
  13         2             2.280      48          33.42       14.58
  14         2             2.236      50          35.66       14.34
  15         2             2.192      52          37.85       14.15
  16         2             2.150      54          40.00       14.00
  17         2             2.108      56          42.11       13.89
  18         2             2.067      58          44.18       13.82
  19         2             2.027      60          46.20       13.80
  20         2             1.988      62          48.19       13.81
  21         2             1.949      64          50.14       13.86
  22         1             1.911      65          52.05       12.95
  23         1             1.874      66          53.93       12.07
  24         1             1.838      67          55.77       11.23
  25         1             1.802      68          57.57       10.43
  26         1             1.767      69          59.33       9.67
  27         1             1.733      70          61.07       8.93
  28         1             1.699      71          62.77       8.23
  29         1             1.666      72          64.43       7.57
  30         1             1.634      73          66.07       6.93
  31         1             1.602      74          67.67       6.33
  32         1             1.571      75          69.24       5.76
  33         1             1.541      76          70.78       5.22
  34         1             1.511      77          72.29       4.71
  35         1             1.482      78          73.77       4.23
  36         1             1.453      79          75.23       3.77
  37         1             1.425      80          76.65       3.35
  38         1             1.397      81          78.05       2.95
  39         1             1.370      82          79.42       2.58
  40         1             1.343      83          80.76       2.24
  41         1             1.317      84          82.08       1.92
  42         1             1.292      85          83.37       1.63
  43         1             1.267      86          84.64       1.36
  44         1             1.242      87          85.88       1.12
  45         1             1.218      88          87.10       0.90
  46         1             1.194      89          88.29       0.71
  47         1             1.171      90          89.46       0.54
  48         1             1.148      91          90.61       0.39
  49         1             1.126      92          91.74       0.26
  50         1             1.104      93          92.84       0.16
  51         1             1.083      94          93.93       0.07
  52         1             1.062      95          94.99       0.01
  53         1             1.041      96          96.03       0.03
  54         1             1.021      97          97.05       0.05
  55         1             1.001      98          98.05       0.05

To determine whether the **geometric** model describes the distribution of
individuals among OTUs as we observed, we will use the
Kolmogorov-Smirnov test statistic ($$D_{max}$$). The statistic is the
maximum difference between the cumulative observed and expected values
(i.e. 16.43) divided by the total number of individuals sampled (i.e.
98). So for this case the value was 0.1677. To test this statistic we
can calculate the critical value for α=0.05 as
0.886`{ {math|{ {radical|Sobs}}}}`{=mediawiki} or 0.1195 and α=0.01 as
1.031`{ {math|{ {radical|Sobs}}}}`{=mediawiki} or 0.1390. Because our
calculated value is greater than both critical values we are confident
(P\<0.01) that the observed and expected values are significantly
different and we can reject the hypothesis that the observed data
follows the **geometric** distribution.

Running\...

    mothur > summary.single(calc=geometric)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  geometric   geometric_lci   geometric_hci
    unique 0.019556    0.105226    0.090427
    0.00   0.028679    0.105778    0.090902
    0.01   0.045567    0.106910    0.091874
    0.02   0.081446    0.109286    0.093916
    0.03   0.112433    0.112491    0.096671
    0.04   0.123174    0.114556    0.098444
    0.05   0.136999    0.120669    0.103698
    0.06   0.140532    0.125027    0.107443
    0.07   0.131241    0.126907    0.109059
    0.08   0.121753    0.134225    0.115347
    0.09   0.148807    0.136559    0.117354
    0.10   0.167704    0.139020    0.119468 <---

In this table the data in the column \"geometric\" are the calculated
statistic value, those in column \"geometric\_lci\" are the critical
values for α=0.01, and those in column \"geometric\_hci\" are the
critical values for α=0.05. These are the same values that we found
above for a cutoff of 0.10.
