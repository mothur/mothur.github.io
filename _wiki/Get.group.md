---
title: 'Get.group'
tags: 'commands'
---
The **get.group** command allows you to get a
listing of the different groups available for the multi-sample OTU data
that are currently stored in memory. This feature should help in using
the group option for other commands. For this tutorial you should
download and decompress
[AmazonData.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip).

## Default Options

The shared parameter is required.

    mothur > get.group(shared=amazon.an.shared)
    rainforest
    pasture

This tells you that you have two groups: one for the rainforest
sequences and another for the pasture sequences.

## Revisions

-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)


