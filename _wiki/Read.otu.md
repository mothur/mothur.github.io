---
title: 'Read.otu'
---
NOTE: Starting with mothur version 1.18.0 the **read.otu** command no longer
exists. You can enter your file names directly into the commands that
use them. For example:

Instead of:

    mothur > read.otu(list=98_sq_phylip_amazon.fn.list)
    mothur > collect.single()

you would run:

    mothur > collect.single(list=98_sq_phylip_amazon.fn.list)

To make a shared file from a list and group file mothur now has a new
command [make.shared](make.shared).
