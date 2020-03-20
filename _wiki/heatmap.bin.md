---
title: 'heatmap.bin'
tags: 'commands'
redirect_from: '/wiki/Heatmap.bin.html'
---
The **heatmap.bin** command generates a heat map
from data provided in either a \*.list or a \*.shared file. Each row in
the heatmap represents a different OTU and the color of the OTU in each
group scaled between black and red according to the relative abundance
of that OTU within the group. The command will generate a SVG file that
can be further modified in a program like Gimp or Adobe Illustrator.
Options are available to scale the relative abundance for each OTU using
different approaches. This tutorial uses the data files in [
AbRecovery.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/abrecovery.zip).

## Default settings

To execute the **heatmap.bin** command first generate the shared data and
run the **heatmap.bin** command:

    mothur > make.shared(list=abrecovery.fn.list, group=abrecovery.groups)
    mothur > heatmap.bin(shared=abrecovery.fn.shared)

This will generate 12 SVG files - a heat map for each OTU definition
between unique and 0.10 (because of the cutoff in the cluster command).
For example, the heatmap that is generated for OTUs defined at the 0.10
level would be abrecovery.fn.0.10.heatmap.svg.

Alternatively, you could use relative abundance shared data from a

\.relabund file.

    mothur > make.shared(list=abrecovery.fn.list, group=abrecovery.groups)
    mothur > get.relabund(shared=abrecovery.fn.shared)
    mothur > heatmap.bin(relabund=abrecovery.fn.relabund)

Or the following commands will generate a heatmap for group B:

    mothur > parse.list(list=abrecovery.fn.list, group=abrecovery.groups)
    mothur > heatmap.bin(list=abrecovery.fn.B.list)

For the purposes of this tutorial, however, we will work with the
heatmaps generated from multiple samples.

## Options

### scale

Because communities typically follow some type of skewed distribution,
it may be desirable to scale the abundance data to flatten the
distribution so that the data is easier to visualize. By default, for
each group the abundance of each OTU is transformed using log10 and the
result is scaled to the largest log10 abundance value. Alternatively,
the ability to scale by log2 or to turn off scaling is possible as well:

    mothur > heatmap.bin(shared=abrecovery.fn.shared, scale=log2)

or

    mothur > heatmap.bin(shared=abrecovery.fn.shared, scale=linear)

Default behavior is achieved as follows:

    mothur > heatmap.bin(shared=abrecovery.fn.shared, scale=log10)

Other scaling options could be incorporated if you have a suggestion.

### label

There may only be a couple of lines in your OTU data that you are
interested in generating a heatmap for. There are two options. You
could: (i) manually delete the lines you aren't interested in from you
list or shared file; (ii) or use the label option. If you only want to
read in the data for the lines labeled unique, 0.03, 0.05 and 0.10 you
would enter:

    mothur > heatmap.bin(shared=abrecovery.fn.shared, label=unique-0.03-0.05-0.10)

### group

If you use the [get.group](/wiki/get.group) command with this
dataset, you will seen that there were 3 groups here: A, B, and C. If
you just want the heat map between groups A and B, A and C, or B and C
enter the following:

    mothur > heatmap.bin(shared=abrecovery.fn.shared, groups=A-B)
    mothur > heatmap.bin(shared=abrecovery.fn.shared, groups=A-C)
    mothur > heatmap.bin(shared=abrecovery.fn.shared, groups=B-C)

Note that if you run these commands, the SVG files will have the same
name and will be written over for each execution. You will need to
rename the file between executions.

### fontsize

The fontsize parameter allows you to adjust the fontsize in the picture
mothur creates. The default is 24.

### numotu

The numotu parameter allows you to display only the top N otus, by
default all the otus are displayed. You could choose to look at the top
10, by setting numotu=10. The default for sorted is topotu when numotu
is used.

### sorted

By default the **heatmap.bin** command will sort the rows of the heatmap
first by those that are shared. The other sorting options are none,
totalotu, totalgroup.

The following command will create a picture with the rows in the same
order as the listfile.

    mothur > heatmap.bin(shared=abrecovery.fn.shared, sorted=none)

The following command will create a picture with the rows sorted with
the largest otus displayed first.

    mothur > heatmap.bin(shared=abrecovery.fn.shared, sorted=topotu)

The following command will create a picture with the rows sorted with
the largest otus for each group displayed first.

    mothur > heatmap.bin(shared=abrecovery.fn.shared, sorted=topgroup)

## Revisions

-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Bug Fix: Fixes out of bounds error.
    [\#363](https://github.com/mothur/mothur/issues/363)


