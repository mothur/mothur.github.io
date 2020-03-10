---
title: 'Metastats'
---
The **metastats** command is based on the Metastats program, White, J.R.,
Nagarajan, N. & Pop, M. Statistical methods for detecting differentially
abundant features in clinical metagenomic samples. PLoS Comput Biol 5,
e1000352 (2009). The **metastats** command outputs a .metastats file.

See: <http://metastats.cbcb.umd.edu/> for more information on Metastats.

## Default Settings

    mothur > metastats(shared=temp.job2.shared, design=temp.job2.design)

## Options

### iters

The iters parameter allows you to set number of bootstrap permutations
for estimating null distribution of t statistic. The default is 1000.

### threshold

The threshold parameter allows you to set the significance level to
reject null hypotheses (default 0.05).

### groups

The groups parameter allows you to specify which of the groups in your
groupfile you would like included. The group names are separated by
dashes.

### label

The label parameter allows you to select what distance levels you would
like, and are also separated by dashes.

### design

The design parameter allows you to assign your groups to sets when you
are running metastat. mothur will run all pairwise comparisons of the
sets. It is required. The design file looks like the group file. It is a
2 column tab delimited file, where the first column is the group name
and the second column is the set the group belongs to.

### sets

The sets parameter allows you to specify which of the sets in your
design file you would like to analyze. The set names are separated by
dashes. The default is all sets in the designfile.

### processors

The processors parameter allows you to specify how many processors you
would like to use. Default processors=Autodetect number of available
processors and use all available.

## Revisions

-   1.25.0 - modified to more closely follow results from metastats
    website.
-   1.25.0 - OTU numbers in **metastats** should correspond to the column
    names in the shared file.
-   1.22.2 - fixed bug.
-   1.23.0 - Added qvalues.
-   1.24.0 - paralellized for Windows.
-   1.29.1 - Bug Fix: error with output filename
-   1.32.0 - Bug Fix: generate p values for sparse data using fisher\'s
    exact test instead of permutted values
-   1.33.0 - improved work balance load between processors.
-   1.36.0 - Remove qvalues. Also removes fortran source from mothur.
-   1.36.0 - Bug Fix: Infinite loop with certain datasets -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=3701>
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.

[Category:Commands](Category:Commands)
