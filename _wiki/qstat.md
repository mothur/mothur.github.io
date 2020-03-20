---
title: 'Qstat'
tags: 'calculators'
redirect_from: '/wiki/Qstat'
---
The **qstat** calculator returns the Q statistic for an
OTU definition. This calculator can be used in the
[summary.single](/wiki/summary.single),
[collect.single](/wiki/collect.single), and
[rarefaction.single](/wiki/rarefaction.single) commands.

$$Q=\frac{\frac{1}{2}n_{R1} + \sum n_r + \frac{1}{2}n_{R2}}{\ln\left(\frac{R_2}{R_1}\right)}$$

where,

$$R_1$$ = the number of individuals in an OTU when at least 25% of the
least abundance OTUs are sampled

$$R_2$$ = the number of individuals in an OTU when at least 75% of the
least abundance OTUs are sampled

$$n_{R1}$$ = the number of OTUs that belong to the OTU where the 25%
cutoff is found

$$n_{R2}$$ = the number of OTUs that belong to the OTU where the 75%
cutoff is found

$$\sum n_r$$ = the total number of OTUs that lie between the 25% and 75%
cutoffs

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) with the following
commands:

    mothur > read.dist(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)
    mothur > cluster()

The 98\_lt\_phylip\_amazon.fn.[sabund file](/wiki/sabund_file) is
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
OTU. The Q statistic is then calculated using the values found in the
subsequent columns. For demonstration we will calculate the Q statistic
for an OTU definition of 0.10. There are 55 OTUs so the 25% cutoff would
occur at 13.75 and the 75% cutoff at 41.25:

  Abundance   Number of OTUs   Cum. Num. of OTUs   Quartile
  ----------- ---------------- ------------------- ----------
  1           34               34                  \<\-- R1
  2           13               47                  \<\-- R2
  3           3                50                  
  4           2                52                  
  5           0                52                  
  6           0                52                  
  7           3                55                  

Therefore we have $$n_{R1}$$ and $$n_{R2}$$ equalling 34 and 13,
respectively and R1 and R2 are 1 and 2, respectively. Finally,
$$\sum n_r$$ equals zero.

$$Q=\frac{\frac{34}{2} + 0 + \frac{13}{2}}{\ln\left(\frac{2}{1}\right)}=33.90$$

Running\...

    mothur > summary.single(calc=qstat)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  qstat
    unique 69.249362
    0.00   68.528014
    0.01   67.085319
    0.02   62.035887
    0.03   58.429149
    0.04   56.265107
    0.05   49.051631
    0.06   44.723546
    0.07   43.280851
    0.08   37.510071
    0.09   35.346029
    0.10   33.903333 <---

These are the same values that we found above for a cutoff of 0.10.
