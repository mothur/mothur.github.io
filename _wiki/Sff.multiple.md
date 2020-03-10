---
title: 'Sff.multiple'
---
The **sff.multiple** command reads a file
containing sff filenames and optional oligos filenames. It runs the
files through sffinfo, trim.flows, shhh.flows and trim.seqs combining
the results.

## Default Options

To get going with **sff.multiple** you first need to create a file
containing the names of the sff files you would like to process. Here\'s
an example:

    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.sff  F5MMO9001.oligos
    F5MMO9001.1.F5MMO9001.water_blank_2.WUGSC.v13.sff  F5MMO9001.oligos
    #F5MMO9001.1.F5MMO9001.positive_mock_2.WUGSC.v13.sff   F5MMO9001.oligos

The \'\#\' character indicates to mothur you wish to ignore that line in
the file. The oligos file name is optional.

    mothur > sff.multiple(file=sfffiles.txt)

The output to the screen will look like:

    mothur > sff.multiple(file=sfffiles.txt)

    Using 1 processors.

    >>>>>  Processing F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.sff (file 1 of 3)  <<<<<
    /******************************************/
    Running command: sffinfo(sff=F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.sff, flow=T, trim=T)
    Extracting info from F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.sff ...
    102
    It took 0 secs to extract 102.
    Output File Names: 
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.fasta
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.qual
    release/F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.flow


    Running command: summary.seqs(fasta=F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.fasta, processors=1)

    Using 1 processors.

           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   50  50  0   3   1
    2.5%-tile: 1   53  53  0   3   3
    25%-tile:  1   377 377 0   4   26
    Median:    1   535 535 0   4   52
    75%-tile:  1   549 549 0   5   77
    97.5%-tile:    1   571 571 0   6   100
    Maximum:   1   574 574 1   7   102
    Mean:  1   432.912 432.912 0.00980392  4.4902
    # of Seqs: 102

    Output File Name: 
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.summary


    Running command: trim.flows(flow=F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.flow, oligos=/F5MMO9001.oligos, maxhomop=9, maxflows=450, minflows=450, pdiffs=0, bdiffs=0, ldiffs=0, sdiffs=0, tdiffs=0, signal=0.5, noise=0.7, order=TACG, processors=1)

    Using 1 processors.
    102

    Output File Names: 
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.trim.flow
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.scrap.flow
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.F5MMO9001.water_blank_1.WUGSC.v35.flow
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.flow.files


    Running command: shhh.flows(file=F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.flow.files, lookup=LookUp_Titanium.pat, cutoff=0.01, sigma=60, mindelta=0.000001, order=TACG, processors=1)

    Using 1 processors.
     
    >>>>>  Processing F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.F5MMO9001.water_blank_1.WUGSC.v35.flow (file 1 of 1)   <<<<<
    Reading flowgrams...
    Identifying unique flowgrams...
    Calculating distances between flowgrams...
    ...
    Output File Names: 
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.F5MMO9001.water_blank_1.WUGSC.v35.shhh.qual
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.F5MMO9001.water_blank_1.WUGSC.v35.shhh.fasta
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.F5MMO9001.water_blank_1.WUGSC.v35.shhh.names
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.F5MMO9001.water_blank_1.WUGSC.v35.shhh.counts
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.F5MMO9001.water_blank_1.WUGSC.v35.shhh.groups
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.fasta
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.names


    Running command: trim.seqs(fasta=F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.fasta, name=F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.names, oligos=F5MMO9001.oligos, allfiles=f, flip=f, keepforward=f, pdiffs=0, bdiffs=0, ldiffs=0, sdiffs=0, tdiffs=0, maxambig=-1, minlength=0, maxlength=0, processors=1)

    Using 1 processors.
    37

    Group count: 
    F5MMO9001.water_blank_1.WUGSC.v35  66
    Total of all groups is 66

    Output File Names: 
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.trim.fasta
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.scrap.fasta
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.trim.names
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.scrap.names
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.groups


    Running command: summary.seqs(fasta=F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.trim.fasta, processors=1, name=F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.trim.names)

     Using 1 processors.
     
           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   263 263 0   4   1
    2.5%-tile: 1   263 263 0   4   2
    25%-tile:  1   267 267 0   4   17
    Median:    1   276 276 0   4   34
    75%-tile:  1   283 283 0   4   50
    97.5%-tile:    1   305 305 0   6   65
    Maximum:   1   305 305 0   7   66
    Mean:  1   278.636 278.636 0   4.33333
    # of unique seqs:  37
    total # of seqs:   66

    Output File Name: 
    F5MMO9001.1.F5MMO9001.water_blank_1.WUGSC.v35.shhh.trim.summary


    /******************************************/
    ...

