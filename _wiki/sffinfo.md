---
title: 'sffinfo'
tags: 'commands'
redirect_from: '/wiki/Sffinfo'
---
The **sffinfo** command extract sequences reads from a .sff file.


## Default settings

The **sffinfo** command requires that the user provide a .sff or sff.txt
file. You may enter multiple sff files by separating them by -\'s. For
example: F5MMO9001.sff-GHL4YHV01.sff.

    mothur > sffinfo(sff=F5MMO9001.sff)

This command will generate two files - F5MMO9001.fasta and
F5MMO9001.qual. By default these are the trimmed.

or to parse a sff.txt file:

    mothur > sffinfo(sfftxt=F5MMO9001.sff.txt)

This command will generate two files - F5MMO9001.sff.fasta and
F5MMO9001.sff.qual. By default these are the trimmed.

## Options

### fasta

The fasta parameter allows you to indicate if you would like a fasta
file generated. By default fasta=True.

     mothur > sffinfo(sff=F5MMO9001.sff, fasta=F)

### qfile

The qfile parameter allows you to indicate if you would like a quality
file generated. By default qfile=True.

     mothur > sffinfo(sff=F5MMO9001.sff, qfile=F)

### trim

The trim parameter allows you to indicate if you would like a sequences
and quality scores trimmed to the clipQualLeft and clipQualRight values.
By default trim=True, but you can extract the raw sequence data by
setting trim=false.

     mothur > sffinfo(sff=F5MMO9001.sff, trim=f)

### sfftxt

The sfftxt parameter allows you to indicate if you would like a sff.txt
file generated. By default sfftxt=false.

     mothur > sffinfo(sff=F5MMO9001.sff, sfftxt=T)

### flow

The flow parameter allows you to indicate if you would like a flowgram
file generated. By default flow=true.

     mothur > sffinfo(sff=F5MMO9001.sff, flow=T)

### accnos

The accnos parameter allows you to provide a accnos file containing the
names of the sequences you would like extracted. You may enter multiple
files by separating them by -\'s.

     mothur > sffinfo(sff=F5MMO9001.sff, accnos=F5MMO9001.accnos)

### oligos

The oligos option takes a file that can contain the sequences of the
forward and reverse primers and barcodes and their sample identifier.
Each line of the oligos file can start with the key words \"forward\",
\"reverse\", \"barcode\", \"linker\" and \"spacer\" or it can start with
a \"\#\" to tell mothur to ignore that line of the oligos file. For
example, consider a trimmed version of F5MMO9001.oligos:

    forward    ATTACCGCGGCTGCTGG   v13
    forward    CCGTCAATTCMTTTRAGT  v35
    forward    TACGGYTACCTTGTTAYGACTT  v69
    barcode    TCACCTC F5MMO9001.700015271.WUGSC
    barcode    TGCGTTC F5MMO9001.700015280.WUGSC
    barcode    ACGGCTC F5MMO9001.700015283.WUGSC
    barcode    TATTGAC F5MMO9001.700015656.WUGSC
    barcode    TAATCTC F5MMO9001.700015677.WUGSC
    ...

### bdiffs & pdiffs & ldiffs & sdiffs & tdiffs

These parameters are used to allow differences in the barcode, primers,
linkers and spacers. pdiffs is maximum number of differences to the
primer sequence, default=0. bdiffs is maximum number of differences to
the barcode sequence, default=0. ldiffs is maximum number of differences
to the linker sequence, default=0. sdiffs is maximum number of
differences to the spacer sequence, default=0. tdiffs is maximum total
number of differences to the barcode, primer, linker and spacer (default
to pdiffs + bdiffs + ldiffs + sdiffs).

## Revisions

-   1.24.0 - flow default changed to true, added a warning about
    corrupted sff files.
-   1.28.0 - added oligos, pdiffs, sdiffs, ldiffs, bdiffs and tdiffs
    options.
-   1.30.0 - Bug fix: trimmed the entire sequence if clipQualRight=0.
-   1.33.0 - Added the group parameter.
-   1.33.0 - Bug Fix: Windows version with oligos file caused corrupt
    sff files after parse. -
    [1](https://forum.mothur.org/viewtopic.php?f=3&t=2555&p=7422#p7422)
-   1.36.0 - Bug Fix: Off by one in right side trimming.
    [https://forum.mothur.org/viewtopic.php?f=4&t=3764](https://forum.mothur.org/viewtopic.php?f=4&t=3764)


