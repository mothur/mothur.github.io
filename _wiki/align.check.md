---
title: 'align.check'
tags: 'commands'
redirect_from: '/wiki/Align.check'
---
The **align.check** command allows you to calculate the number of
potentially misaligned bases in a 16S rRNA gene sequence alignment. If
you are familiar with the editor window in ARB, this is the same as
counting the number of \~, \#, -, and = signs. To run through the
command below use the greengenes [secondary structure
map](secondary_structure_map) and the [ esophagus
dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/esophagus.zip).

## Meaning of symbols

It should first be noted that every sequence alignment will have
non-ideal pairing, thus this tool should be used to identify outliers in
your alignment.

  Symbol   Base-pairings
  -------- --------------------------------------------------
  \#       AA, AC, CC, CT, GG, A-, C-, G-, T-
  \-       GT
  =        AG
  \+       TT
  \~       AT, CG
  loop     \-- and positions not in the secondary structure

## Default settings

To run **align.check** you need to provide your aligned sequences as a
FASTA-formatted file. You also need to provide the appropriate file
containing the [secondary structure
map](secondary_structure_map). These esophagus sequences were
aligned using the greengenes alignment. The output will be in

\.align.check file. Try the following command:

    mothur > align.check(fasta=esophagus.align, map=gg.ss.map)

The output file will look like:

    name   pound   dash    plus    equal   loop    tilde   total
    9_1_12 42  68  8   28  275 420 872
    9_1_14 36  68  6   26  266 422 851
    9_1_15 44  68  8   28  276 418 873
    9_1_16 34  72  6   30  267 430 860
    9_1_18 46  80  2   36  261 406 862
    ...

## name

You can also provide a name file associated with your fasta file.

    mothur > align.check(fasta=esophagus.align, map=gg.ss.map, name=esophagus.names)

## count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence.

    mothur > align.check(fasta=esophagus.align, map=gg.ss.map, count=esophagus.count_table)

## Comparing alignments

We find that the SILVA alignment actually provides a better alignment
than the greengenes alignment. To test this, realign the esophagus
sequences using the SILVA alignment with the
[align.seqs](align.seqs) command:

    mothur > align.seqs(candidate=esophagus.fasta, template=silva.bacteria.fasta)
    mothur > align.check(fasta=esophagus.align, map=silva.ss.map)

And the top of the resulting esophagus.align.check file looks like:

    name   pound   dash    plus    equal   loop    tilde   total
    9_1_12 20  72  6   28  277 432 866
    9_1_14 26  70  6   28  271 420 848
    9_1_15 20  72  6   28  277 432 866
    9_1_16 30  72  4   32  274 426 859
    9_1_18 18  80  4   36  265 416 850
    ...

You can seem by comparing the greengenes and SILVA alignments for these
5 sequences that there are significantly fewer \#\'s in the SILVA
aligned sequences.

## Revisions

-   1.28.0 Added count option
-   1.28.0 Added name parameter back