## Optional Parameters

### minflows & maxflows

The minflows parameter will set the minimum number of flows that each
sequence must contain to make it in to a \"trim\" file while running the
trim.flows command. By default this is set to 450; Chris Quince has
preferred 360 in his documentation for processing GSFLX and Titanium
data.

### bdiffs & pdiffs & ldiffs & sdiffs & tdiffs

These parameters are used to allow differences in the barcode, primers,
linkers and spacers. pdiffs is maximum number of differences to the
primer sequence, default=0. bdiffs is maximum number of differences to
the barcode sequence, default=0. ldiffs is maximum number of differences
to the linker sequence, default=0. sdiffs is maximum number of
differences to the spacer sequence, default=0. tdiffs is maximum total
number of differences to the barcode, primer, linker and spacer (default
to pdiffs + bdiffs + ldiffs + sdiffs).

### signal & noise

By default, trim.flows will treat any intensity signal greater than 0.50
as a real signal and any intensity less than 0.70 as noise. If an
intensity falls between 0.50 and 0.70, it is treated as ambiguous and
set as a trim point. The settings of 0.50 and 0.70 are suggested by
Quince and we really see no need to change it, but in case people want
to play with the values here is how you\'d do it:

    mothur > sff.multiple(file=sfffiles.txt, signal=0.60, noise=0.65)

### maxhomop

Looking at the summary.seqs output for your dataset you may notice that
the longest homopolymer in the dataset is 31 bases long. This is highly
suspect as it is well-established that 454 technology struggles with
homopolymers. To cap the homopolymer length you use the maxhomop option:

    mothur > sff.multiple(file=sfffiles.txt, maxhomop=9)

### order

The order parameter is used to select the flow order. Options are A, B
and I. Default=A, meaning flow order of TACG.

    mothur > sff.multiple(file=sfffiles.txt, order=A)

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

    mothur > sff.multiple(file=sfffiles.txt, maxiter=1000)

### mindelta

The mindelta sets a threshold for determining how much change in the
flowgram correction is allowed before saying that the job is done. By
default this is set to 0.000001 (i.e. 10\^-6). We took this default
value from Chris Quince. It can be changed as follows:

    mothur > sff.multiple(file=sfffiles.txt, mindelta=0.000001)

### cutoff

The cutoff option is used in the initial clustering step to seed the
expectation-maximizaton step. Quince suggests a default value of 0.01
and we have no reason to suggest otherwise:

    mothur > sff.multiple(file=sfffiles.txt, cutoff=0.01)

### sigma

The sigma option is used to set the dispersion of the data in the
expectation-maximization step of the algorithm. Quince suggests a
default value of 0.06 and we have no reason to suggest otherwise:

    mothur > sff.multiple(file=sfffiles.txt, sigma=0.06)

### minlength & maxlength

Huse and colleagues also found that large variations in sequence length
was an indicator of poor sequence quality. Of course, they were working
with sequences that they knew the correct sequence lengths, so you
should be cautious about screening based on length. Looking at these
data, you might predict that sequences shorter than 200 bp or longer
than 300 bp are probably bad, but it is a judgement call:

    mothur > sff.multiple(file=sfffiles.txt, minlength=200, maxlength=300)

### keepfirst & removelast

The keepfirst parameter in [trim.seqs](trim.seqs) trims the
sequence to the first keepfirst number of bases after the barcode or
primers are removed, before the sequence is checked to see if it meets
the other requirements. The removelast removes the last removelast
number of bases after the barcode or primers are removed, before the
sequence is checked to see if it meets the other requirements.

### allfiles

With the barcodes it is possible to sequence many different samples in a
single 454 run. It may happen that some of these samples should not be
analyzed together for your analysis (e.g. comparing fecal to rhizosphere
microbial communities). To parse apart the sequences that belong to each
sample, use the allfiles option. This will generate a fasta and groups
file for each barcode defined in your oligos file:

    mothur > sff.multiple(file=sfffiles.txt, allfiles=T)

### keepforward

The keepforward parameter allows you indicate you want to keep the
primer for the [trim.seqs](trim.seqs) command. Default=F.

### processors

The processors parameter allows you to run the command with multiple
processors. Default processors=Autodetect number of available processors
and use all available.

    mothur > sff.multiple(file=sfffiles.txt, processors=2)

## Revisions

-   1.28.0 - First introduced
-   1.30.0 - Bug Fix: - end of file character added to oligos filenames
    when the input file did not end in blank line, resulting in cannot
    find file error.
-   1.31.0 - Bug Fix: fixed order parameter to use A, B and I.
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.

[Category:Commands](Category:Commands)
