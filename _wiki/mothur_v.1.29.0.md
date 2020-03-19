---
title: 'mothur v.1.29.0'
redirect_from: '/wiki/Mothur_v.1.29.0.html'
---
This is an exciting day\... we are happy to announce the release of
[mothur v.1.29.0](mothur_v.1.29.0) and the beta version of
mothur v.2.0. The difference? The beta is our first public release of
the GUI version of mothur that we have been developing off and on for
almost two years now. You can play around with the [ GUI
Tutorial](Gui_Tutorial) and send feedback to
mothur.bugs\@gmail.com. It is built upon the command line version, which
we continue to develop and support. Please send us your feedback
regarding the GUI implementation and any problems and desires you might
like to see in the future for the GUI. One of the cool features of the
GUI is the ability to create batch scripts that you can then either run
directly from within the GUI or via the command line interface.

As for the v.1.29, we have a number of useful feature developments.
First, we've developed [filter.shared](filter.shared), which
removes columns of OTUs based on frequency and abundance parameters. If
there are other parameters you can think of, let us know. Second,
although it's been in mothur for awhile, we are publicly releasing the
ability to subsample alpha and beta diversity metrics to a common number
of sequences per sample. We added these parameters to the [Schloss
SOP](Schloss_SOP) with the last release. Finally, there are a
number of other features and bug fixes that our loyal users have
suggested via the forum - thanks for your suggestions!

Looking ahead, with the next release we should have a vetted SOP for
analyzing Illumina data. Preliminary indications are that we get
comparable sequence length to 454 that is just as good (or better) but a
lot more reads. We're also working with various people to generate
similar SOPs for the new 454 flow structure and IonTorrent data. Sorry
all of this has taken us so long.

We're excited for 2013 and the future of mothur. Please let us know if
there's anything missing or if there's something you think others
would benefit from having in mothur!

## New commands

-   [filter.shared](filter.shared) - remove OTUs based on
    various criteria

## Feature updates

-   [classify.otu](classify.otu) - added persample option,
    which finds the consensus taxonomy for each sample in each otu.
-   [cluster.split](cluster.split) - added cluster option
    (default=t). If false, mothur will split the matrix but not cluster.
-   [indicator](indicator) - added groups to the output of
    the indicator values. -
    [https://forum.mothur.org/viewtopic.php?f=3&t=1675](https://forum.mothur.org/viewtopic.php?f=3&t=1675)
-   [summary.single](summary.single),
    [summary.shared](summary.shared),
    [rarefaction.shared](rarefaction.shared),
    [dist.shared](dist.shared),
    [tree.shared](tree.shared),
    [unifrac.weighted](unifrac.weighted),
    [unifrac.unweighted](unifrac.unweighted) - added
    subsample option
-   [make.fastq](make.fastq) - added format parameter.
-   [venn](venn) - added sharedotus parameter (default = T).
    When sharedotus=t, mothur will output the otu labels of the shared
    species for sharedsobs.
-   [trim.seqs](trim.seqs) &&
    [trim.flows](trim.flows) - you can set a barcode or
    primer name to "ignore", and mothur will disregard sequences that
    belong to that group.
-   [chimera.slayer](chimera.slayer) and
    [chimera.perseus](chimera.perseus) - added dereplicate
    parameter to
-   [parse.list](parse.list) - added count parameter
-   [sens.spec](sens.spec) - increased speed and reduced
    memory needed to run
-   [chimera.uchime](chimera.uchime) - added strand parameter
    to -
    [https://forum.mothur.org/viewtopic.php?f=3&t=1882&p=5255#p5255](https://forum.mothur.org/viewtopic.php?f=3&t=1882&p=5255#p5255)

## Bug fixes

-   [classify.otu](classify.otu) - if basis=sequence and
    count file is used, redundant sequences were not added to
    .tax.summary file counts.
-   [https://forum.mothur.org/viewtopic.php?f=3&t=1656](https://forum.mothur.org/viewtopic.php?f=3&t=1656) - ignore N's
-   [classify.seqs](classify.seqs) - if input directory was
    given with a group file, path was incorrect.
-   if tree file had random Windows newlines, mothur could not read
    sequence names properly.
-   [tree.shared](tree.shared) - if shared file was not in
    alphabetical order. All shared files created by
    [make.shared](make.shared) after 6/10 are sorted.

## Changes to wiki

-   gui tutorial and related links

## Registered users

2423
