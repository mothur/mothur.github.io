---
title: 'Batch mode'
redirect_from: '/wiki/Batch_mode'
---
In [batch mode](batch_mode) you can supply a file with a list
of commands that you want mothur to run. This would be useful if you
have a set of analyses that you know you are going to run and don\'t
want to have to wait for them to run, or for running the same set of
commands on several datasets.

## Batch Files

Batch files can be used to create a set of commands you wish to run on
your data. Let\'s say you want to assemble pair end reads and prepare
them for analysis. You might create a batch file like this:

    make.file(inputdir=./MiSeq_SOP, type=gz, prefix=stability)
    make.contigs(file=current, processors=12)
    screen.seqs(fasta=current, group=current, maxambig=0, maxlength=275)
    unique.seqs()
    count.seqs(name=current, group=current)
    align.seqs(fasta=current, reference=silva.v4.fasta)

You can add comments to your batch file by starting the line with a
\'\#\' character. For example:

    #This is my comment about my analysis 
    make.file(inputdir=./MiSeq_SOP, type=gz, prefix=stability)
    #assemble paired reads
    make.contigs(file=current, processors=12)

## Environment Variables

Environment variables can be used to generalize a batch file for reuse.
This can be helpful for standardizing analysis done in your lab. Let\'s
add environment variables to the above batch file.

### Format

The format of environmental variables is \[tag\]=\[value\]. For example,
let\'s create a environment variable for the processors option.

    PROC=12

Mothur will automatically pull in the systems environment variable. For
example you can set variables in bash and then run a batch file:

    MothurMac-3% export REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release
    MothurMac-3% export ALIGNREF=silva.v4.fasta
    MothurMac-3% export TAXONREF_FASTA=trainset9_032012.pds.fasta
    MothurMac-3% export TAXONREF_TAX=trainset9_032012.pds.tax
    MothurMac-3% export CONTAMINENTS=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota
    MothurMac-3% export LOGNAME=MiSEQ_SOP_mouse_03032020
    MothurMac-3% export DATA=/Users/sarahwestcott/Desktop/MiSeq_SOP
    MothurMac-3% export TYPE=gz
    MothurMac-3% export PROC=12
    MothurMac-3% ./mothur "stability.batch" 

where stability.batch look like:

    set.logfile(name=$$LOGNAME)
    make.file(inputdir=$$DATA, type=$$TYPE, prefix=stability)
    make.contigs(file=current, processors=$$PROC)
    screen.seqs(fasta=current, group=current, maxambig=0, maxlength=275)
    unique.seqs()
    count.seqs(name=current, group=current)
    align.seqs(fasta=current, reference=$$REFERENCE_LOCATION/$$ALIGNREF)
    screen.seqs(fasta=current, count=current, start=1968, end=11550, maxhomop=8)
    filter.seqs(fasta=current, vertical=T, trump=.)
    unique.seqs(fasta=current, count=current)
    pre.cluster(fasta=current, count=current, diffs=2)
    chimera.vsearch(fasta=current, count=current, dereplicate=t)
    remove.seqs(fasta=current, accnos=current)
    classify.seqs(fasta=current, count=current, reference=$$REFERENCE_LOCATION/$$TAXONREF_FASTA, taxonomy=$$REFERENCE_LOCATION/$$TAXONREF_TAX, cutoff=80)
    remove.lineage(fasta=current, count=current, taxonomy=current, taxon=$$CONTAMINENTS)
    remove.groups(count=current, fasta=current, taxonomy=current, groups=Mock)
    cluster.split(fasta=current, count=current, taxonomy=current, splitmethod=classify, taxlevel=4, cutoff=0.15)
    make.shared(list=current, count=current, label=0.03)
    classify.otu(list=current, count=current, taxonomy=current, label=0.03)
    phylotype(taxonomy=current)
    make.shared(list=current, count=current, label=1)
    classify.otu(list=current, count=current, taxonomy=current, label=1)

### Use

The \'\$$\' symbol indicates to mothur that the value is an environment
variable to be replaced with the actual value at run time. For example:

    PROC=12
    make.contigs(file=current, processors=$$PROC)

is equivalent to

    make.contigs(file=current, processors=12)

You can add multiple environment variables to a batch file.

    #Set environment variables
    REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release
    DATA=/Users/sarahwestcott/Desktop/MiSeq_SOP
    TYPE=gz
    PROC=12
    #list of commands to run
    make.file(inputdir=$$DATA, type=$$TYPE, prefix=stability)
    make.contigs(file=current, processors=$$PROC)
    screen.seqs(fasta=current, group=current, maxambig=0, maxlength=275)
    unique.seqs()
    count.seqs(name=current, group=current)
    align.seqs(fasta=current, reference=$$REFERENCE_LOCATION/silva.v4.fasta)

