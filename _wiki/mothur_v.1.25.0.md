---
title: 'mothur v.1.25.0'
redirect_from: '/wiki/Mothur_v.1.25.0.html'
---
We are happy to announce the release of [mothur
v.1.25.0](/wiki/mothur_v.1.25.0) with a number of new commands,
features and bug fixes. First, the most significant new command is
[pcr.seqs](/wiki/pcr.seqs), which will lift out specific regions of
your gene of interest based on a number of user supplied parameters
including primer sequence and alignment region. This would be most
useful for creating your own reference sequence files for alignments and
classification. Second, another new feature is the
[cooccurrence](/wiki/cooccurrence) function, which will use a
number of metrics and methods of testing those metrics to measure
whether populations are co-occurring more frequently than you'd expect
by chance. Third, at the suggestion of a user on the forum, we have
begun to look at methods of synthesizing data in the
[create.database](/wiki/create.database) function. Finally, to
support Greg Caporaso's BIOM format, we have allowed for more easy
formatting of data from a shared file to a biom file using the
[make.biom](/wiki/make.biom) and
[make.shared](/wiki/make.shared) files.

As always, we have added a number of new features and fixed several bugs
that were reported to us by you through emails to mothur.bugs\@gmail.com
and through the user forum. We take your feedback seriously. Thank you
for your continued support and suggestions. As always keep the 6 packs
coming\...

Pat Schloss

## New commands

-   [pcr.seqs](/wiki/pcr.seqs) - trim inputted sequences based on a
    variety of user-defined options
-   [cooccurrence](/wiki/cooccurrence) - calculates four metrics
    and tests their significance to assess whether presence-absence
    patterns are different than what one would expect by chance
-   [create.database](/wiki/create.database) - synthesize sequence,
    group and taxonomy information
    (https://forum.mothur.org/viewtopic.php?f=5&t=1524)
-   [make.biom](/wiki/make.biom) - creates a .biom file from a
    shared file (https://biom-format.org/documentation/biom\_format.html)

## Feature updates

-   [metastats](/wiki/metastats) - modified to more closely follow
    results from metastats website rather than the C code provided by
    the Pop lab
-   [trim.flows](/wiki/trim.flows) and
    [trim.seqs](/wiki/trim.seqs) - allow for characters other than
    ATGC in reverse primers
-   [make.shared](/wiki/make.shared) - added biom parameter to
    create a shared file from a biom file

## Bug fixes

-   [phylotype](/wiki/phylotype) - the numOtus in the list file was
    one to high. OTUs were clustered correctly, the count was just off.
-   [phylotype](/wiki/phylotype) - only clustering at leaf nodes,
    level 1.
-   [metastats](/wiki/metastats) - OTU numbers in metastats now
    correspond to the column names in the shared file
-   [classify.seqs](/wiki/classify.seqs) segfault if no files are
    given. Should return error message instead
    (https://forum.mothur.org/viewtopic.php?f=4&t=1525)
-   [rarefaction.single](/wiki/rarefaction.single) - groupnames
    that include "\_" causes parsing error in the creation of the
    groups.rarefaction file. Fixed, workaround until release,
    groupmode=false.
-   [filter.seqs](/wiki/filter.seqs) - when run with "current",
    it generated ".filter" and not "filename.filter" file.
-   [sffinfo](/wiki/sffinfo) - if the sff file doesn't end in
    ".sff" then the output files all end in "flow", for example,
    instead of ".flow"
-   [trim.seqs](/wiki/trim.seqs) - windows version crash
    (https://forum.mothur.org/viewtopic.php?f=4&t=1543)
-   [trim.seqs](/wiki/trim.seqs) - fixed bug that caused seqs to go
    to scrap if no oligos file was given.
-   [shhh.flows](/wiki/shhh.flows) - outputdir didn't put all of
    the files to the output directory
-   [pairwise.seqs](/wiki/pairwise.seqs) - checks for positive
    values for gap open, gap extend, or mismatch.
-   [corr.axes](/wiki/corr.axes) - fixed OTU labels
    (https://forum.mothur.org/viewtopic.php?f=3&t=1500)
-   mothur can handle leading spaces in command names
    (https://forum.mothur.org/viewtopic.php?f=4&t=1557)

## Wiki updates

-   no longer building 32 bit Mac binaries.

## Registered users

2202
