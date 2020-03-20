---
title: 'mothur v.1.15.0'
redirect_from: '/wiki/Mothur_v.1.15.0.html'
---
We are happy to announce the release of [Mothur
v.1.15.0](/wiki/Mothur_v.1.15.0) in honor of Bret Favre finally
ending his consecutive game streak (and hopefully his career). Although
impressive, he really should have hung up the shoulder pads back when we
were postdocs. Regardless, mothur isn't going anywhere.

Our latest release includes a number of exciting new commands to help
with data processing and analysis. First, a number of people have asked
for the "classic" form of the clustering algorithms that was
originally implemented in DOTUR; this has been implemented as the
[cluster.classic](/wiki/cluster.classic) command. Second, we have
also created the Catchall command that wraps John
Bunge's CatchAll program for using parametric models to estimate
community richness. Third, methods for performing indicator analyses
have been on our radar for awhile and we are happy to finally add
[indicator](/wiki/indicator) to the stable of mothur commands.
Fourth, to complement the
[normalize.shared](/wiki/normalize.shared) command we have added
the [sub.sample](/wiki/sub.sample) command, which randomly selects
a subsample of sequences from each group so they all have the same
number of sequences. Fifth, at the suggestion of some users, we have
created the [consensus.seqs](/wiki/consensus.seqs) command to
generate a consensus sequence for a list of sequences, OTUs or
phylotypes. Finally, several utility commands such as
[remove.groups](/wiki/remove.groups),
[get.groups](/wiki/get.groups), [get.otus](/wiki/get.otus),
[remove.otus](/wiki/remove.otus) have been added to make data
processing added. As always, we have also added a number of smaller
features to existing commands and cured a few bugs. These are generally
all suggested by users and we appreciate your continued support and
feedback. We are always curious to hear how people are using the
software and what we can do to make input and output more useful. Our
goal is to help you take raw data and get it into a format that you can
use to do science. If we aren't doing that for you, let us know!

Once again, Pat is thinking about hosting one or two workshops this
Spring in the Detroit/Ann Arbor area with a slightly different format.
They would start on a Thursday evening and then go full days on Friday
and Saturday. If you are interested, please let us know and suggest some
weekends that would work best for you.

Be sure to pad your CV as much as possible with papers that cite mothur
between now and the end of 2010 and get ready for an exciting 2011. Keep
the [six packs](https://leinie.com) coming

## New commands

-   [cluster.classic](/wiki/cluster.classic) - clustering method
    from dotur
-   Catchall command - wrapper for the catchall
    program
-   [indicator](/wiki/indicator) command - identify indicator
    "species" for nodes on a tree
-   [consensus.seqs](/wiki/consensus.seqs) command - finds a
    consensus sequence for each OTU or phylotype
-   [sub.sample](/wiki/sub.sample) - create a file containing a
    sub-sampling of sequences
-   [remove.groups](/wiki/remove.groups) /
    [get.groups](/wiki/get.groups) - get or remove sequences from a
    specific group or set of groups
-   [get.otus](/wiki/get.otus) /
    [remove.otus](/wiki/remove.otus) - get or remove otus
    containing sequences from a specified group or set of groups.

## Feature updates

-   [cluster](/wiki/cluster) and hcluster -
    added weighted method
-   [get.seqs](/wiki/get.seqs) and
    [remove.seqs](/wiki/remove.seqs) - added qfile parameter
-   [make.group](/wiki/make.group) - added output parameter
-   [unifrac.unweighted](/wiki/unifrac.unweighted) and
    [unifrac.weighted](/wiki/unifrac.weighted) - modified the
    inputs for the distance parameter
-   [get.lineage](/wiki/get.lineage) and
    [remove.lineage](/wiki/remove.lineage) - change default for
    dups parameter in to true if a name file is given
-   [trim.seqs](/wiki/trim.seqs) - added group parameter
-   added strip command to mothur's makefile to reduce the size of the
    executable
-   [parsimony](/wiki/parsimony) - added processors option for
    parallelization
-   [get.oturep](/wiki/get.oturep) - added weighted parameter
-   [sffinfo](/wiki/sffinfo) - added XY coordinates and run time
    timestamps to the output.

## Bug fixes

-   [unifrac.weighted](/wiki/unifrac.weighted) - bug introduced in
    version 1.14.0.
-   [classify.seqs](/wiki/classify.seqs) - bug where summary file
    not printing last level's summary info has been fixed
