---
title: 'Shhh.seqs'
---
The **shhh.seqs** command is a mothur-based rewrite
of Chris Quince\'s sequence denoising algorithm, SeqNoise
[1](http://code.google.com/p/ampliconnoise/). (Note: SeqNoise is one of
two algorithms in the AmpliconNoise pipeline. The other, PyroNoise, runs
first and takes as input the raw flowgrams. A mothur implementation of
PyroNoise is available as [shhh.flows](shhh.flows).)

## Default settings

The fasta and name parameters are required.

    mothur > shhh.seqs(fasta=stool.trim.unique.good.filter.unique.fasta, name=stool.trim.unique.good.filter.names)

This will generate the following files:

-   stool.trim.unique.good.filter.unique.shhh.fasta - \...
-   stool.trim.unique.good.filter.unique.shhh.names - \...
-   stool.trim.unique.good.filter.unique.shhh.map - \...

## Options

### group

    mothur > shhh.seqs(fasta=stool.trim.unique.good.filter.unique.fasta, name=stool.trim.unique.good.filter.names, group=stool.good.groups)

### processors

Default processors=Autodetect number of available processors and use all
available.

### sigma

The sigma parameter \.... The default is 0.01.

## Revisions

-   1.23.0 First introduced.
-   1.33.0 Improved work balance load between processors.
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.

[Category:Commands](Category:Commands)
