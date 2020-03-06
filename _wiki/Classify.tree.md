---


title: 'Classify.tree'
---
The classify.tree command is used to get a consensus taxonomy for each
node on a tree.

{% include toc.html %}

## Default Setting

The classify.tree command parameters are tree, taxonomy, name, group and
cutoff. The taxonomy and tree parameters are required.

First you must classify your sequences, you can do so by running the
following command:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=trainset6_032010.rdp.fasta, taxonomy=trainset6_032010.rdp.tax)

Then create a tree:

    mothur > dist.seqs(fasta=abrecovery.align, output=lt)
    mothur > clearcut(phylip=abrecovery.phylip.dist)

    Then you can use your taxonomy file to find the consensus taxonomy for your tree nodes.

    mothur > classify.tree(taxonomy=abrecovery.rdp.taxonomy, tree=abrecovery.phylip.tre)

When you open abrecovery.phylip.taxonomy.summary you will see:

    TreeNode   NumRep  Taxonomy
    243    2   Bacteria(100);"Firmicutes"(100);"Clostridia"(100);Clostridiales(100);"Ruminococcaceae"(100);Faecalibacterium(100);
    244    3   Bacteria(100);"Firmicutes"(100);"Clostridia"(100);Clostridiales(100);"Ruminococcaceae"(100);Faecalibacterium(100);
    245    4   Bacteria(100);"Firmicutes"(100);"Clostridia"(100);Clostridiales(100);"Ruminococcaceae"(100);Faecalibacterium(100);
    ...

The first column is the tree node label, the second column is the number
of descendants of the node and the third column is the consensus
taxonomy.

## name

The name parameter allows you add a names file with your taxonomy file.

    mothur > classify.tree(taxonomy=abrecovery.rdp.taxonomy, tree=abrecovery.phylip.tre, names=abrecovery.names) 

## group

The group parameter allows you to provide a group file. If a group file
is given, a consensus for each group will be given at each node.

    mothur > classify.tree(taxonomy=abrecovery.rdp.taxonomy, tree=abrecovery.phylip.tre, group=abrecovery.groups)

## cutoff

The cutoff parameter allows you to specify a consensus confidence
threshold for your taxonomy. The default is 51, meaning 51%. Cutoff
cannot be below 51.

    mothur > classify.tree(taxonomy=abrecovery.rdp.taxonomy, tree=abrecovery.phylip.tre, cutoff=80) 

## Revisions

-   1.24.0 - First introduced.
-   1.31.0 - Bug Fix: when names file is given everything is
    unclassified -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=2161&p=6116#p6116>
-   1.40.0 Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)

[Category:Commands](Category:Commands)
