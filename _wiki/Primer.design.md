---
title: 'Primer.design'
tags: 'commands'
---
The **primer.design** \..... It creates a \*.otu.cons.fasta,
\*.primer.summary and \*.pick.list files.

## Default Settings

The list, fasta and otunumber parameters are required.

    mothur > primer.design(list=final.an.list, fasta=final.fasta, name=final.names, otulabel=Otu01)

## Options

### name

The name option allows you to provide a name file associated with your
fasta file.

### count

The count option allows you to provide a count file associated with your
fasta and list file.

### otulabel

The otunumber parameter is used to indicate the OTU you want to use from
your list file. It is required.

    mothur > primer.design(list=final.an.list, fasta=final.fasta, name=final.names, otulabel=Otu10)

### length

The length parameter is used to indicate the length of the primer. The
default is 18.

    mothur > primer.design(list=final.an.list, fasta=final.fasta, name=final.names, otulabel=Otu01, length=15)

### pdiffs

The pdiffs parameter is used to specify the number of differences
allowed in the primer. The default is 0.

    mothur > primer.design(list=final.an.list, fasta=final.fasta, name=final.names, otulabel=Otu01, pdiffs=1)

### mintim

The mintm parameter is used to indicate minimum melting temperature. If
a primer\'s melting temperature is below the minimum then it is ignored.

### maxtm

The maxtm parameter is used to indicate maximum melting temperature. If
a primer\'s melting temperature is above the maximum then it is ignored.

### cutoff

The cutoff parameter allows you set a percentage of sequences that
support the base when constructing the consensus sequences for each OTU.
For example: cutoff=97 would only return a sequence that only showed
ambiguities for bases that were not supported by at least 97% of
sequences.

    mothur > primer.design(list=final.an.list, fasta=final.fasta, name=final.names, otulabel=Otu01, cutoff=95)

### processors

The processors parameter allows you to indicate the number of processors
you want to use. Default processors=Autodetect number of available
processors and use all available.

    mothur > primer.design(list=final.an.list, fasta=final.fasta, name=final.names, otulabel=Otu01, processors=2)

### label

The label parameter is used to indicate the label you want to use from
your list file. If no label is given the first distance is used.

    mothur > primer.design(list=final.an.list, fasta=final.fasta, name=final.names, otulabel=Otu01, label=0.03)

## Revisions

-   1.30.0 - First Introduced
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.


