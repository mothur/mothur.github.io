---
title: 'remove.rare'
tags: 'commands'
redirect_from: '/wiki/Remove.rare'
---
The **remove.rare** command removes OTUs at a
specified rarity (number of observations in the dataset) and outputs a
new file. The files that we discuss in this tutorial can be obtained by
downloading the [amazondata.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) file
and decompressing it.


## Default settings

The **remove.rare** command can be run on a list,
rabund, sabund, or shared file. Options include nseqs, label, groups,
and bygroup.

## list file

Reading a [ list file](list_file):

    mothur > remove.rare(list=98_lt_phylip_amazon.fn.list, nseqs=2, label=0.10)

or if you clustered with a [ count file](Count_File), be sure
to include it:

    mothur > remove.rare(list=98_lt_phylip_amazon.fn.unique_list, count=amazon.count_table, nseqs=2, label=0.10)

Originally 98\_lt\_phylip\_amazon.fn.list at distance 0.10 contained 55
OTUs, after running the above command
98\_lt\_phylip\_amazon.fn.pick.list contains 8 OTUs.

## rabund file

Reading a [ rabund file](rabund_file):

    mothur > remove.rare(rabund=98_lt_phylip_amazon.fn.rabund, nseqs=2)

98\_lt\_phylip\_amazon.fn.rabund looks like:

    unique 96  2   2   1   1   1   1   1   1   1   1   1 ...   
    0.00   95  2   2   2   1   1   1   1   1   1   1   1 ...
    0.01   93  2   2   2   2   2   1   1   1   1   1   1 ...
    0.02   89  4   3   3   2   2   1   1   1   1   1   1 ...
    0.03   84  4   4   3   2   2   2   2   2   2   1   1 ...
    0.04   81  4   4   3   2   2   2   2   2   2   2   2 ...
    0.05   73  4   4   3   3   3   2   2   2   2   2   2 ...
    0.06   68  4   4   4   4   3   3   2   2   2   2   2 ...   
    0.07   66  4   4   4   4   3   3   2   2   2   2   2 ...
    0.08   59  7   5   4   4   3   3   3   3   2   2   2 ...
    0.09   57  7   7   4   4   4   3   3   3   3   2   2 ...
    0.10   55  7   7   7   4   4   4   3   3   2   2   2 ...

and after running **remove.rare**,
98\_lt\_phylip\_amazon.fn.pick.rabund looks like:

    0.02   3   4   3   3   
    0.03   3   4   4   3   
    0.04   3   4   4   3   
    0.05   5   4   4   3   3   3   
    0.06   6   4   4   4   4   3   3   
    0.07   6   4   4   4   4   3   3   
    0.08   8   7   5   4   4   3   3   3   3   
    0.09   9   7   7   4   4   4   3   3   3   3   
    0.10   8   7   7   7   4   4   4   3   3   

## sabund file

Reading a [ sabund file](sabund_file):

    mothur > remove.rare(sabund=98_lt_phylip_amazon.fn.sabund, nseqs=2)

98\_lt\_phylip\_amazon.fn.sabund looks like:

    unique 2   94  2   
    0.00   2   92  3   
    0.01   2   88  5   
    0.02   4   84  2   2   1   
    0.03   4   75  6   1   2   
    0.04   4   69  9   1   2   
    0.05   4   55  13  3   2   
    0.06   4   48  14  2   4   
    0.07   4   44  16  2   4   
    0.08   7   36  15  4   2   1   0   1   
    0.09   7   36  12  4   3   0   0   2   
    0.10   7   35  12  2   3   0   0   3

and after running **remove.rare**,
98\_lt\_phylip\_amazon.fn.pick.sabund looks like:

    0.02   4   0   0   2   1   
    0.03   4   0   0   1   2   
    0.04   4   0   0   1   2   
    0.05   4   0   0   3   2   
    0.06   4   0   0   2   4   
    0.07   4   0   0   2   4   
    0.08   7   0   0   4   2   1   0   1   
    0.09   7   0   0   4   3   0   0   2   
    0.10   7   0   0   2   3   0   0   3

## shared file

Reading a [ shared file](shared_file):

    mothur > remove.rare(shared=98_lt_phylip_amazon.fn.shared, nseqs=2)

