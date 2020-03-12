---
title: 'List.otulabels'
tags: 'commands'
---
The **list.otulabels** command lists otu labels
from shared, relabund or list file. This list can be used especially
with subsampled datasets when used with output from classify.otu,
otu.association, or corr.axes to select specific otus using the
[get.otus](get.otus) or
[remove.otulabels](remove.otulabels) commands.

## Default Settings

The **list.otulabels** command reads a shared, relabund, list or
constaxonomy file and creates a \*.otulabels file.

    mothur > list.otulabels(shared=final.an.0.03.subsample.0.03.pick.shared)

or

    mothur > list.otulabels(relabund=final.an.0.03.subsample.0.03.pick.relabund)

or

    mothur > list.otulabels(list=final.an.list)

or

    mothur > list.otulabels(list=final.opti_mcc.0.03.constaxonomy)

If you open the final.an.0.03.subsample.0.03.pick.otulabels file you
will see:

    Otu001
    Otu002
    Otu003
    Otu004
    Otu005
    Otu006
    Otu007
    Otu008
    Otu009
    Otu010
    Otu011
    Otu012
    Otu013

## Options

### groups

The groups parameter allows you to specify which of the groups in your
shared or relabund file you would like included. The groups option is
ignored with the list file. The group names are separated by dashes.

### label

The label parameter allows you to select what distance levels you would
like, and are also separated by dashes.

## Revisions

-   1.26.0 - First Introduced
-   1.30.0 - Added list file
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.42.0 - Added constaxonomy file
    [\#581](https://github.com/mothur/mothur/issues/581)


