---
title: 'trim.flows'
tags: 'commands'
redirect_from: '/wiki/Trim.flows.html'
---
The **trim.flows** command is analogous to the
[trim.seqs](/wiki/trim.seqs) command, except that it uses the
flowgram data that comes bundled in the sff file that is generated by
454 sequencing. It's primary usage is as a preliminary step to running
shhh.seqs. Chris Quince has a series of perl scripts that fulfill a
similar role
[1](https://code.google.com/archive/p/ampliconnoise/downloads). This
command will allow you to partition your flowgram data by sample based
on the barcode, trim the flows to a specified length range, and cull
sequences that are too short or have too many mismatches to barcodes and
primers. For this page we use a hypothetical sff file - GQY1XT001.sff.

## Preliminaries and defaults

To get going with **trim.flows** you first need to have flowgram data. You
can generate this in mothur using mothur's version of
[sffinfo](/wiki/sffinfo) with the flows option.

    mothur > sffinfo(sff=GQY1XT001.sff, flow=T)

Opening up GQY1XT001.flow in your favorite text editor will reveal a
file that looks like this.

    800
    GQY1XT001CQL4K 85 1.04 0.00 1.00 0.02 0.03 1.02 0.05 ...
    GQY1XT001CQIRF 84 1.02 0.06 0.98 0.06 0.09 1.05 0.07 ... 
    GQY1XT001CF5YW 88 1.02 0.02 1.01 0.04 0.06 1.02 0.03 ...
    GQY1XT001DB0ZG 85 1.04 0.00 1.01 0.01 0.02 1.01 0.00 ...
    GQY1XT001AKONJ 89 1.03 0.00 1.02 0.01 0.02 1.01 0.00 ...
    GQY1XT001BJEZH 292 1.03 0.01 1.00 0.02 0.03 1.02 0.00 ...
    GQY1XT001C1YUM 304 1.04 0.02 1.04 0.02 0.05 0.97 0.02 ...
    GQY1XT001BBRX0 140 1.02 0.03 0.99 0.03 0.04 1.05 0.04 ...

What you have on the first row is the total number of flow values - 800
for Titanium data. For GS FLX it would be 400. The second and following
lines contain the sequence name, the number of useable flows as defined
by 454's software, and the flow intensity for each base going in the
order of TACG. So for example, the first sequence looks like\....

    GQY1XT001CQL4K 85 1.04 0.00 1.00 0.02 0.03 1.02 0.05 ...

By default, **trim.flows** will require each sequence to contain at least
450 flows and will trim each flowgram to 450 flows. We have found that
this does the best job of reducing the sequencing noise. However, this
assumes that your amplicon is shorter than 450 flows (i.e. Bacterial
primers 27F/519R which amplify V1-3 only requires 350-400 flows to
sequence depending on the exact sequence). Chris Quince suggests a
minimum number of flows of 360 and a maximum of 720. We use Quince's
settings for denoting the minimum signal (0.50) and noise (0.70). To run
trim.flows with the default settings you will do the following:

    mothur > trim.flows(flow=GQY1XT001.flow)

This will create a file called GQY1XT001.trim.flow and
GQY1XT001.scrap.flow, that contain the trimmed files that passed the
criteria and the sequences that didn't, respectively. In the
GQY1XT001.scrap.flow file, you can see appended to the accession numbers
the criteria(on) on which each read was culled (l for length, b for
barcode, etc). Also created is a file called GQY1XT001.flow.files which
lists all of the flow files that were created.

Rarely will you really just want the default settings. Below are some
options that you are likely to want to use:

## Options

### oligos

The oligos option takes a file that can contain the sequences of the
forward and reverse primers and barcodes and their sample identifier.
Each line of the oligos file can start with the key words "forward",
"reverse", and "barcode" or it can start with a "\#" to tell
mothur to ignore that line of the oligos file. This same file can be
used for running the [trim.seqs](/wiki/trim.seqs) command. For
example, consider a trimmed version of sahl09.oligos:

    forward    CATGCTGCCTCCCGTAGGAGT vWhateverF
    #reverse   TCAGAGTTTGATCCTGGCTCAG vWateverR
    barcode    AACCAACC    ALP50M
    barcode    AACCAAGG    AZAC1 
    barcode    AACCATCG    ALP2B
    barcode    AACCATGC    ALP1B
    barcode    AACCGCAT    ALP80M
    barcode    AACCGCTA    ALPG2
    barcode    AACCGGAA    AZ273
    ...

The forward primer is best thought of as the forward sequencing primer.
So if you are using the 16S rRNA primers 27f and 338r to generate
sequencing substrate, but you are sequencing off of the 338r end of the
fragment, you would list 338r as the forward primer and 27f as the
reverse. Here we are using a "\#" for the reverse primer to indicate
that we don't want mothur to screen for the reverse primer. If the
"\#" were removed, all of the sequences would wind up in the scrap
file because the reads are typically not long enough to get to the
distal primer. The lines starting with barcode follow the format of
"barcode" - tab - barcode sequence - tab - sample identifier - line
break. There is no limit to the number of primers or barcodes that
mothur can handle. The forward and reverse primers can also be
degenerate using standard IUPAC nomenclature. You can enter your oligos
as upper or lowercase letters.

    mothur > trim.flows(flow=GQY1XT001.flow, oligos=GQY1XT001.oligos)

Running **trim.flows** with the oligos file will generate a number of new
flow files. For example:

    GQY1XT001.A01.v35.flow
    GQY1XT001.A02.v35.flow
    GQY1XT001.A03.v35.flow
    GQY1XT001.A04.v35.flow
    GQY1XT001.A05.v35.flow
    GQY1XT001.A06.v35.flow
    GQY1XT001.A07.v35.flow
    ...

The GQY1XT001.flow.files file will contain a list of all of these files
and will come in handy for the [shhh.seqs](/wiki/shhh.seqs)
command.

### bdiffs & pdiffs & ldiffs & sdiffs & tdiffs

These parameters are used to allow differences in the barcode, primers,
linkers and spacers. It has been shown that sequencing errors in the PCR
primer region of a sequence correlate highly with poor sequence quality.
Therefore, the default is to require an exact match to the primer or
barcode sequences that you provide. pdiffs is maximum number of
differences to the primer sequence, default=0. bdiffs is maximum number
of differences to the barcode sequence, default=0. ldiffs is maximum
number of differences to the linker sequence, default=0. sdiffs is
maximum number of differences to the spacer sequence, default=0. tdiffs
is maximum total number of differences to the barcode, primer, linker
and spacer (default to pdiffs + bdiffs + ldiffs + sdiffs).

    mothur > trim.flows(flow=GQY1XT001.flow, oligos=GQY1XT001.oligos, bdiffs=1, pdiffs=2)

### minflows & maxflows

The minflows parameter will set the minimum number of flows that each
sequence must contain to make it in to a "trim" file. By default this
is set to 450; Chris Quince has preferred 360 in his documentation for
processing GSFLX and Titanium data.

    mothur > trim.flows(flow=GQY1XT001.flow, minflows=450)

The maxflows parameter will set the number of flows after which all
other flows should be ignored. For instance, with Titanium data there
are 800 flows. Setting maxflows to 450 (the default) will result in
trimming the flowgram data to 450 flows. By default this is set to 450;
Chris Quince has preferred 360 in his documentation for processing GSFLX
data and 720 for Titanium data.

    mothur > trim.flows(flow=GQY1XT001.flow, maxflows=450)

Combining minflows and maxflows allows you to set the range of flows you
want. By default you will get flowgrams that are all 450 flows long. The
following will give you Quince's recommended set up for Titanium data:

    mothur > trim.flows(flow=GQY1XT001.flow, minflows=360, maxflows=720)

### fasta

The fasta option allows you to tell **trim.flows** that you want it to
translate the flowgram data to fasta sequence format:

    mothur > trim.flows(flow=GQY1XT001.flow, fasta=T)

### signal & noise

By default, **trim.flows** will treat any intensity signal greater than 0.50
as a real signal and any intensity less than 0.70 as noise. If an
intensity falls between 0.50 and 0.70, it is treated as ambiguous and
set as a trim point. The settings of 0.50 and 0.70 are suggested by
Quince and we really see no need to change it, but in case people want
to play with the values here is how you'd do it:

    mothur > trim.flows(flow=GQY1XT001.flow, signal=0.60, noise=0.65)

### maxhomop

Looking at the summary.seqs output for your dataset you may notice that
the longest homopolymer in the dataset is 31 bases long. This is highly
suspect as it is well-established that 454 technology struggles with
homopolymers. To cap the homopolymer length you use the maxhomop option:

    mothur > trim.flows(flow=GQY1XT001.flow, maxhomop=9)

It is likely that sequences with longer homopolymers will get culled for
other reasons.

### order

The order parameter is used to select the flow order. Options are A, B
and I. Default=A, meaning flow order of TACG.

    mothur > trim.flows(flow=GQY1XT001.flow, order=A)

### processors

The processors parameter allows you to run the command with multiple
processors. Default processors=Autodetect number of available processors
and use all available.

    mothur > trim.flows(flow=GQY1XT001.flow, oligos=GQY1XT001.oligos, processors=2)

## Putting it together

Here's how one might mix and match the settings to process their
Titanium data\...

    mothur > trim.flows(flow=GQY1XT001.flow, oligos=GQY1XT001.oligos, pdiffs=2, bdiffs=1, processors=8)

This will generate individual flow files for each barcode/primer
combination, GQY1XT001.trim.flow and GQY1XT001.scrap.flow files and a
GQY1XT001.flow.files file.

## Revisions

-   First Introduced - version 1.22.0.
-   1.23.0 - fixed bug that occurred if you had multiple primers with
    blank names. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1358](https://forum.mothur.org/viewtopic.php?f=4&t=1358)
-   1.24.0 - added linker and spacer option to the oligos file, as well
    as ldiffs and sdiffs parameters.
-   1.25.0 - allow for characters other than ATGC in reverse primers.
-   1.30.0 - added flow orders A, B and I.
-   1.33.0 - Bug Fix: printing trimmed number of flows to scrap file
    instead of original number of flows. Caused error if you wanted to
    read scrapped flow file.
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.45.0 Fixes trim.flows empty *flow.files issue.
-   1.48.0 Changes default output to count file instead of name file.
