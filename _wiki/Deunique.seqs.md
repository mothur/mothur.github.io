---
title: 'Deunique.seqs'
---
The **deunique.seqs** command is the reverse of
the [unique.seqs](unique.seqs) command, and creates a fasta
file from a fasta and name file. For this tutorial, you should use the
files found in the [ AmazonData.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip)
archive.

To run the command the names of a fasta-file and name-file need to be
provided:

    mothur > deunique.seqs(fasta=amazon.unique.fasta, name=amazon.names)

or

    mothur > deunique.seqs(fasta=amazon.unique.fasta, count=amazon.count_table)

This will generate a new fasta file containing all the sequences:
amazon.redundant.fasta.

[Category:Commands](Category:Commands)
