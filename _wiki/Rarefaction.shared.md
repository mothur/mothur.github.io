---
title: 'Rarefaction.shared'
---
The [rarefaction.shared](rarefaction.shared) command will
generate inter-sample rarefaction curves using a re-sampling without
replacement approach. The traditional way that ecologists use
rarefaction is not to randomize the sampling order within a sample,
rather between samples. For instance, if we wanted to know the number of
OTUs in the human colon, we might sample from various sites within the
colon, and sequence a bunch of 16S rRNA genes. By determining the number
of OTUs in each sample and comparing the composition of those samples it
is possible to determine how well you have sampled the biodiversity
within the individual. mothur has the ability to generate data for
inter-sample rarefaction curves for the number of observed species. For
this tutorial you should download and decompress [
Patient70Data.zip](Media:Patient70Data.zip)


## Default settings

For example:

    mothur > make.shared(list=patient70.fn.list, group=patient70.sites.groups)

By default, the rarefaction.shared() command will perform 1,000
randomizations of the order in which the samples are considered. So if
you run rarefaction.shared() multiple times, you will get slightly
different results. To get the default behavior enter:

    mothur > rarefaction.shared(shared=patient70.fn.shared)

This will result in output to the screen looking like:

    unique 1
    0.00   2
    0.01   3
    0.02   4
    0.03   5
    0.04   6
    0.05   7
    0.06   8
    0.07   9
    0.08   10
    0.09   11
    0.10   12

The left column indicates the label for each line in the data set and
the right column indicates the row number in the data set. Execution of
rarefaction.shared() will generate the file
patient70.fn.shared.rarefaction, which looks like:

    samples    unique      lci     hci     0.00        lci     hci     ... 
    1  443.7500    164.7345    722.7655    182.8480    86.3489     279.3471    ...
    2  850.0090    490.6902    1209.3278   308.3940    187.8304    428.9576    ...
    3  1248.1000   855.0973    1641.1027   413.4350    291.1591    535.7109    ...
    4  1634.4600   1251.6258   2017.2942   502.5470    392.0305    613.0635    ...
    5  2002.1400   1655.6566   2348.6234   582.0000    485.6954    678.3046    ...
    6  2375.1600   2107.6512   2642.6688   650.0620    578.2567    721.8673    ...
    7  2742.0000   2742.0000   2742.0000   713.0000    713.0000    713.0000    ...

The actual file has many more columns, but this should give you the
idea. The first column is the number of samples that have been
considered. Since their were 7 group names in the group file,
rarefaction.shared() rarefied the data over the 7 groups. The rest of
the columns are in triplets. The first column of the triplet is the
average number of OTUs observed after sampling 1, 2, 3, etc. groups. The
second and third columns of each triplet are the bounds on the 95%
confidence interval of average. If you look closely, you will find that
the average for 1 sample is the average number of OTUs observed across
all of the samples. Also, if you look at the data in the row for 7
samples you will see that the bounds on the 95% confidence interval are
the same as the average. Finally, the richness observed for sample 7 is
the total number of OTUs you would observe if you processed
patient70.fn.list through summary.single().

## Options

### label

There may only be a couple of lines in your OTU data that you are
interested in generating the rarefaction curve for. There are two
options. You could: (i) manually delete the lines you aren\'t interested
in from your list file; (ii) or use the label option. To use the label
option with the rarefaction.shared() command you need to know the labels
you are interested in. If you want the rarefaction curve data for the
lines labeled unique, 0.03, 0.05 and 0.10 you would enter:

    mothur > rarefaction.shared(shared=patient70.fn.shared, label=unique-0.03)

In the file patient70.fn.shared.rarefaction you would see something
like:

    numsampled unique      lci     hci     0.03        lci     hci
    1      437.9010    156.7862    719.0158    58.6599     32.9568     84.3630
    2      844.5540    484.9140    1204.1940   76.2709     52.1988     100.3430
    3      1234.6800   850.1886    1619.1714   86.6658     64.5309     108.8007
    4      1617.0100   1239.6273   1994.3927   94.2071     74.2022     114.2120
    5      2003.0800   1661.2946   2344.8654   100.1300    82.7736     117.4864
    6      2376.2700   2105.6267   2646.9133   105.6120    92.6939     118.5301
    7      2742.0000   2742.0000   2742.0000   111.0000    111.0000    111.0000

### iters

To improve the accuracy of the calculations you can change the number of
randomizations that are performed using the iters option; the default
value is 1,000. Running 10,000 randomization should take 10-times as
long as the default:

    mothur > rarefaction.shared(shared=patient70.fn.shared, iters=10000)

### processors

The processors option allows you to reduce the processing time by using
multiple processors. By default mothur will use all the processors
found. You can set the processors with the following option:

    mothur > rarefaction.shared(shared=patient70.fn.shared, processors=2)

### jumble

Obviously, the goal of rarefaction is to randomize across the samples;
however, if you just want a collector\'s curve across the samples you
can use the jumble option:

    mothur > rarefaction.shared(shared=patient70.fn.shared, jumble=0)

### design

The design parameter allows you to assign your groups to sets. If
provided mothur will run rarefaction.shared on a per set basis.

    mothur > rarefaction.shared(shared=final.an.0.03.subsample.0.03.pick.shared, design=mouse.sex_time.design)

### sets

The sets parameter allows you to specify which of the sets in your
design file you would like to analyze. The set names are separated by
dashes. The default is all sets in the design file.

    mothur > rarefaction.shared(shared=final.an.0.03.subsample.0.03.pick.shared, design=mouse.sex_time.design, sets=F003Late)

### groupmode

If you are running rarefaction.shared with a design file and would like
your results collated in multiple files, set groupmode=f.
(Default=True).

    mothur > rarefaction.shared(shared=final.an.0.03.subsample.0.03.pick.shared, design=mouse.sex_time.design, groupmode=f)

### groups

If you had started this tutorial with the following comamnds:

    mothur > get.group(shared=patient70.fn.shared)

You would have seen that there were 7 groups here: 70A-70F and 70S. The
sequences from 70S were collected from Patient 70\'s stool sample those
from samples 70A-70F were from their mucosa. These 7 groups would yield
21 lies if you ran the rarefaction.shared() command; however, if you
were only interested in the comparisons between each mucosa site you
could use the groups option:

    mothur > rarefaction.shared(shared=patient70.fn.shared, groups=70A-70B-70C-70D-70E-70F)

Alternatively, if you want all of the pairwise comparisons you can
either not include the group option or set it equal to \"all\".

    mothur > rarefaction.shared(shared=patient70.fn.shared, calc=sharedobserved, groups=all)

### subsample

The subsample parameter allows you to enter the size pergroup of the
sample or you can set subsample=T and mothur will use the size of your
smallest group.

### subsampleiters

The subsampleiters parameter allows you to choose the number of times
you would like to run the subsample. Default=1000.

### withreplacement

The withreplacement parameter allows you to indicate you want to
subsample your data allowing for the same read to be included multiple
times. Default=f.

### Visualization with R

To visual your data follow Pat\'s tutorial
[here](http://www.riffomonas.org/minimalR/06_line_plots.html).

## Revisions

-   1.26.0 - added design, sets and groupmode parameters
-   1.29.0 - added subsampling parameters.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Fixes segfault error for commands that use subsampling.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.42.0 - Adds processors option.
    [\#544](https://github.com/mothur/mothur/issues/544)
-   1.42.0 - Adds withreplacement parameter to sub.sample command.
    [\#262](https://github.com/mothur/mothur/issues/262)

[Category:Commands](Category:Commands)
