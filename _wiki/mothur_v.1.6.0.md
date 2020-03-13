---
title: 'Mothur v.1.6.0'
redirect_from: '/wiki/Mothur_v.1.6.0.html'
---
We are happy to announce the release of [mothur
v.1.6.0](mothur_v.1.6.0) from the new cozy confines of the
University of Michigan! Thank you for your patience as we moved the
server across the country and then had a hick-up or two while we
reconnected everything. Hopefully, by now you have noticed that the
picture of my young bride and son have moved to www.mothur.org. There
you can find several useful links - the [ wiki](Main_Page), a
[discussion forum](https://www.mothur.org/forum), and a link to [download
mothur](download_mothur). In case you thought we take
ourselves too seriously (please see the [system](system)
command), we have \"[jumped the
shark](wikipedia:Jumping_the_shark)\" and set-up a [facebook
page](https://www.facebook.com/pages/mothur/133966409231) for all of the
adoring fans. A final bit of very exciting news is that the [manuscript
describing
mothur](https://aem.asm.org/cgi/content/abstract/AEM.01541-09v1) has been
accepted by Applied & Environmental Microbiology. Please cite it
liberally. Thanks for the cast of characters that joined me in this
venture!

This is a deceptively small update. We have added three commands. First,
we have done our best to cull the literature, do some interpretive
reading, and implement four algorithms to detect chimeras. The
[chimera.seqs](chimera.seqs) command implements the
Bellerophon, Pintail, CCode, and ChimeraCheck algorithms. Please feel
free to play around with these commands and let us know what you think
of them. We have had to implement several of these based solely on what
was provided in the original manuscript, which didn\'t always make
sense. If we missed an algorithm, please let us know. Also, the default
options in mothur are the way they are implemented in their \"home\"
programs. Second, we have added the
[align.check](align.check) command. If you are familiar with
the [arb editor window](https://www.arb-home.de), you have noticed that
for 16S rRNA sequences they put all sorts of marks under the bases to
describe the secondary structure alignment quality. This command will
count the number of those different markings for each sequence to allow
you to assess alignment quality. Third, we often receive requests from
people for something like what we have provided in
[get.sharedotu](get.sharedotu). This command will return the
sequences shared between two or more groups. If people still have
comments on this command, please let us know. Finally, as we release
this version the documentation for these three commands is very sparse.
Between the move, setting up the lab, and life the personnel in the
documentation department has gotten a little behind. Feel free to take a
hack at it if we don\'t do it first.

As always we have a number of projects in the works for future releases.
These will include taxonomy assignment tools, phylotype-based methods,
and OTU-by-OTU comparisons. We are also responding to reviewers\'
comments regarding our aligner; hopefully these will be resubmitted in
the next week and you will soon see it published in PLoS ONE. As always,
thanks for your support and if you have any questions, comments, or
critiques, feel free to post them to the forum or to send us an email. I
am honestly blown away by the response we have received by users such as
yourselves. Remember that our goal is to make this project
community-supported and so we\'re going to start leaning on you guys to
help us out with documentation, answering questions, and providing
example analyses.

Updates
=======

-   [chimera.seqs](chimera.seqs) - a command to detect
    chimeric sequences using bellerophon, pintail, ccode and chimera
    check methods.

<!-- -->

-   [align.check](align.check) - uses secondary structure
    maps to check the quality of an alignment.

<!-- -->

-   [get.sharedotu](get.sharedotu) - identifies sequences
    that are shared by multiple OTUs

Bug fixes
=========

-   mothur now checks for empty input files.

<!-- -->

-   fixed bug with [trim.seqs](trim.seqs),
    [reverse.seqs](reverse.seqs) and
    [filter.seqs](filter.seqs)

Documentation changes
=====================

-   [facebook fan
    club](https://www.facebook.com/pages/mothur/133966409231) - we\'re up
    to 25 friends!

<!-- -->

-   [mothur forum](https://www.mothur.org/forum) - please feel free to
    direct questions to the forum and to answer other people\'s
    questions.

<!-- -->

-   [publication](https://aem.asm.org/cgi/content/abstract/AEM.01541-09v1) -
    the paper describing mothur is now available ahead of print from
    Applied & Environmental Microbiology. Please cite it!
