---


title: 'Shhh.flows'
---
The [shhh.flows](shhh.flows) command is Pat Schloss\'s
translation of Chris Quince\'s PyroNoise algorithm
[1](http://people.civil.gla.ac.uk/~quince/Software/PyroNoise.html) from
C to C++ with the incorporation of mothur\'s bells and whistles. Based
on processing of test datasets provided by Quince, shhh.flows gives the
same/similar output to AmpliconNoise. (Note: The AmpliconNoise pipeline
includes a second algorithm, SeqNoise. SeqNoise does not operate on the
underlying flowgrams. A mothur implementation of SeqNoise is available
as [shhh.seqs](shhh.seqs).) shhh.flows uses a
expectation-maximization algorithm to correct flowgrams to identify the
idealized form of each flowgram and translate that flowgram to a DNA
sequence. Our testing has shown that when Titanium data are trimmed to
450 flows using [trim.flows](trim.flows), shhh.flows provides
the highest quality data for any other method available. In contrast,
when we use the min/max number of flows suggested by Quince of 360/720,
the error rate is not that great. This much improved error rate does
come at a computational cost. Whereas the features in
[trim.seqs](trim.seqs) take on the order of minutes,
shhh.flows can take on the order of hours. Running shhh.flows with large
datasets without multiple processors or MPI is not suggested. You can
obtain the appropriate version of MPI for your operating system at
<http://www.open-mpi.org/>. You will also need a lookup file that tells
shhh.flows the probability of observing an intensity value for a given
homopolymer length. You can get mothur-compatible files [
here](lookup_files) and will need to put these files either
with your data or the mothur executable.

{% include toc.html %}

## Default settings

There are two ways to run shhh.flows. First, if you have single flow
files that you generated in [trim.flows](trim.flows) and you
want to process the through shhh.flows, you will need to use the flow
option as follows:

    mothur > shhh.flows(flow=GQY1XT001.A01.v35.flow)

This will generate several files including \...

-   GQY1XT001.A01.v35.shhh.fasta - idealized fasta sequence data
    containing the de-noised sequences
-   GQY1XT001.A01.v35.shhh.names - a names file that maps each read to
    an idealized fasta sequence
-   GQY1XT001.A01.v35.shhh.qual - quality scores on a 100 point scale
    and should not be confused with the more conventional phred scores.
-   GQY1XT001.A01.v35.shhh.groups - a group file indicating the group
    that each sequence in the names file comes from
-   GQY1XT001.A01.v35.shhh.counts - a summary of the original translated
    sequences sorted with their idealized sequence counterpart

Alternatively, if you used multiple barcodes and or primers in
[trim.flows](trim.flows), then the names of the resulting
flow files will be stored in a file ending in \"flow.files\". Using the
files option will tell the shhh.flows command to process each of those
flow files:

    mothur > shhh.flows(files=GQY1XT001.flow.files)

This will create the 5 files from above for each barcode / primer
combination plus concatenated GQY1XT001.shhh.fasta and
GQY1XT001.shhh.names files that can be used as input to
[trim.seqs](trim.seqs).

## Options

### processors

Although MPI is not required to run shhh.flows, to get all you can out
of all of your processors, you really need to use MPI and the MPI
version of mothur. To run shhh.flows without MPI, but still get a small
boost in performance you can do the following:

    mothur > shhh.flows(files=GQY1XT001.flow.files, processors=8)

This will allow you to use 8 processors (for mac and linux boxes) in the
initial distance calculation step, but will only use 1 processor during
the expeectation-maximization step. Alternatively, you can get the full
boost in both stages with mpi by running the following from the command
line:

    mpirun -np 8 mothurMPI "#shhh.flows(file=GQY1XT001.flow.files)"

### lookup

A lookup file is required to run shhh.flows and it needs to be located
either in the same folder as your data, next to your executable, or in
the path you give this option. You can obtain the various [lookup
files](lookup_files) that are compatible with mothur.

### maxiter

The maxiter option tells shhh.flows the maximum iterations to run if the
delta value does not first drop below the mindelta value. The minimum
number of iterations is 10. By default maxiter is set to 1000. If you
set maxiter to 0, then the number of iterations do not matter and the
mindelta criteria will be used. To change the value of maxiter, do so as
follows:

    mothur > shhh.flows(flow=GQY1XT001.A01.v35.flow, maxiter=1000)

### mindelta

The mindelta sets a threshold for determining how much change in the
flowgram correction is allowed before saying that the job is done. By
default this is set to 0.000001 (i.e. 10\^-6). We took this default
value from Chris Quince. It can be changed as folllows:

    mothur > shhh.flows(flow=GQY1XT001.A01.v35.flow, mindelta=0.000001)

### cutoff

The cutoff option is used in the initial clustering step to seed the
expectation-maximizaton step. Quince suggests a default value of 0.01
and we have no reason to suggest otherwise:

    mothur > shhh.flows(flow=GQY1XT001.A01.v35.flow, cutoff=0.01)

### sigma

The sigma option is used to set the dispersion of the data in the
expectation-maximization step of the algorithm. Quince suggests a
default value of 0.06 and we have no reason to suggest otherwise:

    mothur > shhh.flows(flow=GQY1XT001.A01.v35.flow, sigma=0.06)

### order

The order parameter is used to select the flow order. Options are A, B
and I. Default=A, meaning flow order of TACG.

    mothur > trim.flows(fasta=GQY1XT001.flow, order=A)

### large

The large parameter allows you to split your flow file and process the
pieces separately.

    mothur > shhh.flows(flow=GQY1XT001.flow, large=10000)

## Next steps

The next thing you will likely want to do is remove the barcode and
primer sequences from each idealized fasta sequence and generate a group
file like you would if you had just used the raw fasta data. You, of
course, can do this with [trim.seqs](trim.seqs). For example,
we might use the following command:

    mothur > trim.seqs(fasta=GQY1XT001.shhh.fasta, name=GQY1XT001.shhh.names, oligos=GQY1XT001.oligos, pdiffs=2, bdiffs=1, flip=T, processors=8)

From this output you are ready to carry out the rest of your pipeline.

## Revisions

-   First introduced - version 1.22.0.
-   1.25.0 - with outputdir didn\'t put all of the files to the output
    directory
-   1.26.0 - added large parameter
-   1.30.0 - added flow order options A, B and I.

[Category:Commands](Category:Commands)
