---
title: 'make.group'
tags: 'commands'
redirect_from: '/wiki/Make.group.html'
---
The **make.group / make.count** command reads a [file](/wiki/file_file) file, [fasta](/wiki/fasta_file) file or series of fasta files and
creates a [ group](/wiki/group_file) or [count](/wiki/Count_file) file.

## Default Options
By default mothur will output a count table file.

    mothur > make.group(fasta=sample1.fasta-sample2.fasta-sample3.fasta, groups=A-B-C)

    or

    mothur > make.count(file=stability.files)
    
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

