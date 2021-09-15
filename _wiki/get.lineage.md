---
title: 'get.lineage'
tags: 'commands'
redirect_from: '/wiki/Get.lineage.html'
---
The **get.lineage** command reads a taxonomy file
and taxon then generates a new file containing only sequences from the
specified taxon. You may also include either a [
fasta](/wiki/fasta_file), [ name](/wiki/name_file), [
group](/wiki/group_file), [ list](/wiki/list_file), [
count](/wiki/Count_File) or [align.report file](/wiki/align.report_file) to this command and mothur will
generate new files for each of those containing only the selected
sequences. This tutorial uses the data files in [Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/ExampleDataSet.zip) 
and [mothur-formatted version of the RDP training set
    (v.9)](https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset9_032012.pds.zip).



## Default Settings

To run get.lineage, you must provide a taxonomy or constaxonomy file and
one or more taxon names. The command will generate a \*.pick.\* file.

### Running with a taxonomy file

To generate an taxonomy file, let's first run
[classify.seqs](/wiki/classify.seqs):

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)
    mothur > get.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;)

This generates final.pick.taxonomy a file containing the 1439
sequences from Bacteria;Firmicutes;

You can select sequences from multiple taxa by separating them with
dashes. Example:

     mothur > get.lineage(taxonomy=taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;-Bacteria;Bacteroidetes;)

This generates final.pick.taxonomy a file containing the 2311
sequences from Bacteria;Firmicutes; or Bacteria;Bacteroidetes;

You may enter your taxon names with confidence scores, doing so will get
only those sequences that belong to the taxonomy and whose confidence
scores is above the scores you give.

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)
    mothur > get.lineage(taxonomy=final.taxonomy, taxon=Bacteria(100);Firmicutes(90);)
    
This generates final.pick.taxonomy a file containing the 1386
sequences from Bacteria;Firmicutes; whose confidence scores are at 100
percent for Bacteria and at or above 90 for Firmicutes.

### Running with a constaxonomy file

First we need to find the consensus taxonomies for each OTU with the
[classify.otu](/wiki/classify.otu) command:

    mothur > classify.otu(list=final.opti_mcc.list, count=final.count_table, taxonomy=final.taxonomy)
    mothur > get.lineage(constaxonomy=final.opti_mcc.0.03.cons.taxonomy, list=final.opti_mcc.list, taxon=Bacteria;Firmicutes;, label=0.03)

This generates final.opti_mcc.0.03.pick.list containing the 339 OTUs that
classified to Bacteria;Firmicutes;.

## fasta option

To use the fasta option, follow this example:

    mothur > get.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, fasta=final.fasta)

This generates the file final.pick.fasta, which contains only
sequences from Bacteria;Firmicutes;

## count option

The [ count](/wiki/Count_File) file is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > get.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, count=final.count_table)

## name option - not recommended

To use the name option, follow this example:

    mothur > get.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, name=final.names)

This generates the file final.pick.names, which contains only the
names of sequences from Bacteria;Firmicutes;

NOTE: We DO NOT recommend using the name file. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

### dups

The dups parameter is only used in tandem with a namefile. By default,
dups=TRUE, so if any sequence in a specific line in the name file is in
your taxon, then all sequences in that line will be kept. This is
especially useful when used with the groupfile, since for most commands
your files can contain only the unique sequences, but the groupfile
needs to contain all the sequences in your namefile.

## group option

To use the group option, follow this example:

    mothur > get.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, group=final.groups)

This generates the file final.pick.groups, which contains only
sequences from Bacteria;Firmicutes;


## alignreport option

To use the alignreport option, follow this example:

    mothur > get.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, alignreport=final.align.report)

This generates the file final.pick.align.report, which contains
only sequences from Bacteria;Firmicutes;

## list option

To use the list option, follow this example:

    mothur > get.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, list=final.opti_mcc.list)

This generates the file final.opti_mcc.pick.list, which contains only
sequences from Bacteria;Firmicutes;

## constaxonomy option

If you provide a constaxonomy file, mothur will select the OTUs from a
shared or list file that are assigned to the requested taxon. The
constaxonomy parameter requires a list or shared file.

    mothur > get.lineage(constaxonomy=final.opti_mcc.0.03.cons.taxonomy, shared=final.opti_mcc.shared, taxon=Bacteria;Firmicutes;, label=0.03)

or

    mothur > get.lineage(constaxonomy=final.opti_mcc.0.03.cons.taxonomy, list=final.opti_mcc.list, taxon=Bacteria;Firmicutes;, label=0.03)

## Revisions

-   1.28.0 Added count parameter
-   1.28.0 Can handle () in taxon names,
    [https://forum.mothur.org/viewtopic.php?f=3&t=1815](https://forum.mothur.org/viewtopic.php?f=3&t=1815)
-   1.31.0 added constaxonomy and shared parameters. -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2210](https://forum.mothur.org/viewtopic.php?f=3&t=2210)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.40.0 - Bug Fix: Fixes partial match bug.
    [\#399](https://github.com/mothur/mothur/issues/399)
-   1.40.5 - Bug Fix: failing to find taxons
    [\#477](https://github.com/mothur/mothur/issues/477)
-   1.45.0 Fixes bug with get.lineage not handling taxon definitions with multiple levels.
