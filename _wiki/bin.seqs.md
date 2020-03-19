---
title: 'bin.seqs'
tags: 'commands'
redirect_from: '/wiki/Bin.seqs.html'
---
**bin.seqs** prints out a fasta-formatted file where
sequences are ordered according to the OTU that they belong to. Such an
output may be helpful for generating primers specific to an OTU or for
classification of sequences. For this tutorial, download and decompress
[amazondata.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip).


## Default settings

To execute the bin.seqs() you must provide a [list
file](list_file) and the fasta option must be used to provide
a [fasta-formatted file](fasta_file) that has the
sequences represented in the list file.

    mothur > bin.seqs(list=98_sq_phylip_amazon.an.list, fasta=amazon.fasta)

This command will generate 12 fasta-formatted files. Each file
represents a different label. Within each file the sequences are sorted
according to the OTU that they belong to. The sequence names have been
modified to indicate its OTU grouping. For example, the file
98\_sq\_phylip\_amazon.an.0.10.fasta contains the following output:

    >U68686    Otu01
    TAATACAGAAGGTGCAAGCGTTGTTCGGAATTATTGGGCGTAAAGGGCGCGTAGGCGGTGCGGTAAGTC...
    >U68635    Otu01
    TAATACAGAGGGGGCAAGCGTTGTTCGGAATTATTGGGCGTAAAGGGCGCGTANGCGGTGCGGTAAGT...
    ... 
    >U68610    Otu04
    TAATACAAACGTCTCAANCGTTGTTCGGATTCATTGGGCGTAAAGGGTGCGTANGCGGCGCGGTAANT...
    ...

The number indicates the OTU that the sequence belongs to.

## Options

### group

If you provide a group file, then in addition to the OTU number the
group will also be provided.

    >U68589    forest  Otu01
    TAATACGTAGGGTGCAAGCGTTGCCCGGGTTTATTGGGCGTAAAGGGCGCGTAGGCGGCTCGACACGTCCGTTGTGAAATC...
    >U68590    forest  Otu02
    TAATACGGGGGGAGCAAGCGTTGTTCGGATTTACTGGGCGTAAAGGGCGCGTATGCGGCCAGCGCAAGTCAGTTGTGAAAT...
    >U68591    forest  Otu03
    CGTAGGGTCCAAGCGTTATCCGGAATTACTGGGCGTAAAGAGTTGCGTAGGTGGCATAGTAAGCAGATAGTGAAATGATAC...
    >U68687    pasture Otu04
    TAATACAGAGGTCCCAAGCGTTGTTCGGATTCACTGGGCGTAAAGGGTGCGTAGGTGGTGAGGTAAGTCGGATGTGAAATC...
    >U68592    forest  Otu04
    TAATACAGAGGTCCCGAGCGTTGTTCGGATTCACTGGGCGTAAAGGGTGCGTAGGTGGTGGGATAAGTCGGATGTGAAATC...
    ...

### name

A [name file](name_file) indicating
sequence names that are identical to a references sequence, may be
inputted to **bin.seqs** so that the fasta and list files are complementary.
The following commands illustrate this:

    mothur > bin.seqs(list=98_sq_phylip_amazon.an.list, fasta=amazon.unique.fasta, name=amazon.names)

### count

The [count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information. If
you ran the cluster command with a count file, be sure to include the
count file with this command as the list file will only contain the
unique names.

    mothur > bin.seqs(list=final.an.unique_list.list, fasta=final.fasta, count=final.count_table, label=0.03)

    >GQY1XT001EH8KN    F003D000-F003D142-F003D144-F003D146-F003D150    Otu0001 NumRep=41
    C-G--T-T--GA-A-A-C-T-G-A--TT-G-T-C--T-T-G-A-G-T-G-G-GC-GA-G-A-A-G-T-A--TG-C-GG-A-ATG-C-G-...
    >GQY1XT001CRCO3    F003D004    Otu0001 NumRep=1
    C-G--T-T--GA-A-A-C-T-G-A--TT-G-T-C--T-T-G-A-G-T-G-G-GC-GA-G-A-A-G-T-A--TG-C-GG-A-ATG-C-G-...
    >GQY1XT001C0JER    F003D146    Otu0001 NumRep=1
    C-G--T-T--GA-A-A-C-T-G-A--C--G-T-C--T-T-G-A-G-T-G-G-GC-GA-G---A-G-T-A--TG-C-GG-A-ATG-C-G-...
    >GQY1XT001APSXD    F003D142-F003D144   Otu0001 NumRep=4
    C-G--T-T--GA-A-A-C-T-G-A--C--G-T-C--T-T-G-A-G-T-G-G-GC-GA-G-A-A-G-T-A--TG-C-GG-A-ATG-C-G-...

### label

There may only be a couple of lines in your OTU data that you are
interested in running through bin.seqs(). There are two options. You
could: (i) manually delete the lines you aren't interested in from your
list file; (ii) or use the label option. If you only want to read in the
data for the lines labeled unique, 0.03, 0.05 and 0.10 you would enter:

    mothur >  bin.seqs(list=98_sq_phylip_amazon.an.list, fasta=amazon.fasta, label=unique-0.03-0.05-0.10)

## Revisions

-   1.28.0 Added count parameter
