---
title: 'remove.lineage'
tags: 'commands'
redirect_from: '/wiki/Remove.lineage.html'
---
The **remove.lineage** command reads a taxonomy file
and taxon then generates a new file removing sequences from the
specified taxon. You may also include either a [
fasta](/wiki/fasta_file), [ name](/wiki/name_file), [
group](/wiki/group_file), [ list](/wiki/list_file), [
count](/wiki/Count_File) or [align.report file](/wiki/align.report_file) to this command and mothur will
generate new files removing
sequences from the specified taxon. This tutorial uses the data files in [Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/exampledataset.zip) 
and [mothur-formatted version of the RDP training set
    (v.9)](https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset9_032012.pds.zip).



## Default Settings

To run remove.lineage, you must provide a taxonomy or constaxonomy file and
one or more taxon names. The command will generate a \*.pick.\* file.

### Running with a taxonomy file

To generate an taxonomy file, let's first run
[classify.seqs](/wiki/classify.seqs):

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)
    mothur > remove.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;)

This generates final.pick.taxonomy a file containing the 985
sequences not from Bacteria;Firmicutes;

You can select sequences from multiple taxa by separating them with
dashes. Example:

     mothur > remove.lineage(taxonomy=taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;-Bacteria;Bacteroidetes;)

This generates final.pick.taxonomy a file containing the 113
sequences not from Bacteria;Firmicutes; or Bacteria;Bacteroidetes;

You may enter your taxon names with confidence scores, doing so will get
only those sequences that belong to the taxonomy and whose confidence
scores are below the scores you give.

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)
    mothur > remove.lineage(taxonomy=final.taxonomy, taxon=Bacteria(100);Firmicutes(90);)
    
This generates final.pick.taxonomy a file containing the 1038
sequences not from Bacteria;Firmicutes; and whose confidence scores are at or below 100
percent for Bacteria and below 90 for Firmicutes. For example:

    M00967_43_000000000-A3JHG_1_1114_8550_6381	Bacteria(100);Firmicutes(87);Firmicutes_unclassified(87);Firmicutes_unclassified(87);Firmicutes_unclassified(87);Firmicutes_unclassified(87);

is included in the .pick file, but

    M00967_43_000000000-A3JHG_1_2111_10149_9721	Bacteria(100);Firmicutes(92);Clostridia(92);Clostridiales(92);Lachnospiraceae(91);Lachnospiraceae_unclassified(91);


### Running with a constaxonomy file

First we need to find the consensus taxonomies for each OTU with the
[classify.otu](/wiki/classify.otu) command:

    mothur > classify.otu(list=final.opti_mcc.list, count=final.count_table, taxonomy=final.taxonomy)
    mothur > remove.lineage(constaxonomy=final.opti_mcc.0.03.cons.taxonomy, list=final.opti_mcc.list, taxon=Bacteria;Firmicutes;, label=0.03)

This generates final.opti_mcc.0.03.pick.list containing the 193 OTUs that are not
classified to Bacteria;Firmicutes;.

## fasta 

To use the fasta option, follow this example:

    mothur > remove.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, fasta=final.fasta)

This generates the file final.pick.fasta, which removes
sequences from Bacteria;Firmicutes;

## count

The [ count](/wiki/Count_File) file is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > remove.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, count=final.count_table)

## list 

To use the list option, follow this example:

    mothur > remove.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, list=final.opti_mcc.list)

This generates the file final.opti_mcc.pick.list, which removes
sequences from Bacteria;Firmicutes;

## constaxonomy

If you provide a constaxonomy file, mothur will remove the OTUs from a
shared or list file that are assigned to the specified taxon. The
constaxonomy parameter requires a list or shared file.

    mothur > remove.lineage(constaxonomy=final.opti_mcc.0.03.cons.taxonomy, shared=final.opti_mcc.shared, taxon=Bacteria;Firmicutes;, label=0.03)

or

    mothur > remove.lineage(constaxonomy=final.opti_mcc.0.03.cons.taxonomy, list=final.opti_mcc.list, taxon=Bacteria;Firmicutes;, label=0.03)

## alignreport

To use the alignreport option, follow this example:

    mothur > remove.lineage(taxonomy=final.taxonomy, taxon=Bacteria;Firmicutes;, alignreport=final.align.report)

This generates the file final.pick.align.report, which does not contain sequences from Bacteria;Firmicutes;

## name - not recommended

We DO NOT recommend using the name file. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

### dups - not recommended

The dups parameter is only used in tandem with a name file. By default,
dups=TRUE, so if any sequence in a specific line in the name file is in
your taxon, then all sequences in that line will be kept. This is
especially useful when used with the groupfile, since for most commands
your files can contain only the unique sequences, but the group file
needs to contain all the sequences in your name file.

## group - not recommended

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

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
-   1.45.0 Fixes bug with remove.lineage not handling taxon definitions with multiple levels.

