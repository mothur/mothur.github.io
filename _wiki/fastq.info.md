---
title: 'fastq.info'
tags: 'commands'
redirect_from: '/wiki/Fastq.info.html'
---
The **fastq.info** command reads a fastq file and creates a fasta and
quality file or can be used to parse fastq files by sample.

## Default settings

The **fastq.info** command parameters are file, fastq, fasta, qfile, oligos,
group and format; file or fastq is required.

    mothur > fastq.info(fastq=M11Fcsw.fastq)

or

    mothur > fastq.info(file=fastqFiles.file)

## Options

### file

The file lines can be 2, 3, or 4 columns. The forward fastq files in the
first column and their matching reverse fastq files in the second
column, or a groupName then forward fastq file and reverse fastq file,
or forward fastq file then reverse fastq then forward index and reverse
index file. If you only have one index file add 'none' for the other
one.

    Two Column 
     
    ffastqfile1 rfastqfile1
    ffastqfile2 rfastqfile2
    ...

    Two Column PacBio

    group1 pacBioFastqfile1 
    group2 pacBioFastqfile2 
    group3 pacBioFastqfile3
    ...
      
    Three Column
     
    group ffastqfile  rfastqfile
    group ffastqfile  rfastqfile
    group ffastqfile  rfastqfile
    ...
     
    Four Column  - ('none' is the option for no forward index file)
     
    My.forward.fastq My.reverse.fastq none My.rindex.fastq

### oligos

The oligos parameter allows you to provide an oligos file to split your
fastq file into separate fastq files by barcode and primers.

### bdiffs & pdiffs & ldiffs & sdiffs & tdiffs

These parameters are used to allow differences in the barcode, primers,
linkers and spacers. pdiffs is maximum number of differences to the
primer sequence, default=0. bdiffs is maximum number of differences to
the barcode sequence, default=0. ldiffs is maximum number of differences
to the linker sequence, default=0. sdiffs is maximum number of
differences to the spacer sequence, default=0. tdiffs is maximum total
number of differences to the barcode, primer, linker and spacer (default
to pdiffs + bdiffs + ldiffs + sdiffs).

### checkorient

If you are running the **fastq.info** command with paired barcodes or
primers, you can use the checkorient parameter. When checkorient=t and
mothur can't find the barcodes and primers, it will search the reverse
compliment.

### fasta

The fasta parameter allows you to indicate whether you want a fasta file
generated. Default=T.

### qfile

The qfile parameter allows you to indicate whether you want a quality
file generated. Default=T.

### pacbio

When pacbio is set to true, quality scores of 0 will results in a
corresponding base of N. Default=F.

### format

The format parameter is used to indicate whether your sequences are
sanger, solexa, illumina or illumina1.8+. default=sanger.

## Revisions

-   1.24.0 Added fasta and qfile options. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1444](https://forum.mothur.org/viewtopic.php?f=5&t=1444)
-   1.28.0 Added format option
-   1.28.0 Fixed negative quality scores related to format of
    sequences. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1727&p=4651&hilit=fastq.info#p4651](https://forum.mothur.org/viewtopic.php?f=4&t=1727&p=4651&hilit=fastq.info#p4651)
-   1.30.0 added illumina1.8+ format.
-   1.30.0 added pacbio parameter.
-   1.42.0 Adds Oligos class and split.groups commands fastq.info.
    [\#499](https://github.com/mothur/mothur/issues/499)
-   1.43.0 Adds 2 column pacbio file option to fastq.info.
    [\#649](https://github.com/mothur/mothur/issues/649)
-   1.48.0 Changes default output to count file instead of name file.
