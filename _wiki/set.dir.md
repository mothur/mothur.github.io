---
title: 'set.dir'
tags: 'commands'
redirect_from: '/wiki/Set.dir'
---
**set.dir** allows you to redirect the output files
created by mothur, or set the directory where mothur will look for input
files. You can also set a default location for mothur to look if it
can\'t find your files in the input location. This allows you to keep
your reference files in one location.


## input

    mothur > set.dir(input=../inputFiles)
    Changing input directory to /Users/Work/Desktop/inputFiles/

## output

If output directory does not exist mothur will create it for you.

    mothur > set.dir(output=../outputFiles)
    Changing output directory to /Users/Work/Desktop/outputFiles/

## tempdefault

By default tempdefault=mothur\'s executable location.

    mothur > set.dir(tempdefault=../referenceFiles)
    Changing default directory to /Users/Work/Desktop/referenceFiles/

## debug

The debug flag is used to indicate you want extra output to the screen
and logfile. It will help you spot file format issues that cause mothur
crashes.

    mothur > set.dir(debug=t)

## inputdir && outputdir

Mothur allows you to change the input and output directories globally in
any command. For example:

    mothur > summary.seqs(fasta=amazon.fasta, inputdir=../inputFiles)

## blastdir

Mothur allows you to set the location of the blast executables directory
globally in any command. For example:

    mothur > summary.seqs(fasta=amazon.fasta, blastdir=/usr/local/bin/blast)

## modifynames

The modifynames flag is used to indicate how you want mothur to treat
sequence names containing \':\' characters. Default=t, meaning if your
sequence names contain \':\' change them to \'\_\' to avoid issues while
making trees. modifynames=F will leave sequence names as they are.

## Order of searching

When mothur is trying to find a file without a full path here are the
order of searches.

    1. Default path
    2. Output directory
    3. Input directory

The output directory is listed before the input directory because many
of mothur\'s command create files that then are used as inputs on the
next command.

## Revisions

-   1.26.0 - added debug parameter
-   1.31.0 - added modifynames parameter. -
    [https://forum.mothur.org/viewtopic.php?f=10&t=2324&p=6360#p6360](https://forum.mothur.org/viewtopic.php?f=10&t=2324&p=6360#p6360)
-   1.36.0 - if output directory does not exist mothur will create it
    for you.
-   1.36.0 - By default tempdefault is set to mothur\'s executable
    location.
-   1.39.0 - Adds blastdir parameter.


