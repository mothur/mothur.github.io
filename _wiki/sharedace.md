---
title: 'Sharedace'
redirect_from: '/wiki/Sharedace'
---
The **sharedace** calculator returns the shared ACE
richness estimate for an OTU definition. This calculator can be used in
the [summary.shared](summary.shared) and
[collect.shared](collect.shared) commands. The calculations
for the shared ACE richness estimator are implemented as described by
Chao in the user manual for her program
[spade](https://chao.stat.nthu.edu.tw/SPADE_UserGuide.pdf).

$$S_{A,B ACE} = S_{12 \left ( abund \right )} + \frac {S_{12 \left ( rare \right )}}{c_{12}} + \frac {1}{C_{12}} \left [ f_{\left ( rare \right )1+} {\gamma}_1  + f_{\left ( rare \right )+1} {\gamma}_2 + f_{11}{\gamma}_3 \right ]$$

where,

$$C_{12} = 1 - \frac {\sum_{i=1}^{S_{12\left ( rare \right )}} {\left \{Y_i I \left ( X_i = 1 \right ) + X_iI \left ( Y_i = 1 \right ) - I \left ( X_i = Y_i = 1 \right ) \right \}}} {T_{11}}$$

$${\Gamma}_1 = \frac{S_{12 \left (rare \right )} T_{21}}{C_{12} T_{10}T_{11}} - 1$$

$${\Gamma}_2 = \frac{S_{12 \left (rare \right )} T_{12}}{C_{12} T_{01}T_{11}} - 1$$

$${\Gamma}_3 = \left[ \frac{s_{12\left( rare \right)}}{c_{12}}\right ]^2 \frac{T_{22}}{T_{10}T_{01}T_{11}} - \frac{S_{12 \left( rare \right)}T_{11}}{C_{12}T_{01}T_{10}}-{\Gamma}_1-{\Gamma}2$$

  ---------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------
  $$T_{10} = \sum_{i=1}^{S_{12\left( rare \right)}} X_i$$                              $$T_{01} = \sum_{i=1}^{S_{12\left( rare \right)}} Y_i$$
  $$T_{11} = \sum_{i=1}^{S_{12\left( rare \right)}} X_i Y_i$$                          $$T_{21} = \sum_{i=1}^{S_{12\left( rare \right)}} X_i \left( X_i - 1 \right) Y_i$$
  $$T_{12} = \sum_{i=1}^{S_{12\left( rare \right)}} X_i \left( Y_i - 1 \right) Y_i$$   $$T_{22} = \sum_{i=1}^{S_{12\left( rare \right)}} {X_i \left( X_i - 1 \right) Y_i \left( Y_i - 1 \right)}$$
  ---------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------

$$f_{11}$$ = number of shared OTUs with one observed individual in A and B

$$f_{\left(rare \right)1+}$$ = number of OTUs with one individual found in
A and less than or equal to 10 in B.

$$f_{\left(rare \right)+1}$$ = number of OTUs with one individual found in
B and less than or equal to 10 in A.

$$S_{12\left(rare\right)}$$ = number of shared OTUs where both of the
communities are represented by less than or equal to 10 sequences.

$$S_{12\left(abund\right)}$$ = number of shared OTUs where at least one of
the communities is represented by more than 10 sequences.

$$S_{12\left(obs\right)}$$ = number of shared OTUs in A and B.

$$I\left(\right)$$ = evaluates to 1 if the contents are true and to 0 if
they are false

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) with the following
commands:

    mothur > cluster(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)
    mothur > make.shared(list=98_lt_phylip_amazon.fn.list, group=amazon.groups, label=0.10)

The 98\_lt\_phylip\_amazon.fn.[shared file](shared_file) will
contain the following two lines:

    0.10   forest  55  1   1   1   1   1   1   3   3   2   2   1   1   3   2   1   1   1   1   2   1   1   2   5   1   1   1   1   2   1   1   1   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   
    0.10   pasture 55  0   0   0   1   1   0   1   0   0   5   0   0   0   0   0   2   0   0   0   3   0   0   2   1   0   1   0   0   0   0   0   0   1   2   1   1   1   1   1   7   1   1   2   1   1   1   1   1   1   1   1   1   2   1   1   

