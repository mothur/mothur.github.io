---
title: 'Mothur v.1.27.0'
---
With a quick turn around, we are happy to announce the release of
[mothur v.1.27.0](mothur_v.1.27.0). You\'ll see that we
haven\'t added any new commands; however, we have made some significant
changes to the various cluster commands resulting in much reduced memory
requirements and faster executions. We\'ve also fixed a couple of bugs
and posted the mothur-compatible version of the latest RDP taxonomy
files.

Look for some more exciting features and commands in September!

## Feature updates

-   [cluster](cluster),
    [cluster.classic](cluster.classic),
    [cluster.split](cluster.split) - reduced memory by 50%
    and increased speed by 55%.
-   [create.database](create.database) - allowed command to
    proceed with abundance mismatches between constaxonomy file and
    shared file to allow the user to sample or normalize the shared
    file.
-   [chop.seqs](chop.seqs) - added processors option. -
    <http://www.mothur.org/forum/viewtopic.php?f=5&t=1683>

## Bug fixes

-   [screen.seqs](screen.seqs) - segfault in MPI version.
-   [sub.sample](sub.sample) - missing files if subsamples
    call of the unique.seqs command produced a file with the same name
    as subsamples output file name.
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=1681>
-   various commands would complain about missing names if the names
    file did not end in white space -
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=1698&p=4538#p4538>

## Changes to wiki

-   Posted mothur-compatible version of latest [RDP reference
    files](RDP_reference_files) (v. 9)

## Registered users

2309
