---


title: 'Shannon'
---
The [shannon](shannon) calculator returns the Shannon
diversity index for an OTU definition. This calculator can be used in
the [summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands.

$$H_{shannon} = - \sum_{i=1}^{S_{obs}} \frac{n_i}{N} ln \frac{n_i}{N}$$

$$var\left ( H_{Shannon} \right ) = \frac {\sum_{i=1}^{S_{obs}} \frac{n_i}{N} \left ( ln \frac{n_i}{N} \right )^2 - H_{shannon}^{2}}{N} + \frac{S_{obs} - 1}{2N^{2}}$$

$$LCI_{95%}=H_{shannon}-1.96\sqrt{var\left ( H_{shannon} \right )}$$

$$UCI_{95%}=H_{shannon}+1.96\sqrt{var\left ( H_{shannon} \right )}$$

where,

$$S_{obs}$$ = the number of observed OTUs

$$n_i$$ = the number of individuals in OTU <i>i</i>

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
Shannon index is then calculated using the values found in the
subsequent columns. For demonstration we will calculate the Shannon
index for an OTU definition of 0.03:

$$H_{shannon} = -\left(75\left(\frac{1}{98}\right)\ln\left(\frac{1}{98}\right)+6\left(\frac{2}{98}\right)\ln\left(\frac{2}{98}\right)+1\left(\frac{3}{98}\right)\ln\left(\frac{3}{98}\right)+2\left(\frac{4}{98}\right)\ln\left(\frac{4}{98}\right)\right) = 4.3533$$

$$var\left(H_{shannon}\right)=\frac{75\frac{1}{98}\left(\ln\frac{1}{98}\right)^2+6\frac{2}{98}\left(\ln\frac{2}{98}\right)^2+1\frac{3}{98}\left(\ln\frac{3}{98}\right)^2+2\frac{4}{98}\left(\ln\frac{4}{98}\right)^2-\left(4.35\right)^2}{98}+\frac{83}{2\left(98\right)^2} = 0.006644$$

$$LCI_{95%}= 4.3533-1.96\sqrt{0.006644}=4.19$$

$$UCI_{95%}= 4.3533 +1.96\sqrt{0.006644}=4.51$$

Running\...

    mothur > summary.single(sabund=98_lt_phylip_amazon.fn.sabund, calc=shannon)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  Shannon     Shannon_lci Shannon_hci
    unique 4.556676    4.415476    4.697875
    0.00   4.542530    4.400817    4.684243
    0.01   4.514238    4.371670    4.656806
    0.02   4.432830    4.279100    4.586561
    0.03   4.353294    4.196449    4.510139<---
    0.04   4.310857    4.154934    4.466780
    0.05   4.187011    4.032469    4.341554
    0.06   4.093330    3.936160    4.250500
    0.07   4.065038    3.910282    4.219793
    0.08   3.909320    3.745866    4.072774
    0.09   3.838295    3.665956    4.010634
    0.10   3.770031    3.590406    3.949656

These are the same values that we found above for a cutoff of 0.03.
