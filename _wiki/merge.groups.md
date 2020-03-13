---
title: 'merge.groups'
tags: 'commands'
redirect_from: '/wiki/Merge.groups.html'
---
The **merge.groups** command reads a shared file
and a design file and merges the groups in the shared file that are in
the same grouping in the design file. The files that we discuss in this
tutorial can be obtained by downloading the
[amazondata.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) file and decompressing
it, as well as [amazondesign.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondesign.zip)


## Default settings

To run the **merge.groups** command the
[design\_file](Design_File) is required.

    mothur > merge.groups(shared=98_lt_phylip_amazon.fn.shared, design=98_lt_phylip_amazon.design)

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

and after running **merge.groups**,
98\_lt\_phylip\_amazon.fn.merge.shared looks like:

    unique a   96  1   1   1   1   1   1   1   1   1   1 ...
    0.00   a   95  1   1   1   1   1   1   1   1   1   1 ...   
    0.01   a   93  1   1   1   1   1   1   1   1   1   1 ...
    0.02   a   89  1   1   1   1   1   1   1   1   1   1 ...
    0.03   a   84  1   1   1   1   1   1   1   1   1   1 ...
    0.04   a   81  1   1   1   1   1   1   1   2   1   1 ...   
    0.05   a   73  1   1   1   1   1   1   2   2   2   1 ...
    0.06   a   68  1   1   1   1   1   1   2   2   2   4 ...
    0.07   a   66  1   1   1   2   1   1   2   2   2   4 ...
    0.08   a   59  1   1   1   2   1   1   2   3   2   7 ...
    0.09   a   57  1   1   1   2   1   1   4   3   2   7 ...
    0.10   a   55  1   1   1   2   1   1   4   3   2   7 ...

## Options

### group

The group parameter is used to provide a group file you want to merge.

    mothur > merge.groups(group=amazon.groups, design=98_lt_phylip_amazon.design)

### count

The count parameter is used to provide a count file you want to merge.
Using the fasta parameter with the count parameter prevents file
mismatches if you select groups.

    mothur > merge.groups(count=amazon.count_table, design=98_lt_phylip_amazon.design)

### fasta

The fasta parameter is used only with the count file to remove any
sequences that have zero counts due to selecting groups. Using the fasta
parameter with the count parameter prevents file mismatches if you
select groups.

    mothur > merge.groups(count=amazon.count_table, design=98_lt_phylip_amazon.design, fasta=amazon.fasta)

### groups

The groups parameter allows you to specify which of the groups you would
like analyzed. Default=all. You may separate group names with dashes.
NOTE: If you are using groups with a count file be sure to use the fasta
parameter to avoid file mismatches.

### method

The method parameter allows you to select method you would like to use
to merge the groups. Options are sum, average and median. Default=sum.
You cannot use the average method with the count file.

    mothur > merge.groups(count=amazon.count_table, design=98_lt_phylip_amazon.design, method=median)

### label

The label parameter is used to analyze specific labels in your input.
default=all. You may separate label names with dashes.

## Revisions

-   1.24.0 - added group option. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1436#p3586](https://forum.mothur.org/viewtopic.php?f=5&t=1436#p3586)
-   1.37.0 - Adds fasta, count and method parameters.
    [\#88](https://github.com/mothur/mothur/issues/88)
    [\#105](https://github.com/mothur/mothur/issues/105)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)


