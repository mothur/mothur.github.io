---


title: 'Chimera.ccode'
---
Use Ccode approach \....


{% include toc.html %}

## Algorithm

## Default settings

The fasta and template parameters are required. You may enter multiple
fasta files by separating them by dashes. Example:
fasta=ex.align-abrecovery.align.

    mothur > chimera.ccode(fasta=ex.align, template=core_set_aligned.imputed.fasta)

The output to the screen looks like:

    mothur > chimera.ccode(fasta=ex.align, template=core_set_aligned.imputed.fasta)
    Reading sequences and template file... Done.
    Finding top matches for sequences... Done.

    gi|11093940|MNF8|AF293012 was found have at least one chimeric window.
    gi|11093937|MNF2|AF293009 was found have at least one chimeric window.
    gi|11093934|MND1|AF293006 was found have at least one chimeric window.
    gi|11093933|MNA5|AF293005 was found have at least one chimeric window.
    gi|11093932|MNA1|AF293004 was found have at least one chimeric window.
    gi|11093930|MNH4|AF293002 was found have at least one chimeric window.
    gi|11093926|MNH2|AF292998 was found have at least one chimeric window.
    gi|11093924|MNF4|AF292996 was found have at least one chimeric window.

Opening ex.ccode.chimeras you would see:

    For full window mapping info refer to ex.mapinfo
    ...
    gi|11093940|MNF8|AF293012

    Reference sequences used and distance to query:
    1456   0.124
    141312 0.138
    102418 0.140
    110103 0.149
    183441 0.234
    99346  0.236
    142598 0.239
    136664 0.239
    1443   0.251
    216057 0.256
    70898  0.262
    167370 0.263
    10709  0.264
    225365 0.265
    168547 0.265
    27824  0.268
    10686  0.269
    10763  0.269
    147978 0.269
    123055 0.269


    Mapping information: 
    Window StartPos    EndPos
    1  108 778
    2  778 1448
    3  1448    2118
    4  2118    2788
    5  2788    3458
    6  3458    4128
    7  4128    4798
    8  4798    5468
    9  5468    6138
    10 6138    6808
    11 6808    6812

    Window AvgQ    (sdQ)   AvgR    (sdR)   Ratio   Anova
    1  47.550  20.109  54.095  11.853  0.879   4.709
    2  21.350  8.677   21.711  5.681   0.983   0.065
    3  43.250  20.749  49.658  13.050  0.871   3.829
    4  49.050  16.863  50.247  11.667  0.976   0.173
    5  0.001   0.001   0.001   0.001   1.000   0.004
    6  16.350  8.916   20.821  7.403   0.785   6.340
    7  45.150  10.811  46.626  12.730  0.968   0.250
    8  29.600  5.020   25.779  7.435   1.148   5.029
    9  30.650  3.345   24.074  7.534   1.273   14.877
    10 54.500  6.126   44.747  13.275  1.218   10.523
    11 0.450   0.510   0.521   0.501   0.864   0.363

    Window ConfidenceLimit t-Student   Anova
    1              
    2              
    3              
    4              
    5              
    6              
    7              
    8      *   *   
    9  *   *   *   
    10     *   *   
    11             

    ...

The \* indicate that the window was found to be chimeric using the given
limits.

## Options

### filter

By default the filter parameter is set to false, but if you set it to
true a 50% soft vertical filter will be applied.

    mothur > chimera.ccode(fasta=ex.align, template=core_set_aligned.imputed.fasta, filter=t)
    Reading sequences and template file... Done.
    Finding top matches for sequences... Done.
    Filter removed 6397 columns.

    gi|11093940|MNF8|AF293012 was found have at least one chimeric window.
    gi|11093939|MNB2|AF293011 was found have at least one chimeric window.
    gi|11093937|MNF2|AF293009 was found have at least one chimeric window.
    gi|11093934|MND1|AF293006 was found have at least one chimeric window.
    gi|11093932|MNA1|AF293004 was found have at least one chimeric window.
    gi|11093930|MNH4|AF293002 was found have at least one chimeric window.
    gi|11093926|MNH2|AF292998 was found have at least one chimeric window.
    gi|11093924|MNF4|AF292996 was found have at least one chimeric window.

### mask

