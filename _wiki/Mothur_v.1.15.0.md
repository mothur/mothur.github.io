---
title: 'Mothur v.1.15.0'
---
We are happy to announce the release of [Mothur
v.1.15.0](Mothur_v.1.15.0) in honor of Bret Favre finally
ending his consecutive game streak (and hopefully his career). Although
impressive, he really should have hung up the shoulder pads back when we
were postdocs. Regardless, mothur isn\'t going anywhere.

Our latest release includes a number of exciting new commands to help
with data processing and analysis. First, a number of people have asked
for the \"classic\" form of the clustering algorithms that was
originally implemented in DOTUR; this has been implemented as the
[cluster.classic](cluster.classic) command. Second, we have
also created the [catchall](catchall) command that wraps John
Bunge\'s CatchAll program for using parametric models to estimate
community richness. Third, methods for performing indicator analyses
have been on our radar for awhile and we are happy to finally add
[indicator](indicator) to the stable of mothur commands.
Fourth, to complement the
[normalize.shared](normalize.shared) command we have added
the [sub.sample](sub.sample) command, which randomly selects
a subsample of sequences from each group so they all have the same
number of sequences. Fifth, at the suggestion of some users, we have
created the [consensus.seqs](consensus.seqs) command to
generate a consensus sequence for a list of sequences, OTUs or
phylotypes. Finally, several utility commands such as
[remove.groups](remove.groups),
[get.groups](get.groups), [get.otus](get.otus "wikilink"),
[remove.otus](remove.otus) have been added to make data
processing added. As always, we have also added a number of smaller
features to existing commands and cured a few bugs. These are generally
all suggested by users and we appreciate your continued support and
feedback. We are always curious to hear how people are using the
software and what we can do to make input and output more useful. Our
goal is to help you take raw data and get it into a format that you can
use to do science. If we aren\'t doing that for you, let us know!

Once again, Pat is thinking about hosting one or two workshops this
Spring in the Detroit/Ann Arbor area with a slightly different format.
They would start on a Thursday evening and then go full days on Friday
and Saturday. If you are interested, please let us know and suggest some
weekends that would work best for you.

Be sure to pad your CV as much as possible with papers that cite mothur
between now and the end of 2010 and get ready for an exciting 2011. Keep
the [six packs](https://leinie.com/red.html) coming

## New commands

-   [cluster.classic](cluster.classic) - clustering method
    from dotur
-   [catchall](catchall) command - wrapper for the catchall
    program
-   [indicator](indicator) command - identify indicator
    \"species\" for nodes on a tree
-   [consensus.seqs](consensus.seqs) command - finds a
    consensus sequence for each OTU or phylotype
-   [sub.sample](sub.sample) - create a file containing a
    sub-sampling of sequences
-   [remove.groups](remove.groups) /
    [get.groups](get.groups) - get or remove sequences from a
    specific group or set of groups
-   [get.otus](get.otus) /
    [remove.otus](remove.otus) - get or remove otus
    containing sequences from a specified group or set of groups.

## Feature updates

-   [cluster](cluster) and [hcluster](hcluster "wikilink") -
    added weighted method
-   [get.seqs](get.seqs) and
    [remove.seqs](remove.seqs) - added qfile parameter
-   [make.group](make.group) - added output parameter
-   [unifrac.unweighted](unifrac.unweighted) and
    [unifrac.weighted](unifrac.weighted) - modified the
    inputs for the distance parameter
-   [get.lineage](get.lineage) and
    [remove.lineage](remove.lineage) - change default for
    dups parameter in to true if a name file is given
-   [trim.seqs](trim.seqs) - added group parameter
-   added strip command to mothur\'s makefile to reduce the size of the
    executable
-   [parsimony](parsimony) - added processors option for
    parallelization
-   [get.oturep](get.oturep) - added weighted parameter
-   [sffinfo](sffinfo) - added XY coordinates and run time
    timestamps to the output.

## Bug fixes

-   [unifrac.weighted](unifrac.weighted) - bug introduced in
    version 1.14.0.
-   [classify.seqs](classify.seqs) - bug where summary file
    not printing last level\'s summary info has been fixed
