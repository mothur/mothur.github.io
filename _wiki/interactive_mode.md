---
title: 'Interactive mode'
redirect_from: '/wiki/Interactive_mode'
---
## Default mode

When you start mothur, you will see a screen that looks like this:

    Mac version

    Using ReadLine,Boost,HDF5,GSL
    mothur v.1.45.0
    Last updated: 3/22/21
    by
    Patrick D. Schloss

    Department of Microbiology & Immunology

    University of Michigan
    http://www.mothur.org

    When using, please cite:
    Schloss, P.D., et al., Introducing mothur: Open-source, platform-independent, community-supported software for describing and comparing microbial communities. Appl Environ Microbiol, 2009. 75(23):7537-41.

    Distributed under the GNU General Public License

    Type 'help()' for information on the commands that are available

    For questions and analysis support, please visit our forum at https://forum.mothur.org

    Type 'quit()' to exit program

    [NOTE]: Setting random seed to 19760620.

    Interactive Mode
    
    
    
    mothur > 


All of your commands will be entered from the mothur prompt. You can get
a list of commands by typing help() at the prompt and you can get more
specific help for each command by typing command\_name(help) at the
prompt. For example:

    mothur > align.seqs(help)

Would give you the help file information for the
[align.seqs](/wiki/align.seqs) command.

If you want to quit mothur you simply enter:

    mothur > quit()

or

    mothur > quit

With the exception of quit, all commands require you to provide an open
and close parentheses. If you supply any options there cannot be a space
between the option, the '=', and the option setting. To separate
options, use a comma. For example:

    mothur > cluster(method=opti, cutoff=0.03)
    
## Running a batch file 

You can run a batch file from the mothur prompt as follows:

    mothur > stability.batch

## Environment Variables

Environment variables can be used to generalize variables for reuse.
Let's add environment variables to our analysis.

### Format

The format of environmental variables is \[tag\]=\[value\]. For example,
let's create a environment variable for the processors option.

    PROC=12

mothur will automatically pull in the systems environment variable. For
example you can set variables in bash and then run mothur:

  . mothurMac-3% export REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release
  . mothurMac-3% export ALIGNREF=silva.v4.fasta
  . mothurMac-3% export TAXONREF_FASTA=trainset9_032012.pds.fasta
  . mothurMac-3% export TAXONREF_TAX=trainset9_032012.pds.tax
  . mothurMac-3% export CONTAMINENTS=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota
  . mothurMac-3% export LOGNAME=MiSEQ_SOP_mouse_03032020
  . mothurMac-3% export DATA=/Users/sarahwestcott/Desktop/MiSeq_SOP
  . mothurMac-3% export TYPE=gz
  . mothurMac-3% export PROC=12
  . mothurMac-3% ./mothur 

    Type 'quit()' to exit program

    [note]: Setting random seed to 19760620.

    mothur >  set.logfile(name=$LOGNAME)

    mothur > set.dir(input=$DATA)
  . mothur's directories:
    inputDir=/Users/sarahwestcott/Desktop/MiSeq_SOP

### Use

The '$' symbol indicates to mothur that the value is an environment
variable to be replaced with the actual value at run time. For example:

    PROC=12
    make.contigs(file=current, processors=$PROC)

is equivalent to

    make.contigs(file=current, processors=12)

You can create an environment variable for anything you wish as well as
combining variables. For example:

    mothur > REFERENCE_LOCATION=/Users/sarahwestcott/Desktop/release
    Setting environment variable REFERENCE_LOCATION to /Users/sarahwestcott/Desktop/release

    mothur > ALIGNREF=silva.v4.fasta
    Setting environment variable ALIGNREF to silva.v4.fasta

    mothur > align.seqs(fasta=my.fasta, reference=$REFERENCE_LOCATION/$ALIGNREF)

Alternatively, If you know what commands you will be running, you can
use either the [command line mode](/wiki/command_line_mode) or
[batch mode](/wiki/batch_mode).
