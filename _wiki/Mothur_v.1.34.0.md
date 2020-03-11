---
title: 'Mothur v.1.34.0'
---
After a long delay, we are very happy to announce the release of
[mothur\_v.1.34.0](mothur_v.1.34.0) ! We\'re anxious to get
back on our normal release schedule of a new version ever month or two.
In the current release, we\'ve added a new machine learning algorithm
[classify.svm](classify.svm) and added a bunch of new
features that you all have requested. There are also a number of bug
fixes that have also been incorporated into the release. Some of the
feature updates that you might find most interesting is the addition of
the shannon range calculator that was published last year in ISMEJ by
Haegeman and colleagues and the addition of the [Jensen-Shannon
Divergence](Jensen-Shannon_Divergence) calculator. You may
notice that we don\'t quite have the make.sra command up and running
yet. It\'s still very much in the works and we have a lot of the
components in place to make it happen. We are working with the folks at
the SRA to make it as seem less as possible for you all and so this has
required a bit of iteration. We were really hoping to have something for
you by this release, but all we can do is hope that we\'ll have it for
the next release. SRA is very excited about this, but they just need to
make sure all their ducks are in a row first.

There\'s also a few other things going on that you should know about\...

-   We\'ve launched a blog. Of course, we\'re only 10 years behind, but
    hey! The plan is to use the blog to discuss how to use mothur to do
    different things beyond the analysis examples and how we generate
    various reference files. You\'ll see a nice mix of mothur, R, and
    bash commands getting play in the posts.
-   There will be a mothur workshop in Detroit from December 17-19. The
    next workshop will be in March and I\'m still not sure whether it
    will be a mothur or R workshop. Email Pat if you are interested.

We\'re plugging away at continuing to make mothur a great program, as
always, if you have questions, ideas, or code to contribute, please
don\'t hesitate to shoot us a note!

## New commands

-   [get.mimarkspackage](get.mimarkspackage) - create blank
    mimarks package form for sra command
-   [make.sra](make.sra) - create submission ready files
-   [Classify.svm](Classify.svm) - Rank OTUs using the
    support vector machine learning algorithm

## Feature updates

-   added [shannonrange](shannonrange) calculator to
    [collect.single](collect.single),
    [summary.single](summary.single),
    [rarefaction.single](rarefaction.single).
-   added shared parameter to [count.seqs](count.seqs) aka
    make.table command. Can be used to transpose the shared file for use
    with other software packages.
-   [consensus.seqs](consensus.seqs) cutoff parameter can now
    be a float. cutoff=97.5.
-   [dist.shared](dist.shared) - when subsample used \*.ave
    distance matrix saved as current phylip file
-   [tree.shared](tree.shared) - added [Jensen-Shannon
    Divergence](Jensen-Shannon_Divergence) calculator, jsd
    and [Square Root Jensen-Shannon
    Divergence](Square_Root_Jensen-Shannon_Divergence)
    calculator, rjsd. -
    <https://www.mothur.org/forum/viewtopic.php?f=5&t=2961>
-   [cluster.split](cluster.split) - added the file option
    which allows you to enter your file containing your list of column
    and names/count files as well as the singleton file. This file is
    mothur generated, when you run cluster.split() with the cluster=f
    parameter. This can be helpful when you have a large dataset that
    you may be able to use all your processors for the splitting step,
    but have to reduce them for the cluster step due to RAM constraints.
    For example: cluster.split(fasta=yourFasta, taxonomy=yourTax,
    count=yourCount, taxlevel=3, cluster=f, processors=8) then
    cluster.split(file=yourFile, processors=4). This allows your to
    maximize your processors during the splitting step. Also, if you are
    unsure if the cluster step will have RAM issue with multiple
    processors, you can avoid running the first part of the command
    multiple times.
-   [make.contigs](make.contigs) - added checkorient
    parameter. - <https://www.mothur.org/forum/viewtopic.php?f=3&t=2993>
-   [fastq.info](fastq.info), [sffinfo](sffinfo "wikilink"),
    [trim.flows](trim.flows)- added checkorient parameter.
-   [trim.flows](trim.flows) can now process paired barcodes
    and primers.

## Bug fixes

-   [fastq.info](fastq.info) stopped processing after 100001
    seqs. - <https://www.mothur.org/forum/viewtopic.php?f=4&t=2829> -
    fixed 1.33.1
-   [make.biom](make.biom) picrust couldn\'t handle
    unclassifieds -
    <https://www.mothur.org/forum/viewtopic.php?f=4&t=2816> - fixed
    1.33.1
-   [create.database](create.database) OutLabel bug -
    \"cannot convert Otu0001 to an integer\" fixed 1.33.3
-   [merge.sfffiles](merge.sfffiles) -Windows version caused
    substring error on parse. fixed 1.33.2 3/11 version.
-   [chimera.slayer](chimera.slayer) - \"\[megablast\] FATAL
    ERROR: blast: Unable to open input file\" on linux version with
    multiple processors. fixed 1.33.3
-   [rarefaction.single](rarefaction.single) -
    \*.groups.rarefaction file labels in wrong order -
    <https://www.mothur.org/forum/viewtopic.php?f=4&t=2963> - fixed
    1.33.3
-   [align.seqs](align.seqs) - Windows align.seqs flip=t
    caused segfault fixed 1.33.2 3/19 version
-   [summary.shared](summary.shared) subsample issue -
    <https://www.mothur.org/forum/viewtopic.php?f=4&t=2861> - fixed
    1.33.3
-   seq.error is changing the current fasta file to the seq file. it
    shouldn\'t change the current fasta file.
-   [trim.seqs](trim.seqs) - qaverage bug scrapping seqs -
    fixed 1.33.3 4/4.
-   [make.biom](make.biom) - \"biom error: cannot convert
    null to a float\"
-   [get.seqs](get.seqs),
    [remove.seqs](remove.seqs),
    [remove.lineage](remove.lineage),
    [get.lineage](get.lineage),
    [screen.seqs](screen.seqs),
    [pcr.seqs](pcr.seqs) changed read of count file causing
    file mismatches with count files that didn\'t include group data.
-   [clearcut](clearcut) - distances out of range bug
-   [dist.shared](dist.shared) -
    <https://www.mothur.org/forum/viewtopic.php?f=3&t=3186>
-   [make.contigs](make.contigs) - rindex files -
    <https://www.mothur.org/forum/viewtopic.php?f=3&t=3159&start=10#p9096>

## Videoblog

-   <https://www.youtube.com/watch?v=IobnyTQ4F6Q></a>
