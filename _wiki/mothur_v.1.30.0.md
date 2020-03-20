---
title: 'mothur v.1.30.0'
redirect_from: '/wiki/Mothur_v.1.30.0.html'
---
We are very happy to announce the release of [mothur
v.1.30.0](/wiki/mothur_v.1.30.0). This is a big release with a
number of new commands and feature updates. First, we have updated
[make.contigs](/wiki/make.contigs) to reflect our development and
testing of paired end sequencing on a MiSeq using a dual index approach.
Use of this command and the overall MiSeq-based workflow has been added
to the stable of [analysis examples](/wiki/Analysis_examples) as
the Schloss lab's [miseq sop](/wiki/MiSeq_SOP). We have also
posted our wetlab protocol there as well. A manuscript describing the
SOPs has been submitted to *Applied and Environmental Microbiology*.
This brings us to our second big new command, which we used to write the
MiSeq pipeline manuscirpt: [write.paper](/wiki/write.paper). We're
all overburdened and the climate of publish or perish has convinced us
that this new command will help everyone. We're working on
write.dissertation but it's not quite cleared our stringent QC
standards quite yet. A third important new command is
[primer.design](/wiki/primer.design), which will allow you to
create a list of candidate primers/probes designed to groups of bacteria
within OTUs or phylotypes.

We've also added several other useful commands and a number of new
feature updates to commands that you will likely find useful. One of
note is the ability to use output from
[summary.seqs](/wiki/summary.seqs),
[make.contigs](/wiki/make.contigs), and
[align.seqs](/wiki/align.seqs) in
[screen.seqs](/wiki/screen.seqs). This should give more flexibility
and quicker execution times. We've demonstrated how to do this in the
[miseq sop](/wiki/MiSeq_SOP). A second option that many will find
useful is the ability to set the flow order in
[trim.flows](/wiki/trim.flows) and
[shhh.flows](/wiki/shhh.flows) to allow 454's new acyclic flow
order (order=B) and Ion Torrent's acyclic flow order (order=I).
Although we have these options available, we are still encouraging
people to stick with the original 454 flow order and to stay away from
Ion Torrent. Our testing with mock communities has shown that the new
technologies are not able to match the performance we see in the [454
SOP](/wiki/454_SOP) with flow order A or using the [MiSeq
SOP](/wiki/MiSeq_SOP). The next release will hopefully have more
guidance on the best course of action for these platforms. Finally, we
added a pacbio option to [fastq.info](/wiki/fastq.info) which
corrects quality scores of 0 to ambiguous base calls. There should be a
PacBio SOP posted prior to the next release as well.

This is a big release and there's a lot going on trying to figure out
the best way to generate an analyze data from these new sequencing
platforms. If you would like to stay at the bleeding edge of this
progress, consider coming to one of Pat's workshops in Detroit, MI. The
next workshops are April 15-17 and May 6-8. Email Pat for more
information. Thanks as always for everyone's feedback and citations.
mothur is far and away the most cited bioinformatics program used to
analyze 16S rRNA gene sequences. Thank you!

## New commands

-   [make.contigs](/wiki/make.contigs) - updated to reflect new
    MiSeq SOP
-   [write.paper](/wiki/write.paper) - given a sff file or
    collection of fastq files will write a manuscript for a desired
    journal
-   [primer.design](/wiki/primer.design) - will generate candidate
    PCR primers for OTUs of interest
-   [get.dists](/wiki/get.dists) - selects distances from a phylip
    or column file related to groups or sequences listed in an accnos
    file.
-   [remove.dists](/wiki/remove.dists) - removes distances from a
    phylip or column file related to groups or sequences listed in an
    accnos file.
-   [merge.taxsummary](/wiki/merge.taxsummary) - combines tax
    summary files.

## Feature updates

-   [pre.cluster](/wiki/pre.cluster) - added topdown parameter
-   various commands - mothur will change ':' characters in sequence
    names to '\_' to avoid problems in downstream analysis with trees.
-   added checks to make sure Windows paralellized commands complete
    their tasks.
