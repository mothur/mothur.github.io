---
title: 'count.seqs'
tags: 'commands'
redirect_from: '/wiki/Count.seqs'
---
The **count.seqs** / make.table command counts the
number of sequences represented by the representative sequence in a name
file. If a group file is given, it will also provide the group count
breakdown.

## Default Settings

To run the command the names of a name-file needs to be provided:

    mothur > count.seqs(name=stool.final.names)

This will generate a summary file called, stool.final.seq.count which
looks like:

    Representative_Sequence total  
    F21Fcsw_12128  1764
    F11Fcsw_6529   1568
    F11Fcsw_112161 861
    F11Fcsw_56988  480
    F11Fcsw_63768  361
    M41Fcsw_132742 326
    M11Fcsw_34015  414
    F31Fcsw_128576 509
    F21Fcsw_85352  370
    ...

## Shared

Can be used to transpose the shared file for use with other software
packages.

    mothur > count.seqs(shared=final.opti_mcc.shared)

    OTU_Label  total   F003D000    F003D002    F003D004    F003D006    F003D008    F003D142    F003D144    F003D146    F003D148    F003D150
    Otu0001    6079    409 992 933 953 346 696 474 436 376 464
    Otu0002    4658    384 170 393 419 286 744 584 557 491 630
    Otu0003    3969    230 418 442 560 359 595 301 348 388 328
    Otu0004    3352    167 88  240 354 779 455 173 449 237 410
    Otu0005    2643    183 274 379 370 333 229 212 172 137 354
    ...

## Group

If you would like to see how the sequences are spread over your samples
provide the group file.

    mothur > count.seqs(name=stool.final.names, group=stool.final.groups)

This will generate a summary file called, stool.final.seq.count which
looks like:

    Representative_Sequence    total   F11Fcsw F12Fcsw F13Fcsw F14Fcsw F21Fcsw F22Fcsw 
    F21Fcsw_12128  1764    0   0   0   0   39  31  ...
    F11Fcsw_6529   1568    38  17  23  128 26  18  ...
    F11Fcsw_112161 861 1   0   2   7   67  52  ...
    F11Fcsw_56988  480 9   1   0   3   0   0   ...
    F11Fcsw_63768  361 6   2   0   6   28  17  ...
    M41Fcsw_132742 326 0   0   0   0   0   0   ...
    M11Fcsw_34015  414 9   8   29  23  6   5   ...
    ...

## count

The count parameter allows you to inflate or deflate count tables.

## compress

The compress parameter allows you to indicate you want the count table
printed in compressed format. Default=t.

    mothur > count.seqs(count=final.count_table, compress=f)

Will result in

    Representative_Sequence    total   F003D000    F003D002    F003D004    F003D006    F003D008    F003D142    F003D144    F003D146    F003D148    F003D150
    GQY1XT001CFHYQ 467 325 40  22  30  24  6   7   3   7   3
    GQY1XT001C44N8 3677    323 132 328 318 232 579 448 426 381 510
    GQY1XT001C296C 4652    356 877 754 794 284 538 361 313 0   375
    GQY1XT001ARCB1 2202    203 391 220 155 308 126 33  191 289 286
    ...

    mothur > count.seqs(count=final.count_table, compress=t)

Will result in

    #Compressed Format: groupIndex,abundance. For example 1,6 would mean the read has an abundance of 6 for group 1.
    #1,F003D000    2,F003D002  3,F003D004  4,F003D006  5,F003D008  6,F003D142  7,F003D144  8,F003D146  9,F003D148  10,F003D150 
    Representative_Sequence    total   F003D000    F003D002    F003D004    F003D006    F003D008    F003D142    F003D144    F003D146    F003D148    F003D150
    GQY1XT001CFHYQ 467 1,325   2,40    3,22    4,30    5,24    6,6 7,7 8,3 9,7 10,3
    GQY1XT001C44N8 3677    1,323   2,132   3,328   4,318   5,232   6,579   7,448   8,426   9,381   10,510
    GQY1XT001C296C 4652    1,356   2,877   3,754   4,794   5,284   6,538   7,361   8,313   10,375
    GQY1XT001ARCB1 2202    1,203   2,391   3,220   4,155   5,308   6,126   7,33    8,191   9,289   10,286
    GQY1XT001CFWVZ 1967    1,193   2,152   3,191   4,300   5,228   6,179   7,172   8,161   9,111   10,280
    ...
    GQY1XT001EI480 10  1,8 8,1 9,1
    GQY1XT001EDBEC 95  1,9 2,13    3,13    4,7 5,10    6,11    7,8 8,8 9,5 10,11
    GQY1XT001D47YY 97  1,10    2,2 3,13    4,21    5,9 6,5 7,11    8,12    9,2 10,12
    GQY1XT001CNUHI 19  1,17    2,1 7,1
    ...

## Groups

If you would like to simplify the output because you are only interested
in the number of sequence represented by a specific group or set of
groups you can use the groups option.

    mothur > count.seqs(name=stool.final.names, group=stool.final.groups, groups=F11Fcsw-F12Fcsw)

This will generate a summary file called, stool.final.seq.count which
looks like:

    Representative_Sequence    total   F11Fcsw F12Fcsw 
    F11Fcsw_6529   55  38  17  
    F11Fcsw_112161 1   1   0   
    F11Fcsw_56988  10  9   1   
    F11Fcsw_63768  8   6   2   
    M11Fcsw_34015  17  9   8   
    F11Fcsw_455    107 57  50  
    F11Fcsw_9818   24  23  1   
    F11Fcsw_46282  3   3   0   
    ...

Note: When you use the groups option, if a representative sequence does
not represent any sequences from the groups you requested it is not
displayed. Also, the total reflects the total represented from those
groups, not total from all groups.

## Revisions

-   1.26.0 - added large parameter and alias make.table name.
-   1.34.0 - added shared parameter. Can be used to transpose the shared
    file for use with other software packages.
-   1.38.0 - removes large parameter
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.42.0 - Adds count and compress parameters to **count.seqs** to inflate
    or deflate count tables.


