---
title: 'make.group'
tags: 'commands'
redirect_from: '/wiki/Make.group.html'
---
The **make.group** command reads a fasta file or series of fasta files and
creates a [ group](/wiki/group_file) file.

## Default Options

    mothur > make.group(fasta=sample1.fasta-sample2.fasta-sample3.fasta, groups=A-B-C)

This command will generate a .group file that looks like:

    sample1Seq!   A
    sample1Seq2   A
    sample1Seq3   A
    sample1Seq4   A
    sample1Seq5   A
    sample2Seq!   B
    sample2Seq2   B
    sample2Seq3   B
    sample2Seq4   B
    sample2Seq5   B
    sample3Seq!   C
    sample3Seq2   C
    sample3Seq3   C
    sample3Seq4   C
    sample3Seq5   C
    
## output
The output parameter allows you to specify the name of group file or count file created. 

## format
The format parameter allows you to specify whether the outputted file is a group file or count file. Options group or count. Default=count.


## Revisions

-   1.38.1 Fixes bug with output directory
-   1.40.0 Bug Fix: Adds deliminator to output file for multiple groups.
    mergegroups -\> merge.groups.
    [\#384](https://github.com/mothur/mothur/issues/384)
-   1.42.0 Bug Fix: Fixes output filename for make.group.
    [\#602](https://github.com/mothur/mothur/issues/602)
-   1.48.0 Adds format parameter