-   [list.otulabels](/wiki/list.otulabels) - added list parameter
-   [get.otus](/wiki/get.otus) and
    [remove.otus](/wiki/remove.otus) - added list and
    shared parameters
-   [count.groups](/wiki/count.groups) - creates a summary file
-   [fastq.info](/wiki/fastq.info) and
    [make.fastq](/wiki/make.fastq) - added illumina1.8+ format
-   [screen.seqs](/wiki/screen.seqs) - added contigsreport,
    alignreport and summary files to allow files to be screened using
    their inputs. added minoverlap, ostart, oend, mismatches, maxn,
    minscore, maxinsert, minsim parameters and optimization types of
    minoverlap, ostart, oend, mismatches, maxn, minscore, maxinsert,
    minsim.
-   [pcr.seqs](/wiki/pcr.seqs) - added pdiffs
-   [trim.flows](/wiki/trim.flows) and
    [shhh.flows](/wiki/shhh.flows) modified to include order=A,
    order=B, and order=I.
-   [dist.shared](/wiki/dist.shared) - added column format to
    output parameter
-   [consensus.seqs](/wiki/consensus.seqs) - changed consensus
    sequence name from seq1, seq2, \... to OTUlabel.
-   [trim.seqs](/wiki/trim.seqs) - added checkorient parameter
-   [trim.seqs](/wiki/trim.seqs) - can now trim paired barcodes and
    primers.
-   [get.sharedseqs](/wiki/get.sharedseqs) - added shared file
    option and changed unique and shared parameter names to uniquegroups
    and sharedgroups.
-   [fastq.info](/wiki/fastq.info) - added pacbio parameter
-   [seq.error](/wiki/seq.error) - added count parameter
-   [chimera.slayer](/wiki/chimera.slayer),
    [chimera.uchime](/wiki/chimera.uchime),
    [chimera.perseus](/wiki/chimera.perseus) - with count file and
    dereplicate=t will create a \*.pick.count\_table file.
-   [sub.sample](/wiki/sub.sample) - added taxonomy file.

## Bug fixes

-   [seq.error](/wiki/seq.error) - align=f was not degapping the
    sequences.
-   [metastats](/wiki/metastats) - error with output filename -
    fixed in 1.29.1.
-   [venn](/wiki/venn) - segfault when no shared otus - fixed in
    1.29.1.
-   Windows version removing '\\' if full path was given.
-   [sffinfo](/wiki/sffinfo) - trimmed the entire sequence if
    clipQualRight=0.
-   [pcr.seqs](/wiki/pcr.seqs) - if file was aligned and both
    forward and reverse primers were given, reverse primer was not
    trimmed properly. - fixed 1.29.2
-   [tree.shared](/wiki/tree.shared) - subsampling with eliminated
    groups. - fixed 1.29.2
-   Catchall - \[error\]: this command doesn't
    create a sabund output file.
-   [amova](/wiki/amova), [homova](/wiki/homova) -
    [https://forum.mothur.org/viewtopic.php?f=1&t=1919](https://forum.mothur.org/viewtopic.php?f=1&t=1919)
-   [get.seqs](/wiki/get.seqs) - dups=f seq name mismatches.
-   [cluster.split](/wiki/cluster.split) - no longer creates
    concatenated distance matrix for splitmethod=fasta.
-   [chimera.slayer](/wiki/chimera.slayer),
    [chimera.uchime](/wiki/chimera.uchime),
    [chimera.perseus](/wiki/chimera.perseus) - dereplicate=t,
    remove.seqs(dups=f) was not removing all redundant chimeras.
-   [sff.multiple](/wiki/sff.multiple) - end of file character
    added to oligos filenames when the input file did not end in blank
    line, resulting in cannot find file error.

## Changes to wiki

-   We renamed the "[Schloss SOP](/wiki/454_SOP)" to "[454
    SOP](/wiki/454_SOP)". You will be automatically re-directed to
    the 454 page
-   We created the [miseq\_sop](/wiki/MiSeq_SOP) page that
    describes how to use mothur to process MiSeq generated amplicon
    data.

## GUI

-   fixed bug with "reset to default" menu option.
-   removed autofilled file names of removed commands from file input
    combo boxes.

## Registered users

2495
