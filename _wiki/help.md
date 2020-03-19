---
title: 'help'
tags: 'commands'
redirect_from: '/wiki/Help'
---
The **help** command will output a list of the valid
commands that are found in mothur.

    mothur > help()

    Valid commands are: align.check, align.seqs, amova, anosim, bin.seqs, biom.info, catchall, chimera.bellerophon, chimera.ccode, chimera.check, chimera.perseus, chimera.pintail, chimera.slayer, chimera.uchime, chimera.vsearch, chop.seqs, classify.otu, classify.seqs, classify.svm, classify.tree, clearcut, cluster, cluster.classic, cluster.fragments, cluster.split, collect.shared, collect.single, consensus.seqs, cooccurrence, corr.axes, count.groups, count.seqs, create.database, degap.seqs, deunique.seqs, deunique.tree, dist.seqs, dist.shared, fastq.info, filter.seqs, filter.shared, get.commandinfo, get.communitytype, get.coremicrobiome, get.current, get.dists, get.group, get.groups, get.label, get.lineage, get.mimarkspackage, get.otus, get.otulist, get.oturep, get.otus, get.rabund, get.relabund, get.sabund, get.seqs, get.sharedseqs, heatmap.bin, heatmap.sim, help, homova, indicator, kruskal.wallis, lefse, libshuff, list.otulabels, list.otus, list.seqs, make.biom, make.contigs, make.fastq, make.file, make.group, make.lefse, make.lookup, make.shared, make.sra, make.table, mantel, merge.count, merge.files, merge.groups, merge.sfffiles, merge.taxsummary, metastats, mgcluster, mimarks.attributes, nmds, normalize.shared, otu.association, otu.hierarchy, pairwise.seqs, parse.list, parsimony, pca, pcoa, pcr.seqs, phylo.diversity, phylotype, pre.cluster, primer.design, quit, rarefaction.shared, rarefaction.single, remove.dists, remove.groups, remove.lineage, remove.otus, remove.otus, remove.rare, remove.seqs, rename.file, rename.seqs, reverse.seqs, screen.seqs, sens.spec, seq.error, set.current, set.dir, set.logfile, set.seed, sff.multiple, sffinfo, shhh.flows, shhh.seqs, sort.seqs, sparcc, split.abund, split.groups, sub.sample, summary.qual, summary.seqs, summary.shared, summary.single, summary.tax, system, tree.shared, trim.flows, trim.seqs, unifrac.unweighted, unifrac.weighted, unique.seqs, venn.
    For more information about a specific command type 'commandName(help)' i.e. 'cluster(help)'

    For further assistance please refer to the mothur manual on our wiki at https://www.mothur.org/wiki, or contact us at mothur.bugs@gmail.com.

Or you can access the **help** for a specific command with the following:

    mothur > help(cluster)

    The cluster command parameter options are phylip, column, name, count, method, cutoff, precision, sim, showabund and timing. Fasta or Phylip or column and name are required.
    The phylip and column parameter allow you to enter your distance file. 
    The fasta parameter allows you to enter your fasta file for use with the agc or dgc methods. 
    The name parameter allows you to enter your name file. 
    The count parameter allows you to enter your count file. 
    A count or name file is required if your distance file is in column format.
    The method parameter allows you to enter your clustering mothod. Options are furthest, nearest, average, weighted, agc and dgc. Default=average.  The agc and dgc methods require a fasta file.The cluster command should be in the following format: 
    cluster(method=yourMethod, cutoff=yourCutoff, precision=yourPrecision) 
    The acceptable cluster methods are furthest, nearest, average and weighted.  If no method is provided then average is assumed.

    For further assistance please refer to the Mothur manual on our wiki at https://www.mothur.org/wiki, or contact Pat Schloss at mothur.bugs@gmail.com.

Alternatively, if you want the **help** information specific to a particular
command, use **help** as the option. For example,

    mothur > cluster(help)

You should note that the documentation on this wiki is more complete and
informative than that provided by the **help** command and options.

## Revisions

-   1.38.1 - Improved **help** options
-   1.40.0 - Updates **help** and fixes redirect bug.
    [\#387](https://github.com/mothur/mothur/issues/387)
-   1.42.0 - Improves **help** command.
    [\#183](https://github.com/mothur/mothur/issues/183)
