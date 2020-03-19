---
title: 'Braycurtis'
tags: 'calculators'
redirect_from: '/wiki/Braycurtis'
---
The **braycurtis** calculator returns the
Bray-Curtis index describing the dissimilarity between the structure of
two communities. This calculator can be used in the
[summary.shared](summary.shared) and
[collect.shared](collect.shared) commands.

$$D_{Bray-Curtis}=1-2\frac{\sum min\left(S_{A,i}\mbox{, } S_{B,i}\right)}{\sum S_{A,i}+\sum S_{B,i}}$$

where,

$$S_{A,i}$$ = the number of individuals in the ith OTU of community A

$$S_{B,i}$$ = the number of individuals in the ith OTU of community B

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) with the following
commands:

    mothur > read.dist(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)
    mothur > cluster()
    mothur > read.otu(list=98_lt_phylip_amazon.fn.list, group=amazon.groups, label=0.10)

The 98\_lt\_phylip\_amazon.fn.[shared file](shared_file) will
contain the following two lines:

    0.10   forest  55  1   1   1   1   1   1   3   3   2   2   1   1   3   2   1   1   1   1   2   1   1   2   5   1   1   1   1   2   1   1   1   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   
    0.10   pasture 55  0   0   0   1   1   0   1   0   0   5   0   0   0   0   0   2   0   0   0   3   0   0   2   1   0   1   0   0   0   0   0   0   1   2   1   1   1   1   1   7   1   1   2   1   1   1   1   1   1   1   1   1   2   1   1   

This indicates that the label for the OTU definition was 0.10. The first
line is from the forest sample and the second is from the pasture
sample. There are a total of 55 OTUs between the two communities.
Writing the data in a more presentable manner we see:

  index   forest   pasture   min(A, B)
  ------- -------- --------- -----------
  1       1        0         0
  2       1        0         0
  3       1        0         0
  4       1        1         1
  5       1        0         0
  6       1        0         0
  7       3        1         1
  8       3        0         0
  9       2        0         0
  10      2        5         2
  11      1        0         0
  12      1        0         0
  13      3        0         0
  14      2        0         0
  15      1        0         0
  16      1        3         1
  17      1        0         0
  18      1        0         0
  19      2        0         0
  20      1        3         1
  21      1        0         0
  22      2        0         0
  23      5        2         2
  24      1        1         1
  25      1        0         0
  26      1        1         1
  27      1        0         0
  28      2        0         0
  29      1        0         0
  30      1        0         0
  31      1        0         0
  32      1        0         0
  33      1        1         1
  34      0        2         0
  35      0        1         0
  36      0        1         0
  37      0        1         0
  38      0        1         0
  39      0        1         0
  40      0        7         0
  41      0        1         0
  42      0        1         0
  43      0        2         0
  44      0        1         0
  45      0        1         0
  46      0        1         0
  47      0        1         0
  48      0        1         0
  49      0        1         0
  50      0        1         0
  51      0        1         0
  52      0        1         0
  53      0        2         0
  54      0        1         0
  55      0        1         0
  Total   49       49        11

Using these sums to evaluate <i>D</i> we get:

$$D_{Bray-Curtis}=1-2\frac{11}{49+49}=0.7755$$

Running\...

    mothur > summary.shared(calc=braycurtis)

\...and opening 98\_lt\_phylip\_amazon.fn.shared.summary gives:

    label  comparison      BrayCurtis
    0.10   forest  pasture     0.77551

These are the same values that we found above for a cutoff of 0.10.
