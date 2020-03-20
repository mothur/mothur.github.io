---
title: 'mothur v.1.13.0'
redirect_from: '/wiki/Mothur_v.1.13.0.html'
---
As everyone heads back to a new academic year, we are happy to announce
the release of [mothur v.1.13.0](/wiki/mothur_v.1.13.0)!

Since the last release we have been head deep in processing the raw 16S
rRNA data for the US Human Microbiome Project - that's 90 \*million\*
sequences for those of you keeping track at home. That also means that
mothur is strong enough to process a large number of sequences. We are
quite excited about this because many people did not think that an
OTU-based analysis without using heuristics was possible. We were also
able to provide phylotype-based and phylogeny-based analysis of the data
- all using mothur. Now comes the difficult task of converting data into
results, conclusions, and ultimately meaningful biology. The side effect
of all this means that we have revamped a number of features to improve
their speed through better programming an parallelization of various
commands (e.g. [unifrac.weighted](/wiki/unifrac.weighted) and
[unifrac.unweighted](/wiki/unifrac.unweighted). The basic pipeline
that we used is explained in the [Costello stool
analysis](/wiki/Costello_stool_analysis).

In addition, we are grateful for the questions, suggestions, and bug
reports that have been trickling in. You'll notice that many of the
feature updates listed below are the requests of people on the mothur
forum. We have also added several calculators for measuring community
evenness and expanded the options for 8 different functions. In the last
release we provided a wrapper for [clearcut](/wiki/clearcut), which
required you to have a separate clearcut executable. From here out, this
is no longer necessary as clearcut is hard-wired into mothur. We're
looking forward to doing the same thing with CatchAll and Metastats. As
always, please keep the praise, complaints, suggestions, and 6 packs
coming.

Pat Schloss

## Feature updates

-   changed the output for [get.oturep](/wiki/get.oturep) names -
    [https://forum.mothur.org/viewtopic.php?f=5&t=506&sid=b0e550aae63ff095ea48b51802a51526](https://forum.mothur.org/viewtopic.php?f=5&t=506&sid=b0e550aae63ff095ea48b51802a51526)
-   made minsnp=100 the default in
    [chimera.slayer](/wiki/chimera.slayer)
-   added groupmode parameter to
    [summary.single](/wiki/summary.single) -
    [https://forum.mothur.org/viewtopic.php?f=5&t=513&sid=b44f89ef348ab38c197ffe489e656402](https://forum.mothur.org/viewtopic.php?f=5&t=513&sid=b44f89ef348ab38c197ffe489e656402)
-   added default option to [set.dir](/wiki/set.dir), so that you
    can set input, output and tempdefault to the location of mothur's
    executable. This is helpful if you double click on the mothur
    executable, since current working directory will be set to your home
    directory.
-   added countgaps parameter to [chop.seqs](/wiki/chop.seqs)
    command -
    [https://forum.mothur.org/viewtopic.php?f=3&t=495&sid=4acb77fd1bf0275576c23be41e4ab8b5](https://forum.mothur.org/viewtopic.php?f=3&t=495&sid=4acb77fd1bf0275576c23be41e4ab8b5)
-   added summary and collect parameter to
    [phylo.diversity](/wiki/phylo.diversity) - made summary=T the
    default and collect=F, rarefy=F by default. Summary=T creates a
    .phylodiv.summary file that contains the total phylogenetic
    diversity in each group.
-   added scale parameter to
    [phylo.diversity](/wiki/phylo.diversity) - phylo.diversity is
    divided by the number of sequences that have been sampled.
-   added version numbers to all shortcut files mothur creates so they
    can be automatically remade when you upgrade to a new version.
-   [classify.seqs](/wiki/classify.seqs) - when using knn method
    with distance search a .match.dist file is generated to report the
    smallest distance to the closest match in the database.
-   added oldfasta and column parameters to
    [dist.seqs](/wiki/dist.seqs) - to append to a column-formatted
    distance matrix. given a column matrix, a new fasta file and a old
    fasta file we add distances to the original distance matrix
    calculated with the old fasta file.
-   [split.abund](/wiki/split.abund) - if the rare or abund don't
    exist create a blank file anyway to prevent confusion when the
    command is run multiple times.
-   made neighbor=T default in [clearcut](/wiki/clearcut)
-   added fontsize and numotu parameters to
    [heatmap.bin](/wiki/heatmap.bin) command. Also added more
    sorting options for the picture: none, shared, totalotu,
    totalgroup. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=504&sid=3ea797594a02a1bdbc0972a7120b9919](https://forum.mothur.org/viewtopic.php?f=5&t=504&sid=3ea797594a02a1bdbc0972a7120b9919)
-   increased speed of parallelized commands file division.
-   new calculators:
    -   [invsimpson](/wiki/invsimpson) - the inverse Simpson index
        (1/D)
    -   [simpsoneven](/wiki/simpsoneven) - a Simpson index-based
        measure of evenness
    -   [shannoneven](/wiki/shannoneven) - a Shannon index-based
        measure of evenness
    -   [heip](/wiki/heip) - Heip's metric of community evenness
    -   [smithwilson](/wiki/smithwilson) - Smith and Wilson's
        metric of community evenness

<!-- -->

-   Added "\[error\]" to the start of every error message that is
    outputed to the logfile to make it easy to grep errors from large
    logfiles.
-   [screen.seqs](/wiki/screen.seqs) no longer outputs \*bad.fasta,
    \*bad.names, \*bad.groups
-   [heatmap.bin](/wiki/heatmap.bin) can now take a relabund file
    as an input.
-   added relabund parameter to [read.otu](/wiki/read.otu) command.
-   added clearcut source to mothur so that clearcut exe is no longer
    needed.
-   increased speed of unifrac commands, changed default of random
    parameter to false.
-   changed [remove.seqs](/wiki/remove.seqs) and
    [get.seqs](/wiki/get.seqs) to make dups=T the default

## Bug fixes

-   fixed bug with venn command if no valid calculators are given.
-   fixed bug with collect.single, rarefaction.single and summary.single
    when run in shared mode after one another the second command would
    only output results for last group.
-   deleted .names.temp that was left behind on windows version.
-   changed [classify.otu](/wiki/classify.otu) to assume the list
    file contains all sequences instead of just uniques.
-   [sffinfo](/wiki/sffinfo) trimming first base.
-   [classify.seqs](/wiki/classify.seqs) was adding an extra
    unclassified at the end of all classifications.
-   [phylo.diversity](/wiki/phylo.diversity) - the collect and
    rarefaction data seems to suggest that each group being analyzed has
    the same number of sequences - the total number of sequences. It
    should instead be the number of sequences in each group. So if the
    largest sample only contains 1000 sequences it should only go down
    1000 sequences, not the total number of unique sequences across all
    groups.
-   fixed bug that did not apply hard to cutoff output of cutoff change
    in cluster.split and cluster.
-   fixed bug that occurred with some of the calculators that caused
    negative results if the numbers were larger than the largest
    possible int for a given platform.
-   fixed ambiguous output for align.seqs flip=T. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=533&sid=3ea797594a02a1bdbc0972a7120b9919](https://forum.mothur.org/viewtopic.php?f=4&t=533&sid=3ea797594a02a1bdbc0972a7120b9919)
-   fixed bug that truncated accession names in mpi-enabled version if a
    file with Windows line endings was used. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=492&p=1174](https://forum.mothur.org/viewtopic.php?f=4&t=492&p=1174)
-   modified [pre.cluster](/wiki/pre.cluster) to make it faster
-   fixed bug with tree.shared -
    [https://forum.mothur.org/viewtopic.php?f=3&t=549](https://forum.mothur.org/viewtopic.php?f=3&t=549)
