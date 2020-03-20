---
title: 'Sequence processing'
redirect_from: '/wiki/Sequence_processing'
---
mothur provides a number of [sequence
processing](/wiki/sequence_processing) commands to go from Sanger
sequences or pyrosequences to a distance matrix. These represent a set
of tools that will enable you to run a fast and flexible sequence
analysis pipeline to enable you to carry out [OTU-based
approaches](/wiki/OTU-based_approaches) and [hypothesis testing
approaches](/wiki/hypothesis_testing_approaches). Examples of each
command are provided within their specific pages, but several users have
provided several [analysis examples](/wiki/analysis_examples),
which use these commands. An exhaustive list of the commands found in
mothur is available within the [ commands category
index](/wiki/tags#commands).

## General commands

-   [reverse.seqs](/wiki/reverse.seqs) - output the reverse
    complement of a sequence collection
-   [summary.seqs](/wiki/summary.seqs) - summarize a collection of
    sequences
-   [summary.qual](/wiki/summary.qual) - summarize a collection of
    sequences quality data
-   [merge.files](/wiki/merge.files) - merge two or more sets of
    files
-   [merge.sfffiles](/wiki/merge.sfffiles) - merge two or more sets
    of sfffiles
-   [merge.taxsummary](/wiki/merge.taxsummary) - combines tax
    summary files.
-   [list.seqs](/wiki/list.seqs) - write the sequence names
    contained within a file to a new file
-   [get.seqs](/wiki/get.seqs) - write the data for a sequence name
    to a new file
-   [remove.seqs](/wiki/remove.seqs) - remove the data for a
    sequence name from a new file
-   [remove.groups](/wiki/remove.groups) - remove sequence from a
    specific group or set of groups
-   [get.groups](/wiki/get.groups) - select sequence from a
    specific group or set of groups
-   [split.abund](/wiki/split.abund) - separate sequences into rare
    and abundant groups
-   [split.groups](/wiki/split.groups) - separate sequences by
    group
-   [sub.sample](/wiki/sub.sample) - to be used as a way to
    normalize your data, or create a smaller set from your original set
-   [consensus.seqs](/wiki/consensus.seqs)
-   [make.fastq](/wiki/make.fastq) - creates a fastq file from a
    fasta and quality file
-   [deunique.tree](/wiki/deunique.tree) - reinserts redundant
    sequence identifiers into a unique tree
-   [count.seqs](/wiki/count.seqs) - counts the number of sequences
    represented by the representative sequence in a name file.
-   [count.groups](/wiki/count.groups) - counts number of sequences
    in a group from a shared or group file.
-   [sort.seqs](/wiki/sort.seqs) - puts sequences in different
    files in the same order.
-   [create.database](/wiki/create.database) - creates a database
    file from a list, repnames, repfasta and contaxonomy file.
-   [get.dists](/wiki/get.dists) - selects distances related to
    sequences or groups in an accnos file.
-   [remove.dists](/wiki/remove.dists) - removes distances related
    to sequences or groups in an accnos file.

## Sequence analysis pipeline

-   [sffinfo](/wiki/sffinfo) - extracts sequences from a sff file.
-   [trim.flows](/wiki/trim.flows) - trims flowgram data to get
    ready to run through shhh.flows
-   [shhh.flows](/wiki/shhh.flows) - the mothur-based
    re-implementation of PyroNoise
-   [make.contigs](/wiki/make.contigs) - create contigs from
    forward and reverse fastq files.
-   [shhh.seqs](/wiki/shhh.seqs) - a mothur-based rewrite of Chris
    Quince's sequence denoising program, SeqNoise
-   [fastq.info](/wiki/fastq.info) - parses fastq file into fasta
    and quality files
-   [trim.seqs](/wiki/trim.seqs) - pre-process sequences to remove
    primers, generate group file, and screen for quality
-   [unique.seqs](/wiki/unique.seqs) - identify the unique
    sequences in a collection and generate a name file
-   [deunique.seqs](/wiki/deunique.seqs) - reverse unique.seqs
-   [pre.cluster](/wiki/pre.cluster) - implements a pseudo-single
    linkage algorithm with the goal of removing sequences that are
    likely due to pyrosequencing errors
-   [cluster.fragments](/wiki/cluster.fragments) - clusters
    sequences that are fragments of a larger sequence
-   [chop.seqs](/wiki/chop.seqs) -
-   [align.seqs](/wiki/align.seqs) - align sequences against a
    reference alignment
-   [filter.seqs](/wiki/filter.seqs) - filter positions out of an
    alignment
-   [screen.seqs](/wiki/screen.seqs) - remove sequences that don't
    satisfy criteria
-   [seq.error](/wiki/seq.error) - a function that assesses error
    rates in sequencing data
-   [chimera.bellerophon](/wiki/chimera.bellerophon) - identify
    potentially chimeric sequences
-   [chimera.check](/wiki/chimera.check) - identify potentially
    chimeric sequences
-   [chimera.ccode](/wiki/chimera.ccode) - identify potentially
    chimeric sequences
-   [chimera.pintail](/wiki/chimera.pintail) - identify potentially
    chimeric sequences
-   [chimera.slayer](/wiki/chimera.slayer) - identify potentially
    chimeric sequences
-   [chimera.uchime](/wiki/chimera.uchime) - identify potentially
    chimeric sequences
-   [chimera.perseus](/wiki/chimera.perseus) - identify potentially
    chimeric sequences
-   [align.check](/wiki/align.check) - characterize the alignment
    quality for 16S rRNA gene sequences
-   [dist.seqs](/wiki/dist.seqs) - generate a pairwise distance
    matrix
-   [pairwise.seqs](/wiki/pairwise.seqs) - generate a pairwise
    distance matrix
-   [pcr.seqs](/wiki/pcr.seqs) - trim inputted sequences based on a
    variety of user-defined options
-   [primer.design](/wiki/primer.design) - will generate candidate
    PCR primers for OTUs of interest
