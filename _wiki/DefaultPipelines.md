---


title: 'DefaultPipelines'
---
{% include toc.html %}

## Schloss\_SOP

The GUI comes with the [ Schloss SOP](Schloss_SOP) already
set for you to use. You can load a pipeline by clicking on the name. You
can run the SOP with Pat\'s example files or go through the commands
inserting your own files.

![ center](DefaultPipelines.jpg " center")

## Reducing\_Sequencing\_Errors

The Reducing\_Sequencing\_Errors pipeline includes the
[trim.flows](trim.flows),
[shhh.flows](shhh.flows), [trim.seqs](trim.seqs "wikilink")
and [summary.seqs](summary.seqs) commands.

![ center](reducingSeqErrors.jpg " center")

## Processing\_Improved\_Sequences

The Processing\_Improved\_Sequences pipeline includes the
[unique.seqs](unique.seqs),
[summary.seqs](summary.seqs),
[align.seqs](align.seqs),
[screen.seqs](screen.seqs),
[filter.seqs](filter.seqs) and
[pre.cluster](pre.cluster) commands.

![ center](processingImprovedSeqs.jpg " center")

## Remmoving\_Chimeras

The Remmoving\_Chimeras pipeline includes the
[chimera.uchime](chimera.uchime),
[remove.seqs](remove.seqs) and
[summary.seqs](summary.seqs) commands.

![ center](removingChimeras.jpg " center")

## Removing\_Contaminants

The Remmoving\_Chimeras pipeline includes the
[classify.seqs](classify.seqs),
[remove.lineage](remove.lineage) and
[summary.seqs](summary.seqs) commands.

![ center](removingContaminants.jpg " center")

## Preparing\_Inputs\_For\_Analysis

The Preparing\_Inputs\_For\_Analysis pipeline includes the
[dist.seqs](dist.seqs), [cluster](cluster "wikilink"),
[make.shared](make.shared),
[count.groups](count.groups),
[sub.sample](sub.sample),
[classify.otu](classify.otu),
[phylotype](phylotype), [clearcut](clearcut "wikilink")
commands.

![ center](preparingInputs.jpg " center")

## Error\_Analysis

The Error\_Analysis pipeline includes the
[filter.seqs](filter.seqs),
[get.groups](get.groups), [seq.error](seq.error "wikilink"),
[get.seqs](get.seqs), [dist.seqs](dist.seqs "wikilink"),
[cluster](cluster),
[summary.single](summary.single) commands.

![ center](errorAnalysis.jpg " center")

## Analysis

The Analysis pipeline includes the
[collect.single](collect.single),
[rarefaction.single](rarefaction.single),
[catchall](catchall),
[summary.single](summary.single),
[heatmap.bin](heatmap.bin),
[heatmap.sim](heatmap.sim), [venn](venn "wikilink"),
[summary.shared](summary.shared),
[tree.shared](tree.shared),
[parsimony](parsimony),
[unifrac.weighted](unifrac.weighted),
[unifrac.unweighted](unifrac.unweighted),
[dist.shared](dist.shared), [pcoa](pcoa "wikilink"),
[nmds](nmds), [amova](amova "wikilink"),
[corr.axes](corr.axes), [metastats](metastats "wikilink") and
[phylo.diversity](phylo.diversity).

![ center](analysis.jpg " center")
