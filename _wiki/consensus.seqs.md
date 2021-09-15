---
title: 'consensus.seqs'
tags: 'commands'
redirect_from: '/wiki/Consensus.seqs.html'
---
The **consensus.seqs** command can be used in 2 ways: create a consensus
sequence from a fastafile, or with a listfile create a consensus
sequence for each otu. Sequences must be aligned. This tutorial
uses the data files in [
Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/ExampleDataSet.zip).

The **consensus.seqs** command parameters are fasta, list, count, name and label.

## Default Settings

The fasta parameter allows you to enter the fasta file containing your
sequences, and is required.

    mothur > consensus.seqs(fasta=final.fasta)

This command will generate 2 files: final.cons.summary and
final.cons.fasta

If you open final.cons.summary, you will see something like:

    PositioninAlignment	A	T	G	C	Gap	NumberofSeqs	ConsensusBase
    1	0.001650	0.992574	0.003713	0.002063	0.000000	2424	N
    2	0.997525	0.000000	0.001238	0.001238	0.000000	2424	V
    3	0.000413	0.002888	0.000000	0.996700	0.000000	2424	H
    4	0.000000	0.000000	0.000825	0.000000	0.999175	2424	g
    5	0.000000	0.000000	0.001650	0.000000	0.998350	2424	g
    6	0.007013	0.002475	0.990099	0.000413	0.000000	2424	N
    7	0.000825	0.528465	0.469884	0.000825	0.000000	2424	N
    8	0.007838	0.000000	0.000000	0.000000	0.992162	2424	a
    9	0.990099	0.000000	0.009901	0.000000	0.000000	2424	R
    10	0.002063	0.050330	0.943069	0.000000	0.004538	2424	d
    11	0.000000	0.000000	0.002888	0.000000	0.997112	2424	g
    12	0.001238	0.002063	0.996287	0.000413	0.000000	2424	N
    13	0.440182	0.102310	0.457508	0.000000	0.000000	2424	D
    14	0.065594	0.455858	0.473185	0.004538	0.000825	2424	n
    15 	0.000413	0.006188	0.007426	0.000000	0.985974	2424	d
    ...

Columns 2 through 5 contain the fraction of sequences with that base at
that location. For positions without perfect agreement, the
ConsensusBase is the appropriate IUPAC nucleotide ambiguity code, while
positions without data are denoted by a period '.'

## Options

### count

The [ count](/wiki/Count_File) file is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > consensus.seqs(fasta=final.fasta, count=final.count_table)

### name - not recommended

The name parameter allows you to enter a name file associated with your
fasta file.

    mothur > consensus.seqs(fasta=final.fasta, name=final.names)

NOTE: We DO NOT recommend using the name file. Instead we recommend using a count file. 
The count file reduces the time and resources needed to process commands. 
It is a smaller file and can contain group information.


### list

You may want to find a consensus sequences for each otu in your list
file. If you ran the cluster command with a count file, be sure to
include the count file with this command. The following command will do that:

     mothur > consensus.seqs(fasta=final.fasta, count=final.count_table, list=final.opti_mcc.list)

This command will generate final.0.03.cons.summary, final.0.03.cons.fasta and final.0.03.cons.names.

### label

There may only be a couple of lines in your OTU data that you are
interested in. There are two options. You could: (i) manually delete the
lines you aren't interested in from your list file; (ii) or use the
label option. To use the label option with the **consensus.seqs** command
you need to know the labels you are interested in. 

    mothur > consensus.seqs(fasta=final.fasta, count=final.count_table, list=final.opti_mcc.list, label=0.03)

### cutoff

The cutoff parameter allows you set a percentage of sequences that
support the base. For example: cutoff=95 would return the base was
supported by at least 95% of sequences.

Here's an example:

    mothur > consensus.seqs(fasta=final.fasta, cutoff=95)

From the .summary file at position 25 we see:

    25	0.000000	0.001238	0.000413	0.997525	0.000825	2424	C

There are no A's, 3 T's, 1 G's, 2418 C, and 2 gaps. Since more than
95% of the sequences support C, that's what is returned, without the
cutoff mothur would return b.


## Revisions

-   1.28.0 Added count parameter
-   1.28.0 Cutoff rounding error -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1781](https://forum.mothur.org/viewtopic.php?f=4&t=1781)
-   1.30.0 changed consensus sequence name from seq1, seq2, \... to
    OTUlabel.


