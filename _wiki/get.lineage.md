---
title: 'get.lineage'
tags: 'commands'
redirect_from: '/wiki/Get.lineage.html'
---
The **get.lineage** command reads a taxonomy file
and taxon then generates a new file containing only sequences from the
specified taxon. You may also include either a [
fasta](fasta_file), [ name](name_file), [
group](group_file), [ list](list_file), [
count](Count_File) or [align.report file](align.report_file) to this command and mothur will
generate new files for each of those containing only the selected
sequences. To complete this tutorial, you are encouraged to obtain the [
AbRecovery](https://mothur.s3.us-east-2.amazonaws.com/wiki/abrecovery.zip) dataset.


## Default Settings

To run get.lineage, you must provide a taxonomy or constaxonomy file and
one or more taxon names. The command will generate a \*.pick.\* file.

### Running with a taxonomy file

To generate an taxonomy file, let's first run
[classify.seqs](classify.seqs):

    mothur > classify.seqs(fasta=abrecovery.fasta, template=silva.nogap.fasta, taxonomy=silva.bacteria.silva.tax)
    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;)

This generates abrecovery.silva.pick.taxonomy a file containing the 106
sequences from Bacteria;Firmicutes;

You can select sequences from multiple taxa by separating them with
dashes. Example:

     mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;-Bacteria;Bacteroidetes;)

This generates abrecovery.silva.pick.taxonomy a file containing the 187
sequences from Bacteria;Firmicutes; or Bacteria;Bacteroidetes;

You may enter your taxon names with confidence scores, doing so will get
only those sequences that belong to the taxonomy and whose confidence
scores is above the scores you give.

    mothur > classify.seqs(fasta=abrecovery.fasta, template=silva.nogap.fasta, taxonomy=silva.bacteria.silva.tax)
    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria(100);Firmicutes(90);)

This generates abrecovery.silva.pick.taxonomy a file containing the 104
sequences from Bacteria;Firmicutes; whose confidence scores are at 100
percent for Bacteria and at or above 90 for Firmicutes.

### Running with a constaxonomy file

First we need to find the consensus taxonomies for each OTU with the
[classify.otu](classify.otu) command:

    mothur > classify.otu(list=final.an.list, name=final.names, taxonomy=final.taxonomy)
    mothur > get.lineage(constaxonomy=final.an.0.03.cons.taxonomy, list=final.an.list, taxon=Bacteria;Firmicutes;, label=0.03)

This generates final.an.0.03.pick.list containing the 401 OTUs that
classified to Bacteria;Firmicutes;.

## fasta option

To use the fasta option, follow this example:

    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, fasta=abrecovery.fasta)

This generates the file abrecovery.pick.fasta, which contains only
sequences from Bacteria;Firmicutes;

## name option

To use the name option, follow this example:

    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, name=abrecovery.names)

This generates the file abrecovery.pick.names, which contains only the
names of sequences from Bacteria;Firmicutes;

### dups

The dups parameter is only used in tandem with a namefile. By default,
dups=TRUE, so if any sequence in a specific line in the name file is in
your taxon, then all sequences in that line will be kept. This is
especially useful when used with the groupfile, since for most commands
your files can contain only the unique sequences, but the groupfile
needs to contain all the sequences in your namefile.

## group option

To use the group option, follow this example:

    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, group=abrecovery.groups)

This generates the file abrecovery.pick.groups, which contains only
sequences from Bacteria;Firmicutes;

## count option

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, count=abrecovery.count_table)

## alignreport option

To use the alignreport option, follow this example:

    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, alignreport=abrecovery.align.report)

This generates the file abrecovery.pick.align.report, which contains
only sequences from Bacteria;Firmicutes;

## list option

To use the list option, follow this example:

    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, list=abrecovery.fn.list)

This generates the file abrecovery.fn.pick.list, which contains only
sequences from Bacteria;Firmicutes;

## constaxonomy option

If you provide a constaxonomy file, mothur will select the OTUs from a
shared or list file that are assigned to the requested taxon. The
constaxonomy parameter requires a list or shared file.

    mothur > get.lineage(constaxonomy=final.an.0.03.cons.taxonomy, shared=final.an.shared, taxon=Bacteria;Firmicutes;, label=0.03)

or

    mothur > get.lineage(constaxonomy=final.an.0.03.cons.taxonomy, list=final.an.list, taxon=Bacteria;Firmicutes;, label=0.03)

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
