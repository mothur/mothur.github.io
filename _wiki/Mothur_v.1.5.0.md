---


title: 'Mothur v.1.5.0'
---
Today, August 10, we are happy to be releasing [mothur
v.1.5.0](mothur_v.1.5.0). As you\'ll notice below, there
aren\'t any \"major\" updates in this release. Instead, we have fixed a
number of bugs and made a few minor modifications. Perhaps the most
significant update was provided by Gerhard Thallinger, a mothur user,
which dramatically accelerates the [cluster](cluster)
command. If you have any code you would like to contribute to mothur,
please let us know. Other useful features include the
[system](system) command, which allows you to run shell
commands from within mothur. In the next few releases, we hope to
include chimera checking functions (e.g. Pintail/Mallard and
Bellerophon) and classification functions.

A few announcements:

-   On August 14th the mothur wiki will be down for a week as we move
    the lab from the University of Massachusetts to the University of
    Michigan. The new address will be www.mothur.org. I don\'t know the
    exact date that we will have the wiki back up, so please check in
    with us towards the end of next week. We appreciate the support we
    have received from the folks at UMass and look forward to new
    adventures in Michigan.
-   We are still waiting to hear back from AEM and PLoS One regarding
    manuscripts I submitted describing mothur and the aligner.
    Hopefully, when the server is back up, I can give you some positive
    news about how to cite mothur in the future.
-   Since the last release, we hosted a workshop at UMass with \~25
    people and led a workshop at Penn State with 27 people. Both were a
    lot of fun and I enjoyed interacting with everyone. I have a few
    workshops lined up for the Fall and Spring at U of Hawaii and
    possibly the U of Tennessee. Hopefully, I\'ll be doing one in Ann
    Arbor as well. Other than that, I don\'t think I\'ll be able to do
    any other workshops until next summer. Just as a heads-up, in the
    future I may start charging a modest amount to compensate my wife
    and make sure that the people who sign up are serious about taking
    the workshop.

## Updates

-   [list.seqs](list.seqs) - reads one of the following file
    types: fasta, name, group or alignreport file and writes out the
    names of the sequences found within it.
-   [get.seqs](get.seqs) - reads an .accnos file and one of
    the following file types: fasta, name, group or alignreport file. It
    outputs a file containing only the sequences in the .accnos file.
-   [remove.seqs](remove.seqs) - reads an .accnos file and
    one of the following file types: fasta, name, group or alignreport
    file. It outputs a file containing the sequences NOT in the .accnos
    file.
-   [system](system) - Allow the user to enter system
    commands from within mothur.
-   added sorted option to [get.rabund](get.rabund).
-   improved clustering algorithm to increase speed with marginal memory
    cost \[thanks to Gerhard Thallinger\]
-   mothur can now read trees that include internal node labels (e.g.
    bootstrap values), but can only take in bifurcating trees.
-   read.otu with list and groups now outputs .rabund files instead of
    .list files.

## Bug fixes

-   fixed windows unable to open file error with filter.seqs.
-   fixed bug with help command.
-   fixed bug with batchfile input.
-   fixed bug that resulted in an infinite loop if user forgot ; in
    ScriptBatchEngine.
-   fixed bug in venn with 4 groups that gave inflated values.
-   fixed bug with aligner that occurred when template sequence names
    contained spaces.
-   fixed bug in simpson calculator that occurred whenever the number of
    sequences exceeded the maximum size of an int
