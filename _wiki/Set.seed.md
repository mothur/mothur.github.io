---
title: 'Set.seed'
---
The **set.seed** command is used to seed random.


### Default Options

The only parameter is seed, and it is required.

    mothur > set.seed(seed=98765)

### Options

Mothur also allows you to set the random seed on any command. This will
change the seed globally. For example:

    mothur > rarefaction.single(shared=98_lt_phylip_amazon.fn.shared, seed=98765)

### Revisions

-   1.36.0 - First Introduced

[Category:Commands](Category:Commands)
