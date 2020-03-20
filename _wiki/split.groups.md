---
title: 'split.groups'
tags: 'commands'
redirect_from: '/wiki/Split.groups.html'
---
The **split.groups** command reads a [
list](/wiki/list_file), [ fasta](/wiki/fasta_file) file or [
flow](/wiki/flow_file) and [ group](/wiki/group_file) file or
[ count](/wiki/Count_File) or [ fastq](/wiki/Fastq_File) file
and generates a fasta, flow or fastq files for each group in the
groupfile. To run this tutorial please download [ Esophagus
dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/esophagus.zip).

## Default Settings

    mothur > split.groups(fasta=esophagus.fasta, group=esophagus.groups)

or

    mothur > split.groups(flow=esophagus.flow, count=esophagus.count_table)

This command generates 3 files: esophagus.B.fasta, esophagus.C.fasta and
esophagus.D.fasta

or

    mothur > split.groups(list=full.list, count=full.count_table)

or

    mothur > split.groups(fastq=full.fastq, count=full.count_table)

## Options

### name

The name parameter allows you add a name file with your fasta file and
a name file will be generated for each group.

    mothur > split.groups(fasta=esophagus.fasta, group=esophagus.groups, name=esophagus.names)

### count

The [ count](/wiki/Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. A count file will be created for each
group.

    mothur > split.groups(fasta=esophagus.fasta, count=esophagus.count_table)

### groups

The groups parameter allows you to select groups to create files for.
For example if you set groups=B-C, you will only get a
esophagus.B.fasta, esophagus.B.names, esophagus.C.fasta,
esophagus.C.name files.

    mothur > split.groups(fasta=esophagus.fasta, group=esophagus.groups, name=esophagus.names, groups=B-C)

### flow

The flow parameter is used to input your flow file.

### processors

The processors option enables you to accelerate the parsing by using
multiple processors. Default processors=Autodetect number of available
processors and use all available.

## Revisions

-   1.28.0 - Added count parameter
-   1.32.0 - Bug Fix: not splitting properly with a count file.
-   1.40.0 - Adds flow parameter.
-   1.42.0 - Adds fastq parameter.
    [\#499](https://github.com/mothur/mothur/issues/499)
-   1.43.0 - Adds list parameter.
    [\#624](https://github.com/mothur/mothur/issues/624)
-   1.44.0 - Adds processors parameter.
    [\#685](https://github.com/mothur/mothur/issues/685)


