---


title: 'Cluster.fragments'
---
The [cluster.fragments](cluster.fragments) command groups
sequences that are part of a larger sequence. To run this tutorial
please download [ esophagus.fasta
file](Media:Esophagus.fasta.zip)

{% include toc.html %}

## Default settings

The cluster.fragments command expects a fasta-formatted file. A names
file may also be provided and when a sequence is determined to be a
fragment of a larger sequence, the list of names corresponding to the
sequence names will be merged. Let\'s take a look at the esophagus.fasta
file. It contains 710 sequences.

    mothur > unique.seqs(fasta=esophagus.fasta)

After running unique.seqs, we find that esophagus.unique.fasta contains
656 unique sequences. Now let\'s see if any of those sequences are
fragments of another sequence.

    mothur > cluster.fragments(fasta=esophagus.unique.fasta, name=esophagus.names)

or with a [ count file](Count_File):

    mothur > cluster.fragments(fasta=esophagus.unique.fasta, count=esophagus.count_table)

After running cluster.fragments, we find that 22 sequences were
fragments of larger sequences. Thus esophagus.unique.fragclust.fasta
contains 634 unique sequences.

## percent & diffs

The diffs parameter allows you to set the number of differences allowed,
default=0. The percent parameter allows you to set percentage of
differences allowed, default=0. percent=2 means if the number of
difference is less than or equal to two percent of the length of the
fragment, then cluster. You may use diffs and percent at the same time
to say something like: If the number or differences is greater than 1 or
more than 2% of the fragment length, don\'t merge.

## Explaining the output

Running the cluster.fragments command above will cause the following to
be outputted to the screen:

    0  656 0
    100    643 13
    200    639 17
    300    638 18
    400    635 21
    500    634 22
    600    634 22
    656    634 22

This output indicates, by column, the number of sequences processed, the
number of sequences that will be found in the final dataset, and the
number of sequences that have been clustered away. This should
accelerate as the function runs.

## What\'s the difference between [cluster.fragments](cluster.fragments) and [pre.cluster](pre.cluster "wikilink")?

-   Cluster.fragments: combine sequences that are pieces of a larger
    sequence
-   Pre.cluster: combine sequences that are within a certain number of
    diffs

Cluster.fragments was developed before pre.cluster. It has some of the
same basic ideas but slight variations. Cluster.fragments processes
unaligned sequences. It sorts them by sequence length and if there are
ties in length then by abundance. It then goes through the sequences
starting with the largest fragment as asks if each following sequence is
a fragment of itself. You can set parameters to determine what this
means, i.e. numdiffs, percentage differences. Mothur does a pairwise
alignment and counts the diffs merging fragments under the unique
sequence. This process is all very much like pre.cluster.

The differences:

Pre.cluster sorts by abundance only to determine the order. Pre.cluster
allows for clustering within samples, cluster.fragments does not.
Pre.cluster is parallelized. Pre.cluster works with both aligned and
unaligned sequences. Pre.cluster only uses diffs not percentages.
Pre.cluster allows you to set alignment methods and parameters for
unaligned sequences, cluster.fragments does not.

We use pre.cluster in our lab. The distinguishing feature to
cluster.fragments is the ability to sort unaligned sequences by length.

## Revisions

-   1.28.0 Added count parameter

[Category:Commands](Category:Commands)
