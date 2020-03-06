---


title: 'Phylotype'
---
The phylotype command can be used to assign sequences to OTUs based on
their taxonomy and outputs a .list, .rabund and .sabund files. To run
through the example below, download [Taxonomy
Files](Media:TaxonomyFiles.zip).


{% include toc.html %}

## Default settings

In order to run the phylotype() command, you need to generate a taxonomy
file. You can do this using the
[classify.seqs](classify.seqs) command, enter the following
command:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=silva.bacteria.fasta, taxonomy=silva.full.taxonomy)
    mothur > phylotype(taxonomy=abrecovery.taxonomy)

This command will generate the following output:

    mothur > phylotype(taxonomy=abrecovery.taxonomy)
    1
    2
    3
    4
    5
    6
    7
    8
    9

Outputted to the screen is a level, 1 meaning the most specific taxonomy
given.

Opening abrecovery.tx.list you would see the output as:

    1  35      AY457915,AY457912,AY457898,AY457895,AY457894 ...            
    2  35  AY457915,AY457912,AY457898,AY457895,AY457894,AY457891,AY457869 ... 
    3  32  AY457915,AY457914,AY457912,AY457898,AY457895,AY457894,AY457891 ...      
    4  25  AY457915,AY457914,AY457912,AY457898,AY457895,AY457894,AY457891,AY457888 ...
    5  15  AY457915,AY457914,AY457913,AY457912,AY457908,AY457901,AY457898,AY457895 ...
    6  11  AY457915,AY457914,AY457913,AY457912,AY457908,AY457901,AY457898,AY457895 ...
    7  8   AY457915,AY457914,AY457913,AY457912,AY457911,AY457910,AY457908,AY457901,AY457898 ...
    8  5   AY457915,AY457914,AY457913,AY457912,AY457911,AY457910,AY457908,AY457901,AY457898 ...
    9  1   AY457915,AY457914,AY457913,AY457912,AY457911,AY457910,AY457909,AY457908,AY457907 ...

## Options

### label

The labels count up from the leaves to the root of the phylotree. There
may only be a couple of level in your phylotree that you are interested
in seeing. You can use the label option to specific the levels you would
like. If you want the data for the lines labeled unique, 1, 3 and 5 you
would enter:

    mothur > phylotype(taxonomy=abrecovery.taxonomy, label=1-3-5)
    1
    3
    5

Opening abrecovery.tx.list you would see the output as:

    1  35      AY457915,AY457912,AY457898,AY457895,AY457894 ...            
    3  32  AY457915,AY457914,AY457912,AY457898,AY457895,AY457894,AY457891 ...      
    5  15  AY457915,AY457914,AY457913,AY457912,AY457908,AY457901,AY457898,AY457895 ...

### cutoff

The cutoff parameter counts up from the root to the leaves of the
phylotree. The cutoff parameter can be used to truncate the depth of the
taxonomy you are interested in.

    mothur > phylotype(taxonomy=abrecovery.taxonomy, cutoff=6)
    1
    2
    3
    4
    5
    6

Opening abrecovery.tx.list you would see the output as:

    1  25  AY457915,AY457914,AY457912,AY457898,AY457895,AY457894,AY457891,AY457888 ...
    2  15  AY457915,AY457914,AY457913,AY457912,AY457908,AY457901,AY457898,AY457895 ...
    3  11  AY457915,AY457914,AY457913,AY457912,AY457908,AY457901,AY457898,AY457895 ...
    4  8   AY457915,AY457914,AY457913,AY457912,AY457911,AY457910,AY457908,AY457901,AY457898 ...
    5  5   AY457915,AY457914,AY457913,AY457912,AY457911,AY457910,AY457908,AY457901,AY457898 ...
    6  1   AY457915,AY457914,AY457913,AY457912,AY457911,AY457910,AY457909,AY457908,AY457907 ...

Level 1 was level 4 without the cutoff, but now the most specific
taxonomy given has changed since we truncated the tree.

### name

The name option allows you to add a names file so your list file will
contain all your sequences, not just the unique ones.

    mothur > phylotype(taxonomy=abrecovery.taxonomy, name=abrecovery.names)

## Revisions

-   1.25.0 - the numOtus in the list file is one to high. Otus are
    clustered correctly, the count is just off.
-   1.25.0 - only clustering at leaf nodes, level 1.
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)

[Category:Commands](Category:Commands)
