---
title: 'remove.lineage'
tags: 'commands'
redirect_from: '/wiki/Remove.lineage'
---
The **remove.lineage** command reads a taxonomy
file and a taxon and generates a new file that contains only the
sequences not containing that taxon. You may also include either a [
fasta](fasta_file), [ name](name_file), [
group](group_file), [ list](list_file), [
count](Count_File) or [align.report
file](align.report_file) to this command and mothur will
generate new files for each of those that contains only the sequences
not containing that taxon. To complete this tutorial, you are encouraged
to obtain the [ abrecovery](https://mothur.s3.us-east-2.amazonaws.com/wiki/abrecovery.zip) dataset.


## Special note

When running **remove.lineage** in
[command\_line\_mode](Command_line_mode), you must wrap your
taxon in quotes so mothur knows to ignore the ; characters.

    Example: ./mothur "#remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon='Bacteria;Firmicutes;');"

## Default Settings

To run remove.lineage, you must provide the taxonomy or constaxonomy
file and taxon. The command will generate a \*.pick.\* file.

### Running with a taxonomy file

To generate an taxonomy file, let\'s first run
[classify.seqs](classify.seqs):

    mothur > classify.seqs(fasta=abrecovery.fasta, template=silva.nogap.fasta, taxonomy=silva.bacteria.silva.tax)
    mothur > remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;)

This generates abrecovery.silva.pick.taxonomy a file containing the 136
sequences NOT from Bacteria;Firmicutes;

You can remove sequences from multiple taxons by separating them with
dashes. Example:

     mothur > remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;-Bacteria;Bacteroidetes;)

This generates abrecovery.silva.pick.taxonomy a file containing the 55
sequences NOT from Bacteria;Firmicutes; or Bacteria;Bacteroidetes;

You may enter your taxons with confidence scores, doing so will get only
those sequences that belong to the taxonomy and whose confidence scores
is above the scores you give.

    mothur > classify.seqs(fasta=abrecovery.fasta, template=silva.nogap.fasta, taxonomy=silva.bacteria.silva.tax)
    mothur > get.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria(100);Firmicutes(90);)

This generates abrecovery.silva.pick.taxonomy a file containing the 240
sequences, removing sequences from Bacteria;Firmicutes whose confidence
scores are below 100 for Bacteria and below 90 for Firmicutes.

### Running with a constaxonomy file

First we need to find the consensus taxonomies for each OTU with the
[classify.otu](classify.otu) command:

    mothur > classify.otu(list=final.an.list, name=final.names, taxonomy=final.taxonomy)
    mothur > remove.lineage(constaxonomy=final.an.0.03.cons.taxonomy, list=final.an.list, taxon='Bacteria(100);Firmicutes(100);', label=0.03)

This generates final.an.0.03.pick.list containing the 207 OTUs NOT
classified to Bacteria;Firmicutes;.

## name option

To use the name option, follow this example:

    mothur > remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, name=abrecovery.names)

This generates the file abrecovery.pick.names, which contains only the
names of sequences NOT from Bacteria;Firmicutes;

## count option

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, count=abrecovery.count_table)

## dups

The dups parameter is only be used in tandem with a namefile. By default
dups is true, so if any sequence in a specific line in the names file is
in your taxon, then all sequences in that line will be removed. This is
especially useful when used with the groupfile, since for most commands
your files can contain only the unique sequences, but the groupfile need
to contain all the sequences in your namefile.

## group option

To use the group option, follow this example:

    mothur > remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, group=abrecovery.groups)

This generates the file abrecovery.pick.groups, which contains only
sequences NOT from Bacteria;Firmicutes;

## fasta option

To use the fasta option, follow this example:

    mothur > remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, fasta=abrecovery.fasta)

This generates the file abrecovery.pick.fasta, which contains only
sequences NOT from Bacteria;Firmicutes;

## alignreport option

To use the alignreport option, follow this example:

    mothur > remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, alignreport=abrecovery.align.report)

This generates the file abrecovery.pick.align.report, which contains
only sequences NOT from Bacteria;Firmicutes;

## list option

To use the list option, follow this example:

    mothur > remove.lineage(taxonomy=abrecovery.silva.taxonomy, taxon=Bacteria;Firmicutes;, list=abrecovery.fn.list)

This generates the file abrecovery.fn.pick.list, which contains only
sequences NOT from Bacteria;Firmicutes;

## constaxonomy && shared && list

If you provide a constaxonomy file, mothur will remove the otus from a
shared or list file that are assigned to the requested taxon. The
constaxonomy parameter may only be used with list or shared.

    mothur > remove.lineage(constaxonomy=final.an.0.03.cons.taxonomy, shared=final.an.shared, taxon='Bacteria(100);Firmicutes(100);', label=0.03)

or

    mothur > remove.lineage(constaxonomy=final.an.0.03.cons.taxonomy, list=final.an.list, taxon='Bacteria(100);Firmicutes(100);', label=0.03)

## Revisions

-   1.28.0 Added count option
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
-   1.42.0 - Bug Fix: Fixes bug in **remove.lineage** with constaxonomy and
    shared files. [\#580](https://github.com/mothur/mothur/issues/580)


