---
title: 'Mothur v.1.33.0'
---
We are happy to be releasing [mothur
v.1.33.0](mothur_v.1.33.0), which includes a number of
exciting new features and updates. There is one new command -
[merge.sfffiles](merge.sfffiles), which does the obvious.
Among the new features in existing commands we have added the [Square
Root Jensen-Shannon
Divergence](Square_Root_Jensen-Shannon_Divergence) and
[Jensen-Shannon Divergence](Jensen-Shannon_Divergence)
calculators, which you can use to calculate distances between samples
using \"rjsd\" and \"jsd\". These have been popular in some of the
recent microbiome literature and thought you would appreciate having
access to these. We have also added the ability to assign samples to
community types in [get.communitytype](get.communitytype)
using K-means and PAM; however, we still recommend using DMM. Following
up on some of the features in the last release that were based on the
work of Curtis Huttenhower, we have added the picrust and reftaxonomy
options to [make.biom](make.biom) so that it is easier for
mothur users to interface wihe picrust. Finally, there are a number of
odds and ends that you\'ll see below [mothur v.1.33.0\#Feature
updates](mothur_v.1.33.0#Feature_updates).

We hope to have another release out to you in the next month or so with
a really important new command. We have been working with the SRA at
NCBI to create a mothur command that will prepackage everything to make
uploadind data to the SRA easier. Those of you that we have spoken about
are very excited about this. The folks at the SRA have been great about
faciliating this and understanding the difficulties users are facing in
getting their data up to the SRA.

If you haven\'t heard, I will be hosting another mothur-based workshop
in Detroit on March 24-26. See the [Workshops](Workshops)
page for more information. There are still a few seats available. There
will likely be another R workshop in June and mothur workshops in August
and December.

Keep your great ideas coming and we\'ll do our best to work them into
mothur!

Pat PS. I\'m now on twitter (\@PatSchloss) and you can feel free to ask
mothur-related questions there (in 140 characters or less!)

## New commands

-   [merge.sfffiles](merge.sfffiles) - combine sfffiles. -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=2466>

## Feature updates

-   [heatmap.bin](heatmap.bin) - added otuLabels to 1.32.1
-   make mothur \"smarter\" about OTULabels. OTU001 and OTU01 should be
    the same. - 1.32.1
-   [list.seqs](list.seqs), [get.seqs](get.seqs "wikilink")
    and [remove.seqs](remove.seqs) - added fastq as an option
-   add otulabels to list file
-   [make.biom](make.biom) - added picrust and reftaxonomy
    parameters.
-   mothur will preserve information after sequence names in a fasta
    file.
-   [venn](venn) - permute parameter can equal 1, 2, 3, or 4.
    -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=2629&p=7252#p7252>
-   [get.oturep](get.oturep) - changed otu numbers to be
    labels
-   [deunique.seqs](deunique.seqs) - added count table -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=2673&sid=1df296b80f7a182faa8ebdf54f43122e>
-   [nmds](nmds) - added group label to \*.axes file -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=2677>
-   [fastq.info](fastq.info) - added oligos, group, pdiffs,
    bdiffs, ldiffs, sdiffs, tdiffs parameters so you can split fastq
    files by sample.
-   [sffinfo](sffinfo) - added group parameter so you can
    split sff files by group
-   [dist.shared](dist.shared),
    [collect.shared](collect.shared) and
    [summary.shared](summary.shared) - added [Jensen-Shannon
    Divergence](Jensen-Shannon_Divergence) calculator, jsd.
-   [dist.shared](dist.shared),
    [collect.shared](collect.shared) and
    [summary.shared](summary.shared) - added [Square Root
    Jensen-Shannon
    Divergence](Square_Root_Jensen-Shannon_Divergence)
    calculator, rjsd.
-   [trim.seqs](trim.seqs) - added logtransform parameter to
-   [trim.seqs](trim.seqs) - reorient parameter no longer
    requires paired barcodes and primers
-   [metastats](metastats),
    [unifrac.weighted](unifrac.weighted),
    [unifrac.unweighted](unifrac.unweighted),
    [parsimony](parsimony),
    [chimera.uchime](chimera.uchime),
    [chimera.perseus](chimera.perseus),
    [chimera.slayer](chimera.slayer),
    [shhh.seqs](shhh.seqs) and
    [pre.cluster](pre.cluster): improved work balance load
    between processors for paralellized commands
-   [get.communitytype](get.communitytype) - added dmm, pam
    and kmeans methods
-   [get.communitytype](get.communitytype) - added calc,
    subsample, iters parameters for calculations in pam and kmeans.
-   [get.current](get.current) - added directory
    information. -
    <http://www.mothur.org/forum/viewtopic.php?f=8&t=332&p=7824#p7824>
-   [classify.seqs](classify.seqs) and
    [summary.tax](summary.tax) - added relabund parameter.
    relabund=t outputs relative abundances to \*.summary file instead of
    raw abundances. Default=f.

## Bug fixes

-   [chimera.uchime](chimera.uchime),
    [chimera.perseus](chimera.perseus),
    [chimera.slayer](chimera.slayer) - with count table and
    dereplicate=t caused total=0 error message. -
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=2620>. - 1.32.1
-   [sff.multiple](sff.multiple) - setting processors=1 for
    future commands. Not using file redirects in commands it runs.
-   [venn](venn) - fixed bug where command overwrote
    .sharedotu files when permute=t
-   [pcr.seqs](pcr.seqs) keepdots=f could cause an aligned
    template to become unaligned.
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=2653&p=7354#p7354>
-   [summary.shared](summary.shared) - \*.ave.dist matrix = 0
    when processors \> 2 when using the subsample parameter and not
    using the distance parameter.
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=2660&p=7372#p7372>
-   [classify.otu](classify.otu) - error in \*.tax.summary
    counts with basis=sequence when using a count file.
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=2492&p=7420#p7420> -
    fixed in 1.32.0.
-   [sffinfo](sffinfo) - windows version with oligos file -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=2555&p=7422#p7422>
-   [set.current](set.current) - setting processors option to
    1, if not set.
-   [trim.flows](trim.flows) - printing trimmed number of
    flows to scrap file instead of original number of flows. Caused
    error if you wanted to read scrapped flow file.
-   [get.oturep](get.oturep) - countable caused sequence not
    found error.

## Changes to wiki

-   Provided a worked example of why cutoff changes when clustering with
    the average neighbor algorithm in the FAQ

## GUI

-   [screen.seqs](screen.seqs) - removed requirement of
    contigs report file. 1.32.1
-   added MISeq\_SOP Pipelines

## Registered users

2736
