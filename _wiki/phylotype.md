---
title: 'phylotype'
tags: 'commands'
redirect_from: '/wiki/Phylotype'
---
The **phylotype** command can be used to assign sequences to OTUs based on
their taxonomy and outputs a .list, .rabund and .sabund files. To run
through the example below, download [Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/ExampleDataSet.zip) 
and [mothur-formatted version of the RDP training set
    (v.9)](https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset9_032012.pds.zip).


## Default settings

In order to run the phylotype() command, you need to generate a taxonomy
file. You can do this using the
[classify.seqs](/wiki/classify.seqs) command, enter the following
command:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)
    mothur > phylotype(taxonomy=final.taxonomy)

This command will generate the following output:

    mothur > phylotype(taxonomy=final.taxonomy)
    1
    2
    3
    4
    5
    6

Outputted to the screen is a level, 1 meaning the most specific taxonomy
given.

Opening final.tx.list you would see the output as:

    label	numPhylos	Phylo01	Phylo02	Phylo03	Phylo04	Phylo05	Phylo06	Phylo07	Phylo08 ...
    1	63	M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    2   39  M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    3   24  M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    4   15  M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    5   9   M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    6   1   M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    
    
## Options

### count

The count option allows you to provide a count file associated with your taxonomy file. 

### label

The labels count up from the leaves to the root of the phylotree. There
may only be a couple of level in your phylotree that you are interested
in seeing. You can use the label option to specific the levels you would
like. If you want the data for the lines labeled unique, 1, 3 and 5 you
would enter:

    mothur > phylotype(taxonomy=final.taxonomy, label=1-3-5)
    1
    3
    5

Opening final.tx.list you would see the output as:

    label	numPhylos	Phylo01	Phylo02	Phylo03	Phylo04	Phylo05	Phylo06	Phylo07	Phylo08 ...
    1	63	M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    3   24  M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    5   9   M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...

### cutoff

The cutoff parameter counts up from the root to the leaves of the
phylotree. The cutoff parameter can be used to truncate the depth of the
taxonomy you are interested in.

    mothur > phylotype(taxonomy=final.taxonomy, cutoff=4)
    1
    2
    3
    4

Opening final.tx.list you would see the output as:

    label	numPhylos	Phylo01	Phylo02	Phylo03	Phylo04	Phylo05	Phylo06	Phylo07	Phylo08 ...
    1	63	M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    2   39  M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    3   24  M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...
    4   15  M00967_43_000000000-A3JHG_1_1101_10331_23332,M00967_43_000000000-A3JHG_1_1101_10367_17664,...

Level 1 was level 4 without the cutoff, but now the most specific
taxonomy given has changed since we truncated the tree.


### name - not recommended

The name option allows you to provide a name file associated with your taxonomy file.

We DO NOT recommend using the name file. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


## Revisions

-   1.25.0 - the numOtus in the list file is one to high. Otus are
    clustered correctly, the count is just off.
-   1.25.0 - only clustering at leaf nodes, level 1.
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)


