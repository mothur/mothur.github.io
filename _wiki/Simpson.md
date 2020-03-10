---
title: 'Simpson'
---
The **simpson** calculator returns the Simpson
diversity index for an OTU definition. This calculator can be used in
the [summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands.

$$D_{simpson} = \frac {\sum_{i=1}^{S_{obs}} {n_i \left ( n_i - 1 \right )}}{N \left( N-1 \right )}$$

$$var\left(D_{simpson}\right)=\frac{\sum_{i=1}^{S_{obs}} \left(\frac{n_i}{N}\right)^3-\left(\sum_{i=1}^{S_{obs}} \left(\frac{n_i}{N}\right)^2\right)^2}{0.25N}$$

$$LCI_{95%}=D_{simpson}-1.96\sqrt{var\left ( D_{simpson} \right )}$$

$$UCI_{95%}=D_{simpson}+1.96\sqrt{var\left ( D_{simpson} \right )}$$

where,

$$S_{obs}$$ = the number of observed OTUs

$$n_i$$ = the number of individuals in the <i>i</i>th OTU

$$N$$ = the total number of individuals in the community

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](Media:AmazonData.zip) with the following
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
OTU. The third column indicates the number of OTUs with only one
indivdiual, the fourth the number of OTUs with two individuals, etc. The
Simpson idex is then calculated using the values found in the subsequent
columns. For demonstration we will calculate the Simpson index for an
OTU definition of 0.03:

$$D_{simpson} = \frac {75 \left(1\right)\left(1-1\right)+6 \left(2\right)\left(2-1\right)+1 \left(3\right)\left(3-1\right)+2 \left(4\right)\left(4-1\right)}{98 \left( 98-1 \right )} = 0.004418$$

$$var\left(D_{simpson}\right)=\frac{75\left(\frac{1}{98} \right)^3+6\left(\frac{2}{98} \right)^3+1\left(\frac{3}{98} \right)^3+2\left(\frac{4}{98} \right)^3-\left(75\left(\frac{1}{98} \right)^2+6\left(\frac{2}{98} \right)^2+1\left(\frac{3}{98} \right)^2+2\left(\frac{4}{98} \right)^2\right)^2}{\frac{98}{4}} = 3.3826x10^{-6}$$

$$LCI_{95%}= 0.004418 -1.96\sqrt{var\left ( 3.3826x10^{-6} \right )} = 0.0008$$

$$UCI_{95%}= 0.004418 +1.96\sqrt{var\left ( 3.3826x10^{-6} \right )} = 0.0080$$

Running\...

    mothur > summary.single(list=98_lt_phylip_amazon.fn.list, calc=simpson)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  Simpson     Simpson_lci Simpson_hci
    unique 0.000421    -0.000375   0.001216
    0.00   0.000631    -0.000333   0.001595
    0.01   0.001052    -0.000165   0.002269
    0.02   0.002946    -0.000093   0.005984
    0.03   0.004418    0.000832    0.008005 <---
    0.04   0.005049    0.001452    0.008647
    0.05   0.007153    0.003370    0.010937
    0.06   0.009257    0.004865    0.013649
    0.07   0.009678    0.005349    0.014007
    0.08   0.014728    0.007908    0.021547
    0.09   0.017673    0.009592    0.025754
    0.10   0.020829    0.011641    0.030017

These are the same values that we found above for a cutoff of 0.03.
