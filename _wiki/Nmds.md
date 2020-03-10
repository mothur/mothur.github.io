---
title: 'Nmds'
---
The **nmds** command is modelled after the **nmds** code
written in R by Sarah Goslee, using Non-metric multidimensional scaling
function using the majorization algorithm from Borg & Groenen 1997,
Modern Multidimensional Scaling.


## Default settings

A [phylip-formatted distance
matrix](phylip-formatted_distance_matrix) must be inputted
for **nmds** to be successful.

    mothur > nmds(phylip=98_sq_phylip_amazon.dist)

## Options

### axes

The axes parameter allows you to enter a file containing a starting
configuration. By default mothur will generate a random starting
configuration.

### mindim

The mindim parameter allows you to select the minimum dimensions to use.
Default=2

### maxdim

The maxdim parameter allows you to select the maximum dimensions to use.
Default=2

### maxiters

The maxiters parameter allows you to select the maximum number of iters
to try with each random configuration. Default=500

### iters

The iters parameter allows you to select the number of random
configuration to try. Default=10.

### epsilon

The epsilon parameter allows you to select set an acceptable stopping
point. Default=1e-12.

## Revisions

-   1.33.0 Added group label to \*.axes file. -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=2677>

[Category:Commands](Category:Commands)
