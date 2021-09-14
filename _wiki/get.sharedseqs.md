---
title: 'get.sharedseqs'
tags: 'commands'
redirect_from: '/wiki/Get.sharedseqs.html'
---
The **get.sharedseqs** command takes a list and count file or shared
file and outputs a \*.shared.seqs file for each distance. This is useful
for those cases where you might be interested in identifying sequences
that are either unique or shared by specific groups, which you could
then classify. To run through the commands below use [ Example 
files](https://mothur.s3.us-east-2.amazonaws.com/wiki/ExampleDataSet.zip).


## Default settings

To execute the **get.sharedseqs** command you must provide a list and count file or shared file. By default this will output the
sequences found in the OTUs shared by all the groups in your count file or shared file. For example:

    mothur > get.sharedseqs(list=final.opti_mcc.list, count=final.count_table)

or

    mothur > make.shared(list=final.opti_mcc.list, count=final.count_table)
    mothur > get.sharedseqs(shared=final.opti_mcc.shared)

This will result in output to the screen looking like:

    0.03	55

The left column indicates the label for each line in the data set and
the right column indicates the number of OTUs shared by all groups at this distance.

The .shared.seqs output files look like:

    Otu001|F3D0|499
    Otu001|F3D141|388
    Otu001|F3D142|244
    Otu001|F3D143|189
    Otu001|F3D144|346
    Otu001|F3D145|566
    Otu001|F3D146|270
    Otu001|F3D147|1316
    Otu001|F3D148|750
    Otu001|F3D149|770
    Otu001|F3D150|265
    Otu001|F3D1|351
    Otu001|F3D2|3076
    Otu001|F3D3|831
    Otu001|F3D5|278
    Otu001|F3D6|902
    Otu001|F3D7|576
    Otu001|F3D8|236
    Otu001|F3D9|435
    Otu002|F3D0|306
    Otu002|F3D141|335
    Otu002|F3D142|258
    Otu002|F3D143|152
    ...


## Options

### fasta

If you provide a fasta file mothur will also output a fasta file for
each distance you specify:

    mothur > get.sharedseqs(list=final.opti_mcc.list, count=final.count_table, fasta=final.fasta)

The .shared.fasta output files look like:

    >M00967_43_000000000-A3JHG_1_2107_20457_11366|F3D7|Otu010
    TAC--GG-AG-GAT--GCA-A-G-C-G-T-T--GT-C-CGG-AT--TT-A-T-T--GG-GC--GT-A-AA-GC-GA-GT-G-CA-...
    >M00967_43_000000000-A3JHG_1_1105_11964_4686|F3D0|Otu012
    TAC--GG-AG-GAT--GCG-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-T-T--GG-GT--TT-A-AA-GG-GT-GC-G-CA-...
    ...


### label

There may only be a couple of lines in your list file that you are
interested in. You could either manually delete the lines you aren't
interested in from you list file or use the label option.

### uniquegroups & sharedgroups

The uniquegroups parameter allows you to see sequences belonging to OTUs
unique to specific groups or unique to a particular group. For example
to see the sequences from OTUs unique to group F3D0 at distance 0.03, you
would enter the following:

    mothur > get.sharedseqs(list=final.opti_mcc.list, count=final.count_table, uniquegroups=F3D0)
    0.03   14

There are 14 OTUs that are unique to F3D0 at distance 0.03 and their
sequence names are listed in final.opti_mcc.0.03.unique.F3D0.shared.seqs.

Similarly, if you wanted the sequences from OTUs unique to groups F3D0 and
F3D1 at distance 0.03, you would enter the following

    mothur > get.sharedseqs(list=final.opti_mcc.list, count=final.count_table, uniquegroups=F3D0-F3D1, label=0.03)
    0.03   1

There is 1 OTU that only contain sequences from groups F3D0 and
F3D1 at a distance of 0.03. The file final.opti_mcc.0.03.unique.F3D0_F3D1.shared.seqs
contains:

    M00967_43_000000000-A3JHG_1_2110_20054_3531|F3D0|Otu301
    M00967_43_000000000-A3JHG_1_1114_9368_6991|F3D1|Otu301
    ...

The sharedgroups parameter allows you to see sequences belonging to OTUs
that contain specific groups or a particular group. For example to see
the sequences from OTUs that contain sequences from group F3D0 at distance
0.03, you would enter the following:

    mothur > get.sharedseqs(list=final.opti_mcc.list, count=final.count_table, sharedgroups=F3D0)
    0.03   192

There are 192 OTUs that contain sequences from group F3D0 at distance 0.03
and their names are listed in final.opti_mcc.0.03.F3D0.shared.seqs.

Similarly, if you wanted the sequences from OTUs that contain sequences
from F3D0 and F3D1 at a distance of 0.03, you would enter the following

    mothur > get.sharedseqs(list=final.opti_mcc.list, count=final.count_table, sharedgroups=F3D0-F3D1)
    0.04   125

There are 125 OTUs that are shared between F3D0 and F3D1 at a distance of 0.03.
The file final.opti_mcc.0.03.F3D0_F3D1.shared.seqs contains:

    M00967_43_000000000-A3JHG_1_1101_20262_22075|F3D6|Otu001
    M00967_43_000000000-A3JHG_1_1114_13556_18457|F3D144|Otu001
    M00967_43_000000000-A3JHG_1_1102_18640_14309|F3D3|Otu001
    M00967_43_000000000-A3JHG_1_1108_5894_23389|F3D143|Otu001
    M00967_43_000000000-A3JHG_1_2101_4780_15092|F3D2|Otu001
    ...

### output

The output parameter allows you to have the .seqs file be in .accnos
form so you can use it with the [get.seqs](/wiki/get.seqs),
[list.seqs](/wiki/list.seqs) and
[remove.seqs](/wiki/remove.seqs) commands. For example:

    mothur > get.sharedseqs(list=final.opti_mcc.list, count=final.count_table, output=accnos)
    0.03	55

Opening final.opti_mcc.0.03.unique.selected_groups.accnos you would see the output as:

    M00967_43_000000000-A3JHG_1_1101_20262_22075
    M00967_43_000000000-A3JHG_1_1114_13556_18457
    M00967_43_000000000-A3JHG_1_1102_18640_14309
    M00967_43_000000000-A3JHG_1_1108_5894_23389
    M00967_43_000000000-A3JHG_1_2101_4780_15092
    ...

## Why do the venn diagram results vary from **get.sharedseqs** results?

Confusion can occur when you have a shared file with more groups than
just the subset you are looking at in your venn diagram. For this
example let's look at a simple shared file like:

Full shared file:

    label group numOtus Otu001 Otu002 Otu003 Otu004 Otu005
    0.26 A 5 43 38 2 0 1
    0.26 B 5 46 14 10 13 1
    0.26 C 5 16 29 29 0 0

    mothur > venn(groups=B-C)

Venn shared file with groups B and C selected:

    label group numOtus Otu001 Otu002 Otu003 Otu004 Otu005
    0.26 B 5 46 14 10 13 1
    0.26 C 5 16 29 29 0 0

    C = 0 unique OTUs
    B = 2 unique OTUs
    BC = 3 shared OTUs

    mothur > get.sharedseqs(uniquegroups=B)

Get.sharedseqs with uniquegroups=B shared file:

    label group numOtus Otu001 Otu002 Otu003 Otu004 Otu005
    0.26 A 5 43 38 2 0 1
    0.26 B 5 46 14 10 13 1
    0.26 C 5 16 29 29 0 0

    B = 1 unique OTUs

The difference between the two commands is the groups mothur is
considering when finding the unique and shared OTUs. With the venn
command, mothur only uses the groups provided by the groups parameter or
if none are provided the first 4 groups in the file. This is done
because there are limits to the drawing of the venn diagram. With more
than 4 groups the picture becomes too complicated to be of use. In this
example group A is not included which changes the shared and unique
composition.The **get.sharedseqs** command does not have the limitations of
the picture. You can set parameters with the sharedgroups and
uniquegroups. The sharedgroups parameter means the OTUs MUST include the
groups you listed, but MAY also include other groups. The uniquegroups
parameter means the OTUs MUST include the groups you listed and ONLY the
groups you listed.

For example:

    mothur > get.sharedseqs(uniquegroups=B-C)
    B-C = 0 unique OTUs (no Otus contains just sequences from B and C)

    mothur > get.sharedseqs(sharedgroups=B-C)
    B-C = 3 shared OTUs (3 Otus contains sequences from B and C and sequences from other groups)

## Revisions

-   1.30.0 - added shared file option and changed unique and shared
    parameter names to uniquegroups and sharedgroups.
-   1.37.0 - Adds count parameter
    [\#133](https://github.com/mothur/mothur/issues/133)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.46.0 - Fixes bug with get.sharedseqs shared file option
