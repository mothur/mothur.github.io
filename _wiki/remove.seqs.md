---
title: 'remove.seqs'
tags: 'commands'
redirect_from: '/wiki/Remove.seqs.html'
---
The **remove.seqs** command takes a list of
sequence names and either a [ fastq](fastq_file), [
fasta](fasta_file), [ name](name_file), [
group](group_file), [ list](list_file), [
count](Count_File) or [
align.report](align.report_file) file to generate a new file
that does not contain the sequences in the list. This command may be
used in conjunction with the [list.seqs](list.seqs) command
to help screen a sequence collection. To complete this analysis, you
need to download the folder compressed in the [
Esophagus.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/esophagus.zip) archive.


## Options

To run remove.seqs, you must provide the accnos option and at least one
other option. The command will generate a \*.pick.\* file.

### accnos option

To generate an accnos file, let's first run
[unique.seqs](unique.seqs),
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

### name option

To use the name option, follow this example:

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, name=esophagus.names)

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

By default, the entire line from a name file if you remove any name from
the line. default=false. If dups=true, then **remove.seqs** outputs a new

\.accnos file containing all the sequences removed. To turn this setting
off, see the [ dups](#dups) subsection, below.

#### dups

The dups parameter is only be used in tandem with a namefile. By default
dups is set to true, which means that if any sequence in a specific line
of the names file is in your .accnos file all sequences in that line
will be removed. For example, let's look at the following line from the
esophagus.unique.good.accnos:

    65_1_2 65_1_2,65_1_23,65_2_1,65_2_8

if dups=false, only 65\_1\_2 will be removed from your files, but if
dups=true, then 65\_1\_2,65\_1\_23,65\_2\_1,65\_2\_8 will all be
removed.

### count option

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, count=esophagus.count_table)

### group option

To use the group option, follow this example:

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, group=esophagus.groups)

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

### taxonomy option

To use the taxonomy option, follow this example:

    mothur > remove.seqs(accnos=esophagus.unique.bad.accnos, taxonomy=esophagus.silva.full.taxonomy)

This generates the file esophagus.silva.full.pick.taxonomy, which
contains the following lines:

    9_1_12 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_14 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_15 Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);...
    9_1_16 Bacteria(100);Firmicutes(100);Clostridia(100);Acidaminococcaceae(100);Veillonella(100);...

### qfile option

The qfile option allows you to remove sequences from your quality file,
and can be used as follows:

    mothur > remove.seqs(accnos=esophagus.unique.good.accnos, qfile=esophagus.qual)

### fastq option

The fastq option allows you to remove sequences from your fastq file.

    mothur > remove.seqs(fastq=C10Fst.fastq, accnos=temp.accnos)

### contigsreport

The contigsreport option allows you to select sequences from your
contigsreport file.

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


