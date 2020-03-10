---
title: 'Mothur v.1.14.0'
---
We are happy to announce the release of [ mothur
v.1.14](mothur_v.1.14.0) in time for Halloween - trick or
treat!

This is update has a number of new commands and options that are just
plain awesome. I\'ll call your attention to three that we are
particularly excited about. The first is a command for the complete
pipeline that the Schloss lab uses to process their own data
([pipeline.pds](pipeline.pds)). This command is written so
that you can modify the pipeline to your lab\'s unique needs. The second
is a wrapper for the [metastats](metastats) code that was
generously provided by Mihai Pop\'s research group. The third will [
normalize](normalize.shared) your shared files so that each
group has the same number of sequences. In the next release we hope to
do a similar type of processing by randomly sub-sampling sequences from
each group; however, we think the
[normalize.shared](normalize.shared) approach is better.
Among the new options that are available you\'ll notice that we added
parallelization to three more commands. The feature that many people
will appreciate most are the addition of the optimize and criterion
options to [screen.seqs](screen.seqs). These options should
make running the command much easier (and limit the number related
emails that pile up in our inbox). A number of the new commands,
options, and bug fixes were suggested by users of the online mothur
forum as well as those contacting us via mothur.bugs\@gmail.com. We
really appreciate this input and thank you for helping us to make mothur
a great program.

Going forward we are excited about the features we have planned for the
next release, so stay tuned. You have probably noticed that the number
of new features and options continues to grow. This is awesome, but at
the same time it seems as though there are two other commands we\'d like
to develop and test for every one we put into mothur. Because of this we
are looking for someone to fill a postdoc-type position in the Schloss
lab at The University of Michigan. If you\'d like to learn more, please
contact Pat at pschloss @ umich.edu. The basic qualifications are 1)
good social skills, 2) knowledge of some programming language
(preferably C++), 3) knowledge of microbial ecology, 4) good social
skills.

As always, happy writing and let us know if we can be of assistance.
Most importantly, keep the [six packs](http://leinie.com/red.html)
coming\...

Pat Schloss

\_\_NOTOC\_\_

## New commands

-   [pipeline.pds](pipeline.pds) - an implementation of
    Pat\'s pipeline in a single command, plus the ability to customize
-   [metastats](metastats) - a wrapper for the metastats
    program from Mihai Pop\'s research group
-   [normalize.shared](normalize.shared) - normalize the
    number of sequences per group to a specified level
-   [split.groups](split.groups) - generates a fasta file for
    each group in a groupfile
-   [cluster.fragments](cluster.fragments) - a modified
    version of [pre.cluster](pre.cluster) /
    [unique.seqs](unique.seqs) to cluster aligned sequences
    that overlap, but aren\'t exact
-   [get.lineage](get.lineage) /
    [remove.lineage](remove.lineage) - similar to
    [remove.seqs](remove.seqs)/[get.seqs](get.seqs "wikilink")
    except that instead of taking in an accnos file, one would give a
    taxonomy file and the name of a taxonomic group
-   [fastq.info](fastq.info) - generate fasta and qual files
    from a fastq file
-   [deunique.seqs](deunique.seqs) - re-replicate duplicate
    sequences
-   [pairwise.seqs](pairwise.seqs) - calculate pairwise
    distances between sequences without using a multiple-sequence
    alignment

## Feature updates

-   [screen.seqs](screen.seqs) - added optimize and criteria
    options
-   [rarefaction.single](rarefaction.single) - added
    processors option
-   [phylo.diversity](phylo.diversity) - added processors
    option
-   [summary.shared](summary.shared) - added processors and
    distance options
-   [summary.single](summary.single) - groupmode=T is the new
    default
-   [venn](venn) - added nseqs and permute options
-   [chop.seqs](chop.seqs) - added short option
-   mothur will now look in the output directory automatically if it
    cannot find your file in the default locations, so if you are
    redirecting your output, you can still use simple names as inputs.

## Bug fixes

-   when you go from heatmap.bin() to heatmap.sim() we get a segfault
-   bug in 1.13.0 with shared files smart distancing
-   if using make.group with more then 3 fasta files, resulting file
    will be called merge.groups
-   fixed the unifrac commands so that their output order matches
    summary commands
-   fixed bug introduced in version 1.13.0 that produced significance
    scores of 1 for [unifrac.unweighted](unifrac.unweighted)
-   fixed bug where chimera commands didn\'t output to the correct
    folder if you used set.dir or a complete file name.
-   classify.otu should put in \"no\_consensus\" if below threshold
-   fixed bug with [unifrac.weighted](unifrac.weighted),
    [unifrac.unweighted](unifrac.unweighted) and
    [phylo.diversity](phylo.diversity) that mistakenly added
    the root to the branch length

## Other stuff

-   output of pcoa command changed for \*.pca to \*.pcoa and
    \*.pca.loadings to \*pcoa.loadings
