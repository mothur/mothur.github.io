---
title: 'get.current'
tags: 'commands'
redirect_from: '/wiki/Get.current.html'
---
The **get.current** command allows you to find out which files mothur has
saved as "current" for each type. You can also clear current files.


## Default Options

First let's get some current files saved.

    mothur > summary.seqs(fasta=stool.fasta)
    mothur > unique.seqs(fasta=stool.fasta)

Now we can see how the **get.current** command works.

    mothur > get.current()

    Current files saved by mothur:
    fasta=/Users/SarahsWork/Desktop/release/stool.unique.fasta
    name=/Users/SarahsWork/Desktop/release/stool.names

You can also use these current files to help with mothur's long file
names.

    mothur > summary.seqs(fasta=stool.fasta)
    mothur > unique.seqs(fasta=current)

Screen Output:

    mothur > summary.seqs(fasta=stool.fasta)

           Start   End NBases  Ambigs  Polymer
    Minimum:   1   183 183 0   3
    2.5%-tile: 1   243 243 0   4
    25%-tile:  1   259 259 0   5
    Median:    1   267 267 0   5
    75%-tile:  1   274 274 0   5
    97.5%-tile:    1   287 287 0   6
    Maximum:   1   373 373 0   6
    # of Seqs: 37126

    Output File Name: 
    stool.fasta.summary


    mothur > unique.seqs(fasta=current)
    Using stool.fasta as input file for the fasta parameter.

    Output File Names: 
    stool.unique.fasta
    stool.names

NOTE: For REQUIRED parameters if you do not provide the file mothur will
automatically check to see if there is a current file of that type. So
in the above example you could also run unique.seqs without providing a
fasta file name.

## clear

You can clear specific file values by separating their names with
dashes.

    mothur > summary.seqs(fasta=stool.fasta)
    mothur > unique.seqs(fasta=stool.fasta)
    mothur > get.current(clear=fasta)

    Current files saved by mothur:
    name=/Users/SarahsWork/Desktop/release/stool.names

or you can clear all files by setting clear=all.

    mothur > summary.seqs(fasta=stool.fasta)
    mothur > unique.seqs(fasta=stool.fasta)
    mothur > get.current(clear=all)

    Current files saved by mothur:

## Revisions

-   1.33.0 - added directory information. -
    [https://forum.mothur.org/viewtopic.php?f=8&t=332&p=7824#p7824](https://forum.mothur.org/viewtopic.php?f=8&t=332&p=7824#p7824)
-   1.37.0 - Adds current RAM usage and total RAM available.
-   1.37.0 - Adds output file to **get.current** and input/output file to
    set.current . This allows the commands to work together to keep
    track of current files between instances of mothur. You can input
    the output file of the **get.current** command into the set.current
    command using the new current parameter.
-   1.38.0 - Fixes RAM output for linux.


