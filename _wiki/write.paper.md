---
title: 'Write.paper'
redirect_from: '/wiki/Write.paper.html'
---
The **write.paper** command will take in your
original dataset and run all of the various commands on the data. Using
our latest and greatest text parsing algorithms in combination with
either a specified manuscript or a minimum impact factor the command
will produce a submission-ready manuscript complete with figures and
interpretation. When you've given up (or haven't started trying) to
make sense of your poorly designed experiment, run this command instead
of emailing us to interpret your P-values. This command will do it all:
sequence curation, combine data from different variable regions and
sequencing platforms, read your mind (or your PIs mind), run alpha,
beta, and population-based analyses, and even write the manuscript for
you.

## Default settings

By default the command will process your sff files into a manuscript to
be submitted to Nature (go big or go home). This requires the basic
command call:

    mothur > write.paper(sff=04FOOLS01.sff)

## Options

### sff

this gives the name of the sff file you are processing

    mothur > write.paper(sff=04FOOLS01.sff)

### fastq

the name of your fastq files

    mothur > write.paper(fastq=04FOOLS01.fastq)

### impact

The impact parameter will pick a journal format that has an impact
factor closest to your score of choice

    mothur > write.paper(sff=04FOOLS01.sff, impact=11)

### journal

The journal option will pick your desired journal of choice

    mothur > write.paper(sff=04FOOLS01.sff, journal=Biotechniques)
