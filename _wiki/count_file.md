---
title: 'count file'
tags: 'file_types'
redirect_from: '/wiki/Count_File'
---
The count file is a condensed version of the name file. It can also
include the group information. It can be created using the
[count.seqs](/wiki/count.seqs) command, aka make.table.

**NOTE: DO NOT use a hyphen in group names. The "-" character is used
within mothur to separate group names, labels, taxonomies, ect.
Including a hyphen will cause issues in your downstream analysis.**

## Full format

The full format lists a representative sequence and its abundance counts
for each group. You can see from the table below that GQY1XT001CFHYQ has
representation in all samples, with a total abundance of 467.
GQY1XT001EI480 has representation in 3 samples: F003D000, F003D146 and
F003D148, with a total abundance of 10.

    Representative_Sequence    total   F003D000    F003D002    F003D004    F003D006    F003D008    F003D142    F003D144    F003D146    F003D148    F003D150
    GQY1XT001CFHYQ 467 325 40  22  30  24  6   7   3   7   3
    GQY1XT001C44N8 3677    323 132 328 318 232 579 448 426 381 510
    GQY1XT001C296C 4652    356 877 754 794 284 538 361 313 0   375
    GQY1XT001ARCB1 2202    203 391 220 155 308 126 33  191 289 286
    GQY1XT001CFWVZ 1967    193 152 191 300 228 179 172 161 111 280
    ...
    GQY1XT001EI480 10  8   0   0   0   0   0   0   1   1   0
    GQY1XT001EDBEC 95  9   13  13  7   10  11  8   8   5   11
    GQY1XT001D47YY 97  10  2   13  21  9   5   11  12  2   12
    GQY1XT001CNUHI 19  17  1   0   0   0   0   1   0   0   0

or if no group info was used to create it

    Representative_Sequence    total
    GQY1XT001CFHYQ 467 
    GQY1XT001C44N8 3677
    GQY1XT001C296C 4652
    GQY1XT001ARCB1 2202
    GQY1XT001CFWVZ 1967
    ...
    GQY1XT001EI480 10      
    GQY1XT001EDBEC 95
    GQY1XT001D47YY 97  
    GQY1XT001CNUHI 19  

## Sparse format

The sparse format saves space by storing only non zero sample counts.
Samples are assigned a numeric value, and only samples with non zero
counts are printed to the file. You can see from the table below that
GQY1XT001CFHYQ has representation in all samples, with a total abundance
of 467. GQY1XT001EI480 has representation in 3 samples: 1 (F003D000) , 8
(F003D146) and 9 (F003D148), with a total abundance of 10.

    #Compressed Format: groupIndex,abundance. For example 1,6 would mean the read has an abundance of 6 for group F003D000.
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

## Converting between formats

You can compress or inflate your count table using the
[count.seqs](/wiki/count.seqs) command with the compress option.

    mothur > count.seqs(count=final.count_table, compress=f) 

The above command will convert a sparse format count file to it's full
form.

    mothur > count.seqs(count=final.count_table, compress=t) 

The above command will convert a full format count file to it's sparse
form.


