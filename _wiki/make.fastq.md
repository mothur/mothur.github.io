---
title: 'make.fastq'
tags: 'commands'
redirect_from: '/wiki/Make.fastq.html'
---
The **make.fastq** command reads a fasta file and a quality file and creates
a fastq file.

## Default settings

The **make.fastq** command parameters are fasta and qfile. Both are
required.

    mothur > make.fastq(fasta=stool.fasta, qfile=stool.qual)

## Options

### format

The format parameter is used to indicate whether your sequences are
sanger, solexa, illumina1.8+ or illumina, default=sanger.

## Revisions

-   1.29.0 Added format parameter.
-   1.30.0 Added illumina1.8+ format.


