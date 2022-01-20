---
title: 'remove.seqs'
tags: 'commands'
redirect_from: '/wiki/Remove.seqs.html'
---
The **remove.seqs** command takes a list of
sequence names and either a [ fastq](/wiki/fastq_file), [
fasta](/wiki/fasta_file), [ name](/wiki/name_file), [
group](/wiki/group_file), [ list](/wiki/list_file), [
count](/wiki/Count_File) or [
align.report](/wiki/align.report_file) file to generate a new file
that does not contain the sequences in the list. This command may be
used in conjunction with the [list.seqs](/wiki/list.seqs) command
to help screen a sequence collection. To complete this analysis, you
need to download the folder compressed in the [
Esophagus.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/esophagus.zip) archive.


## Options

To run remove.seqs, you must provide the accnos option and at least one
other option. The command will generate a \*.pick.\* file.

### accnos option

To generate an accnos file, let's first run
[unique.seqs](/wiki/unique.seqs),
[summary.seqs](/wiki/summary.seqs),
[screen.seqs](/wiki/screen.seqs), and
[list.seqs](/wiki/list.seqs):

    mothur > unique.seqs(fasta=esophagus.fasta)

    mothur > summary.seqs(fasta=esophagus.unique.fasta)

           Start   End NBases  Ambigs  Polymer
    Minimum:   1   831 831 0   4
    2.5%-tile: 1   841 841 0   4
    25%-tile:  1   857 857 0   5
    Median:    1   866 866 0   5
    75%-tile:  1   870 870 0   5
    97.5%-tile:    1   900 900 5   7
    Maximum:   1   1378    1378    20  8
    # of Seqs: 656

    mothur > screen.seqs(fasta=esophagus.unique.fasta, maxambig=0)

This generates esophagus.unique.bad.accnos, a file with 129 sequences.

### fasta option

To use the fasta option, follow this example:

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, fasta=esophagus.fasta)

This generates the file esophagus.pick.fasta, which contains the
following lines:

    >9_1_12
    GCAAGTCGAGGGGAAAC...
    >9_1_14
    GCAAGTCGAGGGGAACG...
    >9_1_15
    GCAAGTCGAGGGGAAAC...
    ...
    
NOTE: You can enter multiple files separated by '-''s. 


### count option

The [ count](/wiki/Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, count=esophagus.count_table)

NOTE: You can enter multiple files separated by '-''s. 

### alignreport option

To use the alignreport option, follow this example:

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, alignreport=esophagus.align.report)

This generates the file esophagus.pick.align.report, which contains the
following lines:

    QueryName  QueryLength TemplateName    TemplateLength  SearchMethod    SearchScore AlignmentMethod QueryStart  QueryEnd    TemplateStart   TemplateEnd PairwiseAlignmentLength GapsInQuery GapsInTemplate  LongestInsert   SimBtwnQuery&Template   
    9_1_12 866 108139  1525    kmer    62.17   needleman   1   866 50  917 868 2   0   0   91.36   
    9_1_14 847 134265  1524    kmer    65.71   needleman   1   847 50  896 849 2   2   0   90.81   
    9_1_15 866 108139  1525    kmer    61.47   needleman   1   866 50  917 869 3   1   1   91.02   
    9_1_16 854 13820   1555    kmer    90.67   needleman   1   854 43  897 859 5   4   1   97.56   
    ...

### list option

To use the list option, follow this example:

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, list=esophagus.fn.list)

This generates the file esophagus.fn.pick.list, which contains the
following lines:

    unique 480 9_6_14,9_1_12   9_1_14  9_1_15  9_1_16  9_1_18  9_1_19  9_1_20  9_1_26  9_1_27  ... 
    0.00   265 9_4_14,9_7_28,9_1_26,9_6_14,9_1_12  9_2_20,9_1_14   9_1_15  9_1_16 ...
    0.01   115 9_1_15,9_6_25,9_3_24,9_4_14,9_7_28,9_1_26,9_6_14,9_1_12 65_7_10,65_1_30,9_6_15,9_8_20, ...
    ...

NOTE: You can enter multiple files separated by '-''s. 

### taxonomy option

To use the taxonomy option, follow this example:

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, taxonomy=esophagus.silva.full.taxonomy)

This generates the file esophagus.silva.full.pick.taxonomy, which
contains the following lines:

    9_1_12 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_14 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_15 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_16 Bacteria(100);Firmicutes(100);Clostridia(100);Acidaminococcaceae(100);Veillonella(100);...

NOTE: You can enter multiple files separated by '-''s. 

### qfile option

The qfile option allows you to remove sequences from your quality file,
and can be used as follows:

    mothur > remove.seqs(accnos=esophagus.unique.good.accnos, qfile=esophagus.qual)
    
NOTE: You can enter multiple files separated by '-''s. 

### fastq option

The fastq option allows you to remove sequences from your fastq file.

    mothur > remove.seqs(fastq=C10Fst.fastq, accnos=temp.accnos)
    
NOTE: You can enter multiple files separated by '-''s. 

### contigsreport

The contigsreport option allows you to select sequences from your
contigsreport file.

### name - not recommended

The name option allows you to provide a name file.

We DO NOT recommend using the name file. Instead we recommend using a count file. The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


### group - not recommended

The group parameter allows you to provide a group file.

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file. The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

### dups - not recommended

The dups parameter is only be used in tandem with a namefile. By default
dups is true, so if any sequence in a specific line in the name file is
in your .accnos file, then all sequences in that line will be removed. This
is especially useful when used with the groupfile, since for most
commands your files can contain only the unique sequences, but the
groupfile need to contain all the sequences in your namefile. For
example, let's look at the following line from the
esophagus.unique.good.accnos:

    65_1_2 65_1_2,65_1_23,65_2_1,65_2_8

if dups is set to false, only 65\_1\_2 will be removed from your files, but
if dups is true, then 65\_1\_2,65\_1\_23,65\_2\_1,65\_2\_8 will all be
removed.

## Revisions

-   1.28.0 Added count option
-   1.33.0 Added fastq option
-   1.37.0 Checks for repeat sequences names and eliminates them. Allows
    users creating their own templates to easily remove duplicate
    sequences from their reference files.
    [\#159](https://github.com/mothur/mothur/issues/159)
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.44.0 - Adds contigsreport option.
    [\#660](https://github.com/mothur/mothur/issues/660)
-   1.44.0 - Fixes bug with **remove.seqs** not removing empty groups from
    the count table.
    [\#675](https://github.com/mothur/mothur/issues/675)
-   1.46.0 - Adds warning in remove.seqs for dereplicate. See this [dereplicate example](http://mothur.org/wiki/chimera_dereplicate_example/) for detailed explanation.
-   1.47.0 Allows inputs to include multiple files. [\#803](https://github.com/mothur/mothur/issues/803)

