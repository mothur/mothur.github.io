---
title: 'Sharedchao'
tags: 'calculators'
redirect_from: '/wiki/Sharedchao'
---
The **sharedchao** calculator returns the shared
Chao1 richness estimate for an OTU definition. This calculator can be
used in the [summary.shared](summary.shared) and
[collect.shared](collect.shared) commands. The calculations
for the shared Chao1 richness estimator are implemented as described by
Chao in the user manual for her program
[spade](http://140.114.36.3/wordpress/wp-content/uploads/software/SPADE_UserGuide.pdf).

$$S_{SharedChao} = \begin{cases}
S_{Shared\left ( Obs \right )} + \frac{f_{1+}^{2}}{2f_{2+}} + \frac{f_{+1}^{2}}{2f_{+2}} + \frac{f_{11}^{2}}{4f_{22}}\mbox{, for 2 communities and all denominators}>\mbox{0}
S_{Shared\left ( Obs \right )} + \frac{f_{1+}\left(f_{1+}-1\right)}{2\left(f_{2+}+1\right)} + \frac{f_{+1}\left(f_{+1}-1\right)}{2\left(f_{+2}+1\right)} + \frac{f_{11}\left(f_{11}-1\right)}{4\left(f_{22}+1\right)}\mbox{, for 2 communities and any denominator}=\mbox{0}


S_{Shared\left ( Obs \right )} + \frac{f_{1++}^{2}}{2f_{2++}} + \frac{f_{+1+}^{2}}{2f_{+2+}}  + \frac{f_{++1}^{2}}{2f_{++2}} + \frac{f_{11+}^{2}}{4f_{22+}} + \frac{f_{1+1}^{2}}{4f_{2+2}}  + \frac{f_{+11}^{2}}{4f_{+22}} +  \frac{f_{111}^{2}}{8f_{222}}\mbox{, for 3 communities and all denominators}>\mbox{0}

S_{Shared\left ( Obs \right )}
+ \frac{f_{1++}\left(f_{1++}-1\right)}{2\left(f_{2++}+1\right)} + \frac{f_{+1+}\left(f_{+1+}-1\right)}{2\left(f_{+2+}+1\right)} + \frac{f_{++1}\left(f_{++1}-1\right)}{2\left(f_{++2}+1\right)}
+ \frac{f_{11+}\left(f_{11+}-1\right)}{4\left(f_{22+}+1\right)} + ... + \frac{f_{+11}\left(f_{+11}-1\right)}{4\left(f_{+22}+1\right)}
+ \frac{f_{111}\left(f_{111}-1\right)}{8\left(f_{222}+1\right)}

\mbox{, for 3 communities and any denominator}=\mbox{0}


S_{Shared\left ( Obs \right )}+ \frac{f_{1+++}^{2}}{2f_{2+++}} + ...  + \frac{f_{+++1}^{2}}{2f_{+++2}}
+ \frac{f_{11++}^{2}}{4f_{22++}} + \frac{f_{1+1+}^{2}}{4f_{2+2+}} + ...  + \frac{f_{++11}^{2}}{4f_{++22}}
+ \frac{f_{111+}^{2}}{8f_{222+}} + \frac{f_{11+1}^{2}}{8f_{22+2}} + ...  + \frac{f_{++11}^{2}}{8f_{+222}}
+  \frac{f_{1111}^{2}}{16f_{2222}}\mbox{, for 4 communities and all denominators}>\mbox{0}
S_{Shared\left ( Obs \right )}

+ \frac{f_{1+++}\left(f_{1+++}-1\right)}{2\left(f_{2+++}+1\right)} + ... + \frac{f_{+++1}\left(f_{+++1}-1\right)}{2\left(f_{+++2}+1\right)}
+ \frac{f_{11++}\left(f_{11++}-1\right)}{4\left(f_{22++}+1\right)} + ... + \frac{f_{++11}\left(f_{++11}-1\right)}{4\left(f_{++22}+1\right)}+
+ \frac{f_{111+}\left(f_{111+}-1\right)}{4\left(f_{222+}+1\right)} + ... + \frac{f_{+111}\left(f_{+111}-1\right)}{8\left(f_{+222}+1\right)}+
\frac{f_{1111}\left(f_{1111}-1\right)}{16\left(f_{2222}+1\right)}
\mbox{, for 4 communities and any denominator}=\mbox{0}

\mbox{etc.}

\end{cases}$$

where,

$$f_{11}$$ = number of shared OTUs with one observed individual in A and B

$$f_{1+}, f_{2+}$$ = number of shared OTUs with one or two individuals
observed in A

$$f_{+1}, f_{+2}$$ = number of shared OTUs with one or two individuals
observed in B

$$S_{Shared\left(obs\right)}$$ = number of shared OTUs observed in A and
B.

mothur is able to estimate the total number of shared OTUs across any
number of groupings. Examples calculations for two and three groups are
shown below.

### Two group example

Open the file 98\_lt\_phylip\_amazon.fn.shared generated using the [
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
  5       1        1         X     X     X                 X
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
  16      1        2         X     X                 X     
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
  Total   33       32        10    7     6     1     2     5

Using these sums to evaluate $$S_{SharedChao}$$ we get:

$$S_{SharedChao} = 10 + \frac{7\left(6\right)}{2\left(2\right)} + \frac{6\left(5\right)}{2\left(3\right)} + \frac{5\left(4\right)}{4\left(1\right)} = 30.5$$

Running\...

    mothur > summary.shared(calc=sharedchao)

\...and opening 98\_lt\_phylip\_amazon.fn.shared.summary gives:

    label  comparison      sharedchao
    0.10   forest  pasture     30.500000

These are the same values that we found above for a cutoff of 0.10.

### Three group example

Open the file esophagus.fn.shared generated using the [ Esophagus
dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/esophagus.zip) with the following commands:

    mothur > cluster(phylip=abrecovery.dist, cutoff=0.10)
    mothur > make.shared(list=abrecovery.fn.list, group=abrecovery.groups, label=0.10)

The esophagus.fn.[shared file](shared_file) will contain the
following three lines:

    0.10   B   51  2   66  0   0   27  1   37  5   1   2   8   2   0   0   0   0   0   0   0   23  3   0   1   2   1   0   0   6   1   0   0   1   0   5   2   0   0   0   0   2   0   0   0   0   0   2   1   1   1   1   1   
    0.10   C   51  14  84  4   4   22  2   42  13  10  13  7   5   2   4   3   2   8   4   3   2   2   1   1   2   6   1   1   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   
    0.10   D   51  5   147 0   3   10  1   18  3   0   0   1   1   2   1   0   2   0   0   0   2   5   0   1   6   2   0   0   3   6   2   2   3   3   2   1   1   1   1   1   1   1   1   1   3   1   1   0   0   0   0   0   

This indicates that the label for the OTU definition was 0.10. The first
line is from patient B, the second from patient C, and the third from
patient D. There are a total of 51 OTUs between the three communities
and there are 15 OTUs shared between all three patients. Writing the
data in a more presentable manner we see:

  OTU     B     C     D     shared   f1++   f+1+   f++1   f11+   f1+1   f+11   f111   f2++   f+2+   f++2   f22+   f2+2   f+22   f222
  ------- ----- ----- ----- -------- ------ ------ ------ ------ ------ ------ ------ ------ ------ ------ ------ ------ ------ ------
  1       2     14    5     X                                                         X                                         
  2       66    84    147   X                                                                                                   
  3       27    22    10    X                                                                                                   
  4       1     2     1     X        X             X             X                           X                                  
  5       37    42    18    X                                                                                                   
  6       5     13    3     X                                                                                                   
  7       8     7     1     X                      X                                                                            
  8       2     5     1     X                      X                                  X                                         
  9       23    2     2     X                                                                X      X                    X      
  10      3     2     5     X                                                                X                                  
  11      1     1     1     X        X      X      X      X      X      X      X                                                
  12      2     2     6     X                                                         X      X             X                    
  13      1     6     2     X        X                                                              X                           
  14      6     1     3     X               X                                                                                   
  15      1     1     6     X        X      X             X                                                                     
  16      0     4     0                                                                                                         
  17      0     4     3                                                                                                         
  18      1     10    0                                                                                                         
  19      2     13    0                                                                                                         
  20      0     2     2                                                                                                         
  21      0     4     1                                                                                                         
  22      0     3     0                                                                                                         
  23      0     2     2                                                                                                         
  24      0     8     0                                                                                                         
  25      0     4     0                                                                                                         
  26      0     3     0                                                                                                         
  27      0     1     0                                                                                                         
  28      0     1     0                                                                                                         
  29      0     1     0                                                                                                         
  30      0     0     2                                                                                                         
  31      0     0     2                                                                                                         
  32      1     0     3                                                                                                         
  33      0     0     3                                                                                                         
  34      5     0     2                                                                                                         
  35      2     0     1                                                                                                         
  36      0     0     1                                                                                                         
  37      0     0     1                                                                                                         
  38      0     0     1                                                                                                         
  39      0     0     1                                                                                                         
  40      2     0     1                                                                                                         
  41      0     0     1                                                                                                         
  42      0     0     1                                                                                                         
  43      0     0     1                                                                                                         
  44      0     0     3                                                                                                         
  45      0     0     1                                                                                                         
  46      2     0     1                                                                                                         
  47      1     0     0                                                                                                         
  48      1     0     0                                                                                                         
  49      1     0     0                                                                                                         
  50      1     0     0                                                                                                         
  51      1     0     0                                                                                                         
  Total   205   264   245   15       4      3      4      2      2      1      1      3      4      2      1      0      1      0

Using these sums to evaluate $$S_{SharedChao}$$ we get:

$$S_{SharedChao} = 15
+ \frac{4\left(3\right)}{2\left(4\right)} + \frac{3\left(2\right)}{2\left(5\right)} + \frac{4\left(3\right)}{2\left(3\right)}
+ \frac{2\left(1\right)}{4\left(2\right)} + \frac{2\left(1\right)}{4\left(1\right)} + \frac{1\left(0\right)}{4\left(2\right)}
+ \frac{1\left(0\right)}{8\left(1\right)} = 19.85$$

Running\...

    mothur > summary.shared()

\...and opening esophagus.unique.fn.sharedmultiple.summary gives:

    label  comparison  sharedsobs  sharedchao
    0.10   B-C-D       15.000000   19.850000

These are the same values that we found above for a cutoff of 0.10. The
file esophagus.unique.fn.shared.summary will contain the pairwise
comparisons between patients B, C, and D.

This function is ram dependent, so as your number of groups grows the
memory needed to do the combined group estimate grows exponentially. To
avoid this problem, try comparing less groups by using the groups
parameter to select the groups you would like to compare.
