---
title: 'mothur v.1.35.0'
redirect_from: '/wiki/Mothur_v.1.35.0.html'
---
We have an exciting new release of mothur for you with the release of
[mothur v.1.35.0](/wiki/mothur_v.1.35.0)!

There are several important sets of updates that you will certainly want
to know about. **First**, with this release, you can now use mothur to
generate the files needed to submit 454 and Illumina amplicon data to
the Sequence Read Archive at the NCBI. That can be achieved using the
[get.mimarkspackage](/wiki/get.mimarkspackage) and
[make.sra](/wiki/make.sra) commands. To learn more about how to
pull this off you'll want to follow the tutorial at [Creating a new
submission](/wiki/Creating_a_new_submission). We have been working
with the SRA curators to make sure that all of the formatting is right.
There may be a few bumps in the road as this is rolled out and people
start to use it, but we're pretty confident that it is working. I've
even been able to seamlessly submit data from our lab. We've tried to
make it as painless as possible, so let us know if there's anything
more we can do to make the process easy. **Second**, we have rewriten
the implementation of [make.contigs](/wiki/make.contigs). This
update significantly increases the command's speed. We've also
implemented the alignment methods implemented in PandaSeq and their
methods for calculating quality scores. We still think the default
settings in [make.contigs](/wiki/make.contigs) are the best, but
have gotten enough requests that we thought we'd include them in the
new version. **Third**, using the [set.dir](/wiki/set.dir) command
you can now set the seed for the random number generator. This is
important for improving the reproducibility of your results between runs
that involve generating random numbers. **Fourth**, for those of you
that are fans of the command line-based approach for interfacing with
mothur, you can now temper the amount of output that comes to the
screen, output the help information, and get the version number for the
executable of mothur that you are using using several new command line
options. Finally, for those of you that like to dig a little bit into
the weeds, we have restructured our [GitHub
repository](https://github.com/mothur/mothur) and are making greater use
of their issue tracking tools to organize our development process. As
always, there are a number of other feature updates that we have made as
well as numerous bug fixes that you have called to our attention. As
always, please continue to bring to our attention any problems you are
experiencing in mothur and any ideas you might have for new features or
improving your interaction with the software.

In closing, I will be hosting an [ R workshop for microbial
ecologists](/wiki/Workshops) this May 3-5 in the Detroit area. Let
me know if you have any questions. This material is great for taking
output from mothur to generate publication quality figures and
leveraging the powerful tools that R developers have created for doing
statistical and ecological analyses.


## New commands

-   [get.mimarkspackage](/wiki/get.mimarkspackage) - create blank
    mimarks package form for sra command (see [Creating a new
    submission](/wiki/Creating_a_new_submission))
-   [make.sra](/wiki/make.sra) - create submission ready files (see
    [creating a new submission](/wiki/Creating_a_new_submission))

Added common command line options. Can now use -q or \--quiet, -h or
\--help, -v or \--version.

## Feature updates

-   [set.dir](/wiki/set.dir) - added seed parameter to allow the
    user to set the seed for the random number generator
-   [make.contigs](/wiki/make.contigs) - improved speed, added
    pandaseq-based quality score data, added kmer aligning method
-   [cluster.split](/wiki/cluster.split) - allows one to use the
    cluster.classic option if they set the classic option to T. This is
    likely the most ideal opetion for people using tax level 5 or 6.
-   [make.biom](/wiki/make.biom) - added relabund file as input.
-   [pcr.seqs](/wiki/pcr.seqs) - added fdiffs and rdiffs comments
-   [cluster](/wiki/cluster),
    [cluster.split](/wiki/cluster.split),
    [cluster.classic](/wiki/cluster.classic),
    [phylotype](/wiki/phylotype),
    [mgcluster](/wiki/mgcluster) - Clustering commands did not
    include the count file info. when printing list file OTU order. Only
    effects clustering commands. \*.pick commands must preserve
    otuLabels order. -
    [https://forum.mothur.org/viewtopic.php?f=3&t=3460&p=10483#p10483](https://forum.mothur.org/viewtopic.php?f=3&t=3460&p=10483#p10483)
-   [classify.tree](/wiki/classify.tree) - added output parameter.
    Output=node or taxon. Default=node. Output=taxon will label tree
    with consensus taxonomies.
-   [get.coremicrobiome](/wiki/get.coremicrobiome) - the abundance
    option can now accept float values. abundance=1 or abundance=0.01
    produce same results. Abundance=0.005 or other values between 0 and
    1, instead of the 1% as the lowest value.
-   [chop.seqs](/wiki/chop.seqs) - added keepn parameter.
    Default=f.
-   Restructured source files on github for easier downloads and builds.

## Bug fixes

-   [cluster.split](/wiki/cluster.split) - MPI version compile
    issue,
    [https://forum.mothur.org/viewtopic.php?f=4&t=3453&p=10073#p10073](https://forum.mothur.org/viewtopic.php?f=4&t=3453&p=10073#p10073).
    fixed in 1.34.1.
-   [summary.seqs](/wiki/summary.seqs) - multiple processors
    Windows. fixed 1.34.2
-   [summary.seqs](/wiki/summary.seqs) -MPI bug
    [https://forum.mothur.org/viewtopic.php?f=4&t=3465](https://forum.mothur.org/viewtopic.php?f=4&t=3465) - fixed
    1.34.2
-   [pcr.seqs](/wiki/pcr.seqs) - use of mothur's paired primer tag
    instead of forward and reverse tags causing improper trimming. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=3482](https://forum.mothur.org/viewtopic.php?f=4&t=3482). fixed in
    1.34.3.
-   [sffinfo](/wiki/sffinfo) - parsed sff files giving corrupt
    error. - fixed 1.34.4
-   [pcr.seqs](/wiki/pcr.seqs) - Windows multiple processors with
    start and end parameters giving errors. - fixed 1.34.4
-   [make.contigs](/wiki/make.contigs) - Bug in Windows paralell
    processing.
    [https://forum.mothur.org/viewtopic.php?f=4&t=3571&p=10466#p10466](https://forum.mothur.org/viewtopic.php?f=4&t=3571&p=10466#p10466)
-   [dist.seqs](/wiki/dist.seqs) - bug introduced in 1.34.4 -
    [https://github.com/mothur/mothur/issues/46](https://github.com/mothur/mothur/issues/46)</a>
-   [rarefaction.single](/wiki/rarefaction.single) - returning
    median instead of mean.
    [https://forum.mothur.org/viewtopic.php?f=3&t=3484](https://forum.mothur.org/viewtopic.php?f=3&t=3484)
-   [make.contigs](/wiki/make.contigs) - skipping groups if invalid
    fastq files provided. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=2571](https://forum.mothur.org/viewtopic.php?f=4&t=2571)
-   [make.contigs](/wiki/make.contigs) - bug that required barcodes to process
-   [metastats](/wiki/metastats) - infinite loop.
-   [pcr.seqs](/wiki/pcr.seqs) - When sequence length \< primer
    Length + pdiffs, basic\_string error occurred. Rare case.
-   mothur will now read over null strings to avoid pesky sequence not
    found errors.

## Download

-   [v.1.35.0](https://github.com/mothur/mothur/releases/tag/v1.35.0) is
    available on github

## Registered users

-   3221
