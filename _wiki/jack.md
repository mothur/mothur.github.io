---
title: 'Jack'
tags: 'calculators'
redirect_from: '/wiki/Jack'
---
The **jack** calculator returns the interpolated
Jackknife richness estimate for an OTU definition. This calculator can
be used in the [summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands. The
calculations for the Jackknife richness estimator are implemented as
described by Burnham and Overton. Note that programs like EstiamteS and
various microbial ecology papers present either the first and/or second
order Jackknife estimate. This method essentially uses a statistical
procedure to determine which order results in the minimum bias (error).

$$S_{jack,k} = S_{obs} + \sum_{i=1}^k \left ( -1 \right )^{i+1} {k \choose i} n_i$$

$$var \left( S_{jack,k} \right ) = \sum_{i=1}^{n_t} \left ( a_{ik} \right )^2 n_i - S_{jack,k}$$

$$a_{ik} = \begin{cases}
\left ( -1 \right )^{i+1} {k \choose i} + 1\mbox{, i}=\mbox{1...k}
1\mbox{, i}>\mbox{k}
\end{cases}$$

where,

k = The order of the Jackknife estimate

$$n_t$$ = The number of sequences in the largest OTU.

To determine which order of the estimate to use it is necessary to
calculate the test statistics, $$T_k$$:

$$T_k = \frac{S_{jack,k+1} - S_{jack,k}}{\left ( var \left( S_{jack,k+1} - S_{jack,k} | S \right )\right )^2}$$

$$var \left( S_{jack,k+1} - S_{jack,k} | S \right ) = \frac {S_{obs}}{S_{obs}-1} \left [ \sum_{i=1}^{n_1} \left ( b_{i}^2 n_i \right ) - \frac{\left ( s_{jack,k+1} - s_{jack,k} \right )^2 }{s_{obs}}\right ]$$

where,

$$b_i = a_{i,k+1}-a_{i,k}$$

For each $$T_k$$ value, calculate its two-sided p-value. Find the first
k-value where $$P_k$$\>0.05 and calculate c and d:

$$c = \frac {0.05 - P_{k-1}}{P_k - P_{k-1}}$$

$$d_i = ca_{i,k} + \left( i-c \right )a_{i,k-1}$$

With c and d, calculate the interpolated $$S_{jack}$$ and its standard
error:

$$S_{jack} = \sum_{i=1}^{n_1}d_i n_i$$

$$se \left ( S_{jack} \right ) = \left ( \sum_{i=1}^{n_1} \left ( d_{i}^2 n_i\right )-S_{jack}\right )^{0.5}$$

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
OTU. The Jackknife estimator is then calculated using the values found
in the subsequent columns. For example, the calculations for an OTU
definition of 0.03 and k=1 would include:

$$S_{jack,1} = 84 + \left ( -1 \right )^{2} {1 \choose 1} 75 = 159$$

$$a_{11}=\left ( -1 \right )^{2} {1 \choose 1} + 1 = 2$$

$$a_{21}= a_{31}= a_{41}=1$$

$$var \left( S_{jack,1} \right ) = \left(a_{11}^2 \right) 75 + \left(a_{21}^2 \right) 6 + \left(a_{31}^2 \right) 1 + \left(a_{41}^2 \right) 2-S_{jack,k}= \left(4\right) 75 + \left(1\right) 6 + \left(1\right) 1 + \left(1\right) 2 -159= 150$$

The statistics for the remaining k's and the Tk and Pk can be
calculated:

    k     Sj,k    var      Tk       Pk
    1     159     150     13.91  <0.0001
    2     228     450     8.89   <0.0001
    3     292     938     5.77   <0.0001
    4     350     1700    3.36    0.0008<---
    5     399     2940    1.54    0.1235<---
    6     434     5250     

The p-value crosses 0.05 between a order of 4 and 5 and you can
calculate a c-value of 0.40 and the interpolated $$S_{jack}$$ of 369.64
with 95% confidence interval between 278.98 and 460.30.

Running\...

    mothur > summary.single(calc=jack)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  Jackknife   Jackknife_lci   Jackknife_hci
    unique 1549.202880 939.980213  2158.425548
    0.00   1106.253448 698.849662  1513.657235
    0.01   705.482860  471.308255  939.657466
    0.02   623.978806  464.534765  783.422847
    0.03   369.639494  278.978083  460.300904 <---
    0.04   297.567063  221.375904  373.758221
    0.05   185.682530  141.619413  229.745648
    0.06   150.890195  116.993035  184.787355
    0.07   117.801661  95.890012   139.713311
    0.08   95.071587   78.049671   112.093503
    0.09   95.406507   77.224837   113.588177
    0.10   93.278681   74.883420   111.673942

These are the same values that we found above for a cutoff of 0.03.
