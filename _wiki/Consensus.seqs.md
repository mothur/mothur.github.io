---
title: 'Consensus.seqs'
---
The **consensus.seqs** command can be used in 2 ways: create a consensus
sequence from a fastafile, or with a listfile create a consensus
sequence for each otu. Sequences must be aligned.

The **consensus.seqs** command parameters are fasta, list, name and label.

## Default Settings

The fasta parameter allows you to enter the fasta file containing your
sequences, and is required.

    mothur > consensus.seqs(fasta=abrecovery.align)

This command will generate 2 files: abrecovery.cons.summary and
abrecovery.cons.fasta

If you open abrecovery.cons.summary, you will see something like:

    PositioninAlignment    A   T   G   C   Gap NumberofSeqs    ConsensusBase
    1  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    2  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    3  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    4  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    5  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    6  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    7  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    8  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    9  0.000000    0.000000    0.000000    0.000000    1.000000    242 .
    10 0.000000    0.000000    0.000000    0.000000    1.000000    242 .

Columns 2 through 5 contain the fraction of sequences with that base at
that location. For positions without perfect agreement, the
ConsensusBase is the appropriate IUPAC nucleotide ambiguity code, while
positions without data are denoted by a period \'.\'

## Options

### name

The name parameter allows you to enter a name file associated with your
fasta file.

    mothur > consensus.seqs(fasta=abrecovery.align, name=abrecovery.names)

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > consensus.seqs(fasta=abrecovery.align, count=abrecovery.count_table)

### list

You may want to find a consensus sequences for each otu in your list
file. If you ran the cluster command with a count file, be sure to
include the count file with this command as the list file will only
contain the unique names. The following command will do that:

     mothur > consensus.seqs(fasta=abrecovery.align, list=abrecovery.fn.list)

or

     mothur > consensus.seqs(fasta=abrecovery.align, list=abrecovery.fn.unique_list, count=abrecovery.count_table)

This command will generate abrecovery.unique.cons.summary,
abrecovery.unique.cons.names, abrecovery.unique.cons.fasta and a group
of files, such as abrecovery.0.01.cons.summary and
abrecovery.0.01.cons.names (In version 1.20).

### label

There may only be a couple of lines in your OTU data that you are
interested in. There are two options. You could: (i) manually delete the
lines you aren\'t interested in from your list file; (ii) or use the
label option. To use the label option with the **consensus.seqs** command
you need to know the labels you are interested in. If you want the
consensus data for the lines labeled unique, 0.03, 0.05 and 0.10 you
would enter:

    mothur > consensus.seqs(fasta=abrecovery.align, list=abrecovery.fn.list, label=unique-0.03-0.05-0.10)

### cutoff

The cutoff parameter allows you set a percentage of sequences that
support the base. For example: cutoff=95 would return the base was
supported by at least 95% of sequences.

Here\'s an example:

    mothur > consensus.seqs(fasta=abrecovery.align, cutoff=95)

From the .summary file at position 2029 we see:

    2029   0.000000    0.000000    0.954545    0.004132    0.041322    242 G

There are no A\'s, no T\'s, 231 G\'s, 1 C, and 10 gaps. Since more than
95% of the sequences support G, that\'s what is returned, without the
cutoff mothur would return s.

## Revisions

-   1.28.0 Added count parameter
-   1.28.0 Cutoff rounding error -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1781](https://forum.mothur.org/viewtopic.php?f=4&t=1781)
-   1.30.0 changed consensus sequence name from seq1, seq2, \... to
    OTUlabel.

[Category:Commands](Category:Commands)
