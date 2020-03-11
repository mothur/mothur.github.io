---
title: 'Venn'
---
The **venn** command generates a Venn diagram from data
provided in a \*.shared file. The command can generate diagrams (as SVG
files) to compare the richness shared among 2, 3, or 4 groups. The SVG
file that can be further modified in a program like Gimp or Adobe
Illustrator to scale the areas to be proportional to the richness
represented by the region. Options are available to measure richness
based on the observed richness or the estimated richness using the
[chao](chao) and [sharedchao](sharedchao "wikilink")
calculators. This tutorial uses the data files in [
AbRecovery.zip](Media:AbRecovery.zip).


## Default settings

To execute venn(), shared data created:

    mothur > cluster(phylip=abrecovery.dist, cutoff=0.10)  
    mothur > make.shared(list=abrecovery.fn.list, group=abrecovery.groups)
    mothur > venn(shared=abrecovery.fn.shared)

This will generate 12 SVG files - a **venn** diagram for each OTU definition
between unique and 0.10 (because of the cutoff in the read.dist
command). For example, the **venn** diagram that is generated for OTUs
defined at the 0.10 level would be abrecovery.fn.0.10.venn.sobs.svg.

## Options

### calc

By default the venn() command will calculate the shared richness based
on the observed OTUs. Alternatively, it is possible to use the
[chao](chao) and [sharedchao](sharedchao "wikilink") or the
[ace](ace) and [sharedace](sharedace "wikilink") calculators
to predict the richness of each region. This option can be implemented
by the following command:

    mothur > venn(shared=abrecovery.fn.shared, calc=sharedchao)

Alternatively the observed richness can be used with the command:

    mothur > venn(shared=abrecovery.fn.shared, calc=sharedsobs)

Both can be run simultaneously by the command:

    mothur > venn(shared=abrecovery.fn.shared, calc=sharedsobs-sharedchao)

### label

There may only be a couple of lines in your OTU data that you are
interested in generating a **venn** diagram for. There are two options. You
could: (i) manually delete the lines you aren\'t interested in from you
list or shared file; (ii) or use the label option. If you only want to
read in the data for the lines labeled unique, 0.03, 0.05 and 0.10 you
would enter:

    mothur > venn(shared=abrecovery.fn.shared, label=unique-0.03-0.05-0.10)

### group

At this point, if you run the following command:

    mothur > get.group(shared=abrecovery.fn.shared)

You would have seen that there were 3 groups here: A, B, and C. If you
just want the **venn** diagrams between groups A and B, A and C, or B and C
enter the following:

    mothur > venn(shared=abrecovery.fn.shared, groups=A-B)
    mothur > venn(shared=abrecovery.fn.shared, groups=A-C)
    mothur > venn(shared=abrecovery.fn.shared, groups=B-C)

Note that if you run these commands, the SVG files will have the same
name and will be written over for each execution. You will need to
rename the file between executions.

### nseqs

The nseqs parameter will output the number of sequences represented by
the otus in the picture, default=F.

    mothur > venn(shared=abrecovery.fn.shared, nseqs=T)

### permute

If you have more than four groups and set permute=t, mothur will create
pictures with all possible 4-way permutations. The permute option can
also be set to 1,2,3, or 4 to create combinations of varying size.

    mothur > venn(shared=abrecovery.fn.shared, permute=t)

### fontsize

The fontsize parameter allows you to adjust the fontsize in the picture
mothur creates. The default is 24.

### sharedotus

The sharedotus parameter can be used with the sharedsobs calculator to
get the names of the OTUs in each section of the **venn** diagram.
Default=t.

    mothur > venn(shared=abrecovery.fn.shared, label=0.03)

The abrecovery.fn.0.03.sharedsobs.sharedotus file contains:

    Groups NumShared   OTULabels
    A-B    15  Otu001,Otu003,Otu005,Otu007,Otu011,Otu012,Otu013,Otu014,Otu015,Otu026,Otu028,Otu030,Otu032,Otu040,Otu041
    A-C    8   Otu008,Otu014,Otu023,Otu027,Otu030,Otu031,Otu032,Otu040
    B-C    6   Otu014,Otu030,Otu032,Otu040,Otu044,Otu048
    A-B-C  4   Otu014,Otu030,Otu032,Otu040

## Why do the **venn** diagram results vary from [get.sharedseqs](get.sharedseqs) results?

Confusion can occur when you have a shared file with more groups than
just the subset you are looking at in your **venn** diagram. For this
example let\'s look at a simple shared file like:

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
because there are limits to the drawing of the **venn** diagram. With more
than 4 groups the picture becomes too complicated to be of use. In this
example group A is not included which changes the shared and unique
composition.The get.sharedseqs command does not have the limitations of
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

-   1.23.0 - Added fontsize parameter.
-   1.29.0 - Added the sharedotus parameter.
-   1.29.1 - Bug Fix: segfault when no shared otus.
-   1.33.0 - permute parameter can equal 1, 2, 3, 4 or true. -
    <https://www.mothur.org/forum/viewtopic.php?f=3&t=2629&p=7252#p7252>
-   1.33.0 - Bug Fix: overwrote .sharedotu files when permute=t
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)

[Category:Commands](Category:Commands)
