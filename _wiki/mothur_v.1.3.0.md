---
title: 'mothur v.1.3.0'
redirect_from: '/wiki/Mothur_v.1.3.0.html'
---
We are happy to release [mothur v.1.3.0](/wiki/mothur_v.1.3.0)
today, May 25, 2009. Since the April release we have added an additional
nearly 100 users. Thanks to the 347 of you for your continued support!
It was great to meet so many people at the 2009 ASM General Meeting in
Philadelphia, PA and to hear what people are up to. The skinny on [ my
poster](https://mothur.s3.us-east-2.amazonaws.com/wiki/asmposter.pdf) is that I reanalyzed the Sogin
pyrosequencing dataset of 222,000 V6 tags in under 6 hrs on my Mac
laptop. Most of that time was spent calculating the pairwise distances,
which we have parallelized so you can use up to 4 processors.

This release gets us ever closer to having a complete pyrosequencing
pipeline. We have added tools to [ filter](/wiki/filter.seqs) out
user-specified columns from an alignment file, [ calculate pairwise
distances](/wiki/dist.seqs) from an alignment file using multiple
processors, generate a [ pairwise distance
matrix](/wiki/dist.shared) and [ newick-formatted
tree](/wiki/tree.shared) to describe the similarity between
communities. We have added an additional four calculators, which [
predict the number of additional OTUs that would be observed with
further
sampling](/wiki/calculators#estimates-of-number-of-additional-otus-observed-with-extra-sampling)
and we have made use of Anne Chao's recent modifications to the [
shared Chao estimator](/wiki/sharedchao) to estimate the shared
richness between two or more communities. For those of you using [ batch
files](/wiki/Batch_mode), it is now possible to annotate your file
with comments by making the first character of a line '\#'. Finally,
we have tried to iron out a few pesky bugs. Looking forward to the
Fathur's Day release, we are planning on introducing an aligner that is
as good or better than the SILVA, NAST, or RDP aligners, but
considerably faster plus a number of additional features. If you would
like to help us evaluate the aligner, please email me.

Those of you that have been with us since February know that I have been
engaged in two open-source experiments. First, in the [ last
release](/wiki/Mothur_v.1.2.0) I mentioned that if people made a
substantive contribution to the wiki or contribute code, then I would
include them as a co-author on the mothur manuscript that I will submit
this summer. [ several people](/wiki/Analysis_examples) have taken
me up on this by generating wiki pages describing how they have used
mothur and other tools to analyze their data. If you are interested in
contributing and being a co-author, please make your contribution by
July 1. Please email me with any questions. Second, I have made myself
an open-source resource by providing [workshops](/wiki/workshops)
free of charge (except my travel expenses). I'm about to go to the
University of British Columbia for a workshop and later in the summer
I'll be at the Microbial Diversity course at Woods Hole and then Penn
State University. If you are interested in coming to Amherst to
participate in the workshop (and why else would you come to Amherst?)
please let me know. I'm thinking of offering the workshop here in July.
If you're thinking of flying - the closest airport is Hartford, CT
(BDL), which is about an hour away.

My apologies to those of you looking for . mothur's Day release earlier
in May. It was a golden opportunity to further milk the name, but so it
goes. But you can look forward to a Fathur's Day release.


## Minor updates

-   Can use a \# to comment out lines in a [ batch
    file](/wiki/Batch_mode).

## Major updates

-   The [filter.seqs](/wiki/filter.seqs) command - Remove select
    columns from an alignment by removing any column that has a specific
    character in it, a minimum base frequency, or a user-supplied filter
-   The [dist.seqs](/wiki/dist.seqs) command - Generate a
    column-formatted sequence-based pairwise distance matrix
-   The [dist.shared](/wiki/dist.shared) command - Generate a
    phylip-formatted community-based pairwise distance matrix
-   The [tree.shared](/wiki/tree.shared) command - Generate a
    newick-formatted tree file comparing the membership or structure of
    multiple communities

## Calculators

-   [sharedchao](/wiki/sharedchao) - updated richness estimator for
    N≥2; incorporated into calculating 3- and 4-way Venn diagrams
-   [boneh](/wiki/boneh) - Boneh's estimator to determine how many
    how many new species would be observed with additional sampling
-   [efron](/wiki/efron) - Efron's estimator to determine how many
    how many new species would be observed with additional sampling
-   [shen](/wiki/shen) - Shen's estimator to determine how many
    how many new species would be observed with additional sampling
-   [solow](/wiki/solow) - Solow's estimator to determine how many
    how many new species would be observed with additional sampling

## Bug fixes

-   Got rid of weird output to screen when running
    [collect.single](/wiki/collect.single) or using the npshannon
    calculator
-   Fixed bug that would not permit freq=1
-   Fixed file error with
    [rarefaction.single](/wiki/rarefaction.single) and
    [rarefaction.shared](/wiki/rarefaction.shared)
-   Fixed how scaling worked on heatmap
-   Patched up a number of memory leaks and other memory problems
-   Modified many of the \*.shared commands to be much faster
