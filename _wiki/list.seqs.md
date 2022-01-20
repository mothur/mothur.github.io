---
title: 'list.seqs'
tags: 'commands'
redirect_from: '/wiki/List.seqs.html'
---
The **list.seqs** command will write out the names
of the sequences found within a [ fastq](/wiki/fastq_file), [
fasta](/wiki/fasta_file), [ name](/wiki/name_file), [
group](/wiki/group_file), [ count](/wiki/Count_File), [
list](/wiki/list_file), [
qfile](/wiki/qual_file), or [
align.report](/wiki/align.report_file) file. This could be useful
for using the [get.seqs](/wiki/get.seqs) and
[remove.seqs](/wiki/remove.seqs) commands as well as to generate a
[group file](/wiki/group_file). To complete this analysis, you need
to download the folder compressed in the [
Esophagus.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/esophagus.zip) archive.


## Options

At least one of the following options must be used. Each of these
options will generate a file ending in accnos that contains a single
column containing the list of the sequences contained in the input files.

### fastq option

The fastq option is used as presented in the following command:

    mothur > list.seqs(fastq=test.fastq)
    
You can enter multiple files separated by '-''s and mothur will output an accnos file containing reads present in all files. This can be helpful when correcting file mismatches. For example if you have missing reads in your paired fastq files, try this:

    mothur > list.seqs(fastq=test.R1.fastq-test.R2.fastq)
    mothur > get.seqs(fastq=test.R1.fastq-test.R2.fastq, accnos=current)

### fasta option

The fasta option is used as presented in the following command:

    mothur > list.seqs(fasta=esophagus.fasta)

The resulting esophagus.accnos file looks something like:

    59_10_1
    59_10_10
    59_10_11
    59_10_13
    59_10_15
    59_10_16
    59_10_17
    ...
    
You can enter multiple files separated by '-''s and mothur will output an accnos file containing reads present in all files. For example if you want to know what reads are common to several samples, try this:

    mothur > split.groups(fasta=test.fasta, count=test.count_table) - creates a fasta and count table for each sample
    mothur > list.seqs(fasta=test.sample1.fasta-test.sample2.fasta-test.sample3.fasta) - lists sequences present in sample1, sample2 and sample3 

### count option

The [ count](/wiki/Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > list.seqs(count=esophagus.count_table)
    

You can enter multiple files separated by '-''s and mothur will output an accnos file containing reads present in all files.


### alignreport option

The alignreport option is used as presented in the following command:

    mothur > list.seqs(alignreport=esophagus.align.report)

### list option

The list option is used as presented in the following command:

    mothur > list.seqs(list=esophagus.fn.list)
    
You can enter multiple files separated by '-''s and mothur will output an accnos file containing reads present in all files.

### taxonomy option

The taxonomy option is used as presented in the following command:

    mothur > list.seqs(taxonomy=esophagus.silva.full.taxonomy)
    
You can enter multiple files separated by '-''s and mothur will output an accnos file containing reads present in all files.

    mothur > list.seqs(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy)
    mothur > get.seqs(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, accnos=current)

    
### qfile option

The qfile option allows you to include a quality file. This can be helpful when correcting file mismatches between fasta and quality files.
Mothur will output an accnos file containing the sequences present in both the fasta and quality file.

    mothur > list.seqs(qfile=test.qual, fasta=test.fasta)
    mothur > get.seqs(qfile=current, fasta=current, accnos=current)

### name - not recommended

The name option allows you to provide a name file.

We DO NOT recommend using the name file. Instead we recommend using a count file. The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


### group - not recommended

The group parameter allows you to provide a group file.

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file. The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

## Revisions

-   1.28.0 Added count option
-   1.33.0 Added fastq option
-   1.40.0 Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.47.0 Adds qfile option. [\#802](https://github.com/mothur/mothur/issues/802)
-   1.47.0 Allows inputs to include multiple files. [\#803](https://github.com/mothur/mothur/issues/803)


