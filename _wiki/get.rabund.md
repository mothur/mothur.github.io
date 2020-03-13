---
title: 'get.rabund'
tags: 'commands'
redirect_from: '/wiki/Get.rabund'
---
The **get.rabund** command will generate an [rabund
file](rabund_file) based on the OTU data that you have read
into mothur.

## Default

If you read in a [list file](list_file),
[shared\_file](shared_file) or
[sabund\_file](sabund_file), **get.rabund** will generate the
corresponding rabund file:

    mothur > get.rabund(list=amazon.fn.list)

or

    mothur > get.rabund(sabund=amazon.fn.sabund)

or

    mothur > get.rabund(shared=amazon.an.shared)

## Options

### label

If the list file contains multiple lines and you are only interested in
a subset of those lines you can use the label option:

    mothur > get.rabund(list=amazon.fn.list, label=unique-0.03-0.10-0.20)

### sorted

By default the data in the rabund file are not sorted. That is they are
in the same order as the OTUs in your list file. If you would like these
data to be sorted by their abundance you need to use the sorted option:

    mothur > get.rabund(list=amazon.fn.list, sorted=T)

### groups

You can use the groups parameter to specify which groups you want
included in your analysis.

    mothur > get.rabund(shared=amazon.shared, groups=pasture)

### count

If your list file contains only the unique sequence names because you
ran cluster with a count file, be sure to include the count file with
the **get.rabund** command.

    mothur > get.rabund(list=amazon.an.unique_list, count=amazon.count_table)

## Revisions

-   1.31.0 - Added count parameter.
-   1.41.0 - Adds shared and groups options.
    [\#325](https://github.com/mothur/mothur/issues/325)


