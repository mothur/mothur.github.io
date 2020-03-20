---
title: 'mothur v.1.22.0'
redirect_from: '/wiki/Mothur_v.1.22.0.html'
---
After a three month layoff, we are happy to announce the release of
[mothur v.1.22.0](/wiki/mothur_v.1.22.0). A lot has been going on
around here (including the "release" of a new Schloss son) so don't
think we're slacking!

There are a number of important updates to mothur that you are sure to
enjoy. First, to mark the acceptance of a manuscript in PLoS ONE
describing a sequence analysis pipeline we are now announcing the
presence of several commands - [trim.flows](/wiki/trim.flows),
[shhh.flows](/wiki/shhh.flows), and
[seq.error](/wiki/seq.error); [shhh.flows](/wiki/shhh.flows)
is our implementation of Chris Quince's PyroNoise algorithm and
[seq.error](/wiki/seq.error) allows you to compare mock community
sequence data to reference sequences to measure error rates. Second, we
have also added a number of features to various commands that you are
sure to find useful. For example, it is now possible to give a group
file to pre.cluster and the chimera checking tools to perform those
algorithms on a sample-by-sample basis. The results should be
comparable, but this is a more elegant way of doing the analyiss and you
will be rewarded by the ability to parallelize the operations and make
the overall process much faster. Third, Window's users will be happy to
learn that we are in the process of parallelizing all of the appropriate
commands. This release allows windows users to parallelize
[align.seqs](/wiki/align.seqs), [dist.seqs](/wiki/dist.seqs),
[summary.seqs](/wiki/summary.seqs), and
[classify.seqs](/wiki/classify.seqs). This list will grow in future
releases.

We are also no longer going to update the [Costello stool
analysis](/wiki/Costello_stool_analysis) pipeline. This was
necessary because the original data did not provide the flowgram data
making it impossible to implement our new pipeline, which incorporates
[shhh.flows](/wiki/shhh.flows). So, the new pipeline, which is
described in the PLoS ONE manuscript, is described at the [Schloss
SOP](/wiki/454_SOP) wiki page. This is the culmination of many
years of effort and we are happy to have this behind us! The upshot is
that we were able to reduce the error rate from \~0.8% to \~0.01%. If
you would like a copy of the manuscript before it is posted online,
please shoot us an email. We will be running another workshop in
Michigan from December 19-21 that will provide all the fine points of
this pipeline, available options, and how to modify it for your
analysis. If you or anyone in your lab would be interested in attending
let us know.

As always, keep the citations coming! :)

Pat Schloss

## New commands

-   [trim.flows](/wiki/trim.flows) - trim flowgram data to get
    ready to run through shhh.flows
-   [shhh.flows](/wiki/shhh.flows) - the mothur-based
    re-implementation of PyroNoise (this had been hidden as shhh.seqs in
    earlier versions)
-   [seq.error](/wiki/seq.error) - a function that assesses error
    rates in sequencing data
-   [summary.tax](/wiki/summary.tax) - summarizes taxonomy file.
-   [count.groups](/wiki/count.groups) - counts the number of
    sequence in a given group or set of groups

## Feature updates

-   [align.seqs](/wiki/align.seqs),
    [dist.seqs](/wiki/dist.seqs),
    [summary.seqs](/wiki/summary.seqs),
    [classify.seqs](/wiki/classify.seqs) - added multiple
    processors option for Windows users
-   [make.shared](/wiki/make.shared) - removed ordergroup parameter
-   [sub.sample](/wiki/sub.sample) - improved speed for sampling of
    fasta and list files
-   [rarefaction.single](/wiki/rarefaction.single) - single output
    file for each rarefaction calculator when running with a shared
    file.
-   [sub.sample](/wiki/sub.sample) - now outputs a unique fasta
    file and new name file
    (https://forum.mothur.org/viewtopic.php?f=4&t=1299)
-   [unique.seqs](/wiki/unique.seqs) - name file prints in same
    order as fasta file
-   [summary.seqs](/wiki/summary.seqs) - added a column indicating
    the number of sequences represented by the different cutoffs in the
    output
-   [summary.seqs](/wiki/summary.seqs) - added mean values to
    output
-   [pre.cluster](/wiki/pre.cluster) - added group and bygroup
    parameters
-   [chimera.uchime](/wiki/chimera.uchime) - added group parameter
    to so that when checking with reference=self, you can check on a
    bygroup basis. When using reference=self and a group file, you can
    also use multiple processors.
-   [chimera.slayer](/wiki/chimera.slayer) - added group parameter
    to so that when checking with reference=self, you can check on a
    bygroup basis.
-   [cluster.split](/wiki/cluster.split) - changed default cutoffs
    for command. cutoff=0.25 and taxlevel=3.
-   added leading '0' to OTU number labels. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1284](https://forum.mothur.org/viewtopic.php?f=5&t=1284)

## Bug fixes

-   1.21.1 - fixed bug with labels in [parsimony](/wiki/parsimony)
    command.
-   1.21.1 - [cluster.split](/wiki/cluster.split) - if your number
    of split files was less than the number of processors, the command
    crashed.
-   added checking for mismatches between phylip and design files for
    [amova](/wiki/amova), [homova](/wiki/homova) and
    [anosim](/wiki/anosim) commands.
-   fixed colors for [heatmap.sim](/wiki/heatmap.sim) - colors
    seemed reversed after change to calculators to output distance
    instead of similarity. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1293](https://forum.mothur.org/viewtopic.php?f=4&t=1293)
-   fixed issue with [system](/wiki/system) command that occurred
    when file redirects were used.
-   fixed bug with Root level values in tax.summary file. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1316](https://forum.mothur.org/viewtopic.php?f=4&t=1316)
-   1.22.2 fixed bug with [metastats](/wiki/metastats)

## Wiki updates

-   Added the [454 SOP](/wiki/454_SOP) for analyzing 16S
    rRNA gene pyrosequencing sequence data. This now supersedes the
    earlier [Costello stool
    analysis](/wiki/Costello_stool_analysis) pipeline.
