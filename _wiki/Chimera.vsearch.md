---
title: 'Chimera.vsearch'
tags: 'commands'
---
The **chimera.vsearch** command reads a fasta file and reference file or a
fasta and name or count file and outputs potentially chimeric sequences.
The vsearch program is donated to the public domain,
[https://github.com/torognes/vsearch](https://github.com/torognes/vsearch).


## Default Settings

The fasta parameter is required.

    mothur > chimera.vsearch(fasta=stool.trim.unique.good.align, reference=silva.gold.align)

or

    mothur > chimera.vsearch(fasta=fasta=stool.trim.unique.good.align, name=fasta=stool.trim.unique.good.names)

or

    mothur > chimera.vsearch(fasta=fasta=stool.trim.unique.good.align, name=fasta=stool.trim.unique.good.names, group=stool.trim.unique.good.groups)

The chimeras file format is explained
[here](https://drive5.com/usearch/manual/uchimeout.html).

## Options

### vsearch

The vsearch parameter allows you to specify the name and location of
your vsearch executable. By default mothur will look in your path and
mothur\'s executable. You can set the vsearch location as follows:
vsearch=/usr/bin/vsearch.

    mothur > chimera.vsearch(vsearch=/usr/bin/vsearch.2.11.1,  fasta=stool.trim.unique.good.align, name=stool.trim.good.names)

### name

You can provide a name file to check for chimeras using more abundant
sequences as the reference.

    mothur > chimera.vsearch(fasta=stool.trim.unique.good.align, name=stool.trim.good.names)

### group

If you are using reference=self and provide a groupfile, mothur will use
the more abundant sequences from the same sample to check the query
sequence.

    mothur > chimera.vsearch(fasta=stool.trim.unique.good.align, name=stool.trim.good.names, group=stool.good.groups)

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. The count file can also contain group
information.

    mothur > make.table(name=stool.trim.good.names, group=stool.good.groups)
    mothur > chimera.vsearch(fasta=stool.trim.unique.good.align, count=stool.trim.good.count_table)

### processors

The processors parameter allows you to specify how many processors you
would like to use. The default is 1.

### dereplicate

The dereplicate parameter can be used when checking for chimeras by
group. If the dereplicate parameter is false, then if one group finds
the sequence to be chimeric, then all groups find it to be chimeric,
default=f. If you set dereplicate=t, and then run remove.seqs with
dups=f you can remove only the redundant chimeric sequences.

Let\'s look at an example:

    >seq1
    attgacat....
    >seq4
    ttgacaga....

    seq1 seq1,seq2,seq3
    seq4 seq4,seq5,seq6

    seq1 group1
    seq2 group2
    seq3 group3
    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=f and dups=t, (default settings in mothur), and seq2 is
found to be chimeric by group2. The results would be:

    >seq4
    ttgacaga....

    seq4 seq4,seq5,seq6

    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=t and dups=t, and seq2 is found to be chimeric by group2.
The results would be:

    >seq4
    ttgacaga....

    seq4 seq4,seq5,seq6

    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=t and dups=f, and seq2 is found to be chimeric by group2.
The results would be:

    >seq1
    attgacat....
    >seq4
    ttgacaga....

    seq1 seq1,seq3
    seq4 seq4,seq5,seq6

    seq1 group1
    seq3 group3
    seq4 group1
    seq5 group2
    seq6 group3

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
for being a parent. If you don\'t care about very close chimeras, then
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


