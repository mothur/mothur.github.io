---
title: 'Merge.otus'
---
The **merge.otus** command will combine OTUs based
on taxonomic assignment.

## Default Settings

To run the **merge.otus** command you need to provide consensus taxonomy
file, <https://mothur.org/wiki/Constaxonomy_file> and a list, shared or
relabund file.

    mothur > merge.otus(constaxonomy=final.opti_mcc.0.03.constaxonomy, list=final.opti_mcc.list)

## Options

### label

The label parameter allows you to indicate which labels you want to
include, label names should be separated by dashes. Default is all
labels in your list file.

### taxlevel

The taxlevel parameter allows you to specify the taxonomy level you
would like to use when merging. Default=maxlevel.

## Revisions

-   1.42.0 - First Introduced
    [\#558](https://github.com/mothur/mothur/issues/558)

[Category:Commands](Category:Commands)
