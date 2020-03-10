---
title: 'Count.groups'
---
The **count.groups** command counts sequences
from a specific group or set of groups from the following file types:
group, count or shared file. To run this tutorial please download, [
Example Data ](Media:countGroupsDataset.zip)

## Default Settings

To run the command with a group file:

    mothur > count.groups(group=stool.final.groups)

or with a shared file:

    mothur > count.groups(shared=stool.final.an.shared)

or with a [ count file](Count_File):

    mothur > count.groups(count=stool.final.count_table)

The output will look something like:

    F11Fcsw contains 696.
    F12Fcsw contains 637.
    F13Fcsw contains 883.
    F14Fcsw contains 1327.
    F21Fcsw contains 708.
    F22Fcsw contains 721.
    F23Fcsw contains 995.
    F24Fcsw contains 1223.
    F31Fcsw contains 1215.
    ...

### groups

If you would like to simplify the output because you are only interested
in a certain group or set of groups, you can use the groups parameter.

    mothur > count.groups(group=stool.final.groups, groups=F11Fcsw-F12Fcsw)

and the output will look like:

    F11Fcsw contains 696.
    F12Fcsw contains 637.

### accnos

If the set of groups you would like is rather large you can use the
accnos parameter to save some typing. The accnos file should contain a
list of the group names you would like to see in the output.

    mothur > count.groups(group=stool.final.groups, accnos=stool.groups.accnos)

and the output will look like:

    F34Fcsw contains 1247.
    M11Fcsw contains 657.
    M12Fcsw contains 503.
    M13Fcsw contains 1295.
    M14Fcsw contains 1145.
    M21Fcsw contains 1102.
    M22Fcsw contains 1008.
    M23Fcsw contains 1131.
    M24Fcsw contains 922.
    M41Fcsw contains 1250.
    M42Fcsw contains 1134.
    M43Fcsw contains 1025.
    M44Fcsw contains 1189.

## Revisions

-   First Introduced - 1.22.0.
-   1.28.0 Added count option
-   1.30.0 Creates a summary file.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)

[Category:Commands](Category:Commands)
