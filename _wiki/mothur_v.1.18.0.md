---
title: 'mothur v.1.18.0'
redirect_from: '/wiki/Mothur_v.1.18.0.html'
---
We are happy to announce the release of [Mothur
v.1.18.0](Mothur_v.1.18.0). This is a very significant
release, so please pay close attention to the notes below. We have
implemented a number of new and important commands and we have
significantly improved the usablity of mothur.

Thinking about usability\... First, we have reworked how you interface
with the commands to hopefully make it much easier to use. Through
teaching numerous workshops, I have noticed that the long file names are
ridiculous and even I have problems with typos. To counter this, we have
improved mothur's "memory" to make it, um, more motherly. If you
start with sffinfo or any other command where you insert a fasta file
name, mothur will either guess which fasta file you need for the next
command, or you can tell it fasta=current. The same works for name,
group, accnos, and taxonomy files. In addition, if you use processors=8,
mothur will remember to use 8 processors where possible in all of the
other options. Second, all the read commands (e.g. read.dist, read.otu,
etc) have been scrapped because they didn't do anything and were a
painful(less) extra step. Instead, you will now enter the information
into the actual command you want to run. This has the side effect that
we need a new command, [make.shared](make.shared), to parse
list files into shared files. Third, if I have a hard time keeping
straight what commands use template files and which use reference files,
I suspect many of you do as well. To solve this problem, we have
streamlined our option names so that any input sequence file uses the
fasta option (no more candidate files) and any reference sequence file
now uses the reference option (no more template files). If you forget
and use candidate and template in align.seqs mothur won't make a peep.

Thinking about functionality\... We just published a paper in [Applied
and Environmental
Microbiology](https://aem.asm.org/cgi/content/abstract/AEM.02810-10v1)
that talks about clustering sequences into OTUs. In that manuscript we
describe metrics for assessing clustering quality, this was done using
the newly released [sens.spec](sens.spec) command. We also
describe a new method of speeding up and reducing the memory
requirements of clustering based on splitting sequences by taxonomy or
distance matrices by taxonomy or distance. This functionality is
available using the [cluster.split](cluster.split) command.
As part of this paper we have concluded that furthest neighbor needs to
go away for most applications. While you can still use the furthest
neighbor algorithm (method=furthest), the average neighbor algorithm is
the new default. In addition, to simplify everyone's life, we have
abandoned using the rounding option as a default and now use a hard
cutoff (cutoff=T). Give the paper a read and if you have any questions,
holler.

Please feel free to let us know what you think about these improvements.
They really are geared towards making your life easier. Although we
resist making such large changes, the further we wait the more wonky
things get. I will be implementing these changes to the Costello Data
Analysis page over the next few days to show how we would use the new
commands with the new version of mothur.

A couple of other small notes\... First, there are still spots available
in the mothur workshop I will be holding on April 27-29 in Detroit.
Second, I will be moving this mailing list and the google group mailing
list to a new system so if you don't want to be on the list you can
just pluck yourself off. Third, ahem, the delivery of 6 packs and harder
liquor has slowed considerably. You know where to send them\...

Till next time,

Pat Schloss

## New commands

-   [cluster.split](cluster.split) - A parallelized approach
    to clustering sequences into OTUs
-   [sens.spec](sens.spec) - A method of determining the
    quality of OTU assignment
-   [make.shared](make.shared) - creates a shared file from a
    list and group file.
-   removed read.dist,
    read.tree, [read.otu](read.otu)
    commands - you will receive a warning if you use these commands
    -   you now use the actual command to read in the file
    -   For example: cluster(column=amazon.dist, name=amazon.names)
-   [get.current](get.current) - outputs current files mothur
    is saving, allows you to clear values.
-   [set.current](set.current) - allows you to overwrite
    mothur's current files and clear them.

## Feature updates

-   [cluster](cluster), hcluster,
    [mgcluster](mgcluster) and
    [cluster.split](cluster.split) - changed default
    clustering method to average and set hard to true
-   [summary.seqs](summary.seqs) and
    [align.check](align.check) - added name file option to
-   [align.check](align.check) - added summary output
    information
-   [screen.seqs](screen.seqs) - included name file
    information to improve use of the optimize step
-   [align.seqs](align.seqs) - sped up the merging of files
    when running with multiple processors.
-   [get.groups](get.groups) and
    [remove.groups](remove.groups) - added group counts info
    to the output
-   [normalize.shared](normalize.shared) - when norm is
    greater than the number of sequences in a sample it is removed from
    the analysis
-   [get.current](get.current),
    [set.current](set.current) and pretty much every other
    command in mothur:
    -   you can now set filenames to "current". example:
        summary.seqs(fasta=stool.fasta) unique.seqs(fasta=current).
        Also, if a required parameter is not given mothur will look for
        the current file, so summary.seqs(fasta=stool.fasta)
        unique.seqs() would also work.
    -   processors parameter persists, so if you set processors=2 for
        any command mothur will use 2 processors for all commands that
        use multiple processors.
-   Streamlined option names for input files:
    -   Input fasta files now all use the fasta option (no more
        "candidate", etc.)
    -   Reference fasta files now all use the reference option (no more
        "template", etc.)

## Bug fixes

-   [https://forum.mothur.org/viewtopic.php?f=4&t=1132&p=2653#p2653](https://forum.mothur.org/viewtopic.php?f=4&t=1132&p=2653#p2653)
-   Catchall - fixed bug that caused a bad\_alloc
    after running with a shared file.
-   [get.lineage](get.lineage) and
    [remove.lineage](remove.lineage) - fixed bug with that
    caused a crash if your taxonomy file contained confidence scores
    that were not integers and you requested taxons containing
    confidence scores.
-   [clearcut](clearcut) - fixed bug with that caused it not
    to complete if you requested the version information.
-   [pca](pca) - fixed compute bug
-   [pairwise.seqs](pairwise.seqs) - fixed bug caused by
    using Nast when aligning.
