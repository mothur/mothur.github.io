---
title: 'Sequence processing'
---
mothur provides a number of [sequence
processing](sequence_processing) commands to go from Sanger
sequences or pyrosequences to a distance matrix. These represent a set
of tools that will enable you to run a fast and flexible sequence
analysis pipeline to enable you to carry out [OTU-based
approaches](OTU-based_approaches) and [hypothesis testing
approaches](hypothesis_testing_approaches). Examples of each
command are provided within their specific pages, but several users have
provided several [analysis examples](analysis_examples),
which use these commands. An exhaustive list of the commands found in
mothur is available within the [ commands category
index](Special:Categories).

## General commands

-   [reverse.seqs](reverse.seqs) - output the reverse
    complement of a sequence collection
-   [summary.seqs](summary.seqs) - summarize a collection of
    sequences
-   [summary.qual](summary.qual) - summarize a collection of
    sequences quality data
-   [merge.files](merge.files) - merge two or more sets of
    files
-   [merge.sfffiles](merge.sfffiles) - merge two or more sets
    of sfffiles
-   [merge.taxsummary](merge.taxsummary) - combines tax
    summary files.
-   [list.seqs](list.seqs) - write the sequence names
    contained within a file to a new file
-   [get.seqs](get.seqs) - write the data for a sequence name
    to a new file
-   [remove.seqs](remove.seqs) - remove the data for a
    sequence name from a new file
-   [remove.groups](remove.groups) - remove sequence from a
    specific group or set of groups
-   [get.groups](get.groups) - select sequence from a
    specific group or set of groups
-   [split.abund](split.abund) - separate sequences into rare
    and abundant groups
-   [split.groups](split.groups) - separate sequences by
    group
-   [sub.sample](sub.sample) - to be used as a way to
    normalize your data, or create a smaller set from your original set
-   [consensus.seqs](consensus.seqs)
-   [make.fastq](make.fastq) - creates a fastq file from a
    fasta and quality file
-   [deunique.tree](deunique.tree) - reinserts redundant
    sequence identifiers into a unique tree
-   [count.seqs](count.seqs) - counts the number of sequences
    represented by the representative sequence in a name file.
-   [count.groups](count.groups) - counts number of sequences
    in a group from a shared or group file.
-   [sort.seqs](sort.seqs) - puts sequences in different
    files in the same order.
-   [create.database](create.database) - creates a database
    file from a list, repnames, repfasta and contaxonomy file.
-   [get.dists](get.dists) - selects distances related to
    sequences or groups in an accnos file.
-   [remove.dists](remove.dists) - removes distances related
    to sequences or groups in an accnos file.

## Sequence analysis pipeline

-   [sffinfo](sffinfo) - extracts sequences from a sff file.
-   [trim.flows](trim.flows) - trims flowgram data to get
    ready to run through shhh.flows
-   [shhh.flows](shhh.flows) - the mothur-based
    re-implementation of PyroNoise
-   [make.contigs](make.contigs) - create contigs from
    forward and reverse fastq files.
-   [shhh.seqs](shhh.seqs) - a mothur-based rewrite of Chris
    Quince\'s sequence denoising program, SeqNoise
-   [fastq.info](fastq.info) - parses fastq file into fasta
    and quality files
-   [trim.seqs](trim.seqs) - pre-process sequences to remove
    primers, generate group file, and screen for quality
-   [unique.seqs](unique.seqs) - identify the unique
    sequences in a collection and generate a names file
-   [deunique.seqs](deunique.seqs) - reverse unique.seqs
-   [pre.cluster](pre.cluster) - implements a pseudo-single
    linkage algorithm with the goal of removing sequences that are
    likely due to pyrosequencing errors
-   [cluster.fragments](cluster.fragments) - clusters
    sequences that are fragments of a larger sequence
-   [chop.seqs](chop.seqs) -
-   [align.seqs](align.seqs) - align sequences against a
    reference alignment
-   [filter.seqs](filter.seqs) - filter positions out of an
    alignment
-   [screen.seqs](screen.seqs) - remove sequences that don\'t
    satisfy criteria
-   [seq.error](seq.error) - a function that assesses error
    rates in sequencing data
-   [chimera.bellerophon](chimera.bellerophon) - identify
    potentially chimeric sequences
-   [chimera.check](chimera.check) - identify potentially
    chimeric sequences
-   [chimera.ccode](chimera.ccode) - identify potentially
    chimeric sequences
-   [chimera.pintail](chimera.pintail) - identify potentially
    chimeric sequences
-   [chimera.slayer](chimera.slayer) - identify potentially
    chimeric sequences
-   [chimera.uchime](chimera.uchime) - identify potentially
    chimeric sequences
-   [chimera.perseus](chimera.perseus) - identify potentially
    chimeric sequences
-   [align.check](align.check) - characterize the alignment
    quality for 16S rRNA gene sequences
-   [dist.seqs](dist.seqs) - generate a pairwise distance
    matrix
-   [pairwise.seqs](pairwise.seqs) - generate a pairwise
    distance matrix
-   [pcr.seqs](pcr.seqs) - trim inputted sequences based on a
    variety of user-defined options
-   [primer.design](primer.design) - will generate candidate
    PCR primers for OTUs of interest
