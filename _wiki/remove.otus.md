---
title: 'remove.otus'
tags: 'commands'
redirect_from: '/wiki/Remove.otus.html'
---
The **remove.otus** command removes otu labels from \*.cons.taxonomy,
\*.corr.axes, \*.otu.corr, shared and list files. This can be useful
especially with subsampled datasets or when groups have been selected.


## Default Options

The **remove.otus** parameters are: constaxonomy, otucorr, corraxes, shared,
list and accnos. The accnos parameter is required as well as at least
one of the other file types.

    mothur > remove.otus(accnos=final.an.0.03.subsample.0.03.pick.0.03.otus, corraxes=final.an.0.03.subsample.0.03.pick.pearson.corr.axes)

This command will create a
final.an.0.03.subsample.0.03.pick.pearson.corr.pick.axes containing the
otus NOT in the accnos file.

## Options

### constaxonomy

The constaxonomy parameter is used to input the results of the
classify.otu command.

    mothur > remove.otus(accnos=final.an.0.03.subsample.0.03.pick.0.03.otus, constaxonomy=final.an.0.03cons.taxonomy)

The final.an.0.03cons.taxonomy contains 684 otus, but the
remove.otulabels command selected the 86 otus NOT in the accnos file.

### otucorr

The otucorr parameter is used to input the results of the
otu.association command.

    mothur > remove.otus(accnos=final.an.0.03.subsample.0.03.pick.0.03.otus, otucorr=final.an.0.03.subsample.0.03.pick.0.03.pearson.otu.corr)

### corraxes

The corraxes parameter is used to input the results of the corr.axes
command.

    mothur > remove.otus(accnos=final.an.0.03.subsample.0.03.pick.0.03.otus, corraxes=final.an.0.03.subsample.0.03.pick.pearson.corr.axes)

### list

The list parameter allows you to input a list file you wish to select
OTUs from.

### shared

The shared parameter allows you to input a shared file you wish to
select OTUs from.

    mothur > remove.otus(shared=abrecovery.an.shared, groups=B)

## Revisions

-   1.26.0 - First Introduced
-   1.30.0 - Added list and shared parameters
-   1.37.0 - Remove.otulabels name changed to remove.otus
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)


