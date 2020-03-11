---
title: 'Mothur v.1.12.0'
---
We are happy to announce the release of
[mothur\_v.1.12.0](mothur_v.1.12.0)! As many of you will
probably be scurrying to pull posters together for ISME in August, we
hope that this release will help you present your data in the best
possible light.

This release has three new commands, which will now enable you to take
your data directly from a 454-Roche sequencer all the way through your
analysis. In other words, we have implemented a command -
[sffinfo](sffinfo) - that will take an sff file and translate
it to a text, fasta, or quality score file with any operating system. In
addition, we have added two other commands including one to [ unalign
sequences](degap.seqs) and to find the [ relative
abundance](get.relabund) of OTUs. We implemented several ways
of normalizing count data and if you have suggestions for others, please
let us know. In addition to these three new commands we have added a
number of features to the existing stable of commands, which should make
your life a bit easier and your analysis more flexible. Perhaps most
important, we have fixed a number of bugs that people have communicated
to us via email and the forum. Along with providing new alignment and
taxonomy reference files containing nearly 15,000 diverse sequences we
are in the process of modifying our example analyses to reflect our
current thinking about how to trim data based on quality scores and
implement all of the new features we\'ve released in the last several
months.

As always, you can feel free to shoot us emails at
mothur.bugs\@gmail.com, post any problems or praise at the forum, and
\"like\" us on facebook. We look forward to your continued support,
suggestions, and questions.

## New commands

-   [degap.seqs](degap.seqs) - a command that takes in an
    aligned file and spits out a degapped file - ng.fasta
-   [get.relabund](get.relabund) - find the relative
    abundance of an OTU
-   [sffinfo](sffinfo) - a command to extract a sequence
    reads from a .sff file.

## Feature updates

-   made chimera commands able process multiple files and added checks
    to [chimera.pintail](chimera.pintail) to look for
    conservation and quantile files if they are not given.
-   made [read.otu](read.otu) sort the shared file
    alphabetically based on groups
-   added ordergroups parameter to [read.otu](read.otu) -
    enter a file that contains groupnames in the order you want
-   made mothur insensitive to extra spaces in between the sequence name
    and sequence group in a groupfile.
-   added groups option to [get.oturep](get.oturep)
    command. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=219&sid=90e7a96c678e887e09bc1d8a37c34052](https://forum.mothur.org/viewtopic.php?f=5&t=219&sid=90e7a96c678e887e09bc1d8a37c34052)
-   mods to [trim.seqs](trim.seqs):
    -   made it optional to give a name for the forward primer
    -   warned if the same barcode is used twice
    -   split samples using primer if a primer name is given
    -   also trims and splits the qual file if it is provided
    -   added two additional options for quality trimming based on a
        rolling average and a sliding window
-   added confidence intervals for [thetayc](thetayc)
-   You can now set a default path at compile time -
    [https://forum.mothur.org/viewtopic.php?f=5&t=493&sid=cb4f1276fa6bfc534be4a3d024628e5a](https://forum.mothur.org/viewtopic.php?f=5&t=493&sid=cb4f1276fa6bfc534be4a3d024628e5a)
-   you can now set the frequency as a percentage for the collect, and
    rarefaction commands.
    [https://forum.mothur.org/viewtopic.php?f=5&t=402&sid=754ff6ec088428a5dcce50ed1e307d70](https://forum.mothur.org/viewtopic.php?f=5&t=402&sid=754ff6ec088428a5dcce50ed1e307d70)
-   added tempdefault parameter to [set.dir](set.dir) to
    override the default set at compile time.

## Bug fixes

-   made looking for \"barcode\", \"forward\", \"reverse\" in oligos
    file for [trim.seqs](trim.seqs) case-insensitive and give
    error if something else is entered.
-   removed blast-related files after running
    [chimera.slayer](chimera.slayer) with blast search mode.
-   in [filter.seqs](filter.seqs) if a filter setting is
    defined by the user (e.g. hard, trump) then turn off the undeclared,
    default settings
-   fixed bug with nearest neighbor [cluster](cluster)
-   fixed bug that was causing double commas in the list file with
    [mgcluster](mgcluster) command

## Other stuff

-   updated the [ SILVA reference
    files](Silva_reference_files) for aligning and
    classifying sequences
