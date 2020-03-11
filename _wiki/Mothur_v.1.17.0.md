---
title: 'Mothur v.1.17.0'
---
February may be the shortest month of the year, but that doesn\'t keep
us from releasing two updates in the month! We are happy to announce the
release of [mothur v.1.17.0](mothur_v.1.17.0). We are excited
about the mothur workshop in Detroit next week and are already planning
for the next workshop towards the end of April, if you are interested in
learning more, please let me know.

This release has several new commands for performing hypothesis testing
to compare groups of samples including commands for performing the [
analysis of molecular variance](amova), [ test of homogeneity
of variance](homova), [ analysis of
similarity](anosim), and [ Mantel\'s
test](mantel). We previously discussed using [AMOVA and
HOMOVA with DNA sequences](https://www.ncbi.nlm.nih.gov/pubmed/18239608)
and are finally bringing that functionality to mothur for comparing
groups of samples.

Another important facet of this release relates to fixing a number of
critical bugs in how we were calculating the unifrac distances. If you
have previously used mothur\'s calculation of these values, please
re-calculate them with the latest version. We are unsure how significant
these bugs were to to people\'s analyses. Needless to say, we apologize
for any problems this may cause people and are very grateful to those
that have brought these problems to our attention. If you know of anyone
using mothur that isn\'t receiving these emails, please spread the word.

Thanks to all of you that have completed our survey. If you haven\'t
[completed it
yet](https://www.mothur.org/limesurvey/index.php?sid=13611&lang=en),
there is still time\...

## New commands

-   [amova](amova) - analysis of molecular variance
-   [homova](homova) - test the homogeneity of variance
-   [anosim](anosim) - analysis of similarity
-   [mantel](mantel) - Mantel\'s test of correlation between
    matrices
-   [make.fastq](make.fastq) - make your own fastq files

## Feature updates

-   [chimera.slayer](chimera.slayer) - added split parameter
-   [unifrac.weighted](unifrac.weighted) and
    [unifrac.unweighted](unifrac.unweighted) - added the root
    parameter

## Bug fixes

-   [catchall](catchall) command not finding files -
    <https://www.mothur.org/forum/viewtopic.php?f=3&t=1114>
-   [sub.sample](sub.sample) command that caused mothur to
    stall if size was close to total number of sequences in file.
-   unifrac commands - significance scores differing between multiple
    processors or one processors if the number of comparisons was less
    than the number of processors used.
-   unifrac commands that occurred if trees were unrooted.

## Other stuff

-   added \[ERROR\] flag when a command aborts
