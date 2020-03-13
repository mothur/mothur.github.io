---
title: 'Mothur v.1.21.0'
redirect_from: '/wiki/Mothur_v.1.21.0.html'
---
We are happy to announce the release of [mothur
v.1.21.0](mothur_v.1.21.0). This release has a few small and
important updates. First, we have completely rewritten the
[metastats](metastats) command to overcome numerous issues
that have been detected in the original code provided by the developers.
Second, we modified the [indicator](indicator) command to
make its use more flexible and to include p-values to describe the
significance of an indicator\'s strength. Third, it is now possible to
store a reference database in memory so that you can run a command (e.g.
classify.seqs) multiple times without having to re-load the database.
This may be useful for people that want to develop web-based
implementations of the classifier; the memory can be cleared with the
new [clear.memory](clear.memory) command. Third, we are now
providing a 64-bit Windows version of the executable and hope to add
parallelization for our windows users in the next release. Finally,
there are a number of bug fixes and small feature updates that have been
made.

Please keep your comments coming in via the forum, emails, and facebook.
People have given us a lot of helpful suggestions and feedback through
these mechanisms and hopefully everyone finds us pretty responsive.
August will be a busy month as Pat will be participating in the STAMPS
course at the Marine Biology Laboratory and will be hosting his own
workshop in Detroit, MI. Spaces are still available for the Detroit
workshop. Hopefully, he\'ll cross paths with some of you soon!

## New commands

-   [clear.memory](clear.memory) - removes saved reference
    data from memory

## Feature updates

-   [indicator](indicator) - parallelized, modified to run
    without a tree file, added significance testing
-   [align.seqs](align.seqs),
    [chimera.ccode](chimera.ccode),
    [chimera.check](chimera.check),
    [chimera.pintail](chimera.pintail),
    [chimera.slayer](chimera.slayer),
    [classify.seqs](classify.seqs) - added save parameter to
    save the reference data in memory.
-   [metastats](metastats) - rewrote command so that memory
    usage is not limited
-   [get.groups](get.groups) and
    [remove.groups](remove.groups) - added shared file type
-   [chimera.slayer](chimera.slayer) - added blastlocation
    parameter
-   A 64-bit Windows executable version is now available
-   [normalize.shared](normalize.shared) and
    [sub.sample](sub.sample) - OTU number labels in shared
    file persist to make downstream analysis easier.

## Bug fixes

-   [get.seqs](get.seqs) and
    [remove.seqs](remove.seqs) - fixed counts
    (https://forum.mothur.org/viewtopic.php?f=4&t=1261)
-   fixed issue with \~ character and multiple processors -
    (https://forum.mothur.org/viewtopic.php?f=4&t=1199)
-   [trim.seqs](trim.seqs) - if oligos file does not contain
    any valid group names.
-   [normalize.shared](normalize.shared) - added a warning
    (https://forum.mothur.org/viewtopic.php?f=3&t=1254)
-   [chimera.uchime](chimera.uchime) -
    (https://forum.mothur.org/viewtopic.php?f=4&t=1238,
    [https://forum.mothur.org/viewtopic.php?f=4&t=1239](https://forum.mothur.org/viewtopic.php?f=4&t=1239),
    [https://forum.mothur.org/viewtopic.php?f=4&t=1237](https://forum.mothur.org/viewtopic.php?f=4&t=1237))

## Minor Releases

-   1.21.1 - fixed bug with labels in [parsimony](parsimony)
    command.
-   1.21.1 - [cluster.split](cluster.split) - if your number
    of split files was less than the number of processors, the command
    crashed.
