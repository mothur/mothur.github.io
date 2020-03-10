---
title: 'Jabund'
---
The [jabund](jabund) calculator returns the abundance-based
Jaccard dissimilarity index describing the fraction of sequences that
don\'t belong to shared OTUs. This calculator can be used in the
[summary.shared](summary.shared) and
[collect.shared](collect.shared) commands.

Note that this approach attempts to incorporate the effect of *unseen*
shared species. For a reference and background, see:

Chao A, Chazdon RL, Colwell RK and Shen T-J. 2005. A new statistical
approach for assessing similarity of species composition with incidence
and abundance data. Ecology Letters 8: 148-159. DOI:
10.1111/j.1461-0248.2004.00707.x

$$D_{J_{abund}} = 1-\frac{U_{est}V_{est}}{U_{est} + V_{est} - U_{est}V_{est}}$$

where,

$$U_{est} = \sum_{i=1}^{S_{12}}{\frac{A_i}{n_{total}} + \frac{m_{total}-1}{m_{total}} \frac{f_{+1}}{2f_{+2}}}  \sum_{i=1}^{S_{12}}{\frac{A_i}{n_{total}}I\left(B_i = 1\right)}$$

$$V_{est} = \sum_{i=1}^{S_{12}}{\frac{B_i}{m_{total}} + \frac{n_{total}-1}{n_{total}} \frac{f_{1+}}{2f_{2+}}}  \sum_{i=1}^{S_{12}}{\frac{B_i}{m_{total}}I\left(A_i = 1\right)}$$

$$S_{12}$$ = the number of shared OTUs between groups A and B

$$A_i$$ = the number of individuals in OTU <i>i</i> of group A

$$B_i$$ = the number of individuals in OTU <i>i</i> of group B

$$m_{total}$$ = total number of individuals sampled from group A

$$m_{total}$$ = total number of individuals sampled from group B

$$f_{1+}\mbox{,   }f_{2+}$$ = number of shared OTUs with one or two
individuals observed in A

$$f_{+1}\mbox{,   }f_{+2}$$ = number of shared OTUs with one or two
individuals observed in B

I(•) = if the argument, •, is true then I(•) is 1; otherwise it is 0.

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

  index   forest (A)   pasture (B)   shared   f~1+~   f~+1~   f~2+~   f~+2~
  ------- ------------ ------------- -------- ------- ------- ------- -------
  1       1            0                                              
  2       1            0                                              
  3       1            0                                              
  4       1            1             X        1       1               
  5       1            0                                              
  6       1            0                                              
  7       3            1             X                1               
  8       3            0                                              
  9       2            0                                              
  10      2            5             X                        1       
  11      1            0                                              
  12      1            0                                              
  13      3            0                                              
  14      2            0                                              
  15      1            0                                              
  16      1            3             X        1                       
  17      1            0                                              
  18      1            0                                              
  19      2            0                                              
  20      1            3             X        1                       
  21      1            0                                              
  22      2            0                                              
  23      5            2             X                                1
  24      1            1             X        1       1               
  25      1            0                                              
  26      1            1             X        1       1               
  27      1            0                                              
  28      2            0                                              
  29      1            0                                              
  30      1            0                                              
  31      1            0                                              
  32      1            0                                              
  33      1            1             X        1       1               
  34      0            2                                              
  35      0            1                                              
  36      0            1                                              
  37      0            1                                              
  38      0            1                                              
  39      0            1                                              
  40      0            7                                              
  41      0            1                                              
  42      0            1                                              
  43      0            2                                              
  44      0            1                                              
  45      0            1                                              
  46      0            1                                              
  47      0            1                                              
  48      0            1                                              
  49      0            1                                              
  50      0            1                                              
  51      0            1                                              
  52      0            1                                              
  53      0            2                                              
  54      0            1                                              
  55      0            1                                              
  Total   49           49            9        6       5       1       1

Using these sums to evaluate <i>C</i> we first need to calculate U and
V:

$$U_{est} = \frac{16}{49} + \left(\frac{48}{49}\right)\left(\frac{5}{2\left(1\right)}\right)\left(\frac{1+3+1+1+1}{49}\right) = 0.6764$$

$$V_{est} = \frac{18}{49} + \left(\frac{48}{49}\right)\left(\frac{6}{2\left(1\right)}\right)\left(\frac{1+3+3+1+1+1}{49}\right) = 0.9671$$

$$C_{J_{abund}} = 1-\frac{\left(0.6764\right)\left(0.9671\right)}{0.6764 + 0.9671 - 0.6541}=0.3388$$

Running\...

    mothur > summary.shared(calc=jabund)

\...and opening 98\_lt\_phylip\_amazon.fn.shared.summary gives:

    label  comparison      JAbund
    0.10   forest  pasture     0.33883

These are the same values that we found above for a cutoff of 0.10.
