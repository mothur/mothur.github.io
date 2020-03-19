---
title: 'mothur v.1.26.0'
redirect_from: '/wiki/Mothur_v.1.26.0.html'
---
We are happy to announce the release of [mothur
v.1.26.0](mothur_v.1.26.0). We have added a improvements to a
number of commands to make them faster and easier to use. We've also
added several new commands for you to try out. Of particular note is
[get.coremicrobiome](get.coremicrobiome), which will tell you
how many OTUs are observed in varying numbers of samples for different
relative abundance cutoffs. Although this has been a popular concept
with the human microbiome research, it can certainly be applied to other
environments as well. We are busy working on a number of other commands
behind the scenes that we hope to release over the next few months.
Specifically, we're working on SOPs for Illumina, IonTorrent, and
PacBio, implementing machine learning algorithms, a new classifier, and
more. Stay tuned!

Also, people frequently ask how we describe our analysis pipeline and
how we analyze data in general. Of course plagiarism is the Worst
Possible Thing In Science, [our most recent
paper](https://www.ncbi.nlm.nih.gov/pubmed/22688727) may inspire you.
It's hot this summer in Michigan with hardly any rain. All of this
makes it hard to keep the ideas flowing. Be sure to keep your [hydrating
substances flowing](https://leinie.com).

## New commands

-   [get.coremicrobiome](get.coremicrobiome) - determines the
    fraction of OTUs that are found in varying numbers of samples for
    different minimum relative abundances
-   [list.otulabels](list.otulabels) - lists otu labels from
    shared or relabund file.
-   [get.otulabels](get.otulabels) - can be used with output
    from classify.otu, otu.association, or corr.axes to select specific
    otus
-   [remove.otulabels](remove.otulabels) - can be used with
    output from classify.otu, otu.association, or corr.axes to remove
    specific otus
-   [load.logfile](load.logfile) - extracts current file
    names from a logfile

## Feature updates

-   [phylo.diversity](phylo.diversity) - improved speed
-   [set.dir](set.dir) - added debug parameter
-   [catchall](catchall), [get.seqs](get.seqs) and
    [classify.seqs](classify.seqs) commands - added debugging
    information to the output
-   [shhh.flows](shhh.flows) - added large parameter
-   [rarefaction.shared](rarefaction.shared) - added design,
    sets and groupmode parameters
-   [otu.association](otu.association) - added metadata
    parameter.
-   [rarefaction.single](rarefaction.single) - changed output
    format
-   [chimera.uchime](chimera.uchime) - mothur will now look
    for uchime in your path, if it is not found with mothur.
-   [catchall](catchall) - mothur will now look for catchall
    in your path, if it is not found with mothur.
-   added buffered reads to improve the speed of reading name, taxonomy,
    design, accnos and group files.
-   added phylip as an output format for commands that output distance
    matrices.
-   [create.database](create.database) - added shared
    parameter command.
-   [count.seqs](count.seqs) - added make.table alias
-   [count.seqs](count.seqs) - added large parameter to to
    create counts table without loading files into memory

## Bug fixes

-   [shhh.flows](shhh.flows) fixed output file location -
    [https://forum.mothur.org/viewtopic.php?f=3&t=1570&p=4131#p4131](https://forum.mothur.org/viewtopic.php?f=3&t=1570&p=4131#p4131)
-   [shhh.flows](shhh.flows) - added checks to make sure all
    flow files are completed when multiple processors are used. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1599](https://forum.mothur.org/viewtopic.php?f=5&t=1599)
-   [shhh.flows](shhh.flows) - is producing an output file
    called \*.flow.fasta instead of \*.fasta. Also when using outputdir
    with the file option, it puts the shhh.fasta and shhh.names files in
    the wrong folder.
-   [make.biom](make.biom) fixed bug that occurred if some
    taxonomies had confidence scores and others did not. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1585](https://forum.mothur.org/viewtopic.php?f=4&t=1585)
-   [catchall](catchall) -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1569](https://forum.mothur.org/viewtopic.php?f=4&t=1569) - The
    catchall executable name released with mothur contained 'C'
    instead of 'c'.
-   [classify.otu](classify.otu) bootstrap values for
    "unknown" taxon too high -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1588](https://forum.mothur.org/viewtopic.php?f=4&t=1588)
-   [align.seqs](align.seqs) - align=blast caused segfault
-   [sffinfo](sffinfo) - reported error when '\~' was in
    sff file name.
-   [classify.seqs](classify.seqs) - output taxonomy name
    missing tag when reference taxonomy file does not have 3 parts. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1613](https://forum.mothur.org/viewtopic.php?f=4&t=1613)

## Registered users

2265
