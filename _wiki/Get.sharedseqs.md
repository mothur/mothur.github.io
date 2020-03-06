---


title: 'Get.sharedseqs'
---
The **get.sharedseqs** command takes a list and group file or shared
file and outputs a \*.shared.seqs file for each distance. This is useful
for those cases where you might be interested in identifying sequences
that are either unique or shared by specific groups, which you could
then classify. To run through the commands below use [ AbRecovery
files](Media:AbRecovery.zip).


{% include toc.html %}

## Default settings

To execute the get.sharedseqs command you must provide a list and
group/count file or shared file. By default this will output the
sequences found in the OTUs shared by all the groups in your group/count
file or shared file. For example:

    mothur > get.sharedseqs(list=abrecovery.fn.list, group=abrecovery.groups)

or

    mothur > get.sharedseqs(list=abrecovery.fn.unique_list, count=abrecovery.count_table)

or

    mothur > make.shared(list=abrecovery.fn.list, group=abrecovery.groups)
    mothur > get.sharedseqs(shared=abrecovery.fn.shared)

This will result in output to the screen looking like:

    unique 0 - No otus shared by groups  A  B  C.
    0.00   0 - No otus shared by groups  A  B  C.
    0.01   1
    0.02   2
    0.03   3
    0.04   3
    0.05   4
    0.06   5
    0.07   6
    ...

The left column indicates the label for each line in the data set and
the right column indicates the number of OTUs at this distance.

The .shared.seqs output files look like:

    AY457715   C   59
    AY457838   A   59
    AY457774   B   59
    ...

The first column is the sequence accession number, the second is the
group that the sequence is from, and the third is the OTU number that
the sequence belongs to.

## Options

### fasta

If you provide a fasta file mothur will also output a fasta file for
each distance you specify:

    mothur > get.sharedseqs(list=abrecovery.fn.list, group=abrecovery.groups, fasta=abrecovery.fasta)

The .shared.fasta output files look like:

    >AY457838   A   59
    CCCTTAGAGTTTGATCCTGGCTCAGGACG...
    >AY457774   B   59
    CCCTTAGAGTTTGATCCTGGCTCAGGACG...
    >AY457715   C   59
    CCCTTAGAGTTTGATCCTGGCTCAGGACG...
    ...

### label

There may only be a couple of lines in your list file that you are
interested in. You could either manually delete the lines you aren\'t
interested in from you list file or use the label option.

    mothur > get.sharedseqs(list=abrecovery.fn.list, group=abrecovery.groups, label=0.04-0.82)
    0.04   3
    0.82   1

Opening abrecovery.fn.0.04.shared.seqs you would see the output as:

    AY457701    C        45
    AY457715    C        45
    AY457838    A        45
    AY457774    B        45
    ...

### uniquegroups & sharedgroups

The uniquegroups parameter allows you to see sequences belonging to OTUs
unique to specific groups or unique to a particular group. For example
to see the sequences from OTUs unique to group A at distance 0.04, you
would enter the following:

    mothur > get.sharedseqs(list=abrecovery.fn.list, group=abrecovery.groups, label=0.04, uniquegroups=A)
    0.04   38

There are 38 OTUs that are unique to A at distance 0.04 and their
sequence names are listed in abrecovery.fn.0.04unique.A.shared.seqs.

Similarly, if you wanted the sequences from OTUs unique to groups A and
B at distance 0.04, you would enter the following

    mothur > get.sharedseqs(list=abrecovery.fn.list, group=abrecovery.groups, label=0.04, uniquegroups=A-B)
    0.04   12

There are 12 OTUs that only contain sequences from groups A and B at a
distance of 0.04. The file abrecovery.fn.0.04unique.A-B.shared.seqs
contains:

    AY457754    B   44
    AY457871    A   44
    AY457910    A   44
    AY457805    B   63
    AY457853    A   63
    ...

The sharedgroups parameter allows you to see sequences belonging to OTUs
that contain specific groups or a particular group. For example to see
the sequences from OTUs that contain sequences from group A at distance
0.04, you would enter the following:

    mothur > get.sharedseqs(list=abrecovery.fn.list, group=abrecovery.groups, label=0.04, sharedgroups=A)
    0.04   57

There are 57 OTUs that contain sequences from group A at distance 0.04
and their names are listed in abrecovery.fn.0.04A.shared.seqs.

Similarly, if you wanted the sequences from OTUs that contain sequences
from groups A and B at distance 0.04, you would enter the following

    mothur > get.sharedseqs(list=abrecovery.fn.list, group=abrecovery.groups, label=0.04, sharedgroups=A-B)
    0.04   15

There are 15 OTUs that are shared between A and B at a distance of 0.04.
The file abrecovery.fn.0.04A-B.shared.seqs contains:

    AY457754   B   44
    AY457871   A   44
    AY457910   A   44
    AY457701   C   45
    AY457715   C   45
    AY457838   A   45
    AY457774   B   45
    AY457747   C   45
    AY457859   A   45
    ...

### output

The output parameter allows you to have the .names file be in .accnos
form so you can use it with the [get.seqs](get.seqs),
[list.seqs](list.seqs) and
[remove.seqs](remove.seqs) commands. For example:

    mothur > get.sharedseqs(list=abrecovery.fn.list, group=abrecovery.groups, label=0.04, output=accnos)

Opening abrecovery.fn.0.04.shared.seqs you would see the output as:

    AY457701
    AY457715
    AY457838
    AY457774
    AY457747
    AY457859
    AY457695
    AY457732
    AY457860
    AY457826
    AY457767
    AY457698
    AY457855
    AY457804

## Why do the venn diagram results vary from [get.sharedseqs](get.sharedseqs) results?

Confusion can occur when you have a shared file with more groups than
just the subset you are looking at in your venn diagram. For this
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
because there are limits to the drawing of the venn diagram. With more
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

-   1.30.0 - added shared file option and changed unique and shared
    parameter names to uniquegroups and sharedgroups.
-   1.37.0 - Adds count parameter
    [\#133](https://github.com/mothur/mothur/issues/133)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)

[Category:Commands](Category:Commands)
