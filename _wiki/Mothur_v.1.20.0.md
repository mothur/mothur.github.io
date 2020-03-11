---
title: 'Mothur v.1.20.0'
---
We are happy to announce the release of [mothur
v.1.20.0](mothur_v.1.20.0) in honor of Fathur\'s Day and
version 1\'s Golden Birthday. We have a few new features and a number of
small, but significant feature updates that you are sure to enjoy.
First, we have heard from a lot of people about the pain of dealing with
blast in chimera.slayer. As a work around that is actually better, we
have ported in the source code from Robert Edgar\'s latest venture
UChime. It is available within mothur as
[chimera.uchime](chimera.uchime). The downside is that the
tool is not published yet; however, based on testing, it is better than
the chimera.slayer algorithm, faster, and dependency-free. We will be
updating the [Costello stool
analysis](Costello_stool_analysis) example page to suggest a
way to use chimera.uchime and chimera.slayer in a new and better way.
Second, we have also added two utility functions to add the redundant
sequence names back into a tree of unique sequences
([deunique.tree](deunique.tree)) and a function that counts
the number of sequences represented by each unique sequence
([count.seqs](count.seqs)). As for features, we have added
the citation feature to every command so you can see the reference that
you should cite in your paper when you use a command. This is important
so people can give proper attribution to the people that developed the
algorithm. We have also decided to convert all of the calculator-related
output to distances to make things uniform; in addition, several of the
parameters did not work as similarities. Finally, we have added column
headings to the shared and relabund files. We realize this may screw up
people\'s scripts; however, having these headings will hopefully help
people that merge mothur and R for their analysis.

This is shaping up to be a great summer as we continue to add new
features to mothur. We are particularly excited about the development of
mothur v.2.0. If you would like to be a beta (delta?) tester of v.2.0,
please shoot us an email at mothur.bugs\@gmail.com and we can get you
set up. Also, I will be hosting another workshop near Detroit from
August 15-17. If you are interested, please email me at
pdschloss\@gmail.com and I can get you more information.

Enjoy!

Pat Schloss

## New commands

-   [chimera.uchime](chimera.uchime) -
    [https://drive5.com/uchime](https://drive5.com/uchime)
-   [deunique.tree](deunique.tree) -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1143](https://forum.mothur.org/viewtopic.php?f=5&t=1143)
-   [count.seqs](count.seqs) -
    [https://forum.mothur.org/viewtopic.php?f=3&t=1147&p=2691#p2691](https://forum.mothur.org/viewtopic.php?f=3&t=1147&p=2691#p2691)

## Feature updates

-   citation feature: gives the reference that should be cited for each
    command and calculator. It\'s accessed just like help for commands,
    example: align.seqs(citation). For calculators, just add citation to
    your calc string, example: collect.single(calc=sobs-chao-citation).
-   [trim.seqs](trim.seqs) - added a name parameter
-   [phylo.diversity](phylo.diversity) - no longer requires a
    groupfile or at least 2 groups to run, if no group file is given
    mothur assumes all sequences are from the same sample.
-   [get.lineage](get.lineage)/[remove.lineage](remove.lineage)
    = can now process multiple taxons separated by a dashes
-   [dist.shared](dist.shared) - added processors option
-   [consensus.seqs](consensus.seqs) - added cutoff option
    (https://forum.mothur.org/viewtopic.php?f=5&t=693)
-   [summary.shared](summary.shared) and
    [collect.shared](collect.shared) - mothur no longer
    reports the similarity values, rather it now reports distances
-   Calculators - a bug was found in the [spearman](spearman)
    calculator and there was general wonkiness in how distances were
    converted to similarity values. The solution has been to just use
    distance values throughout mothur
-   added column headings to the shared/relabund files

## Bug fixes

-   [cluster.split](cluster.split) - fixed an output redirect
    problem with fasta method
    (https://forum.mothur.org/viewtopic.php?f=4&t=1182&p=2803\#p2803)
-   [summary.seqs](summary.seqs) - re-added processors option
    (https://forum.mothur.org/viewtopic.php?f=4&t=1185)

## Minor Releases

-   1.20.1 - fixed bug with [hcluster](hcluster) - was not
    changing the cutoff with average method
-   1.20.2 - fix chimera.uchime bug with Windows, exiting early
-   1.20.3 - added \"unclassified\" bins to
    [classify.otu](classify.otu) summary file
-   1.20.3 - added warning to [trim.seqs](trim.seqs) for
    non-numeric quality scores
