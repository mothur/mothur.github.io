---
title: 'otu.association'
tags: 'commands'
redirect_from: '/wiki/Otu.association.html'
---
The **otu.association** command calculate the
correlation coefficient for the otus in a shared/relabund file.


## Default settings

The **otu.association** command reads a shared
or relabund file.

    mothur > otu.association(shared=final.an.0.03.subsample.0.03.pick.shared)

or

    mothur > otu.association(relabund=final.an.0.03.subsample.0.03.pick.relabund)

The output file will look like:

    OTUA   OTUB    spearmanCoef    Significance
    Otu002 Otu001  -0.066667   0.841481
    Otu003 Otu001  -0.006061   0.985494
    Otu003 Otu002  0.006061    0.985494
    Otu004 Otu001  -0.151515   0.649436
    Otu004 Otu002  0.078788    0.813151
    Otu004 Otu003  0.903030    0.000344
    Otu005 Otu001  -0.127273   0.702596
    Otu005 Otu002  -0.636364   0.047890
    Otu005 Otu003  -0.284848   0.392803
    ...

## Options

### groups

The groups parameter allows you to specify which of the groups you would
like included. The group names are separated by dashes. By default all
groups in the shared or relabund file are used.

### label

The label parameter allows you to select what distance level you would
like used, if none is given all labels are processed.

### method

The method parameter allows you to select what method you would like to
use. Options are [pearson](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient) (default), [spearman](https://en.wikipedia.org/wiki/Spearman's_rank_correlation_coefficient) and [kendall](https://en.wikipedia.org/wiki/Kendall_tau_rank_correlation_coefficient).

To use the spearman method:

    mothur > otu.association(shared=final.an.0.03.subsample.0.03.pick.shared, method=spearman)

or to use the kendall method:

    mothur > otu.association(shared=final.an.0.03.subsample.0.03.pick.shared, method=kendall)



### metadata

The metadata parameter allows you to find the association between the
otus and the metadata.

    mothur > otu.association(shared=final.an.0.03.subsample.0.03.pick.shared, metadata=mouse.dpw.metadata)

### cutoff

The cutoff parameter allows you to set a pvalue at which the otu will be
reported.

    mothur > otu.association(shared=final.an.0.03.subsample.0.03.pick.shared, metadata=mouse.dpw.metadata, cutoff=0.005)

## Revisions

-   1.24.0 - First introduced.
-   1.26.0 - added metadata parameter
-   1.28.0 - added cutoff option -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1639](https://forum.mothur.org/viewtopic.php?f=5&t=1639)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.42.0 - Fixes bug with **otu.association** metadata file.
