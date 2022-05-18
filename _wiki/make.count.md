---
title: 'make.count'
tags: 'commands'
---
The **make.count** command reads a fasta file or series of fasta files and
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
    
    Output File Names: /Users/swestcott/Desktop/release/merge.count_table
    
This command creates a file called merge.count_table.
   
## Options

### output
The output parameter allows you to specify the name of count file created. 

     mothur > make.count(fasta=sample1.fasta-sample2.fasta, groups=A-B, output=samples.count_table)
   
### format
The format parameter allows you to specify whether the outputted file is a group file or count file. Options group or count. Default=count. 



## Revisions

-   1.48.0 First Introduced

