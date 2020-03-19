---
title: 'get.seqs'
tags: 'commands'
redirect_from: '/wiki/Get.seqs.html'
---
The **get.seqs** command takes a list of sequence
names (.accnos file) and either a [ fastq](fastq_file), [
fasta](fasta_file), [ name](name_file), [
group](group_file), [ list](list_file), [
count](Count_File) or [
align.report](align.report_file) file to generate a new file
that contains only the sequences in the list. This command may be used
in conjunction with the [list.seqs](list.seqs) command to
help screen a sequence collection. To complete this analysis, you need
to download the folder compressed in the [
Esophagus.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/esophagus.zip) archive.


## Options

To run get.seqs, you must provide the accnos option and at least one
other option. The command will generate a \*.pick.\* file. To generate
an accnos file, let\'s first run [unique.seqs](unique.seqs),
[summary.seqs](summary.seqs),
[screen.seqs](screen.seqs), and
[list.seqs](list.seqs):

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

    mothur > list.seqs(fasta=esophagus.unique.good.fasta)

This generates esophagus.unique.good.accnos, a file with 527 sequences.

A .accnos file is simply a list of file names that meets some given
criterion (see [list.seqs](list.seqs) for further detail). If
you have a subset of sequences that are of interest to you, and you want
to retrieve them sequences from a larger .fasta file, another option for
generating a .accnos file is to create your list (a single column of
names) in a text editor or spreadsheet program that allows you to save
your work as tab-delimited text. Notepad and Excel both allow you to do
this, just be sure to use quotation marks around your file name in order
to get your .accnos file type designation (e.g.
\"My\_subset\_sequences.accnos\").

### accnos option

To use the accnos option, follow this example:

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, fasta=esophagus.fasta)

This generates the file esophagus.pick.fasta, which contains the
following lines:

    >9_1_12
    GCAAGTCGAGGGGAAAC...
    >9_1_14
    GCAAGTCGAGGGGAACG...
    >9_1_15
    GCAAGTCGAGGGGAAAC...
    ...

### fasta option

To use the fasta option, follow this example:

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, fasta=esophagus.fasta)

This generates the file esophagus.pick.fasta, which contains the
sequences from esophagus.unique.good.accnos.

### name option

To use the name option, follow this example:

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, name=esophagus.names)

This generates the file esophagus.pick.names, which contains the
following lines:

    65_5_22    65_5_22
    65_5_12    65_5_12
    59_7_23    59_7_23
    59_7_7 59_7_7
    65_5_28    65_5_28
    65_9_13    65_9_13
    9_6_11 9_6_11
    ...

#### dups

The dups parameter is only be used in tandem with a namefile. By default
dups is true, so if any sequence in a specific line in the names file is
in your .accnos file, then all sequences in that line will be kept. This
is especially useful when used with the groupfile, since for most
commands your files can contain only the unique sequences, but the
groupfile need to contain all the sequences in your namefile. For
example, let\'s look at the following line from the
esophagus.unique.good.accnos:

    65_1_2 65_1_2,65_1_23,65_2_1,65_2_8

if dups is set to false, only 65\_1\_2 will be added to your files, but
if dups is true, then 65\_1\_2,65\_1\_23,65\_2\_1,65\_2\_8 will all be
added.

### count option

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, count=esophagus.count_table)

### group option

To use the group option, follow this example:

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, group=esophagus.groups)

This generates the file esophagus.pick.groups, which contains the
following lines:

    9_1_12 B
    9_1_14 B
    9_1_15 B
    9_1_16 B
    9_1_18 B
    ...

### alignreport option

To use the alignreport option, follow this example:

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, alignreport=esophagus.align.report)

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

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, list=esophagus.fn.list)

This generates the file esophagus.fn.pick.list, which contains the
following lines:

    unique 480 9_6_14,9_1_12   9_1_14  9_1_15  9_1_16  9_1_18  9_1_19  9_1_20  9_1_26  9_1_27  ... 
    0.00   265 9_4_14,9_7_28,9_1_26,9_6_14,9_1_12  9_2_20,9_1_14   9_1_15  9_1_16 ...
    0.01   115 9_1_15,9_6_25,9_3_24,9_4_14,9_7_28,9_1_26,9_6_14,9_1_12 65_7_10,65_1_30,9_6_15,9_8_20, ...
    ...

### taxonomy option

To use the taxonomy option, follow this example:

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, taxonomy=esophagus.silva.full.taxonomy)

This generates the file esophagus.silva.full.pick.taxonomy, which
contains the following lines:

    9_1_12 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_14 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_15 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_16 Bacteria(100);Firmicutes(100);Clostridia(100);Acidaminococcaceae(100);Veillonella(100);...

### qfile option

The qfile option allows you to select sequences from your quality file,
and can be used as follows:

    mothur > get.seqs(accnos=esophagus.unique.good.accnos, qfile=esophagus.qual)

### fastq option

The fastq option allows you to select sequences from your fastq file.

### contigsreport

The contigsreport option allows you to select sequences from your
contigsreport file.

## Revisions

-   1.28.0 Added count option
-   1.30.0 Bug Fix: dups=f could cause sequence name mismatches between
    new fasta and name files.
-   1.31.1 Bug Fix: dups=f, renaming issue,
    [https://forum.mothur.org/viewtopic.php?f=3&t=2371](https://forum.mothur.org/viewtopic.php?f=3&t=2371)
-   1.33.0 Added fastq option
-   1.37.0 Checks for repeat sequences names and eliminates them. Allows
    users creating their own templates to easily remove duplicate
    sequences from their reference files.
    [\#159](https://github.com/mothur/mothur/issues/159)
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.44.0 - Adds contigsreport option.
    [\#660](https://github.com/mothur/mothur/issues/660)


