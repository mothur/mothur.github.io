---
title: 'create.database'
tags: 'commands'
redirect_from: '/wiki/Create.database.html'
---
The **create.database** command reads a [list
file](/wiki/list_file), \*.cons.taxonomy, \*.rep.fasta,
\*.rep.names or \*.rep.count\_table and optional [group
file](/wiki/group_file), and creates a database file. To run the
following tutorial please download: [ Example
Files](https://mothur.s3.us-east-2.amazonaws.com/wiki/create_database_files.zip)

## Default Settings

The **create.database** command parameters are repfasta, list, shared,
relabund, repname, constaxonomy, group and label. List, relabund or
shared, and count & constaxonomy are required. NOTE: Make SURE the
repfasta, repnames or count and constaxonomy are for the same label as
the listfile.

    mothur > get.oturep(list=final.an.list, label=0.03, fasta=final.fasta, column=final.dist, name=final.names) 
    mothur > classify.otu(list=final.an.list, name=final.names, taxonomy=final.taxonomy, label=0.03)
    mothur > create.database(list=final.an.list, label=0.03, repfasta=final.an.0.03.rep.fasta, repname=final.an.0.03.rep.names, constaxonomy=final.an.0.03.cons.taxonomy)

or with a count file:

    mothur > get.oturep(list=final.an.unique_list, label=0.03, fasta=final.fasta, column=final.dist, count=final.count_table) 
    mothur > classify.otu(list=final.an.unique_list, count=final.count_table, taxonomy=final.taxonomy, label=0.03)
    mothur > create.database(list=final.an.unique_list, label=0.03, repfasta=final.an.0.03.rep.fasta, count=final.an.0.03.rep.count_table, constaxonomy=final.an.0.03.cons.taxonomy)

or with a shared file:

    mothur > get.oturep(list=final.an.list, label=0.03, fasta=final.fasta, column=final.dist, name=final.names) 
    mothur > classify.otu(list=final.an.list, name=final.names, taxonomy=final.taxonomy, label=0.03)
    mothur > create.database(shared=final.an.shared, label=0.03, repfasta=final.an.0.03.rep.fasta, repname=final.an.0.03.rep.names, constaxonomy=final.an.0.03.cons.taxonomy)

or with a relabund file:

    mothur > get.oturep(list=final.an.list, label=0.03, fasta=final.fasta, column=final.dist, name=final.names) 
    mothur > classify.otu(list=final.an.list, name=final.names, taxonomy=final.taxonomy, label=0.03)
    mothur > create.database(relabund=final.an.relabund, label=0.03, repfasta=final.an.0.03.rep.fasta, repname=final.an.0.03.rep.names, constaxonomy=final.an.0.03.cons.taxonomy)

If you open the final.an.database file you will see:

    OTUNumber  Abundance   repSeqName  repSeq  OTUConTaxonomy
    1  6307    GQY1XT001C296C  A-GC--GA-G-A-A-G-T-A ... GT-GAA Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);...
    2  5124    GQY1XT001A3TJI  G-GC--GA-G-A-A-G-T-A ... GT-GAA Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);...
    3  3177    GQY1XT001CS2B8  G-GC--GA-G-A-A-G-T-A ... GT-GAA Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);...
    4  2947    GQY1XT001CD9IB  G-GC--GA-G-A-A-G-T-A ... GT-GAA Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);...
    ...

### list

The list parameter allows you to provide your [
list](/wiki/List_file) file. mothur creates this file by running
the [cluster](/wiki/cluster),
[cluster.split](/wiki/cluster.split) or
[phylotype](/wiki/phylotype) commands.

### shared

The shared parameter allows you to provide your [
shared](/wiki/Shared_file) file. mothur creates this file by
running the [make.shared](/wiki/make.shared) command.

### relabund

The relabund parameter allows you to provide your relative abundance
file. mothur creates this file by running the
[get.relabund](/wiki/Get.relabund) command.

### count

The count file is the count file outputted by
[get.oturep](/wiki/get.oturep)(fasta=yourFastaFile,
list=yourListfile, column=yourDistFile, count=yourCountFile)

### constaxonomy

The constaxonomy file is the taxonomy file outputted by
[classify.otu](/wiki/classify.otu)(list=yourListfile,
name=final.names, taxonomy=yourTaxonomyFile)

## Options

### repfasta

The repfasta file is fasta file outputted by
[get.oturep](/wiki/get.oturep)(fasta=yourFastaFile,
list=yourListfile, column=yourDistFile, name=yourNameFile) and is
optional.

### repname

The repname file is the name file outputted by
[get.oturep](/wiki/get.oturep)(fasta=yourFastaFile,
list=yourListfile, column=yourDistFile, name=yourNameFile) and is
optional.

### group

The group file is optional and will just give you the abundance
breakdown by group.

    mothur > create.database(list=final.an.list, label=0.03, repfasta=final.an.0.03.rep.fasta, repname=final.an.0.03.rep.names, constaxonomy=final.an.0.03.cons.taxonomy, group=final.groups)

If you open the final.an.database file you will see:

    OTUNumber  F003D000 ...    F003D150    repSeqName  repSeq  OTUConTaxonomy
    1  422 1012 ... 492  GQY1XT001C296C    A-GC--GA-G-A-A-G-T-A ... GT-GAA Bacteria(100);"Bacteroidetes"(100);...
    2  413 186 ... 707  GQY1XT001A3TJI G-GC--GA-G-A-A-G-T-A ... GT-GAA Bacteria(100);"Bacteroidetes"(100);...
    3  279 238 ... 342  GQY1XT001CS2B8 G-GC--GA-G-A-A-G-T-A ... GT-GAA Bacteria(100);"Bacteroidetes"(100);...
    4  255 194 ... 410  GQY1XT001CD9IB G-GC--GA-G-A-A-G-T-A ... GT-GAA Bacteria(100);"Bacteroidetes"(100);...
    ...

### label

The label parameter allows you to specify a label to be used from your
list file.

## Revisions

-   1.25.0 - First Introduced
-   1.26.0 - added shared parameter
-   1.31.0 - added count parameter
-   1.39.0 - Makes refasta and repnames parameters optional
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.41.0 - Adds relabund option.
    [\#478](https://github.com/mothur/mothur/issues/478)


