---
title: 'Get.otulist'
---
The **get.otulist** command parses a list file and creates an .otu file
for each distance containing 2 columns. The first column is the OTU
number the second column is a list of sequences in that OTU. For this
tutorial you should download and decompress
[AmazonData.zip](Media:AmazonData.zip).


### Default settings

    mothur > get.otulist(list=98_lt_phylip_amazon.fn.list)

This will result in output to the screen looking like:

    unique
    0.00
    0.01
    0.02
    0.03
    0.04
    0.05
    0.06
    ...

## Options

### label

There may only be a couple of lines in your OTU data that you are
interested in. You can either manually delete the lines you aren\'t
interested in from your list file or use the label option. If you want
the data for the lines labeled unique, 0.03, 0.05 and 0.10 you would
enter:

    mothur > get.otulist(list=98_lt_phylip_amazon.fn.list, label=unique-0.03-0.05-0.10)
    unique
    0.03
    0.05
    0.10

Opening 98\_lt\_phylip\_amazon.fn.0.03.otulist you would see the output
as:

    1  U68589
    2  U68590
    3  U68591
    4  U68592
    5  U68593
    6  U68594
    7  U68595
    8  U68596
    9  U68597
    10 U68598
    11 U68599
    12 U68600
    13 U68601
    14 U68637,U68602
    15 U68603
    16 U68605
    ...

### sort

The sort parameter allows you to select how you want the output
displayed. Options are otu and name, otu is the default. If otu is
selected the output will be otu number followed by the list of names in
that otu. If name is selected the output will be a sequence name
followed by its otu number.

    mothur > get.otulist(list=98_lt_phylip_amazon.fn.list, label=unique-0.03-0.05-0.10, sort=name)

Opening 98\_lt\_phylip\_amazon.fn.0.03.otulist you would see the output
as:

    U68589 1
    U68590 2
    U68591 3
    U68592 4
    U68593 5
    U68594 6
    U68595 7
    U68596 8
    U68597 9
    U68598 10
    U68599 11
    U68600 12
    U68601 13
    U68637 14
    U68602 14
    U68603 15
    ...

[Category:Commands](Category:Commands)
