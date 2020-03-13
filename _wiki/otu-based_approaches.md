---
title: 'OTU-based approaches'
redirect_from: '/wiki/OTU-based_approaches'
---
[otu-based approaches](OTU-based_approaches) enable you to
analyze the frequency distribution of sequences found in bins using a
variety of methods. In contrast to [hypothesis testing
approaches](hypothesis_testing_approaches), these methods
allow you to quantify ecological features such as richness, diversity,
and similarity. Prior to running any of the below listed commands, you
will need to do some [sequence
processing](sequence_processing). Examples of each command
are provided within their specific pages, but several users have
provided several [analysis examples](analysis_examples),
which use these commands. An exhaustive list of the commands found in
mothur is available within the [ commands category
index](Special:Categories). Also list of mothur\'s
[calculators](calculators) with detailed examples.

## General commands

-   [dist.seqs](dist.seqs) - generate a column or
    phylip-formatted distance matrix
-   [cluster](cluster) - clustering sequences into OTUs based
    on genetic distance
-   [hcluster](hcluster) - clustering sequences into OTUs
    based on genetic distance
-   [cluster.classic](cluster.classic) - clustering sequences
    into OTUs based on genetic distance
-   [get.rabund](get.rabund) - convert list or
    species-abundance data into rank-abundance data
-   [get.sabund](get.sabund) - convert list or rank-abundance
    data into species-abundance data
-   [bin.seqs](bin.seqs) - identify the OTU that each
    sequence belongs to
-   [get.oturep](get.oturep) - identify a representative
    sequence from each OTU
-   [get.group](get.group) - have mothur remind you what
    group identifiers are found in your shared files
-   [get.label](get.label) - determine the OTU definitions
    that are found in your OTU files
-   [get.otulist](get.otulist) (was
    [get.listcount](get.listcount)) - list sequences by OTU
    number
-   [make.group](make.group) - generate a group file
-   [make.shared](make.shared) - create a shared file from a
    list and group file
-   [otu.hierarchy](otu.hierarchy) - relates OTUs at
    different distances
-   [parse.list](parse.list) - parses a list file by group
-   [classify.otu](classify.otu) - find a consensus taxonomy
    for an OTU
-   [split.abund](split.abund) -
-   [normalize.shared](normalize.shared)
-   [sub.sample](sub.sample)
-   [remove.groups](remove.groups) - remove sequences from a
    specific group or set of groups from a list file
-   [get.groups](get.groups) - select sequences from a
    specific group or set of groups from a list file
-   [get.otus](get.otus) - selects OTUs containing sequences
    from a specific group or set of groups
-   [remove.otus](remove.otus) - removes OTUs containing
    sequences from a specific group or set of groups
-   [get.dists](get.dists) - selects distances related to
    sequences or groups in an accnos file.
-   [remove.dists](remove.dists) - removes distances related
    to sequences or groups in an accnos file.
-   [consensus.seqs](consensus.seqs)
-   [make.biom](make.biom) - creates a .biom file from a
    shared file.
-   [primer.design](primer.design) - - will generate
    candidate PCR primers for OTUs of interest

## Single sample analyses

-   [collect.single](collect.single) - generate collectors
    curves using a variety of α-diversity
    [calculators](calculators)
-   [rarefaction.single](rarefaction.single) - generate a
    rarefaction curve using a variety of α-diversity
    [calculators](calculators)
-   [summary.single](summary.single) - calculate a variety of
    α-diversity [calculators](calculators) for each OTU
    definition
-   [heatmap.bin](heatmap.bin) - generate an svg-formatted
    heatmap for your OTU data
-   [catchall](catchall)

## Multiple sample analyses

-   [collect.shared](collect.shared) - generate collectors
    curves using a variety of β-diversity
    [calculators](calculators)
-   [rarefaction.shared](rarefaction.shared) - generate an
    inter-sample rarefaction curve for the observed number of OTUs
-   [summary.shared](summary.shared) - calculate a variety of
    β-diversity [calculators](calculators) for each OTU
    definition
-   [dist.shared](dist.shared) - generate a phylip-formatted
    distance matrix describing the pairwise similarity between samples
    using various [calculators](calculators)
-   [get.sharedseqs](get.sharedseqs) (was
    [get.sharedotu](get.sharedotu)) - identifies OTU\'s that
    are shared by multiple groups
-   [heatmap.bin](heatmap.bin) - generate an svg-formatted
    heatmap for your OTU data
-   [heatmap.sim](heatmap.sim) - generate an svg-formatted
    heatmap describing the similarity between samples using various
    [calculators](calculators)
-   [venn](venn) - generate 2, 3, or 4-way venn diagrams to
    describe the overlap between samples using various
    [calculators](calculators)
-   [tree.shared](tree.shared) - generate a newick-formatted
    dendrogram comparing communities using various
    [calculators](calculators)
-   [metastats](metastats)
-   [otu.association](otu.association) - calculate the
    correlation coefficient for the otus in a shared/relabund file.
-   [get.coremicrobiome](get.coremicrobiome)
