---
title: 'mothur v.1.33.0'
redirect_from: '/wiki/Mothur_v.1.33.0.html'
---
We are happy to be releasing [mothur
v.1.33.0](/wiki/mothur_v.1.33.0), which includes a number of
exciting new features and updates. There is one new command -
[merge.sfffiles](/wiki/merge.sfffiles), which does the obvious.
Among the new features in existing commands we have added the [Square
Root Jensen-Shannon
Divergence](/wiki/Square_Root_Jensen-Shannon_Divergence) and
[jensen-shannon divergence](/wiki/Jensen-Shannon_Divergence)
calculators, which you can use to calculate distances between samples
using "rjsd" and "jsd". These have been popular in some of the
recent microbiome literature and thought you would appreciate having
access to these. We have also added the ability to assign samples to
community types in [get.communitytype](/wiki/get.communitytype)
using K-means and PAM; however, we still recommend using DMM. Following
up on some of the features in the last release that were based on the
work of Curtis Huttenhower, we have added the picrust and reftaxonomy
options to [make.biom](/wiki/make.biom) so that it is easier for
mothur users to interface wihe picrust. Finally, there are a number of
[odds and ends](/wiki/mothur_v.1.33.0#feature-updates) that you'll see below .

We hope to have another release out to you in the next month or so with
a really important new command. We have been working with the SRA at
NCBI to create a mothur command that will prepackage everything to make
uploadind data to the SRA easier. Those of you that we have spoken about
are very excited about this. The folks at the SRA have been great about
faciliating this and understanding the difficulties users are facing in
getting their data up to the SRA.

If you haven't heard, I will be hosting another mothur-based workshop
in Detroit on March 24-26. See the [workshops](/wiki/Workshops)
page for more information. There are still a few seats available. There
will likely be another R workshop in June and mothur workshops in August
and December.

Keep your great ideas coming and we'll do our best to work them into
mothur!

Pat PS. I'm now on twitter (\@PatSchloss) and you can feel free to ask
mothur-related questions there (in 140 characters or less!)

## New commands

-   [merge.sfffiles](/wiki/merge.sfffiles) - combine sfffiles. -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2466](https://forum.mothur.org/viewtopic.php?f=3&t=2466)

## Feature updates

-   [heatmap.bin](/wiki/heatmap.bin) - added otuLabels to 1.32.1
-   make mothur "smarter" about OTULabels. OTU001 and OTU01 should be
    the same. - 1.32.1
-   [list.seqs](/wiki/list.seqs), [get.seqs](/wiki/get.seqs)
    and [remove.seqs](/wiki/remove.seqs) - added fastq as an option
-   add otulabels to list file
-   [make.biom](/wiki/make.biom) - added picrust and reftaxonomy
    parameters.
-   mothur will preserve information after sequence names in a fasta
    file.
-   [venn](/wiki/venn) - permute parameter can equal 1, 2, 3, or 4.
    -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2629&p=7252#p7252](https://forum.mothur.org/viewtopic.php?f=3&t=2629&p=7252#p7252)
-   [get.oturep](/wiki/get.oturep) - changed otu numbers to be
    labels
-   [deunique.seqs](/wiki/deunique.seqs) - added count table -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2673&sid=1df296b80f7a182faa8ebdf54f43122e](https://forum.mothur.org/viewtopic.php?f=3&t=2673&sid=1df296b80f7a182faa8ebdf54f43122e)
-   [nmds](/wiki/nmds) - added group label to \*.axes file -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2677](https://forum.mothur.org/viewtopic.php?f=3&t=2677)
-   [fastq.info](/wiki/fastq.info) - added oligos, group, pdiffs,
    bdiffs, ldiffs, sdiffs, tdiffs parameters so you can split fastq
    files by sample.
-   [sffinfo](/wiki/sffinfo) - added group parameter so you can
    split sff files by group
-   [dist.shared](/wiki/dist.shared),
    [collect.shared](/wiki/collect.shared) and
    [summary.shared](/wiki/summary.shared) - added [Jensen-Shannon
    Divergence](/wiki/Jensen-Shannon_Divergence) calculator, jsd.
-   [dist.shared](/wiki/dist.shared),
    [collect.shared](/wiki/collect.shared) and
    [summary.shared](/wiki/summary.shared) - added [Square Root
    Jensen-Shannon
    Divergence](/wiki/Square_Root_Jensen-Shannon_Divergence)
    calculator, rjsd.
-   [trim.seqs](/wiki/trim.seqs) - added logtransform parameter to
-   [trim.seqs](/wiki/trim.seqs) - reorient parameter no longer
    requires paired barcodes and primers
-   [metastats](/wiki/metastats),
    [unifrac.weighted](/wiki/unifrac.weighted),
    [unifrac.unweighted](/wiki/unifrac.unweighted),
    [parsimony](/wiki/parsimony),
    [chimera.uchime](/wiki/chimera.uchime),
    [chimera.perseus](/wiki/chimera.perseus),
    [chimera.slayer](/wiki/chimera.slayer),
    [shhh.seqs](/wiki/shhh.seqs) and
    [pre.cluster](/wiki/pre.cluster): improved work balance load
    between processors for paralellized commands
-   [get.communitytype](/wiki/get.communitytype) - added dmm, pam
    and kmeans methods
-   [get.communitytype](/wiki/get.communitytype) - added calc,
    subsample, iters parameters for calculations in pam and kmeans.
-   [get.current](/wiki/get.current) - added directory
    information. -
    [https://forum.mothur.org/viewtopic.php?f=8&t=332&p=7824#p7824](https://forum.mothur.org/viewtopic.php?f=8&t=332&p=7824#p7824)
-   [classify.seqs](/wiki/classify.seqs) and
    [summary.tax](/wiki/summary.tax) - added relabund parameter.
    relabund=t outputs relative abundances to \*.summary file instead of
    raw abundances. Default=f.

## Bug fixes

-   [chimera.uchime](/wiki/chimera.uchime),
    [chimera.perseus](/wiki/chimera.perseus),
    [chimera.slayer](/wiki/chimera.slayer) - with count table and
    dereplicate=t caused total=0 error message. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=2620](https://forum.mothur.org/viewtopic.php?f=4&t=2620). - 1.32.1
-   [sff.multiple](/wiki/sff.multiple) - setting processors=1 for
    future commands. Not using file redirects in commands it runs.
-   [venn](/wiki/venn) - fixed bug where command overwrote
    .sharedotu files when permute=t
-   [pcr.seqs](/wiki/pcr.seqs) keepdots=f could cause an aligned
    template to become unaligned.
    [https://forum.mothur.org/viewtopic.php?f=3&t=2653&p=7354#p7354](https://forum.mothur.org/viewtopic.php?f=3&t=2653&p=7354#p7354)
-   [summary.shared](/wiki/summary.shared) - \*.ave.dist matrix = 0
    when processors \> 2 when using the subsample parameter and not
    using the distance parameter.
    [https://forum.mothur.org/viewtopic.php?f=4&t=2660&p=7372#p7372](https://forum.mothur.org/viewtopic.php?f=4&t=2660&p=7372#p7372)
-   [classify.otu](/wiki/classify.otu) - error in \*.tax.summary
    counts with basis=sequence when using a count file.
    [https://forum.mothur.org/viewtopic.php?f=4&t=2492&p=7420#p7420](https://forum.mothur.org/viewtopic.php?f=4&t=2492&p=7420#p7420) -
    fixed in 1.32.0.
-   [sffinfo](/wiki/sffinfo) - windows version with oligos file -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2555&p=7422#p7422](https://forum.mothur.org/viewtopic.php?f=3&t=2555&p=7422#p7422)
-   [set.current](/wiki/set.current) - setting processors option to
    1, if not set.
-   [trim.flows](/wiki/trim.flows) - printing trimmed number of
    flows to scrap file instead of original number of flows. Caused
    error if you wanted to read scrapped flow file.
-   [get.oturep](/wiki/get.oturep) - countable caused sequence not
    found error.

## Changes to wiki

-   Provided a worked example of why cutoff changes when clustering with
    the average neighbor algorithm in the FAQ

## GUI

-   [screen.seqs](/wiki/screen.seqs) - removed requirement of
    contigs report file. 1.32.1
-   added MISeq\_SOP Pipelines

## Registered users

2736
