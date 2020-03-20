---
title: 'OTU-based approaches'
redirect_from: '/wiki/OTU-based_approaches'
---
[otu-based approaches](/wiki/OTU-based_approaches) enable you to
analyze the frequency distribution of sequences found in bins using a
variety of methods. In contrast to [hypothesis testing
approaches](/wiki/hypothesis_testing_approaches), these methods
allow you to quantify ecological features such as richness, diversity,
and similarity. Prior to running any of the below listed commands, you
will need to do some [sequence
processing](/wiki/sequence_processing). Examples of each command
are provided within their specific pages, but several users have
provided several [analysis examples](/wiki/analysis_examples),
which use these commands. An exhaustive list of the commands found in
mothur is available within the [ commands category
index](/wiki/tags#commands). There is also a list of mothur's
[calculators](/wiki/calculators) with detailed examples.

## General commands

-   [dist.seqs](/wiki/dist.seqs) - generate a column or
    phylip-formatted distance matrix
-   [cluster](/wiki/cluster) - clustering sequences into OTUs based
    on genetic distance
-   hcluster - clustering sequences into OTUs
    based on genetic distance
-   [cluster.classic](/wiki/cluster.classic) - clustering sequences
    into OTUs based on genetic distance
-   [get.rabund](/wiki/get.rabund) - convert list or
    species-abundance data into rank-abundance data
-   [get.sabund](/wiki/get.sabund) - convert list or rank-abundance
    data into species-abundance data
-   [bin.seqs](/wiki/bin.seqs) - identify the OTU that each
    sequence belongs to
-   [get.oturep](/wiki/get.oturep) - identify a representative
    sequence from each OTU
-   [get.group](/wiki/get.group) - have mothur remind you what
    group identifiers are found in your shared files
-   [get.label](/wiki/get.label) - determine the OTU definitions
    that are found in your OTU files
-   [get.otulist](/wiki/get.otulist) (was
    [get.listcount](/wiki/get.otulist)) - list sequences by OTU
    number
-   [make.group](/wiki/make.group) - generate a group file
-   [make.shared](/wiki/make.shared) - create a shared file from a
    list and group file
-   [otu.hierarchy](/wiki/otu.hierarchy) - relates OTUs at
    different distances
-   [parse.list](/wiki/parse.list) - parses a list file by group
-   [classify.otu](/wiki/classify.otu) - find a consensus taxonomy
    for an OTU
-   [split.abund](/wiki/split.abund) -
-   [normalize.shared](/wiki/normalize.shared)
-   [sub.sample](/wiki/sub.sample)
-   [remove.groups](/wiki/remove.groups) - remove sequences from a
    specific group or set of groups from a list file
-   [get.groups](/wiki/get.groups) - select sequences from a
    specific group or set of groups from a list file
-   [get.otus](/wiki/get.otus) - selects OTUs containing sequences
    from a specific group or set of groups
-   [remove.otus](/wiki/remove.otus) - removes OTUs containing
    sequences from a specific group or set of groups
-   [get.dists](/wiki/get.dists) - selects distances related to
    sequences or groups in an accnos file.
-   [remove.dists](/wiki/remove.dists) - removes distances related
    to sequences or groups in an accnos file.
-   [consensus.seqs](/wiki/consensus.seqs)
-   [make.biom](/wiki/make.biom) - creates a .biom file from a
    shared file.
-   [primer.design](/wiki/primer.design) - - will generate
    candidate PCR primers for OTUs of interest

## Single sample analyses

-   [collect.single](/wiki/collect.single) - generate collectors
    curves using a variety of α-diversity
    [calculators](/wiki/calculators)
-   [rarefaction.single](/wiki/rarefaction.single) - generate a
    rarefaction curve using a variety of α-diversity
    [calculators](/wiki/calculators)
-   [summary.single](/wiki/summary.single) - calculate a variety of
    α-diversity [calculators](/wiki/calculators) for each OTU
    definition
-   [heatmap.bin](/wiki/heatmap.bin) - generate an svg-formatted
    heatmap for your OTU data
-   Catchall

## Multiple sample analyses

-   [collect.shared](/wiki/collect.shared) - generate collectors
    curves using a variety of β-diversity
    [calculators](/wiki/calculators)
-   [rarefaction.shared](/wiki/rarefaction.shared) - generate an
    inter-sample rarefaction curve for the observed number of OTUs
-   [summary.shared](/wiki/summary.shared) - calculate a variety of
    β-diversity [calculators](/wiki/calculators) for each OTU
    definition
-   [dist.shared](/wiki/dist.shared) - generate a phylip-formatted
    distance matrix describing the pairwise similarity between samples
    using various [calculators](/wiki/calculators)
-   [get.sharedseqs](/wiki/get.sharedseqs) (was
    [get.sharedseqs](/wiki/get.sharedseqs)) - identifies OTU's that
    are shared by multiple groups
-   [heatmap.bin](/wiki/heatmap.bin) - generate an svg-formatted
    heatmap for your OTU data
-   [heatmap.sim](/wiki/heatmap.sim) - generate an svg-formatted
    heatmap describing the similarity between samples using various
    [calculators](/wiki/calculators)
-   [venn](/wiki/venn) - generate 2, 3, or 4-way venn diagrams to
    describe the overlap between samples using various
    [calculators](/wiki/calculators)
-   [tree.shared](/wiki/tree.shared) - generate a newick-formatted
    dendrogram comparing communities using various
    [calculators](/wiki/calculators)
-   [metastats](/wiki/metastats)
-   [otu.association](/wiki/otu.association) - calculate the
    correlation coefficient for the otus in a shared/relabund file.
-   [get.coremicrobiome](/wiki/get.coremicrobiome)