This indicates that the label for the OTU definition was 0.10. The first
line is from the forest sample and the second is from the pasture
sample. There are a total of 55 OTUs between the two communities.
Writing the data in a more presentable manner we see:

  index   forest   pasture   S12   f1+   f+1   f2+   f+2   f11
  ------- -------- --------- ----- ----- ----- ----- ----- -----
  1       1        0                                       
  2       1        0                                       
  3       1        0                                       
  4       1        1         X     X     X                 X
  5       1        0                                       
  6       1        0                                       
  7       3        1         X           X                 
  8       3        0                                       
  9       2        0                                       
  10      2        5         X                 X           
  11      1        0                                       
  12      1        0                                       
  13      3        0                                       
  14      2        0                                       
  15      1        0                                       
  16      1        3         X     X                       
  17      1        0                                       
  18      1        0                                       
  19      2        0                                       
  20      1        3         X     X                       
  21      1        0                                       
  22      2        0                                       
  23      5        2         X                       X     
  24      1        1         X     X     X                 X
  25      1        0                                       
  26      1        1         X     X     X                 X
  27      1        0                                       
  28      2        0                                       
  29      1        0                                       
  30      1        0                                       
  31      1        0                                       
  32      1        0                                       
  33      1        1         X     X     X                 X
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
  Total   33       31        9     6     5     1     1     4

Looking at the table and treating forest as X and pasture Y, we see that
all of the shared OTUs are \"rare\" (i.e. abundances less than 10).
Let\'s start the calculations\...

$$T_{10} = 1+3+2+1+1+5+1+1+1=16$$

$$T_{01} = 1+1+5+3+3+2+1+1+1=18$$

$$T_{11} = \left(1\right)\left(1\right)+\left(3\right)\left(1\right)+\left(2\right)\left(5\right)+\left(1\right)\left(3\right)+\left(1\right)\left(3\right)+\left(5\right)\left(2\right)+\left(1\right)\left(1\right)+\left(1\right)\left(1\right)+\left(1\right)\left(1\right)=33$$

$$T_{21} =1\left(1-1\right)1+3\left(3-1\right)1+2\left(2-1\right)5+1\left(1-1\right)3+1\left(1-1\right)3+5\left(5-1\right)2+1\left(1-1\right)1+1\left(1-1\right)1+1\left(1-1\right)1 = 56$$

$$T_{12} =1\left(1-1\right)1+3\left(1-1\right)1+2\left(5-1\right)5+1\left(3-1\right)3+1\left(3-1\right)3+5\left(2-1\right)2+1\left(1-1\right)1+1\left(1-1\right)1+1\left(1-1\right)1 = 62$$

$$T_{22} =1\left(1-1\right) 1\left(1-1\right)+3\left(3-1\right) 1\left(1-1\right)+2\left(2-1\right) 5\left(5-1\right)+1\left(1-1\right) 3\left(3-1\right)+1\left(1-1\right) 3\left(3-1\right)+5\left(5-1\right) 2\left(2-1\right)+1\left(1-1\right) 1\left(1-1\right)+1\left(1-1\right) 1\left(1-1\right)+1\left(1-1\right) 1\left(1-1\right)=80$$

$$C_{12} = 1 - \frac {\left(1+1-1\right)+\left(0+3-0\right)+\left(0+0-0\right)+\left(3+0-0\right)+\left(3+0-0\right)+\left(0+0-0\right)+\left(1+1-1\right)+\left(1+1-1\right)+\left(1+1-1\right)} {33} = 0.606061$$

$${\Gamma}_1 = \frac{9 \left(56\right)}{0.606061 \left(16\right)33} - 1=0.575$$

$${\Gamma}_2 = \frac{9 \left(62\right)}{0.606061 \left(18\right)33} - 1=0.550$$

$${\Gamma}_3 = {\left[ \frac{9}{0.606061}\right ]^2}\frac{80}{16\left(18\right)33} - \frac{9\left(33\right)}{0.606061 \left(16\right)18}-0.575-0.550=-0.97031$$

$$S_{A,B ACE} = 0 + \frac {9}{0.606061} + \frac {1}{0.606061} \left [ 6\left(0.575\right)  + 5\left(0.550\right) + 4 \left(-0.97031\right)\right]=18.676$$

Running\...

    mothur > summary.shared(calc=sharedace)

\...and opening 98\_lt\_phylip\_amazon.fn.shared.summary gives:

    label  comparison      sharedace
    0.10   forest  pasture     18.675936

These are the same values that we found above for a cutoff of 0.10.
