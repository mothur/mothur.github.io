---
title: 'Thetayc'
tags: 'calculators'
redirect_from: '/wiki/Thetayc'
---
The **thetayc** calculator returns the Yue & Clayton
measure of dissimilarity between the structures of two communities. This
calculator can be used in the
[summary.shared](summary.shared) and
[collect.shared](collect.shared) commands.

$$D_{\Theta_{YC}}=1-\frac{\sum_{i=1}^{S_T} a_i b_i }{\sum_{i=1}^{S_T} \left(a_i-b_i\right)^2+\sum_{i=1}^{S_T} a_i b_i}$$

where,

$$S_{T}$$ = the total number of OTUs in communities A and B

$$a_i$$ = the relative abundance of OTU <i>i</i> in community A

$$b_i$$ = the relative abundance of OTU <i>i</i> in community B

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

  index   forest (A)   pasture (B)   (a~i~-b~i~)^2^   a~i~b~i~
  ------- ------------ ------------- ---------------- ----------
  1       1            0             0.0004           0.0000
  2       1            0             0.0004           0.0000
  3       1            0             0.0004           0.0000
  4       1            1             0.0000           0.0004
  5       1            0             0.0004           0.0000
  6       1            0             0.0004           0.0000
  7       3            1             0.0017           0.0012
  8       3            0             0.0037           0.0000
  9       2            0             0.0017           0.0000
  10      2            5             0.0037           0.0042
  11      1            0             0.0004           0.0000
  12      1            0             0.0004           0.0000
  13      3            0             0.0037           0.0000
  14      2            0             0.0017           0.0000
  15      1            0             0.0004           0.0000
  16      1            3             0.0017           0.0012
  17      1            0             0.0004           0.0000
  18      1            0             0.0004           0.0000
  19      2            0             0.0017           0.0000
  20      1            3             0.0017           0.0012
  21      1            0             0.0004           0.0000
  22      2            0             0.0017           0.0000
  23      5            2             0.0037           0.0042
  24      1            1             0.0000           0.0004
  25      1            0             0.0004           0.0000
  26      1            1             0.0000           0.0004
  27      1            0             0.0004           0.0000
  28      2            0             0.0017           0.0000
  29      1            0             0.0004           0.0000
  30      1            0             0.0004           0.0000
  31      1            0             0.0004           0.0000
  32      1            0             0.0004           0.0000
  33      1            1             0.0000           0.0004
  34      0            2             0.0017           0.0000
  35      0            1             0.0004           0.0000
  36      0            1             0.0004           0.0000
  37      0            1             0.0004           0.0000
  38      0            1             0.0004           0.0000
  39      0            1             0.0004           0.0000
  40      0            7             0.0204           0.0000
  41      0            1             0.0004           0.0000
  42      0            1             0.0004           0.0000
  43      0            2             0.0017           0.0000
  44      0            1             0.0004           0.0000
  45      0            1             0.0004           0.0000
  46      0            1             0.0004           0.0000
  47      0            1             0.0004           0.0000
  48      0            1             0.0004           0.0000
  49      0            1             0.0004           0.0000
  50      0            1             0.0004           0.0000
  51      0            1             0.0004           0.0000
  52      0            1             0.0004           0.0000
  53      0            2             0.0017           0.0000
  54      0            1             0.0004           0.0000
  55      0            1             0.0004           0.0000
  Total   49           49            0.0683           0.0137

Using these sums to evaluate <i>D</i> we get:

$$D_{\Theta_{YC}}=1-\frac{0.0137 }{0.0683+0.0137}=0.833$$

Running\...

    mothur > summary.shared(calc=thetayc)

\...and opening 98\_lt\_phylip\_amazon.fn.shared.summary gives:

    label  comparison      thetayc     thetayc_lci thetayc_hci
    0.10   forest  pasture     0.832487    0.026986    0.308039

These are the same values that we found above for a cutoff of 0.10.