By default there is no mask applied, but you can set it to a file
containing your mask or mask=default will apply the ecoli mask.

    mothur > chimera.ccode(fasta=ex.align, template=core_set_aligned.imputed.fasta, mask=default)
    I am using the default 236627 EU009184.1 Shigella dysenteriae str. FBD013.
    Reading sequences and template file... Done.
    Finding top matches for sequences... Done.
    gi|11093939|MNB2|AF293011 does not have an adaquate number of reference sequences that are within 20% and 0.5%
    similarity.  I will continue, but please check.

    gi|11093941|MNA3|AF293013 was found have at least one chimeric window.
    gi|11093940|MNF8|AF293012 was found have at least one chimeric window.
    gi|11093939|MNB2|AF293011 was found have at least one chimeric window.
    gi|11093938|MNC2|AF293010 was found have at least one chimeric window.
    gi|11093937|MNF2|AF293009 was found have at least one chimeric window.
    gi|11093934|MND1|AF293006 was found have at least one chimeric window.
    gi|11093933|MNA5|AF293005 was found have at least one chimeric window.
    gi|11093930|MNH4|AF293002 was found have at least one chimeric window.
    gi|11093926|MNH2|AF292998 was found have at least one chimeric window.
    gi|11093924|MNF4|AF292996 was found have at least one chimeric window.

With the ecoli mask and filter applied\...

    mothur > chimera.ccode(fasta=ex.align, template=core_set_aligned.imputed.fasta, mask=default, filter=t)
    I am using the default 236627 EU009184.1 Shigella dysenteriae str. FBD013.
    Reading sequences and template file... Done.
    Finding top matches for sequences... Done.
    Filter removed 259 columns.

    gi|11093940|MNF8|AF293012 was found have at least one chimeric window.
    gi|11093939|MNB2|AF293011 was found have at least one chimeric window.
    gi|11093937|MNF2|AF293009 was found have at least one chimeric window.
    gi|11093934|MND1|AF293006 was found have at least one chimeric window.
    gi|11093932|MNA1|AF293004 was found have at least one chimeric window.
    gi|11093930|MNH4|AF293002 was found have at least one chimeric window.
    gi|11093926|MNH2|AF292998 was found have at least one chimeric window.

### window

The window parameter is used to determine the length of sequence you
want in each window analyzed. By default it is set to 10% of the
sequence length. It is recommended that your window size be within 5 and
20% of your trimmed sequence length.

    mothur > chimera.ccode(fasta=ex.align, template=core_set_aligned.imputed.fasta, window=400)
    Reading sequences and template file... Done.
    Finding top matches for sequences... Done.

    gi|11093940|MNF8|AF293012 was found have at least one chimeric window.
    gi|11093939|MNB2|AF293011 was found have at least one chimeric window.
    gi|11093937|MNF2|AF293009 was found have at least one chimeric window.
    gi|11093934|MND1|AF293006 was found have at least one chimeric window.
    gi|11093932|MNA1|AF293004 was found have at least one chimeric window.
    gi|11093930|MNH4|AF293002 was found have at least one chimeric window.
    gi|11093929|MNC12|AF293001 was found have at least one chimeric window.
    gi|11093928|MNG3|AF293000 was found have at least one chimeric window.
    gi|11093926|MNH2|AF292998 was found have at least one chimeric window.

### numwanted

The numwanted parameter allows you to specify how many sequences you
would each query sequence compared with. By default it is set to 20.

    mothur > chimera.ccode(fasta=ex.align, template=core_set_aligned.imputed.fasta, numwanted=10)
    Reading sequences and template file... Done.
    Finding top matches for sequences... Done.

    gi|11093940|MNF8|AF293012 was found have at least one chimeric window.
    gi|11093937|MNF2|AF293009 was found have at least one chimeric window.
    gi|11093934|MND1|AF293006 was found have at least one chimeric window.
    gi|11093933|MNA5|AF293005 was found have at least one chimeric window.
    gi|11093932|MNA1|AF293004 was found have at least one chimeric window.
    gi|11093930|MNH4|AF293002 was found have at least one chimeric window.
    gi|11093926|MNH2|AF292998 was found have at least one chimeric window.

### processors

To speed up your processing the chimera.ccode command can be run with
multiple processors by using the processors parameter. By default the
processors parameter is 1. If you are using the mpi-enabled version
processors is set to the number of processes running.

    mothur > chimera.ccode(fasta=ex.align, template=core_set_aligned.imputed.fasta, processors=2)

This method was written using the algorithms described in the
\"Evaluating putative chimeric sequences from PCR-amplified products\"
paper by Juan M. Gonzalez, Johannes Zimmerman and Cesareo Saiz-Jimenez.

## Revisions

-   1.38.0 - Removes save option.

[Category:Commands](Category:Commands)
