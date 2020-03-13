---
title: 'make.lookup'
tags: 'commands'
redirect_from: '/wiki/Make.lookup.html'
---
The **make.lookup** command allows you to create custom lookup files for the
[shhh.flows](shhh.flows) command. To run this tutorial please
download: [ makelookup.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/makelookup.zip).

## Default Options

The reference, flow and error parameters are required.

    mothur > make.lookup(reference=HMP_MOCK.v53.fasta, flow=H3YD4Z101.mock3.flow_450.flow, error=H3YD4Z101.mock3.flow_450.error.summary

## Options

### barcode

The barcode parameter is used to provide the barcode sequence.
Default=AACCGTGTC.

### key

The key parameter is used to provide the key sequence. Default=TCAG.

### order

The order parameter is used to select the flow order. Options are A, B
and I. Default=A, meaning flow order of TACG.

### threshold

The threshold parameter is\.... Default=10000.

## Revisions

-   1.31.0 - First Introduced


