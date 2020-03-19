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
the [names option](cluster#name) for the cluster command.


### name option

If you align your unique sequences, filter and screen them, you might be
removing bases from the sequences that accounted for differences between
the sequences. You can then rerun your sequences through **unique.seqs** by
providing a [name file](name_file) for the name option:

    mothur > unique.seqs(fasta=amazon.unique.filter.fasta, name=amazon.names)

When redundant sequences are found, the list of names corresponding to
the sequence names will be merged.

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > unique.seqs(fasta=amazon.unique.filter.fasta, count=amazon.count_table)

When redundant sequences are found, the counts corresponding to the
sequences will be added.

### format

The format parameter is used to indicate what type of file you want
outputted. Choices are name and count, default=name unless count file
used then default=count.

    mothur > unique.seqs(fasta=amazon.fasta, format=count)

## Revisions

-   1.22.0 Name file prints in same order as fasta file.
-   1.28.0 Added count parameter
-   1.31.1 Bug Fix: segfault with count file containing group info.
-   1.37.0 Adds format parameter
    [\#125](https://github.com/mothur/mothur/issues/125)