You can create an environment variable for anything you wish as well as
combining variables. For example:

    REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release
    ALIGNREF=silva.v4.fasta
    TAXONREF_FASTA=trainset9_032012.pds.fasta
    TAXONREF_TAX=trainset9_032012.pds.tax
    CONTAMINENTS=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota
    LOGNAME=MiSEQ_SOP_mouse_03032020
    DATA=/Users/sarahwestcott/Desktop/MiSeq_SOP
    TYPE=gz
    PROC=12
    #batch commands
    set.logfile(name=$$LOGNAME)
    make.file(inputdir=$$DATA, type=$$TYPE, prefix=stability)
    make.contigs(file=current, processors=$$PROC)
    screen.seqs(fasta=current, group=current, maxambig=0, maxlength=275)
    unique.seqs()
    count.seqs(name=current, group=current)
    align.seqs(fasta=current, reference=$$REFERENCE_LOCATION/$$ALIGNREF)
    screen.seqs(fasta=current, count=current, start=1968, end=11550, maxhomop=8)
    filter.seqs(fasta=current, vertical=T, trump=.)
    unique.seqs(fasta=current, count=current)
    pre.cluster(fasta=current, count=current, diffs=2)
    chimera.vsearch(fasta=current, count=current, dereplicate=t)
    remove.seqs(fasta=current, accnos=current)
    classify.seqs(fasta=current, count=current, reference=$$REFERENCE_LOCATION/$$TAXONREF_FASTA, taxonomy=$$REFERENCE_LOCATION/$$TAXONREF_TAX, cutoff=80)
    remove.lineage(fasta=current, count=current, taxonomy=current, taxon=$$CONTAMINENTS)
    remove.groups(count=current, fasta=current, taxonomy=current, groups=Mock)
    cluster.split(fasta=current, count=current, taxonomy=current, splitmethod=classify, taxlevel=4, cutoff=0.15)
    make.shared(list=current, count=current, label=0.03)
    classify.otu(list=current, count=current, taxonomy=current, label=0.03)
    phylotype(taxonomy=current)
    make.shared(list=current, count=current, label=1)
    classify.otu(list=current, count=current, taxonomy=current, label=1)

## Nested Batch Files

Mothur allows you to run a batch file from another batch file. For
example, let\'s create a batch file that sets environment variables and
uses the lab\'s Standard Operating Procedure for analysis.

First let\'s create a generic batch file to run the MiSeq\_SOP called
stability.batch:

    #This is the Standard Operating Procedure for analysis in the Schloss Lab
    set.logfile(name=$$LOGNAME)
    make.file(inputdir=$$DATA, type=$$TYPE, prefix=stability)
    make.contigs(file=current, processors=$$PROC)
    screen.seqs(fasta=current, group=current, maxambig=0, maxlength=275)
    unique.seqs()
    count.seqs(name=current, group=current)
    align.seqs(fasta=current, reference=$$REFERENCE_LOCATION/$$ALIGNREF)
    screen.seqs(fasta=current, count=current, start=1968, end=11550, maxhomop=8)
    filter.seqs(fasta=current, vertical=T, trump=.)
    unique.seqs(fasta=current, count=current)
    pre.cluster(fasta=current, count=current, diffs=2)
    chimera.vsearch(fasta=current, count=current, dereplicate=t)
    remove.seqs(fasta=current, accnos=current)
    classify.seqs(fasta=current, count=current, reference=$$REFERENCE_LOCATION/$$TAXONREF_FASTA, taxonomy=$$REFERENCE_LOCATION/$$TAXONREF_TAX, cutoff=80)
    remove.lineage(fasta=current, count=current, taxonomy=current, taxon=$$CONTAMINENTS)
    remove.groups(count=current, fasta=current, taxonomy=current, groups=Mock)
    cluster.split(fasta=current, count=current, taxonomy=current, splitmethod=classify, taxlevel=4, cutoff=0.15)
    make.shared(list=current, count=current, label=0.03)
    classify.otu(list=current, count=current, taxonomy=current, label=0.03)
    phylotype(taxonomy=current)
    make.shared(list=current, count=current, label=1)
    classify.otu(list=current, count=current, taxonomy=current, label=1)

Now let\'s create a nested batch containing the specifics for our data:

    #set location of lab reference files
    REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release
    #set location of my data 
    DATA=/Users/sarahwestcott/Desktop/MiSeq_SOP
    #set type of data. ie fastq or gz
    TYPE=fastq
    #set number of processors to use during analysis
    PROC=12
    #reference for alignment
    ALIGNREF=silva.v4.fasta
    #references for classification
    TAXONREF_FASTA=trainset9_032012.pds.fasta
    TAXONREF_TAX=trainset9_032012.pds.tax
    #contaminents to remove from data
    CONTAMINENTS=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota
    #logfile name for this analysis
    LOGNAME=MiSEQ_SOP_mouse_03032020
    #run generic Standard Operating Procedure for analysis in the Schloss Lab
    stability.batch

## Combining commands, variables and batch files

Mothur allows you to combine commands, environment variable and batch
files to create tailored, reproducible batch files. For example:

    REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release
    #tailor align reference to v4 region
    pcr.seqs(fasta=$$REFERENCE_LOCATION/silva.bacteria.fasta, start=11894, end=25319, keepdots=F)
    rename.file(fasta=current, new=$$REFERENCE_LOCATION/silva.v4.fasta)
    DATA=/Users/sarahwestcott/Desktop/MiSeq_SOP
    TYPE=fastq
    PROC=12
    ALIGNREF=silva.v4.fasta
    TAXONREF_FASTA=trainset9_032012.pds.fasta
    TAXONREF_TAX=trainset9_032012.pds.tax
    CONTAMINENTS=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota
    LOGNAME=MiSEQ_SOP_mouse_03032020
    #run generic Standard Operating Procedure for analysis in the Schloss Lab
    ./stability.batch

To run mothur in batch mode enter the name of the batch file after the
program name. For example:

    MothurMac-3% ./mothur "batchfileName" 

    MothurMac-3% ./mothur "MiSEQ_SOP_mouse_03032020.batch"

Of related interest is the [command line
mode](command_line_mode).

## Revisions

-   1.44.0 - Adds environment variables and nested batches.
    [\#601](https://github.com/mothur/mothur/issues/601)
    [\#658](https://github.com/mothur/mothur/issues/658)
