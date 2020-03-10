---
title: 'Sobs'
---
The **sobs** calculator returns the number of observed
OTUs for an OTU definition. This calculator can be used in the
[summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands. Open the
file 98\_lt\_phylip\_amazon.fn.sabund generated using the [ Amazonian
dataset](Media:AmazonData.zip) with the following commands:

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
OTU. Sobs is then calculated by summing the remaining columns. For
example, **sobs** for an OTU definition of 0.10 would be calculated as:

$$S_{obs} = 34 + 13+ 3 + 2 + 0 + 0 + 3 = 55$$

Running\...

    mothur > summary.single(calc=sobs)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  sobs
    unique 96.000000
    0.00   95.000000
    0.01   93.000000
    0.02   89.000000
    0.03   84.000000
    0.04   81.000000
    0.05   73.000000
    0.06   68.000000
    0.07   66.000000
    0.08   59.000000
    0.09   57.000000
    0.10   55.000000 <---

These are the same values that we found above for a cutoff of 0.03.
