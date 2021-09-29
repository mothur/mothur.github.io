---
title: 'split.groups'
tags: 'commands'
redirect_from: '/wiki/Split.groups.html'
---
The **split.groups** command reads a [
list](/wiki/list_file), [ fasta](/wiki/fasta_file), [
flow](/wiki/flow_file) or [ fastq](/wiki/fastq_file) file
and [ count](/wiki/count_file)
and generates a list, fasta, flow or fastq files for each group in the
count file. 
To run through the example below, download [Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/ExampleDataSet.zip) 


## Default Settings

The count is required.

    mothur > split.groups(fasta=final.fasta, count=final.count_table)

This command generates 18 files.

    final.F3D0.count_table
    final.F3D0.fasta
    final.F3D1.count_table
    final.F3D1.fasta
    final.F3D141.count_table
    final.F3D141.fasta
    final.F3D142.count_table
    final.F3D142.fasta
    final.F3D143.count_table
    final.F3D143.fasta
    final.F3D144.count_table
    final.F3D144.fasta
    final.F3D145.count_table
    final.F3D145.fasta
    final.F3D146.count_table
    final.F3D146.fasta
    final.F3D147.count_table
    final.F3D147.fasta
    final.F3D148.count_table
    final.F3D148.fasta
    final.F3D149.count_table
    final.F3D149.fasta
    final.F3D150.count_table
    final.F3D150.fasta
    final.F3D2.count_table
    final.F3D2.fasta
    final.F3D3.count_table
    final.F3D3.fasta
    final.F3D5.count_table
    final.F3D5.fasta
    final.F3D6.count_table
    final.F3D6.fasta
    final.F3D7.count_table
    final.F3D7.fasta
    final.F3D8.count_table
    final.F3D8.fasta
    final.F3D9.count_table
    final.F3D9.fasta

## Options

### groups

The groups parameter allows you to select groups to create files for.
For example if you set groups=F3D0-F3D1-F3D2, you will 6 output files.

    mothur > split.groups(fasta=final.fasta, count=final.count_table, groups=F3D0-F3D1-F3D2)
    
    final.F3D0.count_table
    final.F3D0.fasta
    final.F3D1.count_table
    final.F3D1.fasta
    final.F3D2.count_table
    final.F3D2.fasta

### flow

The flow parameter is used to input your flow file.

### fastq

The flow parameter is used to input your fastq file.

### processors

The processors option enables you to accelerate the parsing by using
multiple processors. Default processors=Autodetect number of available
processors and use all available.

### name - not recommended

The name option allows you to provide a name file associated with your group file.

We DO NOT recommend using the name file. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

### group - not recommended

The group parameter allows you to provide a group file to use when
selecting items from your files. 

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


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
