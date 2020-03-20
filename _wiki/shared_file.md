---
title: 'shared file'
tags: 'file_types'
redirect_from: '/wiki/Shared_file'
---
A shared file is analogous to an [rabund file](/wiki/rabund_file).
The data in a shared file represent the number of times that an OTU is
observed in multiple samples. It is easiest to generate this file using
the [make.shared](/wiki/make.shared) command. The structure of a
shared file is analogous to an rabund file. The first column contains
the label for the comparison - this will be the value for the first
column of each line from the original list file (e.g.
patient70.fn.list). The second column contains the group name that
designates where the data is coming from for that row. Next is the
number of OTUs that were found between each of the groups and is the
number of columns that follow. Finally, the remaining columns indicate
the number of sequences that belonged to each OTU from that group. The
list files that are generated from this command contain the sequence
names in each OTU for each group and can be processed using commands
such as collect.single() like any other list files.

Sample output of 98\_sq\_phylip\_amazon.fn.shared, which can be
downloaded in the [amazondata.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip)
file:

    label  Group   numOtus Otu01   Otu02   Otu03   Otu04   Otu05   Otu06   Otu07   Otu08   Otu09   Otu10   ...
    0.10   forest  55  0   5   2   3   1   1   3   3   1   0   ...
    0.10   pasture 55  7   2   5   1   3   2   0   0   1   2   ...


