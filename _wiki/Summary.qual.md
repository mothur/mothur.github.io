---
title: 'Summary.qual'
---
The **summary.qual** command reads a quality file
and an optional name, and summarizes the quality information.

## Default settings

You must provide a quality file.

    mothur > summary.qual(qfile=summary.qual(qfile=stool.trim.pick.qual)

This command will produce a stool.trim.pick.qual.summary, which should
look like:

    Position   numSeqs AverageQ    q0  q1  q2  ... q38 q39 q40 
    0  1382    27.972504   0   0   0   0   ... 11  0   4
    1  1382    28.861795   0   0   0   0   ... 27  0   7
    2  1382    29.931982   0   0   0   0   ... 28  0   21
    3  1382    30.389292   0   0   0   0   ... 32  0   21
    4  1382    31.139652   0   0   0   0   ... 53  0   23
    5  1382    31.574530   0   0   0   0   ... 66  0   33
    6  1382    32.063675   0   0   0   0   ... 85  0   45
    7  1382    32.369755   0   0   0   0   ... 97  0   47
    8  1382    32.812592   0   0   0   0   ... 110 0   75
    9  1382    32.984081   0   0   0   0   ... 132 0   68
    ...

    Position - spot in sequence.
    numSeqs - the number of sequence that had that position.
    AverageQ - the average quality score
    q0 - the number of sequence with a quality score of 0.
    q1 - the number of sequence with a quality score of 1.
    q2 - the number of sequence with a quality score of 2.
    q3 - the number of sequence with a quality score of 3.
    q4 - the number of sequence with a quality score of 4.
    q5 - the number of sequence with a quality score of 5.
    ...
    ...
    q40 - the number of sequence with a quality score of 40.

### name

The name parameter allows you add a names file with your quality file.

    mothur > summary.qual(qfile=stool.trim.pick.qual, name=stool.trim.unique.good.filter.names)

The screen output looks like:

    Position   NumSeqs AverageQ
    0  2382    27.678001
    100    2382    36.780018
    200    2040    37.163727

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > summary.qual(qfile=stool.trim.pick.qual, count=stool.trim.unique.good.filter.count_table)

### processors

The processors option enables you to accelerate the alignment by using
multiple processors. Default processors=Autodetect number of available
processors and use all available.

## Revisions

-   1.23.0 First Introduced.
-   1.28.0 Added count option
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.

[Category:Commands](Category:Commands)
