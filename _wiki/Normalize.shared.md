---
title: 'Normalize.shared'
---
The **normalize.shared** command creates a .norm.shared file.


## Default Settings

By default, the method is totalgroup, the norm is set to the number of
sequences in your smallest group, all groups in your group file are
included and all labels are used.

    mothur > normalize.shared(shared=abrecovery.fn.shared)

## groups

The groups parameter allows you to select the groups you would like to
include in your .norm.shared file.

    mothur > normalize.shared(shared=abrecovery.fn.shared, groups=B-C)

## method

The method parameter allows you to select what method you would like to
use to normalize. The choices are totalgroup and zscore. We hope to add
more ways to normalize in the future, suggestions are welcome!

Relative Abundance = Abundance / Total number of sequences in the group.
Normalized Value = Relative Abundance \* norm The normalized value is
then rounded to the nearest integer.

    mothur > normalize.shared(shared=abrecovery.fn.shared, method=totalgroup)

or zscore Normalized Abundance = (Abundance - mean) / standard deviation
If using a shared file the normalized value is then rounded to the
nearest integer.

    mothur > normalize.shared(shared=abrecovery.fn.shared, method=zscore)

## norm

The norm parameter allows you to number you would like to normalize to.
By default this is set to the number of sequences in your smallest
group. If you set norm greater than an abundance of a specific group the
group will be removed.

    mothur > normalize.shared(shared=abrecovery.fn.shared, norm=100)

## label

There may only be a couple of lines in your OTU data that you are
interested in finding the normalized abundance for. There are two
options. You could: (i) manually delete the lines you aren\'t interested
in from your list file; (ii) or use the label option. To use the label
option with the normalize.shared() command you need to know the labels
you are interested in. If you want the normalized abundance for the
lines labeled unique, 0.03, 0.05 and 0.10 you would enter:

    mothur > normalize.shared(shared=abrecovery.fn.shared, label=unique-0.03-0.05-0.10)

## makerelabund

The makerelabund parameter allows you to convert a shared file to a
relabund file before you normalize. default=f.

## Revisions

-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)

[Category:Commands](Category:Commands)
