---
title: 'make.file'
tags: 'commands'
redirect_from: '/wiki/Make.file.html'
---
Tired of creating the input files for make.contigs? Let mothur do that
for you! The **make.file** command takes a input directory and creates a
file containing the fastq or gz files in the directory. Need to make a 
count file that associates your fasta files with samples? The ***make.file***
and ***make.count*** commands can do that!


## Default Settings

The make.fastq command parameters are inputdir, numcols, type and prefix. Inputdir is
required.

    mothur > make.file(inputdir=fastqTest)

The resulting stability.files looks like:

    F8D0     F8D0_S345_L001_R1_001.fastq     F8D0_S345_L001_R2_001.fastq  
    F8D125   F8D125_S358_L001_R1_001.fastq   F8D125_S358_L001_R2_001.fastq    
    F8D141   F8D141_S359_L001_R1_001.fastq   F8D141_S359_L001_R2_001.fastq    
    F8D142   F8D142_S360_L001_R1_001.fastq   F8D142_S360_L001_R2_001.fastq    
    F8D143   F8D143_S361_L001_R1_001.fastq   F8D143_S361_L001_R2_001.fastq    
    ...

## Options

### type

The type parameter is used to indicate what file type you would like
mothur to look for. Options are fasta, gz or fastq. Default=fastq.

     mothur > make.file(inputdir=gzTest, type=gz)

The resulting stability.files looks like:

    F8D0     F8D0_S345_L001_R1_001.fastq.gz     F8D0_S345_L001_R2_001.fastq.gz  
    F8D125   F8D125_S358_L001_R1_001.fastq.gz   F8D125_S358_L001_R2_001.fastq.gz    
    F8D141   F8D141_S359_L001_R1_001.fastq.gz   F8D141_S359_L001_R2_001.fastq.gz    
    F8D142   F8D142_S360_L001_R1_001.fastq.gz   F8D142_S360_L001_R2_001.fastq.gz    
    F8D143   F8D143_S361_L001_R1_001.fastq.gz   F8D143_S361_L001_R2_001.fastq.gz       
    ...

Let's make a file file we can use with make.count.

    mothur > make.file(inputdir=fastaTest, type=fasta)

The resulting stability.files will look like:

    testfile.DN1576.CAD	    testfile.DN1576.CAD_705.fasta	
    testfile.DN1576.EF1a	testfile.DN1576.EF1a_771.fasta	
    testfile.DN1576.MDH	    testfile.DN1576.MDH_498.fasta	
    testfile.DN1576.RpS5	testfile.DN1576.RpS5_597.fasta	
    testfile.DN1577.EF1a	testfile.DN1577.EF1a_771.fasta	
    testfile.DN1577.MDH	    testfile.DN1577.MDH_498.fasta	
    testfile.DN1577.RpS5	testfile.DN1577.RpS5_597.fasta	
    testfile.DN1578.CAD	    testfile.DN1578.CAD_705.fasta	
    testfile.DN1578.EF1a	testfile.DN1578.EF1a_771.fasta	
    ...

You can use this file as an input for the make.count command:

    mothur > make.count(file=stability.files)

### numcols

The numcols parameter allows you to set number of columns you mothur to
make in the file. Options 2 or 3. Default=3 for type=fastq and type=gz, meaning groupName
forwardFastq reverseFastq. The groupName is made from the beginning part
of the forwardFastq file. Everything up to the first '_' or if no '_'
is found then the root of the forwardFastq filename. The default is 2 for type=fasta,
meaning groupName fastaFile.

### prefix

The prefix parameter allows you to enter your own prefix for the output
filename. Default=stability.

     mothur > make.file(inputdir=gzTest, type=gz, prefix=myReallyAwesomeData)
     
Would create a file containing the list of gz files in gzTest named
myReallyAwesomeData.files.

## Revisions

-   1.36.0 - First Introduced
-   1.37.0 Adds numcols parameter
    [\#162](https://github.com/mothur/mothur/issues/162)
-   1.38.1 Adds more flexibility to input file names.
    [\#243](https://github.com/mothur/mothur/issues/243)
-   1.38.1 Adds prefix parameter.
    [\#251](https://github.com/mothur/mothur/issues/251)
-   1.39.0 Fixes Windows bug - unable to find files
-   1.39.0 Creates unique group names for 3 column format
-   1.39.0 Fixes bug with "find" command for Linux user
-   1.40.0 Bug Fix: Fixes group names.
-   1.48.1 Adds fasta type.



