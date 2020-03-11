---
title: 'Bergerparker'
---
The **bergerparker** calculator returns the
Berger-Parker dominance index for an OTU definition. This calculator can
be used in the [summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands.

$$d=\frac{n_{max}}{N}$$

where,

$$n_{max}$$ = the abundance of the dominant OTU

$$N$$ = the total number of individuals in the sample

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) with the following
commands:

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
OTU. The Berger-Parker index is then calculated using the values found
in the subsequent columns. For demonstration we will calculate the
Berger-Parker index for an OTU definition of 0.03:

$$d=\frac{4}{98} = 0.0408$$

Running\...

    mothur > summary.single(calc=bergerparker)

\...and opening 98\_lt\_phylip\_amazon.fn.summary gives:

    label  bergerparker
    unique 0.020408
    0.00   0.020408
    0.01   0.020408
    0.02   0.040816
    0.03   0.040816 <---
    0.04   0.040816
    0.05   0.040816
    0.06   0.040816
    0.07   0.040816
    0.08   0.071429
    0.09   0.071429
    0.10   0.071429

These are the same values that we found above for a cutoff of 0.03.
