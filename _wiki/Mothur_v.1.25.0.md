---


title: 'Mothur v.1.25.0'
---
We are happy to announce the release of [mothur
v.1.25.0](mothur_v.1.25.0) with a number of new commands,
features and bug fixes. First, the most significant new command is
[pcr.seqs](pcr.seqs), which will lift out specific regions of
your gene of interest based on a number of user supplied parameters
including primer sequence and alignment region. This would be most
useful for creating your own reference sequence files for alignments and
classification. Second, another new feature is the
[cooccurrence](cooccurrence) function, which will use a
number of metrics and methods of testing those metrics to measure
whether populations are co-occurring more frequently than you\'d expect
by chance. Third, at the suggestion of a user on the forum, we have
begun to look at methods of synthesizing data in the
[create.database](create.database) function. Finally, to
support Greg Caporaso\'s BIOM format, we have allowed for more easy
formatting of data from a shared file to a biom file using the
[make.biom](make.biom) and
[make.shared](make.shared) files.

As always, we have added a number of new features and fixed several bugs
that were reported to us by you through emails to mothur.bugs\@gmail.com
and through the user forum. We take your feedback seriously. Thank you
for your continued support and suggestions. As always keep the 6 packs
coming\...

Pat Schloss

{% include toc.html %}

## New commands

-   [pcr.seqs](pcr.seqs) - trim inputted sequences based on a
    variety of user-defined options
-   [cooccurrence](cooccurrence) - calculates four metrics
    and tests their significance to assess whether presence-absence
    patterns are different than what one would expect by chance
-   [create.database](create.database) - synthesize sequence,
    group and taxonomy information
    (http://www.mothur.org/forum/viewtopic.php?f=5&t=1524)
-   [make.biom](make.biom) - creates a .biom file from a
    shared file (http://biom-format.org/documentation/biom\_format.html)

## Feature updates

-   [metastats](metastats) - modified to more closely follow
    results from metastats website rather than the C code provided by
    the Pop lab
-   [trim.flows](trim.flows) and
    [trim.seqs](trim.seqs) - allow for characters other than
    ATGC in reverse primers
-   [make.shared](make.shared) - added biom parameter to
    create a shared file from a biom file

## Bug fixes

-   [phylotype](phylotype) - the numOtus in the list file was
    one to high. OTUs were clustered correctly, the count was just off.
-   [phylotype](phylotype) - only clustering at leaf nodes,
    level 1.
-   [metastats](metastats) - OTU numbers in metastats now
    correspond to the column names in the shared file
-   [classify.seqs](classify.seqs) segfault if no files are
    given. Should return error message instead
    (http://www.mothur.org/forum/viewtopic.php?f=4&t=1525)
-   [rarefaction.single](rarefaction.single) - groupnames
    that include \"\_\" causes parsing error in the creation of the
    groups.rarefaction file. Fixed, workaround until release,
    groupmode=false.
-   [filter.seqs](filter.seqs) - when run with \"current\",
    it generated \".filter\" and not \"filename.filter\" file.
-   [sffinfo](sffinfo) - if the sff file doesn\'t end in
    \".sff\" then the output files all end in \"flow\", for example,
    instead of \".flow\"
-   [trim.seqs](trim.seqs) - windows version crash
    (http://www.mothur.org/forum/viewtopic.php?f=4&t=1543)
-   [trim.seqs](trim.seqs) - fixed bug that caused seqs to go
    to scrap if no oligos file was given.
-   [shhh.flows](shhh.flows) - outputdir didn\'t put all of
    the files to the output directory
-   [pairwise.seqs](pairwise.seqs) - checks for positive
    values for gap open, gap extend, or mismatch.
-   [corr.axes](corr.axes) - fixed OTU labels
    (http://www.mothur.org/forum/viewtopic.php?f=3&t=1500)
-   mothur can handle leading spaces in command names
    (http://www.mothur.org/forum/viewtopic.php?f=4&t=1557)

## Wiki updates

-   no longer building 32 bit Mac binaries.

## Registered users

2202
