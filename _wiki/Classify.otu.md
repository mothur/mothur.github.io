---
title: 'Classify.otu'
---
The classify.otu command is used to get a consensus taxonomy for an otu.

## Default Setting

The classify.otu command parameters are list, taxonomy, name, count,
cutoff, label and probs. The taxonomy and list parameters are required.

First you must classify your sequences, you can do so by running the
following command:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=silva.nogap.fasta, taxonomy=silva.full.taxonomy)

    Then you can use your taxonomy file to find the consensus taxonomy for your otus at various distances.

    mothur > classify.otu(taxonomy=abrecovery.silva.full.taxonomy, list=abrecovery.fn.list)

When you open abrecovery.fn.0.10.cons.taxonomy you will see:

    ...
    36 1   Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);Faecalibacterium(100);Faecalibacterium_prausnitzii(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);
    37 15  Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);Faecalibacterium(100);Faecalibacterium_prausnitzii(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);
    38 17  Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);Faecalibacterium(100);Faecalibacterium_prausnitzii(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);
    39 1   Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);Faecalibacterium(100);Faecalibacterium_prausnitzii(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);unclassified(100);
    ...

The first column is the otu number, the second column is the number of
sequences in the otu and the third column is the consensus taxonomy.

## name

The name parameter allows you add a names file with your taxonomy file.

    mothur > classify.otu(taxonomy=abrecovery.silva.full.taxonomy, list=abrecovery.fn.list, name=abrecovery.names) 

## count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > classify.otu(taxonomy=abrecovery.silva.full.taxonomy, list=abrecovery.fn.list, count=abrecovery.count_table) 

## cutoff

The cutoff parameter allows you to specify a consensus confidence
threshold for your taxonomy. The default is 51, meaning 51%. Cutoff
cannot be below 51.

    mothur > classify.otu(taxonomy=abrecovery.silva.full.taxonomy, list=abrecovery.fn.list, cutoff=80) 

## threshold

The threshold parameter allows you to specify a cutoff for your taxonomy
input file. It\'s a way to after the fact \"adjust\" the cutoff used in
classify.seqs command without having to reclassify.

    mothur > classify.otu(taxonomy=abrecovery.silva.full.taxonomy, list=abrecovery.fn.list, threshold=90) 

## label

The label parameter allows you to select what distance levels you would
like a output files created for, and is separated by dashes. The default
value for label is all labels in your inputfile.

    mothur > classify.otu(taxonomy=abrecovery.silva.full.taxonomy, list=abrecovery.fn.list, label=0.10-0.20) 

## probs

The probs parameter shuts off the outputting of the consensus confidence
results. The default is true, meaning you want the confidence to be
shown.

    mothur > classify.otu(taxonomy=abrecovery.silva.full.taxonomy, list=abrecovery.fn.list, probs=f) 

## basis

The basis parameter allows you indicate what you want the summary file
to represent, options are otu and sequence. Default is otu. For example
consider the following basis=sequence could give Clostridiales 3 105 16
43 46, where 105 is the total number of sequences whose otu classified
to Clostridiales. 16 is the number of sequences in the otus from groupA,
43 is the number of sequences in the otus from groupB, and 46 is the
number of sequences in the otus from groupC. Now for basis=otu could
give Clostridiales 3 7 6 1 2, where 7 is the number of otus that
classified to Clostridiales. 6 is the number of otus containing
sequences from groupA, 1 is the number of otus containing sequences from
groupB, and 2 is the number of otus containing sequences from groupC.

## group

The group parameter allows you to provide a group file to use when
creating the summary file.

## persample

The persample parameter allows you to find a consensus taxonomy for each
group. Default=false.

## relabund

The relabund parameter allows you to indicate you want the summary file
values to be relative abundances rather than raw abundances. Default=F.

## output

The output parameter allows you to specify format of your \*tax.summary
file. Options are simple and detail. The detail format outputs the
totals at each level, where as the simple format outputs the highest
level. The default is detail.

