---
title: 'sort.seqs'
tags: 'commands'
redirect_from: '/wiki/Sort.seqs.html'
---
The **sort.seqs** command puts sequences from a
fasta, name, [ count](/wiki/Count_File), group, quality, flow or
taxonomy file in the same order.


## Options

The command will generate a \*.sorted.\* file. You can provide an accnos
file to indicate the order you want, otherwise mothur will use the order
of the first file it reads.

### accnos option

To use the accnos option, follow this example:

    mothur > sort.seqs(accnos=order.accnos, fasta=GQY1XT001.shhh.trim.fasta)

### count option

The [ count](/wiki/Count_File) file is used to represent the number of duplicate sequences for a
given representative sequence.

    mothur > sort.seqs(fasta=GQY1XT001.shhh.trim.unique.align, count=GQY1XT001.shhh.trim.count_table)

### fasta option

To use the fasta option, follow this example:

    mothur > sort.seqs(accnos=order.accnos, fasta=GQY1XT001.shhh.trim.fasta)

### flow option

To use the flow option, follow this example:

    mothur > sort.seqs(accnos=order.accnos, fasta=GQY1XT001.shhh.trim.fasta, flow=GQY1XT001.shhh.trim.flow)

### taxonomy option

To use the taxonomy option, follow this example:

    mothur > sort.seqs(accnos=order.accnos, fasta=GQY1XT001.shhh.trim.unique.good.filter.unique.precluster.pick.fasta, taxonomy=GQY1XT001.shhh.trim.unique.good.filter.unique.precluster.pick.rdp.taxonomy)

### qfile option

To use the qfile option, follow this example:

    mothur > sort.seqs(accnos=order.accnos, fasta=GQY1XT001.shhh.trim.fasta, qfile=GQY1XT001.shhh.trim.qual)

### large

The large parameter indicates your files are too large to fit in RAM,
default=F.

    mothur > sort.seqs(accnos=order.accnos, fasta=GQY1XT001.shhh.trim.fasta, qfile=GQY1XT001.shhh.trim.qual, large=T)
    
### name - not recommended

The name option allows you to provide a name file.

We DO NOT recommend using the name file. Instead we recommend using a count file. The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

### group - not recommended

The group parameter allows you to provide a group file.

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file. The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


## Revisions

-   1.24.0 - First introduced.
-   1.28.0 - Added count option
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.47.0 - Fixes crash with sort.seqs if multiple seqs present with the same name.

