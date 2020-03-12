---
title: 'Get.oturep'
tags: 'commands'
---
While the [bin.seqs](bin.seqs) command reports the OTU number
for all sequences, the **get.oturep** command
generates a fasta-formatted sequence file containing only a
representative sequence for each OTU. A .rep.fasta and .rep.names file
or .rep.count\_table file is generated for each OTU definition. For this
tutorial, download and decompress
[AmazonData.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip).


## Default settings

To run the **get.oturep** command you must provide either a
[phylip-formatted distance
matrix](phylip-formatted_distance_matrix) or a
[column-formatted distance
matrix](column-formatted_distance_matrix), together with a
[list file](list_file) whose sequence names are complementary
to the names in the distance matrix. (An exception is that a distance
file is not required if you specify method=abundance.) For example,

    mothur > get.oturep(phylip=98_sq_phylip_amazon.dist, list=98_sq_phylip_amazon.an.list)

or

    mothur > get.oturep(column=98_lt_column_amazon.dist, name=amazon.names, list=98_sq_phylip_amazon.an.list)

The .rep.names file will look like:

    U68589 U68589
    U68590 U68590
    U68591 U68591
    U68687 U68687,U68592
    U68654 U68649,U68639,U68606,U68654,U68593
    U68594 U68594
    U68636 U68636,U68631,U68666,U68595
    U68614 U68629,U68617,U68614,U68596
    ...

or with a [ count file](Count_File):

    mothur > get.oturep(phylip=98_sq_phylip_amazon.dist, list=98_sq_phylip_amazon.an.unique_list, count=amazon.count_table)

or

    mothur > get.oturep(column=98_lt_column_amazon.dist, list=98_sq_phylip_amazon.an.unique_list, count=amazon.count_table)

The .rep.count\_table file will look like:

    ...
    U68589 1
    U68590 1
    U68591 1
    U68687 2
    U68654 5
    U68594 1
    U68636 4
    U68614 4
    ...

The representative sequences are named identically to the names given in
the input file with the addition of the OTU number and number of
sequences represented separated by a tabs as follows:

    >name  OTU#|sequences represented
    sequence....

## Options

### cutoff

The cutoff parameter allows you to limit the distances read into memory
as well as indicating the labels in the list file you want to process.
There may only be a couple of lines in your OTU data that you are
interested in running through get.oturep(). There are two options. You
could: (i) manually delete the lines you aren\'t interested in from your
list file; (ii) or use the cutoff option. If you only want to read in
the data for the lines labeled unique, 0.03, 0.05 and 0.10 you would
enter:

    mothur > get.oturep(column=96_lt_column_amazon.dist, name=amazon.names, fasta=amazon.fasta, list=98_sq_phylip_amazon.fn.list, label=unique-0.03-0.05-0.10)

### fasta

If you provide a fasta file, mothur will generate 12 fasta-formatted
files (one per OTU definition in the list file) that each contain the
same number of sequences as there are OTUs for that OTU definition. If
there are three or more sequences in an OTU, the representative sequence
is that sequence which is the minimum distance to the other sequences in
the OTU. For example, the file 98\_sq\_phylip\_amazon.fn.0.10.fasta
contains the following output:

    mothur > get.oturep(phylip=98_sq_phylip_amazon.dist, list=98_sq_phylip_amazon.an.list, fasta=amazon.fasta)

    >U68589    1|1
    TAATACGTAGGGTGCAAGCGTTGCCCGGGTTTATTGGGCGTAAAGGGCGCGTAGGCGGCTCGACA...
    >U68590    2|1
    TAATACGGGGGGAGCAAGCGTTGTTCGGATTTACTGGGCGTAAAGGGCGCGTATGCGGCCAGCGCA...
    >U68591    3|1
    CGTAGGGTCCAAGCGTTATCCGGAATTACTGGGCGTAAAGAGTTGCGTAGGTGGCATAGTAAGCAGA...
    >U68687    4|2
    TAATACAGAGGTCCCAAGCGTTGTTCGGATTCACTGGGCGTAAAGGGTGCGTAGGTGGTGAGGTAAG...
    >U68654    5|5
    TAATACGGNCGGGGCAANCGTTGTTCGGAATTACTGGGCGTAAAGGGCTCGTAGGCGGCCAACTAAG...
    >U68594    6|1
    TAATCCCAAGGGTGCAANCGTTACTCGGAATTACTGGGCGTAAAGCGTGCGTAGGTGGTTTGTTAAG...
    ...

