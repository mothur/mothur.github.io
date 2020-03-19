---
title: 'oligos file'
tags: 'file_types'
redirect_from: '/wiki/Oligos_File'
---
The oligos file is used to provide barcodes and primers to mothur.
mothur removes items in the following order: linkers, barcodes, spacers
then primers.

## Forward Primers

The forward primer lines can have two formats.

    forward primerString optionalPrimerName

example

    forward CCGTCAATTCMTTTRAGT

or

    forward CCGTCAATTCMTTTRAGT  Group1

## Reverse Primers

Reverse primers have only one format.

    reverse reversePrimerString

example

    reverse CCGTCAATTCMTTTRAGT

## Paired Primers

The paired primer lines can have two formats.

    primer forwardPrimerString reversePrimerString optionalPrimerName

example

    primer ATTAGAWACCCBDGTAGTCC  CCCGTCAATTCMTTTRAGT

or

    primer ATTAGAWACCCBDGTAGTCC  CCCGTCAATTCMTTTRAGT  V5

or to indicate forward only when paired reads

    primer ATTAGAWACCCBDGTAGTCC  NONE  V5

or to indicate reverse only when paired reads

    primer NONE  CCCGTCAATTCMTTTRAGT  V5

## Barcodes

Barcodes should be formatted as follows:

    barcode barcodeString sampleName

example

    barcode    AATGGTAC    F003D000
    barcode    AACCTGGC    F003D002
    barcode    TTCGTGGC    F003D004
    barcode    TTCTTGAC    F003D006
    barcode    TTCGCGAC    F003D008
    barcode    TCCAGAAC    F003D142
    barcode    AAGGCCTC    F003D144
    barcode    TGACCGTC    F003D146
    barcode    AGGTTGTC    F003D148
    barcode    TGGTGAAC    F003D150
    barcode    AACCGTGTC   MOCK.GQY1XT001

## Paired Barcodes

Paired Barcodes should be formatted as follows:

    barcode forwardBarcodeString reverseBarcodeString sampleName

example

    barcode  ccaac  ccaac  V1F01V9RA
    barcode  ggttg  ccaac  V1F02V9RA
    barcode  ttggt  ccaac  V1F03V9RA
    ...

or to indicate forward only when paired reads

    barcode  ccaac  NONE  V1F01V9RA
    barcode  ggttg  NONE  V1F02V9RA
    barcode  ttggt  NONE  V1F03V9RA
    ...

or to indicate reverse only when paired reads

    barcode  NONE  ccaac  V1F01V9RA
    barcode  NONE  ccaac  V1F02V9RA
    barcode  NONE  ccaac  V1F03V9RA
    ...

## Linkers

The linker format is as follows:

    linker yourLinkerString

example

    linker tcag

## Spacers

The spacer format is as follows:

    spacer yourSpacerString

example

    spacer tacgg

## Ignoring samples with [trim.seqs](trim.seqs) && [trim.flows](trim.flows)

You can set the group to "ignore" to indicate to mothur to cull them
from the trimmmed file.

    barcode    AATGGTAC    ignore
    forward CCGTCAATTCMTTTRAGT  ignore

## How different commands handle the \*diffs parameters

### trim.seqs

The trim.seqs command handles paired and single primers differently.
This is designed to allow for the most flexibility in designing your
analysis. Trim.seqs also sets a tdiffs (total differences) parameter
equal to biffs+pdiffs, by default but can be adjusted. Let's assume in
all cases that pdiffs=2, bdiffs=1, tdiffs=3:

-   Paired primers are allowed 2 diff total between both the forward and
    reverse primers. With forward and reverse are each allowed two
    diffs. This can be a bit confusing so here's an example:

    forwardPrimer = 2 diffs, reversePrimer = 0 diffs -> primer will be successfully removed
    forwardPrimer = 2 diffs, reversePrimer = 1 diffs -> primer will not be removed because the paired primer total diffs = 3
    forwardPrimer = 2 diffs, reversePrimer = 2 diffs -> primer will not be removed because the paired primer total diffs = 4
    forwardPrimer = 1 diffs, reversePrimer = 0 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 0 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 2 diffs ->  primer will not be removed because the paired primer total diffs = 3

-   Separate forward and reverse primers handle the diffs differently.
    Both the forward and reverse primers are allowed 2 diffs each.
    Here's the same example with separate primers.

    forwardPrimer = 2 diffs, reversePrimer = 0 diffs -> primer will be successfully removed
    forwardPrimer = 2 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 2 diffs, reversePrimer = 2 diffs -> primer will not be removed because the total diffs (bdiffs+pdiffs) = 4 
    forwardPrimer = 1 diffs, reversePrimer = 0 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 0 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 2 diffs ->  primer will be successfully removed

### pcr.seqs

The pcr.seqs command handles paired and single primers the same. The
pcr.seqs command allows you to set individual diffs values for the
forward and reverse primers. This is designed to allow for maximum
flexibility in removing primers. Let's assume pdiffs=2, rdiffs=2,
meaning allow 2 diffs in each primer.

    forwardPrimer = 2 diffs, reversePrimer = 0 diffs -> primer will be successfully removed
    forwardPrimer = 2 diffs, reversePrimer = 1 diffs ->  primer will be successfully removed
    forwardPrimer = 2 diffs, reversePrimer = 2 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 0 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 0 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 2 diffs -> primer will be successfully removed

### make.contigs

The make.contigs command is designed for paired primers, and operates
like trim.seqs. Make.contigs also sets a tdiffs (total differences)
parameter equal to biffs+pdiffs, by default, but can be adjusted. Let's
assume in all cases that pdiffs=2, bdiffs=1, tdiffs=3:

-   Paired primers are allowed 2 diff total between both the forward and
    reverse primers. With forward and reverse are each allowed two
    diffs. This can be a bit confusing so here's an example:

    forwardPrimer = 2 diffs, reversePrimer = 0 diffs -> primer will be successfully removed
    forwardPrimer = 2 diffs, reversePrimer = 1 diffs -> primer will not be removed because the paired primer total diffs = 3
    forwardPrimer = 2 diffs, reversePrimer = 2 diffs -> primer will not be removed because the paired primer total diffs = 4
    forwardPrimer = 1 diffs, reversePrimer = 0 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 0 diffs, reversePrimer = 1 diffs -> primer will be successfully removed
    forwardPrimer = 1 diffs, reversePrimer = 2 diffs ->  primer will not be removed because the paired primer total diffs = 3

[category:filetypes](Category:FileTypes)
