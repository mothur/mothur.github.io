---
title: 'Morisitahorn'
---
The **morisitahorn** calculator returns the
Morisita-Horn index describing the dissimilarity between the structure
of two communities. This calculator can be used in the
[summary.shared](summary.shared) and
[collect.shared](collect.shared) commands.

$$D_{Morisita-Horn}=1-2\frac{\sum\frac{S_{A,i}}{n}\frac{S_{B,i}}{m}}{\sum \left(\frac{S_{A,i}}{n}\right)^2+\sum \left(\frac{S_{B,i}}{m}\right)^2}$$

where,

$$S_{A,i}$$ = the number of individuals from community A in the ith OTU

$$S_{B,i}$$ = the number of individuals from community B in the ith OTU

$$n$$ = the number of individuals in community A

$$m$$ = the number of individuals in community B

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

  index   forest   pasture   XY   X^2^   Y^2^
  ------- -------- --------- ---- ------ ------
  1       1        0         0    1      0
  2       1        0         0    1      0
  3       1        0         0    1      0
  4       1        1         1    1      1
  5       1        0         0    1      0
  6       1        0         0    1      0
  7       3        1         3    9      1
  8       3        0         0    9      0
  9       2        0         0    4      0
  10      2        5         10   4      25
  11      1        0         0    1      0
  12      1        0         0    1      0
  13      3        0         0    9      0
  14      2        0         0    4      0
  15      1        0         0    1      0
  16      1        3         3    1      9
  17      1        0         0    1      0
  18      1        0         0    1      0
  19      2        0         0    4      0
  20      1        3         3    1      9
  21      1        0         0    1      0
  22      2        0         0    4      0
  23      5        2         10   25     4
  24      1        1         1    1      1
  25      1        0         0    1      0
  26      1        1         1    1      1
  27      1        0         0    1      0
  28      2        0         0    4      0
  29      1        0         0    1      0
  30      1        0         0    1      0
  31      1        0         0    1      0
  32      1        0         0    1      0
  33      1        1         1    1      1
  34      0        2         0    0      4
  35      0        1         0    0      1
  36      0        1         0    0      1
  37      0        1         0    0      1
  38      0        1         0    0      1
  39      0        1         0    0      1
  40      0        7         0    0      49
  41      0        1         0    0      1
  42      0        1         0    0      1
  43      0        2         0    0      4
  44      0        1         0    0      1
  45      0        1         0    0      1
  46      0        1         0    0      1
  47      0        1         0    0      1
  48      0        1         0    0      1
  49      0        1         0    0      1
  50      0        1         0    0      1
  51      0        1         0    0      1
  52      0        1         0    0      1
  53      0        2         0    0      4
  54      0        1         0    0      1
  55      0        1         0    0      1
  Total   49       49        33   99     131

Using these sums to evaluate <i>D</i> we get:

$$D_{Morista-Horn}=1-2\frac{\frac{33}{\left(49\right)\left(49\right)}}
{\frac{99}{49^2}+\frac{131}{49^2}}=0.713$$

Running\...

    mothur > summary.shared(calc=morisitahorn)

\...and opening 98\_lt\_phylip\_amazon.fn.shared.summary gives:

    label  comparison      MorisitaHorn
    0.10   forest  pasture     0.713043

These are the same values that we found above for a cutoff of 0.10.
