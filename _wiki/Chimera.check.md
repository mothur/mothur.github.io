---


title: 'Chimera.check'
---
Use chimeraCheck approach \.... Note: following the RDP model this
method does not determine whether or not a sequence is chimeric, but
allows you to determine that based on the IS values produced.


{% include toc.html %}

## Algorithm

## Default settings

The fasta and template parameters are required. You may enter multiple
fasta files by separating them by dashes. Example:
fasta=ex.align-abrecovery.align.

    mothur > chimera.check(fasta=ex.align, template=core_set_aligned.imputed.fasta)

The output to the screen looks like:

    mothur > chimera.check(fasta=ex.align, template=core_set_aligned.imputed.fasta)
    Reading query sequences... Done.
    Reading in the core_set_aligned.imputed.fasta template sequences...    DONE.
    Finding IS values for sequence 1
    Finding IS values for sequence 2
    ...
    Finding IS values for sequence 18

Opening ex.chimeracheck.chimeras you would see:

    gi|11093941|MNA3|AF293013
    IS scores:     31  36  40  44  52  60  60  59  57  57 ...
    gi|11093940|MNF8|AF293012
    IS scores:     35  43  46  49  55  57  58  62  71  71 ...
    gi|11093939|MNB2|AF293011
    IS scores:     74  80  81  82  91  93  98  100     100 89 ...  
    ...

## Options

### ksize

The ksize parameter allows you to specify the size of the kmer to be
used in determining the differences between sequence fragments. The
default is 7.

    mothur > chimera.check(fasta=ex.align, template=core_set_aligned.imputed.fasta, ksize=8)

### svg

The svg parameter allows you to specify whether or not you would like a
.svg file outputted for each query sequence. This can be helpful in
visualizing the chimeric break. By default svg=false and no picture
files are outputted.

    mothur > chimera.check(fasta=ex.align, template=core_set_aligned.imputed.fasta, svg=t)

To see the .svg files for these sequences download [svg
files](Media:chimeraCheckSVGFiles.zip)

### name

The name parameter allows you to enter a file containing names of
sequences you would like .svg files for. This can be helpful if you just
want to look at the sequences that were determined to be chimeric by
another method.

    mothur > chimera.check(fasta=ex.align, template=core_set_aligned.imputed.fasta,
     name=potentialChimeras.names)

### increment

The increment parameter is used to slide the window along the sequence.
For the chimeracheck algorithm the default is 10.

    mothur > chimera.check(fasta=ex.align, template=core_set_aligned.imputed.fasta, increment=50)

### processors

To speed up your processing the
[chimera.check](chimera.check) command can be run with
multiple processors by using the processors parameter. By default the
processors parameter is 1. If you are using the mpi-enabled version
processors is set to the number of processes you have running.

    mothur > chimera.check(fasta=ex.align, template=core_set_aligned.imputed.fasta, processors=2)

## Revisions

-   1.38.0 - Removes save option.

[Category:Commands](Category:Commands)
