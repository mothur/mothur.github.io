---
title: 'Mothur v.1.28.0'
redirect_from: '/wiki/Mothur_v.1.28.0'
---
We are happy to release [mothur v.1.28.0](mothur_v.1.28.0) on
the US election day - hopefully we can all agree that this is a good
thing! Since the last release we have been busy adding a new command and
a number of new parameters that will make our final Illumina pipeline
easier to use. If you have interest in using mothur to analyze MiSeq
sequence data, please let us know, we\'d be happy to have you test our
new functions. Briefly, we have a new
[sff.multiple](sff.multiple) command that makes life easier
for those that get multiple sff files from their sequence provider.
We\'ve also updated the [schloss sop](Schloss_SOP) to reflect
some of the recent changes we\'ve made to mothur over the past several
releases.

If you haven\'t already, be sure to check out our [latest
article](https://www.ncbi.nlm.nih.gov/pubmed/23018771), that rebuts a
previous ISMEJ article. The piece covers the issue of whether sequence
alignment as we do it is necessary. Initial feedback has been very
positive. The next several releases promise to be very exciting. We\'ll
be unveiling a new mothur GUI and pipelines for non-454 sequencing
platforms.

As always keep the feedback and citations coming! We were happy to
notice that the mothur paper is the 15th most cited paper in AEM history
and DOTUR is the 4th. Thank you, thank you, thank you! We appreciate the
gifts and flowers you continue to send us. One of the students in the
lab would like to see a little more love come our way and would like you
all to know that if things don\'t improve, we will start posting
advertisements in the mothur window..

## New commands

-   [sff.multiple](sff.multiple) - The sff.multiple command
    reads a file containing sff filenames and optional oligos filenames.
    It runs the files through sffinfo, trim.flows, shhh.flows and
    trim.seqs combining the results.
-   [ make.table](count.seqs) command modified to create a
    \".count\_table\" file. Added large parameter in case files are too
    large for ram.

## Feature updates

-   [sffinfo](sffinfo) - added oligos, pdiffs, bdiffs,
    sdiffs, ldiffs and tdiffs parameters to split sff files. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1647](https://forum.mothur.org/viewtopic.php?f=5&t=1647).
-   added count parameter to [cluster](cluster),
    [cluster.classic](cluster.classic),
    [cluster.split](cluster.split),
    [mgcluster](mgcluster),
    [make.shared](make.shared),
    [chimera.perseus](chimera.perseus),
    [chimera.slayer](chimera.slayer),
    [chimera.uchime](chimera.uchime),
    [summary.tax](summary.tax),
    [classify.seqs](classify.seqs),
    [classify.otu](classify.otu),
    [unifrac.unweighted](unifrac.unweighted),
    [unifrac.weighted](unifrac.weighted),
    [parsimony](parsimony), [bin.seqs](bin.seqs),
    [phylo.diversity](phylo.diversity),
    [cluster.fragments](cluster.fragments),
    [unique.seqs](unique.seqs),
    [consensus.seqs](consensus.seqs),
    [get.groups](get.groups),
    [remove.groups](remove.groups),
    [get.seqs](get.seqs), [list.seqs](list.seqs),
    [remove.seqs](remove.seqs),
    [get.lineage](get.lineage),
    [remove.lineage](remove.lineage),
    [summary.seqs](summary.seqs),
    [summary.qual](summary.qual),
    [align.check](align.check),
    [heatmap.sim](heatmap.sim),
    [trim.seqs](trim.seqs),
    [split.groups](split.groups),
    [tree.shared](tree.shared),
    [screen.seqs](screen.seqs),
    [pre.cluster](pre.cluster),
    [get.oturep](get.oturep),
    [pcr.seqs](pcr.seqs), [sort.seqs](sort.seqs),
    [remove.rare](remove.rare),
    [count.groups](count.groups),
    [sub.sample](sub.sample) and
    [split.abund](split.abund).
-   [fastq.info](fastq.info) - added format parameter to
    adapt for different quality score bases.
-   [classify.seqs](classify.seqs) - changed name of bayesian
    method to wang
-   [amova](amova) and [homova](homova) - added
    sets parameter -
    [https://forum.mothur.org/viewtopic.php?f=3&t=1777](https://forum.mothur.org/viewtopic.php?f=3&t=1777)
-   [make.biom](make.biom) - added metadata parameter -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1786](https://forum.mothur.org/viewtopic.php?f=5&t=1786)
-   [otu.association](otu.association) - added cutoff
    parameter - [https://forum.mothur.org/viewtopic.php?f=5&t=1639](https://forum.mothur.org/viewtopic.php?f=5&t=1639)
-   mothur can read sequences with spaces in the sequence string.
-   You can have \'-\'s in a file names as long as they are proceeded by
    a \'\\\'. Example: my-file-name should be entered as
    my\\-file\\-name.
-   [classify.seqs](classify.seqs) - mothur will ignore
    sequences present in the taxonomy file, but not in the reference
    file.
-   list file printed with abundant OTUs first
-   [chimera.uchime](chimera.uchime) - added dereplicate
    option so one can control whether to remove sequences from all
    groups if they are flagged as chimeric in any.

## Bug fixes

-   [parsimony](parsimony) - name file info was not included
    in the creation of the random trees which effected significance
    values.
-   [fastq.info](fastq.info) - negative quality scores. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1727&p=4651&hilit=fastq.info#p4651](https://forum.mothur.org/viewtopic.php?f=4&t=1727&p=4651&hilit=fastq.info#p4651)
-   [chimera.uchime](chimera.uchime) - spaces in path causing
    crash
-   [classify.seqs](classify.seqs) - if taxonomy file
    contained file path information \"cannot resolve path for\" error
    was thrown.
-   [consensus.seqs](consensus.seqs) - cutoff rounding
    error - [https://forum.mothur.org/viewtopic.php?f=4&t=1781](https://forum.mothur.org/viewtopic.php?f=4&t=1781)
-   [align.check](align.check) - added name parameter back
    in.
-   added check to [align.seqs](align.seqs) to make sure
    template is aligned.
-   [clearcut](clearcut) - windows crash reports
-   [get.lineage](get.lineage) &&
    [remove.lineage](remove.lineage) - can handle () in taxon
    names, [https://forum.mothur.org/viewtopic.php?f=3&t=1815](https://forum.mothur.org/viewtopic.php?f=3&t=1815)

## Changes to wiki

-   Updated [schloss sop](Schloss_SOP)
-   [count\_file](Count_File) which is a combination of the
    name and group file\'s information. Uses less memory and runs faster
    with mothur\'s commands.

## Registered users

2370
