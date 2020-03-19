---
title: 'group file'
tags: 'file_types'
redirect_from: '/wiki/Group_file'
---
The group file is used to assign sequences to a specific group. It
consists of 2 columns separated by a tab. The first column contains the
sequence name. The second column contains the group name. Here is an
example:

    AY457915   A   
    AY457914   A   
    AY457913   A   
    AY457912   A   
    AY457911   A   
    AY457910   A   
    AY457909   A   
    AY457908   A   
    AY457907   A   
    AY457906   A   
    ...

Notes:


1\.  Be sure not to include the "\>" in the name of the sequence.

2\.  You sequence name and group name cannot contain blank spaces. For
    example, the following will cause an error: AY457915 Dirt Sample

3\.  DO NOT use a hyphen in group names. The "-" character is used
    within mothur to separate group names, labels, taxonomies, ect.
    Including a hyphen will cause issues in your downstream analysis.

[category:filetypes](Category:FileTypes)
