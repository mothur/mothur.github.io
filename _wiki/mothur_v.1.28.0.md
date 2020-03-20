---
title: 'mothur v.1.28.0'
redirect_from: '/wiki/Mothur_v.1.28.0.html'
---
We are happy to release [mothur v.1.28.0](/wiki/mothur_v.1.28.0) on
the US election day - hopefully we can all agree that this is a good
thing! Since the last release we have been busy adding a new command and
a number of new parameters that will make our final Illumina pipeline
easier to use. If you have interest in using mothur to analyze MiSeq
sequence data, please let us know, we'd be happy to have you test our
new functions. Briefly, we have a new
[sff.multiple](/wiki/sff.multiple) command that makes life easier
for those that get multiple sff files from their sequence provider.
We've also updated the [454 SOP](/wiki/454_SOP) to reflect
some of the recent changes we've made to mothur over the past several
releases.

If you haven't already, be sure to check out our [latest
article](https://www.ncbi.nlm.nih.gov/pubmed/23018771), that rebuts a
previous ISMEJ article. The piece covers the issue of whether sequence
alignment as we do it is necessary. Initial feedback has been very
positive. The next several releases promise to be very exciting. We'll
be unveiling a new mothur GUI and pipelines for non-454 sequencing
platforms.

As always keep the feedback and citations coming! We were happy to
notice that the mothur paper is the 15th most cited paper in AEM history
and DOTUR is the 4th. Thank you, thank you, thank you! We appreciate the
gifts and flowers you continue to send us. One of the students in the
lab would like to see a little more love come our way and would like you
all to know that if things don't improve, we will start posting
advertisements in the mothur window..

## New commands

-   [sff.multiple](/wiki/sff.multiple) - The sff.multiple command
    reads a file containing sff filenames and optional oligos filenames.
    It runs the files through sffinfo, trim.flows, shhh.flows and
    trim.seqs combining the results.
-   [ make.table](/wiki/count.seqs) command modified to create a
    ".count\_table" file. Added large parameter in case files are too
    large for ram.

## Feature updates

-   [sffinfo](/wiki/sffinfo) - added oligos, pdiffs, bdiffs,
    sdiffs, ldiffs and tdiffs parameters to split sff files. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1647](https://forum.mothur.org/viewtopic.php?f=5&t=1647).
-   added count parameter to [cluster](/wiki/cluster),
    [cluster.classic](/wiki/cluster.classic),
    [cluster.split](/wiki/cluster.split),
    [mgcluster](/wiki/mgcluster),
    [make.shared](/wiki/make.shared),
    [chimera.perseus](/wiki/chimera.perseus),
    [chimera.slayer](/wiki/chimera.slayer),
    [chimera.uchime](/wiki/chimera.uchime),
    [summary.tax](/wiki/summary.tax),
    [classify.seqs](/wiki/classify.seqs),
    [classify.otu](/wiki/classify.otu),
    [unifrac.unweighted](/wiki/unifrac.unweighted),
    [unifrac.weighted](/wiki/unifrac.weighted),
    [parsimony](/wiki/parsimony), [bin.seqs](/wiki/bin.seqs),
    [phylo.diversity](/wiki/phylo.diversity),
    [cluster.fragments](/wiki/cluster.fragments),
    [unique.seqs](/wiki/unique.seqs),
    [consensus.seqs](/wiki/consensus.seqs),
    [get.groups](/wiki/get.groups),
    [remove.groups](/wiki/remove.groups),
    [get.seqs](/wiki/get.seqs), [list.seqs](/wiki/list.seqs),
    [remove.seqs](/wiki/remove.seqs),
    [get.lineage](/wiki/get.lineage),
    [remove.lineage](/wiki/remove.lineage),
    [summary.seqs](/wiki/summary.seqs),
    [summary.qual](/wiki/summary.qual),
    [align.check](/wiki/align.check),
    [heatmap.sim](/wiki/heatmap.sim),
    [trim.seqs](/wiki/trim.seqs),
    [split.groups](/wiki/split.groups),
    [tree.shared](/wiki/tree.shared),
    [screen.seqs](/wiki/screen.seqs),
    [pre.cluster](/wiki/pre.cluster),
    [get.oturep](/wiki/get.oturep),
    [pcr.seqs](/wiki/pcr.seqs), [sort.seqs](/wiki/sort.seqs),
    [remove.rare](/wiki/remove.rare),
    [count.groups](/wiki/count.groups),
    [sub.sample](/wiki/sub.sample) and
    [split.abund](/wiki/split.abund).
-   [fastq.info](/wiki/fastq.info) - added format parameter to
    adapt for different quality score bases.
-   [classify.seqs](/wiki/classify.seqs) - changed name of bayesian
    method to wang
-   [amova](/wiki/amova) and [homova](/wiki/homova) - added
    sets parameter -
    [https://forum.mothur.org/viewtopic.php?f=3&t=1777](https://forum.mothur.org/viewtopic.php?f=3&t=1777)
-   [make.biom](/wiki/make.biom) - added metadata parameter -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1786](https://forum.mothur.org/viewtopic.php?f=5&t=1786)
-   [otu.association](/wiki/otu.association) - added cutoff
    parameter - [https://forum.mothur.org/viewtopic.php?f=5&t=1639](https://forum.mothur.org/viewtopic.php?f=5&t=1639)
-   mothur can read sequences with spaces in the sequence string.
-   You can have '-'s in a file names as long as they are proceeded by
    a '\\'. Example: my-file-name should be entered as
    my\\-file\\-name.
-   [classify.seqs](/wiki/classify.seqs) - mothur will ignore
    sequences present in the taxonomy file, but not in the reference
    file.
-   list file printed with abundant OTUs first
-   [chimera.uchime](/wiki/chimera.uchime) - added dereplicate
    option so one can control whether to remove sequences from all
    groups if they are flagged as chimeric in any.

## Bug fixes

-   [parsimony](/wiki/parsimony) - name file info was not included
    in the creation of the random trees which effected significance
    values.
-   [fastq.info](/wiki/fastq.info) - negative quality scores. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1727&p=4651&hilit=fastq.info#p4651](https://forum.mothur.org/viewtopic.php?f=4&t=1727&p=4651&hilit=fastq.info#p4651)
-   [chimera.uchime](/wiki/chimera.uchime) - spaces in path causing
    crash
-   [classify.seqs](/wiki/classify.seqs) - if taxonomy file
    contained file path information "cannot resolve path for" error
    was thrown.
-   [consensus.seqs](/wiki/consensus.seqs) - cutoff rounding
    error - [https://forum.mothur.org/viewtopic.php?f=4&t=1781](https://forum.mothur.org/viewtopic.php?f=4&t=1781)
-   [align.check](/wiki/align.check) - added name parameter back
    in.
-   added check to [align.seqs](/wiki/align.seqs) to make sure
    template is aligned.
-   [clearcut](/wiki/clearcut) - windows crash reports
-   [get.lineage](/wiki/get.lineage) &&
    [remove.lineage](/wiki/remove.lineage) - can handle () in taxon
    names, [https://forum.mothur.org/viewtopic.php?f=3&t=1815](https://forum.mothur.org/viewtopic.php?f=3&t=1815)

## Changes to wiki

-   Updated [454 SOP](/wiki/454_SOP)
-   [count\_file](/wiki/Count_File) which is a combination of the
    name and group file's information. Uses less memory and runs faster
    with mothur's commands.

## Registered users

2370
