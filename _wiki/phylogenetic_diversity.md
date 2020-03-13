---
title: 'Phylogenetic diversity'
redirect_from: '/wiki/Phylogenetic_diversity'
---
## inputs

### required

-   run read.tree command

### optional

-   rarefy = T/\[f\]
-   freq = 100
-   iters - if rarefy
-   groups - select specific groups

## method

default - calculate the branch length in a tree (as a fraction of the
total number of sequences???) in the tree rarefy=T - perform pd
calculation by starting with an empty tree and adding each sequence
(based on freq). keep track of pd as a function of sampling effort and
produce rarefaction data group - because each tree might represent
numerous groups of sequences, the group file will perform calculations
for each group separately name - a tree may only represent the unique
sequences and the name file would bring in the redundant names
