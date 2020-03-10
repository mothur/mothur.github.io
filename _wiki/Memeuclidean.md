---
title: 'Memeuclidean'
---
The **memeuclidean** calculator returns a
membership-baesd Euclidean distance measure between two communities.
This calculator can be used in the
[summary.shared](summary.shared),
[collect.shared](collect.shared),
[dist.shared](dist.shared) commands.

$$D_{Memeuclidean} = \sqrt{ \sum_{j=1}^{S_T}  \left ( S_{Aj} - S_{Bj} \right )^2 }$$

-   where $$S_T$$ is the total number of OTUs
-   where $$S_{Bj}$$ is 1 if the abundance of the jth OTU in sample A is
    greater than zero, otherwise 0.
-   where $$S_{Bj}$$ is 1 if the abundance of the jth OTU in sample B is
    greater than zero, otherwise 0.

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](Media:AmazonData.zip) with the following
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

  index   forest   pasture   shared
  ------- -------- --------- --------
  1       1        0         
  2       1        0         
  3       1        0         
  4       1        1         X
  5       1        0         
  6       1        0         
  7       3        1         X
  8       3        0         
  9       2        0         
  10      2        5         X
  11      1        0         
  12      1        0         
  13      3        0         
  14      2        0         
  15      1        0         
  16      1        3         X
  17      1        0         
  18      1        0         
  19      2        0         
  20      1        3         X
  21      1        0         
  22      2        0         
  23      5        2         X
  24      1        1         X
  25      1        0         
  26      1        1         X
  27      1        0         
  28      2        0         
  29      1        0         
  30      1        0         
  31      1        0         
  32      1        0         
  33      1        1         X
  34      0        2         
  35      0        1         
  36      0        1         
  37      0        1         
  38      0        1         
  39      0        1         
  40      0        7         
  41      0        1         
  42      0        1         
  43      0        2         
  44      0        1         
  45      0        1         
  46      0        1         
  47      0        1         
  48      0        1         
  49      0        1         
  50      0        1         
  51      0        1         
  52      0        1         
  53      0        2         
  54      0        1         
  55      0        1         
  Total   33       31        9

Using these sums to evaluate <i>D</i> we get:

$$D_{AB} = \sqrt{ 

\left(1-0\right)^2 +
\left(1-0\right)^2 +
\left(1-0\right)^2 +
\left(1-1\right)^2 +
...
+\left(0-1\right)^2 +
\left(0-1\right)^2 +
\left(0-1\right)^2 +
\left(0-1\right)^2

 }$$

$$D_{AB}$$ = 6.7823

Running\...

    mothur > summary.shared(calc=memeuclidean)

\...and opening 98\_lt\_phylip\_amazon.fn.shared.summary gives:

    label  comparison      memeuclidean
    0.10   forest  pasture     6.782330

These are the same values that we found above for a cutoff of 0.10.