The detail format looks like:

    taxlevel   rankID  taxon   daughterlevels  total   A   B   C
    0  0   Root    1   28  14  20  9
    1  0.1 "k__Bacteria"   5   28  14  20  9
    2  0.1.1   "p__Actinobacteria" 1   3   0   3   0
    3  0.1.1.1 "c__Actinobacteria" 1   3   0   3   0
    4  0.1.1.1.1   "o__Bifidobacteriales"  1   3   0   3   0
    5  0.1.1.1.1.1 "f__Bifidobacteriaceae" 1   3   0   3   0
    6  0.1.1.1.1.1.1   "g__Bifidobacterium"    3   3   0   3   0
    7  0.1.1.1.1.1.1.1 "s__"   0   1   0   1   0
    7  0.1.1.1.1.1.1.2 "s__adolescentis"   0   1   0   1   0
    7  0.1.1.1.1.1.1.3 "s__longum" 0   1   0   1   0
    2  0.1.2   "p__Bacteroidetes"  1   6   5   3   3
    3  0.1.2.1 "c__Bacteroidia"    1   6   5   3   3
    4  0.1.2.1.1   "o__Bacteroidales"  2   6   5   3   3
    5  0.1.2.1.1.1 "f__Bacteroidaceae" 1   4   4   3   1
    6  0.1.2.1.1.1.1   "g__Bacteroides"    4   4   4   3   1
    7  0.1.2.1.1.1.1.1 "s__"   0   1   1   1   0
    ...

The simple format looks like:

    taxon  total   A   B   C
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__";   1   0   1   0
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__adolescentis";   1   0   1   0
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__longum"; 1   0   1   0
    ...

## printlevel

The printlevel parameter allows you to specify taxlevel of your
\*tax.summary file to print to. Options are 1 to the maz level in the
file. The default is -1, meaning max level. If you select a level
greater than the level your sequences classify to, mothur will print to
the level your max level.

    mothur > classify.otu(biom=abrecovery.an.0.03.biom, label=0.03, printlevel=4)

Detail format:

    taxlevel   rankID  taxon   daughterlevels  total   A   B   C 
    0  0   Root    1   28  14  20  9
    1  0.1 "k__Bacteria"   5   28  14  20  9
    2  0.1.1   "p__Actinobacteria" 1   3   0   3   0
    3  0.1.1.1 "c__Actinobacteria" 1   3   0   3   0
    4  0.1.1.1.1   "o__Bifidobacteriales"  1   3   0   3   0
    2  0.1.2   "p__Bacteroidetes"  1   6   5   3   3
    3  0.1.2.1 "c__Bacteroidia"    1   6   5   3   3
    4  0.1.2.1.1   "o__Bacteroidales"  2   6   5   3   3
    2  0.1.3   "p__Firmicutes" 2   13  8   10  2
    3  0.1.3.1 "c__Bacilli"    1   1   1   0   0
    4  0.1.3.1.1   "o__Turicibacterales"   1   1   1   0   0
    ...

Simple Format:

    taxon  total   A   B   C
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";  3   0   3   0
    "k__Bacteria";"p__Bacteroidetes";"c__Bacteroidia";"o__Bacteroidales";  6   5   3   3
    "k__Bacteria";"p__Firmicutes";"c__Bacilli";"o__Turicibacterales";  1   1   0   0
    ...

## Revisions

-   1.28.0 Added count parameter
-   1.29.0 Added persample parameter
-   1.29.0 Bug Fix - if basis=sequence and count file is used, redundant
    sequences were not added to .tax.summary file counts.
-   1.32.0 Bug Fix: error in \*.tax.summary counts with basis=sequence
    when using a count file.
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=2492&p=7420#p7420>
-   1.36.0 Adds threshold parameter. The threshold parameter allows you
    to specify a cutoff for the taxonomy file that is being inputted.
-   1.37.0 Adds output, print level and relabund parameters
    [\#204](https://github.com/mothur/mothur/issues/204)
    [\#158](https://github.com/mothur/mothur/issues/158)
    [\#101](https://github.com/mothur/mothur/issues/101)
-   1.37.0 Adds parent taxons to unclassified taxons for outputs
    [\#29](https://github.com/mothur/mothur/issues/29)
-   1.38.0 Removes reftaxonomy parameter
-   1.38.0 Fixes bug with persample option
-   1.39.0 Taxonomy files can now contain spaces in the taxon names
-   1.40.0 Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)

[Category:Commands](Category:Commands)
