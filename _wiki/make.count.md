---
title: 'make.count'
tags: 'commands'
---
The **make.count** command reads a file, fasta file or series of fasta files and
creates a [ count](/wiki/count_file) file.

## Default Options

### fasta && groups


    mothur > make.count(fasta=sample1.fasta-sample2.fasta, groups=A-B)
     
    Assigning sequences from file sample1.fasta to group A:	10 sequences assigned to group A
     
    Assigning sequences from file sample2.fasta to group B:	1 sequences assigned to group B
     
    Group count: 
    A	10
    B	1
    
    Total of all groups is 11
    
    Output File Names: merge.count_table
    
This command creates a file called merge.count_table.
   
## Options

### file
The file parameter allows you to associate fasta files to sample names. mothur can create this for you
with the ***make.file*** command.

    mothur > make.file(inputdir=./fasta, type=fasta)

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

With the stability.files as input:

    mothur > make.count(file=stability.files)

This command creates a file called stability.count_table.

### output
The output parameter allows you to specify the name of count file created. 

     mothur > make.count(fasta=sample1.fasta-sample2.fasta, groups=A-B, output=samples.count_table)
   
### format
The format parameter allows you to specify whether the outputted file is a group file or count file. Options group or count. Default=count. 



## Revisions

-   1.48.0 First Introduced
-   1.48.1 Adds file option
