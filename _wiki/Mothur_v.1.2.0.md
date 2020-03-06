---


title: 'Mothur v.1.2.0'
---
We are happy to release [mothur v.1.2.0](mothur_v.1.2.0)
today, April 24, 2009. Since our last release we have nearly doubled the
number of mothur users. Thanks to the 258 of you for your continued
support! This is a very exciting release. First, by making the libshuff
algorithm available in mothur, we have now replaced each of our previous
tools with a more flexible implementation in mothur. For example, in
s-libshuff you needed to sort your matrix prior to input, which was a
pain. Now, with the [libshuff](libshuff) command this is no
longer necessary as you can instead provide a group file. Second, now
that we have finished the old stuff, we are moving into newer ventures.
In this release we provide four new commands which will enable you to
generate [ heat maps](heatmap.bin) representing
rank-abundance data, generate [ venn](venn) diagrams, [
obtain representative sequences](get.oturep) from each OTU,
and generate a file that is [ labelled and sorted](bin.seqs)
according to a list file. Third, we are now ready to start working on a
manuscript describing mothur.

I would like you to consider helping me with an experiment. It is very
important to me that I engage the broader microbial ecology community in
this project. One way that anyone can help out would be to contribute
text to the wiki. There are at least three ways that almost anyone could
help. First, if you look around our pages you\'ll notice a lack of
images and references. We are up to about 85 pages on the wiki and I
don\'t know that I can \"beautify\" these pages on my own. Second, the
pages describing the calculators are very dry and missing from them is a
discussion of why one is better than the other and some of the theory
that explains what the calculator is trying to do. Third, people learn
from example and find it very helpful to copy someone else\'s work to
learn how to use a piece of software. This month I have posted a page
describing an [esophageal community
analysis](esophageal_community_analysis). I would love to
have more of these pages for people to look at and learn from. But the
problem with getting people to contribute to such an endeavor is how to
reward and give credit to contributors. So here\'s an offer that no
junior scientist should turn down. If you make a significant
contribution to the wiki, I will add your name to a publication we are
preparing that describes mothur. My goal is to submit a manuscript
sometime during the summer. By significant contribution, I mean
something of the magnitude of a full page or more, not fixing someone
else\'s typos. Authorship order will be determined by the level of
contribution. If you have any questions, please do not hesitate to be in
touch.

If you are going to Philadelphia for the 2009 ASM meeting, please stop
by our poster, \"Introducing mothur: A Computational Toolbox for
Describing and Comparing Microbial Communities.\" I will be presenting
the poster in the **Molecular Microbial Ecology - Communities - I**
session on May 18th at 1:00 PM. The presentation number is N-099. I
would love to get your feedback and suggestions. I have benefited
enormously by the workshops I have given in the last few months at the
University of Massachusetts, University of Wisconsin, and Louisiana
State University and am looking forward to visiting with folks at the
University of Brittish Columbia, Pennsylvania State University, and
possibly Hawaii in the coming months. We are very excited about this
project and have a lot of plans for future releases. We are well on our
way to implementing a version of the NAST aligner, a distance calculator
function, a function to generate dendrograms based on community
similarity, and additional calculators.

## Major Feature Additions

-   [libshuff](libshuff) - carry out a libshuff analysis
    using the discrete or integral form with a group file
-   [heatmap.bin](heatmap.bin) - generate a heatmap of the
    relative abundance for single or multiple samples
-   [venn](venn) - generate a Venn diagram using the observed
    or estimated richness for up to 4 groups
-   [bin.seqs](bin.seqs) - output a fasta-formatted sequence
    file with the OTU membership for each sequence
-   [get.oturep](get.oturep) - output a fasta-formatted
    sequence file with a representative sequence for each OTU

## Minor Feature Additions

-   modified [ read.dist](read.dist#The_group_option) to read
    matrix for libshuff command
-   New [calculators](calculators):
    -   [chao](chao) - updated the formulae to reflect what
        is done in EstimateS
    -   [logseries](logseries) - test whether observed data
        follow the log series distribution
    -   [geometric](geometric) - test whether observed data
        follow the geometric series distribution
    -   [bstick](bstick) - tests whether observed data follow
        the broken stick distribution
    -   [qstat](qstat) - the Q Statistic
    -   [bergerparker](bergerparker) - the Berger-Parker
        index
    -   [nseqs](nseqs) - the number of sequences in a sample
    -   [coverage](coverage) - the coverage of the sample
    -   [whittaker](whittaker) - the Whittaker similarity
        index
    -   [sharednseqs](sharednseqs) - the number of sequences
        in the two samples
    -   [anderberg](anderberg) - the Anderberg index
    -   [braycurtis](braycurtis) - the Bray-Curtis similarity
        index
    -   [kulczynski](kulczynski) - the Kulczynski index
    -   [kulczynskicody](kulczynskicody) - the
        Kulczynski-Cody index
    -   [lennon](lennon) - the Lennon similarity index
    -   [morisitahorn](morisitahorn) - the Morista-Horn
        similarity index
    -   [ochiai](ochiai) - the Ochiai similarity index

## Wiki Improvements

-   Added manual calculations and mothur output for all of the
    [calculators](calculators) available in mothur
-   Added the [esophageal community
    analysis](esophageal_community_analysis) page as an
    example case study of how to use mothur to analyze community
    sequence data
