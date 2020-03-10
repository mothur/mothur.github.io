---
title: 'Nseqs'
---
The [nseqs](nseqs) calculator returns the number of sequences
that were sampled for an OTU definition. This calculator can be used in
the [summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands, but it
probably only really makes sense for the
[summary.single](summary.single) command. Open the file
98\_lt\_phylip\_amazon.fn.sabund generated using the [ Amazonian
dataset](Media:AmazonData.zip) with the following commands:

    mothur > read.dist(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)
    mothur > cluster()

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
indivdiual, the fourth the number of OTUs with two individuals, etc.
Nseqs is then calculated by summing the product of the column index and
the value in the column. For example, Nseqs for an OTU definition of
0.10 would be calculated as:

$$N = 34\left(1\right) + 13 \left(2\right) + 3 \left(3\right) + 2 \left(4\right) + 0 \left(5\right) + 0 \left(6\right) + 3 \left(7\right) = 98$$

Running\...

    mothur > summary.single(calc=nseqs)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  NSeqs
    unique 98.000000
    0.00   98.000000
    0.01   98.000000
    0.02   98.000000
    0.03   98.000000
    0.04   98.000000
    0.05   98.000000
    0.06   98.000000
    0.07   98.000000
    0.08   98.000000
    0.09   98.000000
    0.10   98.000000 <---

These are the same values that we found above for a cutoff of 0.03.
