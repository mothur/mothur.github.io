---


title: 'Get.group'
---
The [get.group](get.group) command allows you to get a
listing of the different groups available for the multi-sample OTU data
that are currently stored in memory. This feature should help in using
the group option for other commands. For this tutorial you should
download and decompress
[AmazonData.zip](Media:AmazonData.zip).

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

[Category:Commands](Category:Commands)
