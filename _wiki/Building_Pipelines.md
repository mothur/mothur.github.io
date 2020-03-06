---


title: 'Building Pipelines'
---
{% include toc.html %}

## Adding commands

The commands are organized into categories to help you build pipelines
for a specific task. There is also a complete list of mothur\'s commands
if you are looking for a command you know the name of.

### Command Categories

#### Sequence Processing

Sequence Processing commmands include:
[align.check](align.check),
[align.seqs](align.seqs), [bin.seqs](bin.seqs "wikilink"),
[chimera.bellerophon](chimera.bellerophon),
[chimera.ccode](chimera.ccode),
[chimera.check](chimera.check),
[chimera.perseus](chimera.perseus),
[chimera.pintail](chimera.pintail),
[chimera.slayer](chimera.slayer),
[chimera.uchime](chimera.uchime),
[chop.seqs](chop.seqs),
[cluster.fragments](cluster.fragments),
[consensus.seqs](consensus.seqs),
[count.groups](count.groups),
[count.seqs](count.seqs),
[degap.seqs](degap.seqs),
[deunique.seqs](deunique.seqs),
[dist.seqs](dist.seqs), [fastq.info](fastq.info "wikilink"),
[filter.seqs](filter.seqs), [get.seqs](get.seqs "wikilink"),
[list.seqs](list.seqs),
[make.contigs](make.contigs),
[make.fastq](make.fastq),
[count.seqs](count.seqs),
[pairwise.seqs](pairwise.seqs),
[pcr.seqs](pcr.seqs), [pre.cluster](pre.cluster "wikilink"),
[remove.seqs](remove.seqs),
[reverse.seqs](reverse.seqs),
[screen.seqs](screen.seqs),
[seq.error](seq.error),
[sff.multiple](sff.multiple), [sffinfo](sffinfo "wikilink"),
[shhh.flows](shhh.flows), [shhh.seqs](shhh.seqs "wikilink"),
[sort.seqs](sort.seqs),
[split.groups](split.groups),
[sub.sample](sub.sample),
[summary.qual](summary.qual),
[summary.seqs](summary.seqs),
[trim.flows](trim.flows), [trim.seqs](trim.seqs "wikilink")
and [unique.seqs](unique.seqs).

#### Hypothesis Testing

Hypothesis Testing commmands include: [amova](amova),
[anosim](anosim), [clearcut](clearcut "wikilink"),
[cooccurrence](cooccurrence),
[corr.axes](corr.axes),
[deunique.tree](deunique.tree), [homova](homova "wikilink"),
[indicator](indicator), [libshuff](libshuff "wikilink"),
[mantel](mantel), [nmds](nmds "wikilink"),
[otu.association](otu.association),
[parsimony](parsimony), [pca](pca "wikilink"),
[pcoa](pcoa), [phylo.diversity](phylo.diversity "wikilink"),
[unifrac.unweighted](unifrac.unweighted) and
[unifrac.weighted](unifrac.weighted).

#### OTU-Based Approaches

OTU-Based Approaches commmands include: [catchall](catchall),
[classify.shared](classify.shared),
[collect.shared](collect.shared),
[collect.single](collect.single),
[create.database](create.database),
[dist.shared](dist.shared),
[filter.shared](filter.shared),
[get.coremicrobiome](get.coremicrobiome),
[get.group](get.group), [get.groups](get.groups "wikilink"),
[get.label](get.label), [get.otus](get.otus "wikilink"),
[get.otulist](get.otulist),
[get.oturep](get.oturep), [get.otus](get.otus "wikilink"),
[get.rabund](get.rabund),
[get.relabund](get.relabund),
[get.sabund](get.sabund),
[get.sharedseqs](get.sharedseqs),
[heatmap.bin](heatmap.bin),
[heatmap.sim](heatmap.sim),
[list.otulabels](list.otulabels),
[make.shared](make.shared),
[metastats](metastats),
[normalize.shared](normalize.shared),
[otu.hierarchy](otu.hierarchy),
[parse.list](parse.list),
[rarefaction.shared](rarefaction.shared),
[rarefaction.single](rarefaction.single),
[remove.groups](remove.groups),
[remove.otulabels](remove.otulabels),
[remove.otus](remove.otus),
[remove.rare](remove.rare),
[sens.spec](sens.spec),
[split.abund](split.abund),
[summary.shared](summary.shared),
[summary.single](summary.single),
[tree.shared](tree.shared) and [venn](venn "wikilink").

#### Phylotype Analysis

Phylotype Analysis commmands include:
[classify.otu](classify.otu),
[classify.seqs](classify.seqs),
[classify.tree](classify.tree),
[get.lineage](get.lineage),
[remove.lineage](remove.lineage) and
[summary.tax](summary.tax).

#### General

General commmands include: [get.current](get.current),
[load.logfile](load.logfile),
[make.biom](make.biom), [make.group](make.group "wikilink"),
[merge.files](merge.files),
[merge.groups](merge.groups),
[set.current](set.current), [set.dir](set.dir "wikilink"),
[set.logfile](set.logfile) and [system](system "wikilink").

#### Clustering

Clustering commmands include: [cluster](cluster),
[cluster.classic](cluster.classic),
[cluster.split](cluster.split),
[mgcluster](mgcluster) and [phylotype](phylotype "wikilink").

You can add a command buy clicking on it\'s name. It will be added after
the command that is highlighted in the pipeline window. For example if
you have the following pipeline:

![ center](addingCommandBefore.jpg " center")

and you want to add the summary.seqs command after the align.seqs
command to check the alignment. You want to click on the align.seqs
command button in the pipeline window to select it, and then click on
the summary.seqs to add it.

![ center](addingCommandAfter.jpg " center")

## Removing commands

You can remove a command by right clicking on the command button and
selecting the remove option.

![](removingCommand.jpg "removingCommand.jpg")

## Setting optional parameters

### Files

You may use the browse button to select a file, type the name into the
file box, select a file from the list mothur generates, or type
\"current\" to indicate the current file of that type. In an effort to
make mothur \"smarter\", the GUI will add the names of the files created
by previous commands in your pipeline of the given type. For example
given the pipeline:

![ center](filespipelineExample.jpg " center")

the screen.seqs command fasta options would look like:

![ center](autoFillNames.jpg " center")

Some of mothur\'s file names rely on information from within the file.
In that case mothur will add a partial file name to the list. You can
select it and complete the name. Or if you select it and do not complete
the name mothur will choose the closest match to the file name pattern
it can find.

![ center](autoFillNamesPartial.jpg " center")

You can select
amazon.filter.good.phylip.an.\[jclass-thetayc\].\[tag\].tre and edit it
to indicate you want the jclass tree from distance 0.03,
amazon.filter.good.phylip.an.jclass.0.03.tre.

### Other Parameters

The other command parameters are set to mothur\'s defaults.

### Resetting to Default Values

You can reset the parameters to their defaults by right clicking on the
command button and selecting reset to default.

![ center](resetToDefault.jpg " center")

## Tool Bar & Menu Options

![ center](menuOPtions.jpg " center")

![ center](toolbar.jpg " center")

### New

The New button will create a new pipeline for you to start adding
commands to. If you already have a pipeline open you will be prompted to
save it.

### Open

The Open button allows you to open an existing pipeline from a file.

![ center](openPipeline.jpg " center")

### Close

The close button allows you to close a pipeline.

### Save & Save As

You can save a pipeline using the save button.

![ center](savePipeline.jpg " center")

The new pipeline will appear under the pipeline default SOP pipelines.

![ center](testPipeline.jpg " center")
