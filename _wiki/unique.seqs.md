---
title: 'unique.seqs'
tags: 'commands'
redirect_from: '/wiki/Unique.seqs.html'
---
The **unique.seqs** command returns only the
unique sequences found in a fasta-formatted sequence file and a file
that indicates those sequences that are identical to the reference
sequence. Often times a collection of sequences will have a significant
number of identical sequences. It sucks up considerable processing time
to have to align, calculate distances, and cluster each of these
sequences individually. For this tutorial, you should use the files
found in the [ amazondata.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) archive.

To run the command the name of a fasta-file needs to be provided:

    mothur > unique.seqs(fasta=amazon.fasta)

This will generate two files: amazon.names and amazon.unique.fasta. You
can now align amazon.unique.fasta and generate a distance matrix. Then
you can use that matrix with the newly generated amazon.name file with
the [names option](/wiki/cluster#name) for the cluster command.

### count

The [ count](/wiki/Count_File) file is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > unique.seqs(fasta=amazon.unique.filter.fasta, count=amazon.count_table)

When redundant sequences are found, the counts corresponding to the
sequences will be added.

### format

The format parameter is used to indicate what type of file you want
outputted. Choices are name and count, default=name unless count file
used then default=count.

    mothur > unique.seqs(fasta=amazon.fasta, format=count)
    

### name - not recommended

The name option allows you to provide a name file associated with your fasta file.

We DO NOT recommend using the name file. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


## Revisions

-   1.22.0 Name file prints in same order as fasta file.
-   1.28.0 Added count parameter
-   1.31.1 Bug Fix: segfault with count file containing group info.
-   1.37.0 Adds format parameter
    [\#125](https://github.com/mothur/mothur/issues/125)
