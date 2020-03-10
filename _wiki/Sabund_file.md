---
title: 'Sabund file'
---
The data reported in an sabund file is appropriate for plotting in a
species-abundance plot. In DOTUR these data were found in files ending
in \"rank\". Like the [rabund](rabund_file) and [list
files](list_file), the first column represents the distance
that sequences were assigned to OTUs. If you are making your own sabund
file you can make the label anything without spaces. The number in the
second column is number of sequences in the dominant OTU(s). Subsequent
columns contain the number of OTUs within each category (OTUs containing
1 sequence, OTUs containing 2 sequences, 3 sequences, etc).

Sample output of 98\_sq\_phylip\_amazon.fn.sabund, which can be download
in the [AmazonData.zip](Media:AmazonData.zip) file:

    unique 2   94  2   
    0.00   2   92  3   
    0.01   2   88  5   
    0.02   4   84  2   2   1   
    0.03   4   75  6   1   2   
    ...
