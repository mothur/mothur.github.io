---
title: 'sort.seqs'
tags: 'commands'
redirect_from: '/wiki/Sort.seqs.html'
---
The **sort.seqs** command puts sequences from a
fasta, name, [ count](Count_File), group, quality, flow or
taxonomy file in the same order.


## Options

The command will generate a \*.sorted.\* file. You can provide an accnos
file to indicate the order you want, otherwise mothur will use the order
of the first file it reads.

### accnos option

To use the accnos option, follow this example:

    mothur > sort.seqs(accnos=order.accnos, fasta=GQY1XT001.shhh.trim.fasta)

### name option

To use the name option, follow this example:

    mothur > sort.seqs(fasta=GQY1XT001.shhh.trim.unique.align, name=GQY1XT001.shhh.trim.names)

### count option

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence.

    mothur > sort.seqs(fasta=GQY1XT001.shhh.trim.unique.align, count=GQY1XT001.shhh.trim.count_table)

### group option

To use the group option, follow this example:

    mothur > sort.seqs(accnos=order.accnos, group=GQY1XT001.shhh.groups)

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

## Revisions

-   1.24.0 - First introduced.
-   1.28.0 - Added count option
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)


