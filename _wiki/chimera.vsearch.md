---
title: 'chimera.vsearch'
tags: 'commands'
redirect_from: '/wiki/Chimera.vsearch.html'
---
The **chimera.vsearch** command reads a
fasta and count file or fasta file and reference file and outputs potentially chimeric sequences.
The vsearch program is donated to the public domain,
[https://github.com/torognes/vsearch](https://github.com/torognes/vsearch).


## Default Settings

### De Novo

    mothur > chimera.vsearch(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.count_table)
    
### Reference

    mothur > chimera.vsearch(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, reference=chimera.reference.fasta)

The chimeras file format is explained
[here](https://web.archive.org/web/20150220030441/https://drive5.com/usearch/manual/uchimeout.html).

## Options

### count

The [ count](/wiki/Count_File) file is used to represent the number of duplicate sequences for a
given representative sequence. The count file can also contain group
information.

    chimera.vsearch(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.count_table)

### dereplicate

The dereplicate parameter can be used when checking for chimeras by
group. If the dereplicate parameter is false, then if one group finds
the sequence to be chimeric, then all groups find it to be chimeric,
default=f. If you set dereplicate=t, and then when a sequence is found 
to be chimeric it is removed from it's group, not the entire dataset. 

    mothur > chimera.vsearch(dereplicate=t, fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.count_table)

Note: When you set dereplicate=t, mothur generates a new count table
with the chimeras removed and counts adjusted by sample. 

For a detailed example: [Dereplicate example](/wiki/chimera_dereplicate_example)

### removechimeras
    
The removechimeras parameter allow you to remove the chimeras from your files instead of just flagging them. Default=t.

### processors

The processors parameter allows you to specify how many processors you
would like to use. The default is all available.

### vsearch

The vsearch parameter allows you to specify the name and location of
your vsearch executable. By default mothur will look in your path and
mothur's executable location. You can set the vsearch location as
follows: vsearch=/usr/bin/vsearch.

    mothur > chimera.vsearch(vsearch=/usr/bin/vsearch.2.17.1, fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.count_table)

### abskew

The abskew parameter can only be used with template=self. Minimum
abundance skew. Default 1.9. Abundance skew is: min \[ abund(parent1),
abund(parent2) \] / abund(query).

### chimealns

The chimealns parameter allows you to indicate you would like a file
containing multiple alignments of query sequences to parents in human
readable format. Alignments show columns with differences that support
or contradict a chimeric model.

### minh

The minh parameter - mininum score to report chimera. Default 0.3.
Values from 0.1 to 5 might be reasonable. Lower values increase
sensitivity but may report more false positives. If you decrease xn you
may need to increase minh, and vice versa.

### mindiv

The mindiv parameter - minimum divergence ratio, default 0.5. Div ratio
is 100%% - %%identity between query sequence and the closest candidate
for being a parent. If you don't care about very close chimeras, then
you could increase mindiv to, say, 1.0 or 2.0, and also decrease minh,
say to 0.1, to increase sensitivity. How well this works will depend on
your data. Best is to tune parameters on a good benchmark.

### mindiffs

The mindiffs parameter - minimum number of differences in segment
Default = (3).

### xn

The xn parameter - weight of a no vote. Default 8.0. Decreasing this
weight to around 3 or 4 may give better performance on denoised data.

### dn

The dn parameter - pseudo-count prior on number of no votes. Default

1\.4. Probably no good reason to change this unless you can retune to a
good benchmark for your data. Reasonable values are probably in the
range from 0.2 to 2.

### name - not recommended

The name option allows you to provide a name file associated with your fasta file.

We DO NOT recommend using the name file. Instead we recommend using a count file. The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


### group - not recommended

The group parameter allows you to provide a group file.

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file. The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

## Revisions

-   1.38.0 First Introduced
-   1.39.0 Adds **chimera.vsearch** for Windows users
-   1.39.2 Bug Fix: removing last character of sequence names when
    processing with a reference. Not an issue with denovo method.
-   1.40.0 Fixes screen output. \#309
-   1.42.0 Updates vsearch version to 2.11.1
    [\#585](https://github.com/mothur/mothur/issues/585)
-   1.42.0 Adds vsearch parameter to **chimera.vsearch** so that you can
    specify location of vsearch executable.
    [\#586](https://github.com/mothur/mothur/issues/586)
-   1.44.0 Adds parallelization to **chimera.vsearch** when using denovo
    method. [\#700](https://github.com/mothur/mothur/issues/700)
-   1.45.0 Adds multiple processors for chimera.vsearch when using reference instead of denovo. [\#757](https://github.com/mothur/mothur/issues/757)
-   1.45.0 Updates vsearch to 2.16.0. https://github.com/torognes/vsearch/releases/tag/v2.16.0
-   1.47.0 Adds removechimeras parameter to chimera commands to auto remove chimeras from files. [\#795](https://github.com/mothur/mothur/issues/795)
-   1.47.0 Fixes formatting issue with chimera.vsearch with a reference
-   1.48.0 Significant speed improvements to command's split by sample process. 
-   1.48.0 Fixes bug with chimera.vsearch with no groups and denovo

