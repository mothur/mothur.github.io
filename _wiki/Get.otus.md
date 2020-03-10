---
title: 'Get.otus'
---
The **get.otus** command selects otus from a given

## Default Settings

The accnos parameter is required. The command will generate a \*.pick.\*
file.

    mothur > get.otus(accnos=esophagus.groups.accnos,  list=esophagus.fn.list, label=0.03) 

This command will output a new esophagus.fn.pick.0.03.list containing
the 66 otus.

## Options

### constaxonomy

The constaxonomy parameter is used to input the results of the
classify.otu command.

    mothur > get.otus(accnos=final.an.0.03.subsample.0.03.pick.0.03.otulabels, constaxonomy=final.an.0.03cons.taxonomy)

The final.an.0.03cons.taxonomy contains 684 otus, but the get.otulabels
command selected the 598 otus from the accnos file.

### otucorr

The otucorr parameter is used to input the results of the
otu.association command.

    mothur > get.otus(accnos=final.an.0.03.subsample.0.03.pick.0.03.otulabels, otucorr=final.an.0.03.subsample.0.03.pick.0.03.pearson.otu.corr)

### corraxes

The corraxes parameter is used to input the results of the corr.axes
command.

    mothur > get.otus(accnos=final.an.0.03.subsample.0.03.pick.0.03.otulabels, corraxes=final.an.0.03.subsample.0.03.pick.pearson.corr.axes)

### list

The list parameter allows you to input a list file you wish to select
OTUs from.

### shared

The shared parameter allows you to input a shared file you wish to
select OTUs from.

    mothur > get.otus(groups=B-C, shared=esophagus.fn.shared, label=0.03)

## Revisions

-   1.37.0 Merged functionality of get.otulabels command.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)

[Category:Commands](Category:Commands)
