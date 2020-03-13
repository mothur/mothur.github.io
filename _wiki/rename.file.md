---
title: 'rename.file'
tags: 'commands'
redirect_from: '/wiki/Rename.file'
---
The **rename.file** command allows you to **rename.file** from within mothur.
Mothur will update the current files saved by mothur as well.


## Default Settings

The **rename.file** command parameters are: phylip, column, list, rabund,
sabund, name, group, design, tree, shared, relabund, fasta, qfile, sff,
oligos, accnos, biom, count, summary, file, taxonomy, constaxonomy,
input, output, prefix, deletedold and shorten.

    mothur > rename.file(fasta=current, name=current, group=current, taxonomy=current, prefix=final)

    Current files saved by mothur:
    fasta=final.fasta
    name=final.names
    group=final.groups
    taxonomy=final.taxonomy

### input

The input parameter allows you to provide an non typed input file name
to be renamed.

    mothur > rename.file(input=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.an.unique_list.shared, new=final.an.shared)

Note: mothur will not save this file as the current shared file unless
you use the shared parameter as the input.

### new

The new parameter allows you to provide an output file name for the
input file you provide.

### prefix

The prefix parameter allows you to enter your own prefix for shortened
names.

    mothur > rename.file(shared=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.an.unique_list.shared, prefix=final)

    Current files saved by mothur:
    shared=final.an.shared

### shorten

The shorten parameter is used to inicate you want mothur to generate
output file names for you. Default=true.

    mothur > rename.file(shared=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.an.unique_list.shared)

    Current files saved by mothur:
    shared=stability.an.shared

### deleteold

The deleteold parameter indicates whether you want to delete the old
file. Default=true.

## File Type Options

Using the file type options will cause mothur to update the current
files saved by mothur.

### phylip

You can enter you phylip file using the phylip parameter.

### column

You can enter you column file using the column parameter.

### list

You can enter you list file using the list parameter.

### rabund

You can enter you rabund file using the rabund parameter.

### sabund

You can enter you sabund file using the sabund parameter.

### name

You can enter you name file using the name parameter.

### group

You can enter you group file using the group parameter.

### design

You can enter you design file using the design parameter.

### tree

You can enter you tree file using the tree parameter.

### shared

You can enter you shared file using the shared parameter.

### relabund

You can enter you relabund file using the relabund parameter.

### fasta

You can enter you fasta file using the fasta parameter.

### qfile

You can enter you qfile file using the qfile parameter.

### sff

You can enter you sff file using the sff parameter.

### oligos

You can enter you oligos file using the oligos parameter.

### accnos

You can enter you accnos file using the accnos parameter.

### biom

You can enter you biom file using the biom parameter.

### count

You can enter you count file using the count parameter.

### summary

You can enter you summary file using the summary parameter.

### file

You can enter you file file using the file parameter.

### taxonomy

You can enter you taxonomy file using the taxonomy parameter.

### constaxonomy

You can enter you constaxonomy file using the constaxonomy parameter.

## Revisions

-   1.38.0 First Introduced
-   1.39.1 Fixes Bug allowing an automatically rename with output
    directory specified


