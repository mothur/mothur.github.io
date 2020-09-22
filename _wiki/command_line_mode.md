---
title: 'Command line mode'
redirect_from: '/wiki/Command_line_mode'
---
In the [command line mode](/wiki/command_line_mode) you can run
mothur directly from the terminal. This may be advantageous for people
generating shell script pipelines. Following the name of the executable
(i.e. mothur) you would type out the commands within quote marks and the
first character being a pound sign (i.e. '\#'). The commands should be
separated by semicolons.

## Default

For example, if you want to cluster your data and perform some alpha
diversity analysis, then your command line could look like this:

    $ mothur "#dist.seqs(fasta=final.fasta, processors=12);cluster(column=current, count=final.count_table);collect.single();rarefaction.single()"

## Environment Variables

Environment variables can be used within mothur. This can be helpful for
standardizing analysis done in your lab. Let's add environment
variables to the above commands.

    $ mothur "#PROC=12;DATA_LOCATION=/Users/sarahwestcott/Desktop/MiSeq_SOP;dist.seqs(fasta=$DATA_LOCATION/final.fasta, processors=$PROC);cluster(column=current, count=final.count_table);collect.single();rarefaction.single()"

### Format

The format of environmental variables is \[tag\]=\[value\]. For example,
let's create a environment variable for the processors option.

    PROC=12

### Use

The '$' symbol indicates to mothur that the value is an environment
variable to be replaced with the actual value at run time. For example:

    PROC=12
    make.contigs(file=current, processors=$PROC)

is equivalent to

    make.contigs(file=current, processors=12)

mothur will automatically pull in the systems environment variable. For
example you can set variables in bash and then run mothur in command
line mode:

    $ export REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release
    $ export ALIGNREF=silva.v4.fasta
    $ export TAXONREF_FASTA=trainset9_032012.pds.fasta
    $ export TAXONREF_TAX=trainset9_032012.pds.tax
    $ export CONTAMINENTS=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota
    $ export LOGNAME=MiSEQ_SOP_mouse_03032020
    $ export DATA=/Users/sarahwestcott/Desktop/MiSeq_SOP
    $ export TYPE=gz
    $ export PROC=12
    $ ./mothur "#set.logfile(name=$LOGNAME);make.file(inputdir=$DATA, type=$TYPE, prefix=stability);make.contigs(file=current, processors=$PROC);" 

You can create an environment variable for anything you wish as well as
combining variables. For example:

    $ ./mothur "#REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release;TAXONREF_FASTA=trainset9_032012.pds.fasta;TAXONREF_TAX=trainset9_032012.pds.tax;CONTAMINENTS=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota;DATA=/Users/sarahwestcott/Desktop/MiSeq_SOP; PROC=12;classify.seqs(fasta=$DATA/my.fasta, count=$DATA/my.count_table, reference=$REFERENCE_LOCATION/$TAXONREF_FASTA, taxonomy=$REFERENCE_LOCATION/$TAXONREF_TAX, cutoff=80);remove.lineage(fasta=current, count=current, taxonomy=current, taxon=$CONTAMINENTS);"

## Options

### -v / \--version

Outputs the Operating system of the machine, Mothur version and the Release date of said version.

    $ ./mothur -v 
    Linux
    Mothur version=1.41.3
    Release Date=1/30/19

### -h / \--help

Outputs all the available commands and the [FAQ](_wiki/frequently_asked_questions.md).


### -q / \--quiet

Quiet mode will only output errors and nothing else.

A related option is to run mothur in [batch
mode](/wiki/batch_mode).
