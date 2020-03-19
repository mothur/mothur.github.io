---
title: 'chimera.pintail'
tags: 'commands'
redirect_from: '/wiki/Chimera.pintail.html'
---
Use Pintail approach \.... [ silva quantile
file](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.bacteria.pintail.quan.zip), [ silva
conservation file](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.bacteria.freq.zip)


## Algorithm

## Default settings

The fasta and template parameters are required. You may enter multiple
fasta files by separating them by dashes. Example:
fasta=ex.align-abrecovery.align.

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta)

The output to the screen looks like:

    mothur > chimera.seqs(fasta=ex.align, template=core_set_aligned.imputed.fasta)
    Reading sequences and template file... Done.
    Finding closest sequence in template to each sequence... Done.
    Getting conservation... Calculating probability of conservation for your template sequences.
    This can take a while...  I will  output the frequency of the highest base in each position 
    to a .freq file so that you can input them using the conservation parameter next time you run this command.
    Providing the .freq file will improve speed.    Done.
    Finding window breaks... Done.
    Calculating observed distance... Done.
    Finding variability... Done.
    Calculating alpha... Done.
    Calculating expected distance... Done.
    Finding deviation... Done.
    Calculating quantiles for your template.  This can take a while...  
    I will output the quantiles to a .quan file that you can input them using the quantile
    parameter next time you run this command. 
    Providing the .quan file will dramatically improve speed.    
    Processing sequence 0
    Processing sequence 1
    Processing sequence 2
    Processing sequence 3
    Processing sequence 4
    Processing sequence 5
    ...
    ...
    Processing sequence 4936
    Processing sequence 4937
    Done.
    gi|11093941|MNA3|AF293013  div: 29.9873    stDev: 6.01747  chimera flag: Yes
    gi|11093935|MNC9|AF293007  div: 23.9793    stDev: 4.81477  chimera flag: Yes
    gi|11093933|MNA5|AF293005  div: 23.8932    stDev: 4.81141  chimera flag: Yes
    gi|11093930|MNH4|AF293002  div: 32.3988    stDev: 7.03789  chimera flag: Yes
    gi|11093924|MNF4|AF292996  div: 26.593 stDev: 5.26257  chimera flag: Yes

Opening ex.pintail.chimeras you would see:

    gi|11093941|MNA3|AF293013  div: 29.9873    stDev: 6.01747  chimera flag: Yes
    Observed   9.66667 10.6667 12  10.6667 12.3333 12.3333 11.3333 11 ...  
    Expected   6.72447 7.19081 7.3083  7.35233 7.49571 7.34767 7.34767 7.3494 ...  
    gi|11093940|MNF8|AF293012  div: 31.3688    stDev: 5.98965  chimera flag: No
    Observed   9.66667 10.6667 12  10.6667 12.3333 12.3333 11.3333 11 ...  
    Expected   7.03297 7.5207  7.64357 7.68963 7.83958 7.68475 7.68475 7.68656 ...
    ...

## Options

### conservation

You can upload a file containing the frequency information for your
template file to increase speed. mothur will generate this for you but
it takes a long time.

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta,
    conservation=core_set_aligned.imputed.freq)

### quantile

You can upload a file containing the quantiles information for your
template file to increase speed. mothur can generate this for you but it
takes a VERY long time. Note that when you use the filter, mask or mask
and filter you need to select the appropriate quantile file. The filter
parameter makes the quantile file generated specific to the query set
you are analyzing.

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta,
     quantile=core_set_aligned.imputed.pintail.quan)

### filter

By default the filter parameter is set to false, but if you set it to
true a 50% soft vertical filter will be applied. Filtering makes the
quantile file specific to the query set you are analyzing.

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta, filter=t, 
        conservation=core_set_aligned.imputed.freq, quantile=core_set_aligned.imputed.pintail.filtered.ex.quan)

With the filter\...

    gi|11093937|MNF2|AF293009  div: 16.3738    stDev: 5.44241  chimera flag: Yes
    gi|11093934|MND1|AF293006  div: 15.6675    stDev: 5.29495  chimera flag: Yes

### mask

By default there is no mask applied, but you can set it to a file
containing your mask or mask=default will apply the ecoli mask.

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta, filter=t, mask=default, 
        conservation=core_set_aligned.imputed.freq, quantile=core_set_aligned.imputed.pintail.filtered.ex.masked.quan)

With the ecoli mask and filter applied\...

    gi|11093934|MND1|AF293006  div: 15.6675    stDev: 4.26498  chimera flag: Yes

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta,
    method=pintail, mask=default, filter=t, quantile=core_set_aligned.imputed.pintail.filtered.masked.quan)

### window

The window parameter is used to determine the length of sequence you
want in each window analyzed. By default it is set to 300. Note,
changing the window size will require new quantile files to be made.

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta,
    method=pintail, window=200)

### increment

The increment parameter is used to slide the window along the sequence.
For the pintail algorithm the default is 25. Note, changing the
increment will require new quantile files to be made.

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta,
    method=pintail, increment=50)

### processors

To speed up your processing the chimera.seqs command can be run with
multiple processors by using the processors parameter. By default the
processors parameter is 1. If you are using the mpi-enabled version,
processors is set to the number of processors you have running.

    mothur > chimera.pintail(fasta=ex.align, template=core_set_aligned.imputed.fasta,
    method=pintail, quantile=core_set_aligned.imputed.pintail.quan, processors=2)

This method was written using the algorithms described in the paper:
"At Least 1 in 20 16S rRNA Sequence Records Currently Held in the
Public Repositories is Estimated To Contain Substantial Anomalies" by
Kevin E. Ashelford, Nadia A. Chuzhanova, John C. Fry, Antonia J. Jones
and Andrew J. Weightman. Applied and Environmental Microbiology 71 (12):
7724:7736.

## Revisions

-   1.38.0 - Removes save option.


