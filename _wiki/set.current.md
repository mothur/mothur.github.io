---
title: 'set.current'
tags: 'commands'
redirect_from: '/wiki/Set.current.html'
---
The **set.current** command allows you to **set.current** files for mothur to
use. You can also clear current files.


## Default Options

Let's set a current fasta and name file and then see how mothur will
use them. NOTE: For REQUIRED parameters if you do not provide the file
mothur will automatically check to see if there is a current file of
that type.

    mothur > set.current(fasta=stool.fasta, name=stool.names)

    Current files saved by mothur:
    fasta=/Users/SarahsWork/Desktop/release/stool.fasta
    name=/Users/SarahsWork/Desktop/release/stool.names

    mothur > summary.seqs()
    Using stool.fasta as input file for the fasta parameter.

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

Since the fasta parameter is required for the summary.seqs command
mothur will use the current fasta file. Now see what happens with
unique.seqs.

    mothur > set.current(fasta=stool.fasta, name=stool.names)
    mothur > unique.seqs()
    Using stool.fasta as input file for the fasta parameter.

    Output File Names: 
    stool.unique.fasta
    stool.names

If you want to use the name file, you must set name=current since the
name parameter is not required.

    mothur > set.current(fasta=stool.fasta, name=stool.names)
    mothur > unique.seqs(name=current)
    Using stool.names as input file for the name parameter.
    Using stool.fasta as input file for the fasta parameter.

    Output File Names: 
    stool.unique.fasta
    stool.names

## clear

You can clear specific file values by separating their names with
dashes.

    mothur > summary.seqs(fasta=stool.fasta)
    mothur > unique.seqs(fasta=stool.fasta)
    mothur > set.current(clear=fasta)

    Current files saved by mothur:
    name=/Users/SarahsWork/Desktop/release/stool.names

or you can clear all files by setting clear=all.

    mothur > summary.seqs(fasta=stool.fasta)
    mothur > unique.seqs(fasta=stool.fasta)
    mothur > set.current(clear=all)

    Current files saved by mothur:

## current

The current parameter can be used to input the output file from
get.current. This allows the commands to work together to keep track of
current files between instances of mothur.

## processors

You can set the number of processors to use for commands that allow multiple processors.
Otherwise, mothur will detect the number of processors and use as many as are available.

    mothur > set.current(processors=8)
    
    Using 8 processors.

    Current files saved by mothur:
    processors=8

## Revisions

-   1.33.0 - Bug Fix: setting processors option to 1, if not set.
-   1.37.0 - Adds current parameter.


