---
title: 'Merge.sfffiles'
---
Merge.sfffiles The **merge.sfffiles** command reads a sff file or a file
containing a list of sff files and merges the individual files into a
single sff file.

## Default Settings

The file or sff parameter is required as well as the output option.

### file

The file parameter allows you to provide a file containing a list of sff
files to merge.

    mothur > merge.sfffiles(file=listOfSff.files, output=merged.sff)

If you open the listOfSff.files file you will see:

    GQY1XT001.F003D002.sff
    GQY1XT001.F003D004.sff
    GQY1XT001.F003D006.sff
    GQY1XT001.F003D008.sff

### sff

The sff parameter allows you to enter the sff list of sff files
separated by -\'s.

    mothur > merge.sfffiles(sff=GQY1XT001.F003D002.sff-GQY1XT001.F003D004.sff-GQY1XT001.F003D006.sff, output=merged.sff)

### output

The output parameter allows you to provide an output filename.

## Revisions

-   1.33.0 - First Introduced -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2466](https://forum.mothur.org/viewtopic.php?f=3&t=2466).
-   1.33.2 - Bug Fix: Windows version caused substring error on parse.

[Category:Commands](Category:Commands)
