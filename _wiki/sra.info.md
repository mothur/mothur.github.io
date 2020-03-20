---
title: 'sra.info'
tags: 'commands'
redirect_from: '/wiki/Sra.info.html'
---
The **sra.info** command reads an accnos file containing sample names. It
uses prefetch and fasterq\_dump to download and extract the fastq files.
It outputs a [ file](/wiki/File_File) for use with the
[make.contigs](/wiki/make.contigs) command. The prefetch and
fasterq\_dump tools developed by NCBI,
[https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software). To
follow along with this tutorial, download the accnos file [ sra.info
accnos file](https://mothur.s3.us-east-2.amazonaws.com/wiki/srainfo.zip).

## Default Settings

The accnos parameter is used to list the samples you wish to download.
It is required.

    mothur > sra.info(accnos=srainfo.accnos)

The screen output should look like this:

    >>>>>  Processing sample SRX7796885 (1 of 5)   <<<<<
    /******************************************/

    Running command: system("/Users/sarahwestcott/desktop/mothur/TARGET_BUILD_DIRTARGET_BUILD_DIR/tools/prefetch" SRX7796885  -o   /Users/sarahwestcott/desktop/release/SRX7796885.sra )
    2020-03-05T13:13:04 prefetch.2.10.1: 1) Downloading 'SRR11175880'...
    2020-03-05T13:13:04 prefetch.2.10.1:  Downloading via https...
    2020-03-05T13:13:05 prefetch.2.10.1:  https download succeed
    2020-03-05T13:13:05 prefetch.2.10.1: 1) 'SRR11175880' was downloaded successfully
    2020-03-05T13:13:05 prefetch.2.10.1: 'SRX7796885' has 0 unresolved dependencies

    /******************************************/
    It took 2 seconds to download sample SRX7796885.
    /******************************************/

    Running command: system("/Users/sarahwestcott/desktop/mothur/TARGET_BUILD_DIRTARGET_BUILD_DIR/tools/fasterq-dump" /Users/sarahwestcott/desktop/release/SRX7796885.sra  -S -3 --threads 16 -o /Users/sarahwestcott/desktop/release/SRX7796885.fastq )
    spots read      : 28,526
    reads read      : 57,052
    reads written   : 57,052

    /******************************************/

    ...

## Options

### fasterq

The fasterq parameter allows you to specify location of the
fasterq\_dump executable. By default mothur will look in its location
and the location of MOTHUR\_TOOLS if specified at compile time or set
through the [
set.dir](/wiki/Set.dir#tools)(tools=locationOfExternalTools)
command.

    mothur > sra.info(accnos=srainfo.accnos, fasterq=/usr/bin/fasterq-dump)

### prefetch

The prefetch parameter allows you to specify location of the prefetch
executable. By default mothur will look in its location and the location
of MOTHUR\_TOOLS if specified at compile time or set through the [
set.dir](/wiki/Set.dir#tools)(tools=locationOfExternalTools)
command.

    mothur > sra.info(accnos=srainfo.accnos, prefetch=/usr/bin/prefetch)

### maxsize

The maxsize parameter allows you to limit the size of the files
downloaded by prefetch. The default is 20 (20GB). To set the max size to
1G, run this command:

    mothur > sra.info(accnos=srainfo.accnos, maxsize=1)

### gz

The gz parameter allows you to compress the fastq files. The default is
false.

    mothur > sra.info(accnos=srainfo.accnos, gz=true)

### processors

The processors parameter allows you to specify how many processors you
would like to use. The default is all available. NOTE: Windows does not
support multiple processors.

    mothur > sra.info(accnos=srainfo.accnos, processors=12)

## Revisions

-   1.44.0 First Introduced.
    [\#27](https://github.com/mothur/mothur/issues/27)


