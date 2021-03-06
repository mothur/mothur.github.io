---
title: 'rabund file'
tags: 'file_types'
redirect_from: '/wiki/Rabund_file'
---
The data reported in the rabund file is appropriate for plotting as a
rank-abundance plot. In DOTUR these data were found in files ending in
"otu". Like the [sabund](/wiki/sabund_file) and [list
files](/wiki/list_file), the first column represents the distance
that sequences were assigned to OTUs. If you are making your own rabund
file you can make the label anything without spaces. The number in the
second column is the number of OTUs that have been formed. Subsequent
columns contain the number of sequences in each OTU.

Sample output of 98\_sq\_phylip\_amazon.fn.rabund, which can be download
in the [amazondata.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) file:

    unique 96  2   2   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   
    0.00   95  2   2   2   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   
    0.01   93  2   2   2   2   2   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   1   1   1   
    ...


