---
title: 'Chimera.bellerophon'
---
Use Bellerophon approach to create a sorted priority score list of
potentially chimeric sequences.


## Algorithm


1\.  If filter==true, apply a 50% soft filter and generate a filter.align
    file \[this may require pulling filter methods into their own
    classes\]; otherwise no filtering (the Bellerophon server does 50%
    filtering)

2\.  Read sequences into ram as a vector of Sequence objects.

3\.  Find the average midpoint of all sequences in the alignment.

4\.  Define "left" as positions \[1-midpoint\] and right as
    \[midpoint-end\]

5\.  Generate a "Preference" structure with string (sequence name) and
    float (preference score) entries

6\.  Generate "vector<Preference> preferences(n)" where n corresponds to
    the number of sequences and the sequence name is stored with each
    accession.

7\.  Calculate (use preference instead of col):
    $$$$col\left[i\right]=\sum_j^{N}\left|dm^{left}\left[i\right]\left[j\right]-dm^{right}\left[i\right]\left[j\right]\right|$$$$

        Where i is the sequence you are on and j is all the other
        sequences. If correction=T, then dm=sqrt(distance); if
        correction=F, then don't transform the distances. The distance
        calculator should be "eachgap". This step should be
        parallelized.


8\.  Sum across all preferences\[i\] to get dme

9\.  Recalculate each preferences\[i\] value as:
    $$$${preference}\left[i\right]=\frac{dme}{dme-2 * col\left[i\right]}$$$$


10\. Sort the preferences values from high to low.

11\. Output the sorted list to \*.chimera as well as the accession id for
    the closest sequence on the left and right

12\. Output to the screen:
    -   average number of letters on either side of midpoint
    -   number of sequences with a preference score above the 95th
        percentile
    -   min, 2.5 percentile, 25 percentile, median, 75 percentile, 97.5
        percentile and max preference scores
    -   sequence with a preference score above the 95 percentile are
        reported as chimeric.

## Default settings

The only required parameter is fasta. You may enter multiple fasta files
by separating them by dashes. Example: fasta=ex.align-abrecovery.align.
The default settings for **chimera.bellerophon** are filter=F, window=1/4
length of seq, increment=25, correction=T, processors=1.

    mothur > chimera.bellerophon(fasta=ex.align)

The output to the screen looks like:

    Reading sequences from ex.align...Done.
    Processing sliding window: 10
    Processing sliding window: 20
    Processing sliding window: 30
    Processing sliding window: 40
    Processing sliding window: 50
    Processing sliding window: 60
    Processing sliding window: 70
    Processing sliding window: 80
    Processing sliding window: 90
    Processing sliding window: 100
    Processing sliding window: 110
    Processing sliding window: 120
    Processing sliding window: 130
    Processing sliding window: 140
    Processing sliding window: 150
    Processing sliding window: 153
    gi|11093939|MNB2|AF293011 is a suspected chimera at breakpoint 2195
    It's score is 1.31537 with suspected left parent gi|11093938|MNC2|AF293010 and right parent gi|11093938|MNC2|AF293010

    Sequence with preference score above 1.31537: 1
    Minimum:   0.635111
    2.5%-tile: 0.635111
    25%-tile:  0.866302
    Median:    1.00136
    75%-tile:  1.13515
    97.5%-tile:    1.31537
    Maximum:   1.31537

Opening ex.bellerophon.chimera you would see:

    Name   Score   Left    Right
    gi|11093939|MNB2|AF293011  1.31537 gi|11093938|MNC2|AF293010   gi|11093938|MNC2|AF293010
    gi|11093930|MNH4|AF293002  1.29437 gi|11093925|MNG7|AF292997   gi|11093927|MND8|AF292999
    gi|11093937|MNF2|AF293009  1.23542 gi|11093929|MNC12|AF293001  gi|11093927|MND8|AF292999
    gi|11093926|MNH2|AF292998  1.21045 gi|11093924|MNF4|AF292996   gi|11093925|MNG7|AF292997
    ...

## Options

### filter

By default the filter parameter is set to false, but if you set it to
true a 50% soft filter will be applied.

    mothur > chimera.bellerophon(fasta=ex.align, filter=t)

### window

By default the window parameter is set to 1/4 length of seq, but if you
set it up to half the sequence length.

    mothur > chimera.bellerophon(fasta=ex.align, window=200)

### increment

The increment parameter determines how far the 2 windows \"slide\" each
iteration. By default the increment parameter is 25, but if you may set
it up to sequence length minus twice the window.

    mothur > chimera.bellerophon(fasta=ex.align, increment=100)

### correction

By default the correction parameter is set to true, meaning the the
square root of the distances is used instead of the distance value.

    mothur > chimera.bellerophon(fasta=ex.align, correction=f)

## Revisions

-   1.23.0 - fixed bug with MPI-enabled version -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1151](https://forum.mothur.org/viewtopic.php?f=4&t=1151)
-   1.40.0 - Removes processors option.

[Category:Commands](Category:Commands)
