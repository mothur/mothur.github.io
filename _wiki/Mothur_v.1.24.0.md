---


title: 'Mothur v.1.24.0'
---
We are happy to announce the release of [mothur
v.1.24.0](mothur_v.1.24.0)! In this release we have three new
commands that we think you\'ll find useful. Perhaps the most significant
is the addition of [otu.association](otu.association), which
will use a shared or relabund file to create a matrix of correlation
values indicating the association between different OTUs. Just remember
that association is not the same as causation :). We\'ve also added
[classify.tree](classify.tree) which will take a tree and
classification data as input and will output the consensus taxonomy at
each node and [sort.seqs](sort.seqs), which will sort files
for you. We\'ve also added a number of important feature updates
including the addition of p-values to the output from
[corr.axes](corr.axes). We are very much indebted to the
great feedback we\'ve been getting through the forum and this feedback
is the inspiration of many of the newest commands and features that
we\'ve added. Thanks!

As I emailed you earlier in the month we\'ve also made a number of
project-related changes. First, you can now pull down the bleeding-edge
version of mothur whenever you want via GitHub. We look forward to more
interaction with other developers and hope this will foster even greater
collaboration. Second, we\'ve added the new RDP training sets. In the
next release, look for a command that will allow you to trim the
training set sequences to only include the region you are interested in.
Also, be on the lookout in the next few weeks for an updated SILVA
reference alignment.

Keep the mothur citations coming and you know where to send the six
packs!

{% include toc.html %}

## New commands

-   [otu.association](otu.association) - calculate the
    correlation coefficient between the otus in a shared/relabund file.
-   [sort.seqs](sort.seqs) - puts sequences from a fasta,
    name, group, quality, flow or taxonomy file in the same order.
-   [classify.tree](classify.tree) - finds the consensus
    taxonomy for each tree node\'s descendants.

## Feature updates

-   [merge.groups](merge.groups) - added group option -
    <http://www.mothur.org/forum/viewtopic.php?f=5&t=1436#p3586>
-   [classify.seqs](classify.seqs) - mothur will now check to
    see if the sequence is reversed before classifying.
-   [fastq.info](fastq.info) - added fasta and qfile
    parameters - <http://www.mothur.org/forum/viewtopic.php?f=5&t=1444>
-   [corr.axes](corr.axes) - added p\_values
-   [remove.groups](remove.groups) and
    [get.groups](get.groups) - added design file
-   [trim.seqs](trim.seqs) and
    [trim.flows](trim.flows) - added ldiffs and sdiffs
    options. You can now include linker and spacer information in the
    oligos file.
-   [trim.seqs](trim.seqs) - added keepforward option, allows
    you to identify but not remove the forward primer. Default=F.
-   [filter.seqs](filter.seqs),
    [trim.seqs](trim.seqs),
    [screen.seqs](screen.seqs),
    [pairwise.seqs](pairwise.seqs),
    [dist.shared](dist.shared),
    [metastats](metastats) and
    [summary.shared](summary.shared) - paralellized for
    windows
-   [sffinfo](sffinfo) - flow default changed to true, added
    a warning about corrupted sff files.

## Bug fixes

-   [classify.otu](classify.otu) - if your input taxonomy
    file contained confidence scores with decimal points mothur failed
    to remove them before adding classify.otus confidences (was in
    1.23.1).
-   [classify.seqs](classify.seqs) - knn method was
    eliminating sequences that could not be classified at the kingdom
    level. Now they are classified to \"unknown\". -
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=1435>
-   fixed name of npshannon -
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=1449>
-   <http://www.mothur.org/forum/viewtopic.php?f=3&t=1469&p=3719#p3719> -
    put the full path names into the flow.files file.
-   [trim.flows](trim.flows) - was not trimming the fasta
    output -
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=1491&p=3784#p3784>
-   [summary.seqs](summary.seqs) - in windows version, with
    multiple processors, occasionally you would get a crash.
-   [rarefaction.single](rarefaction.single) - group names
    parsing issue if your group names contain \'.\' and groupmode=t.

## Wiki updates

-   Uploaded new version 7 of RDP classification
-   We now provide a public version of the code repository on GitHub
    under the name mothur

## Registered users

2132
