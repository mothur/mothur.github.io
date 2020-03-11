---
title: 'Get.label'
---
The **get.label** command allows you to get a
listing of the labels for each line of the OTU data that are currently
stored in memory. This feature should help in using the label option for
other commands. For this tutorial you should download and decompress
[AmazonData.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip).

The **get.label** command works with a list, rabund or sabund file.

    mothur > get.label(list=98_lt_phylip_amazon.fn.list)
    unique
    0.05
    0.13
    0.15
    0.16
    0.17
    0.20
    0.21
    0.22
    0.23
    0.24
    ...

Or

    mothur > get.label(rabund=98_lt_phylip_amazon.fn.rabund)
    unique
    0.05
    0.13
    0.15
    0.16
    0.17
    0.20
    0.21
    0.22
    0.23
    0.24
    ...

    mothur > get.label(sabund=98_lt_phylip_amazon.fn.sabund)
    unique
    0.05
    0.13
    0.15
    0.16
    0.17
    0.20
    0.21
    0.22
    0.23
    0.24
    ...

[Category:Commands](Category:Commands)
