---


title: 'Get.sabund'
---
The [get.sabund](get.sabund) command will generate an [sabund
file](sabund_file) based on the OTU data that you have read
into mothur.

{% include toc.html %}

## Default Options

For example, if you read in a [list file](list_file),
[get.sabund](get.sabund) will generate the corresponding
sabund file:

    mothur > get.sabund(list=amazon.fn.list)

or

    mothur > get.sabund(rabund=amazon.fn.rabund)

## Options

### label

This series of commands will generate amazon.fn.sabund. If the list file
contains multiple lines and you are only interested in a subset of those
line you can use the label option:

    mothur > get.sabund(list=amazon.fn.list, label=unique-0.03-0.10-0.20)

### count

If your list file contains only the unique sequence names because you
ran cluster with a count file, be sure to include the count file with
the get.sabund command.

    mothur > get.sabund(list=amazon.an.unique_list, count=amazon.count_table)

## Revisions

-   1.31.0 - Added count parameter.

[Category:Commands](Category:Commands)