### name

A [names file](names_file) indicating sequence names that are
identical to a references sequence, may be inputted into the
get.oturep() command so that the fasta and list files are complementary.
The following command illustrate this:

    mothur > get.oturep(column=96_lt_column_amazon.dist, name=amazon.names, fasta=amazon.unique.fasta, list=98_sq_phylip_amazon.fn.list)

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence.

    mothur > get.oturep(column=96_lt_column_amazon.dist, count=amazon.count_table, fasta=amazon.unique.fasta, list=98_sq_phylip_amazon.fn.unique_list)

### sorted

You may want to sort the output you get from the **get.oturep** command. The
sorted option allows you to indicate how you want the output sorted. You
can sort by sequence name, bin number, bin size or group. The default is
no sorting, but your options are name, bin, size, or group.

    mothur > get.oturep(column=96_lt_column_amazon.dist, name=amazon.names, fasta=amazon.fasta, list=98_sq_phylip_amazon.fn.list, label=unique-0.03-0.05-0.10, sorted=name)

### group

The group parameter allows you to provide a group file.

     mothur > get.oturep(column=96_lt_column_amazon.dist, name=amazon.names, fasta=amazon.fasta, list=98_sq_phylip_amazon.fn.list, group=amazon.groups)

### groups

The groups parameter allows you to indicate that you want representative
sequences for each group specified for each OTU, group name should be
separated by dashes. ex. groups=A-B-C.

     mothur > get.oturep(column=96_lt_column_amazon.dist, name=amazon.names, fasta=amazon.fasta, list=98_sq_phylip_amazon.fn.list, group=amazon.groups, groups=forest-pasture)

### weighted

The weighted parameter allows you to indicate that want to find the
weighted representative. You must provide a name file to set weighted to
true. The default value is false. The representative is found by
selecting the sequence that has the smallest total distance to all other
sequences in the OTU. If a tie occurs the smallest average distance is
used. For weighted = false, mothur assumes the distance file contains
only unique sequences, the list file may contain all sequences, but only
the uniques are considered to become the representative. If your
distance file contains all the sequences it would become weighted=true.
For weighted=true, mothur assumes the distance file contains only unique
sequences, the list file must contain all sequences, all sequences are
considered to become the representative, but unique name will be used in
the output for consistency.

### method

The method parameter allows you to select the representative sequence
based on either distance or abundance. The distance method finds the
sequence with the smallest maximum distance to the other sequences. If
tie occurs the sequence with smallest average distance is selected. The
abundance method chooses the most abundant sequence in the OTU as the
representative. It is not necessary to specify a distance file if the
abundance method is used.

### rename

The rename option allows you to set the representative name to the OTU
label. Rename is set to false by default.

## Revisions

-   1.23.0 fasta parameter is no longer required.
-   1.28.0 Added count option
-   1.31.0 - added method parameter.
    [https://forum.mothur.org/viewtopic.php?f=5&t=2131](https://forum.mothur.org/viewtopic.php?f=5&t=2131)
-   1.33.0 - changed otu numbers to be labels
-   1.41.0 - Updates **get.oturep** command to use optiMatrix. Reduces time
    and memory needed. Removes large option.
    [\#465](https://github.com/mothur/mothur/issues/465)
-   1.42.0 - Adds rename option.
    [\#555](https://github.com/mothur/mothur/issues/555)
-   1.43.0 - **get.oturep** command wasn\'t handling multiple labels.
    Removed labels parameter and modifies cutoff to act like cluster
    commands. ie. cutoff=0.01-0.03. Also failing with abundance method
    using count file without group information
    [\#656](https://github.com/mothur/mothur/issues/656)
    [\#575](https://github.com/mothur/mothur/issues/575)


