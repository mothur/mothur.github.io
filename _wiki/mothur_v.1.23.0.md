---
title: 'Mothur v.1.23.0'
redirect_from: '/wiki/Mothur_v.1.23.0.html'
---
We are happy to release our first offering of 2012 -
[mothur\_v.1.23.0](mothur_v.1.23.0). This promises to be yet
another exciting year for developing and supporting mothur!

The current release has a number of useful new commands and important
feature updates that you will certainly want to check out. You may be
interested in checking out two of the new commands. First, we have added
yet another chimera detection approach - Persues - as
[chimera.perseus](chimera.perseus). Our testing suggests that
it is about as good as [chimera.uchime](chimera.uchime).
Second, we also added [shhh.seqs](shhh.seqs) which is a
sequence denoising algorithm originally developed by Chris Quince. We
don\'t like it as well as [pre.cluster](pre.cluster), but
feel free to play with it an form your own opinion. On the options
front, we have continued to add parallelization to a number of commands
for Windows users. We have also added q-values to the output from
[metastats](metastats) so that the output is more in line
with the original R code. Finally, we have updated the [Schloss
SOP](Schloss_SOP), which reflects how my lab uses mothur to
process sff files and was published recently in PLoS ONE and we have
posted a mothur-compatible version of a [ greengenes-formatted
taxonomy](greengenes-formatted_databases) training set that
contains \>80k sequences.

As always, we appreciate your feedback, recommendations, and questions.
We are planning on hosting another workshop in the Detroit area this
April 23-25. If you are interested in attending, please email
pdschloss\@gmail.com to reserve your seat.

Keep the citations coming\...

Pat Schloss

## New commands

-   [chimera.perseus](chimera.perseus) - a mothur-based
    rewrite of Chris Quince\'s chimera detection program, Perseus
-   [shhh.seqs](shhh.seqs) - a mothur-based rewrite of Chris
    Quince\'s sequence denoting program, SeqNoise
-   [summary.qual](summary.qual) - summarize the contents of
    quality score files

## Feature updates

-   [metastats](metastats) - added values
-   [pre.cluster](pre.cluster) - added processors option for
    Windows (option now available for all operating systems)
-   [chimera.uchime](chimera.uchime) - added processors
    option for Windows (option now available for all operating systems)
-   [chimera.slayer](chimera.slayer) - added processors
    option for Windows (option now available for all operating systems)
-   [get.oturep](get.oturep) - fasta parameter is no longer
    required
-   [chimera.uchime](chimera.uchime) - added column headings
    to output
-   [screen.seqs](screen.seqs) - added taxonomy parameter
-   [heatmap.sim](heatmap.sim) and [venn](venn) -
    added fontsize parameter
-   [sens.spec](sens.spec) - fixed label option and added
    smart distancing.
-   [pre.cluster](pre.cluster) - added map output file
-   added warning that mothur does not support protein sequences

## Bug fixes

-   [trim.flows](trim.flows) - fixed bug that occurred if you
    had multiple primers with blank names -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1358](https://forum.mothur.org/viewtopic.php?f=4&t=1358)
-   [chimera.uchime](chimera.uchime) - executable location -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1379](https://forum.mothur.org/viewtopic.php?f=4&t=1379)
-   [classify.seqs](classify.seqs) - mothur couldn\'t handle
    parentheses in the taxonomy file. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1370](https://forum.mothur.org/viewtopic.php?f=4&t=1370)
-   [chimera.bellerophon](chimera.bellerophon) -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1151](https://forum.mothur.org/viewtopic.php?f=4&t=1151) - segfault in
    chimera.bellerophon MPI-Enabled version.
-   [chop.seqs](chop.seqs) - had an off by one error - if you
    put numbases=200 the sequence came out as 199 bases
-   [trim.seqs](trim.seqs) - fixed flip parameter in -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1401&p=3486#p3486](https://forum.mothur.org/viewtopic.php?f=4&t=1401&p=3486#p3486)
-   fixed bug with newly paralellized commands for Windows that was
    causing crashes -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1422](https://forum.mothur.org/viewtopic.php?f=4&t=1422)
-   get.groups and remove.groups file mismatch -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1396&p=3560#p3560](https://forum.mothur.org/viewtopic.php?f=4&t=1396&p=3560#p3560)

## Wiki updates

-   Added the larger greengenes reference taxonomy that was recently
    published to the list of [greengenes-formatted
    databases](greengenes-formatted_databases)
-   [schloss sop](Schloss_SOP) - updated documentation to
    reflect the final version of the recently published [PLoS ONE
    manuscript](https://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0027310)

## Registered users

2046 - 1/9/2012