98\_lt\_phylip\_amazon.fn.shared looks like:

    unique forest  96  1   1   1   1   1   1   1   1   1   1 ...
    unique pasture 96  0   0   0   0   0   0   0   0   0   0 ...
    0.00   forest  95  1   1   1   1   1   1   1   1   1   1 ...   
    0.00   pasture 95  0   0   0   0   0   0   0   0   0   0 ...   
    0.01   forest  93  1   1   1   1   1   1   1   1   1   1 ...
    0.01   pasture 93  0   0   0   0   0   0   0   0   0   0 ...
    0.02   forest  89  1   1   1   1   1   1   1   1   1   1 ...
    0.02   pasture 89  0   0   0   0   0   0   0   0   0   0 ...
    0.03   forest  84  1   1   1   1   1   1   1   1   1   1 ...
    0.03   pasture 84  0   0   0   0   0   0   0   0   0   0 ...
    0.04   forest  81  1   1   1   1   1   1   1   2   1   1 ...   
    0.04   pasture 81  0   0   0   0   0   0   0   0   0   0 ...   
    0.05   forest  73  1   1   1   1   1   1   1   2   2   1 ...
    0.05   pasture 73  0   0   0   0   0   0   1   0   0   0 ...
    0.06   forest  68  1   1   1   1   1   1   1   2   2   1 ...
    0.06   pasture 68  0   0   0   0   0   0   1   0   0   3 ...
    0.07   forest  66  1   1   1   1   1   1   1   2   2   1 ...
    0.07   pasture 66  0   0   0   1   0   0   1   0   0   3 ...
    0.08   forest  59  1   1   1   1   1   1   1   3   2   2 ...
    0.08   pasture 59  0   0   0   1   0   0   1   0   0   5 ...
    0.09   forest  57  1   1   1   1   1   1   3   3   2   2 ...
    0.09   pasture 57  0   0   0   1   0   0   1   0   0   5 ...
    0.10   forest  55  1   1   1   1   1   1   3   3   2   2 ...
    0.10   pasture 55  0   0   0   1   0   0   1   0   0   5 ...

and after running **remove.rare**,
98\_lt\_phylip\_amazon.fn.pick.shared looks like:

    0.02   forest  3   3   0   0   
    0.02   pasture 3   0   3   4   
    0.03   forest  3   3   0   0   
    0.03   pasture 3   1   3   4   
    0.04   forest  3   3   0   0   
    0.04   pasture 3   1   3   4   
    0.05   forest  5   1   3   1   0   0   
    0.05   pasture 5   2   1   2   3   4   
    0.06   forest  6   1   3   1   3   1   0   
    0.06   pasture 6   3   0   3   1   2   4   
    0.07   forest  6   1   3   1   3   1   0   
    0.07   pasture 6   3   0   3   1   2   4   
    0.08   forest  8   3   2   3   1   2   3   0   0   
    0.08   pasture 8   0   5   0   3   1   1   3   5   
    0.09   forest  9   3   3   2   3   1   2   3   0   0   
    0.09   pasture 9   1   0   5   0   3   1   1   3   7   
    0.10   forest  8   3   3   2   3   1   1   5   0   
    0.10   pasture 8   1   0   5   0   3   3   2   7

## Options

### nseqs

The nseqs parameter allows you to set the cutoff for an OTU to be deemed
rare. An OTU will be removed if its total abundance is less than or
equal to nseqs. For example nseqs=1, will remove all singletons.

### label

The label parameter is used to analyze specific labels in your input.
default=all. You may separate label names with dashes. If you are
reading a list file, you must select one label or the first label in
your list file will be used.

### groups

The groups parameter allows you to specify which of the groups you would
like analyzed. Default=all. You may separate group names with dashes.

### bygroup

The bygroup parameter is only valid with the shared file. default=f,
which results in removal of any OTU that has fewer than the threshold
nseqs across all groups. bygroups=T tests for threshold nseqs and drops
OTUs one group at a time. E.g., OTUi is represented by 1 sequence in
groupA and by 100 sequences in groupB. With nseqs=1 and bygroup=t,
abundance of OTUi is set to 0 for groupA, but is retained at 100 for
groupB.

    mothur > remove.rare(shared=98_lt_phylip_amazon.fn.shared, nseqs=2, bygroup=t)

and after running **remove.rare**,
98\_lt\_phylip\_amazon.fn.pick.shared looks like:

    0.02   forest  3   3   0   0   
    0.02   pasture 3   0   3   4   
    0.03   forest  3   3   0   0   
    0.03   pasture 3   0   3   4   
    0.04   forest  3   3   0   0   
    0.04   pasture 3   0   3   4   
    0.05   forest  3   3   0   0   
    0.05   pasture 3   0   3   4   
    0.06   forest  5   0   3   0   3   0   
    0.06   pasture 5   3   0   3   0   4   
    0.07   forest  5   0   3   0   3   0   
    0.07   pasture 5   3   0   3   0   4   
    0.08   forest  7   3   0   3   0   3   0   0   
    0.08   pasture 7   0   5   0   3   0   3   5   
    0.09   forest  8   3   3   0   3   0   3   0   0   
    0.09   pasture 8   0   0   5   0   3   0   3   7   
    0.10   forest  8   3   3   0   3   0   0   5   0   
    0.10   pasture 8   0   0   5   0   3   3   0   7

## Revisions

-   1.28.0 Added count option.
-   1.30.1 - Bug Fix: added OTUlabels to shared file.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)


