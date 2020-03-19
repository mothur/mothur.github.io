---
title: 'parse.list'
tags: 'commands'
redirect_from: '/wiki/Parse.list.html'
---
The **parse.list** command reads a [
list](list_file) file and [ group](group_file) or
[ count](Count_File) file and generates a list file for each
group.


## Default Settings

    mothur > parse.list(list=abrecovery.fn.list, group=abrecovery.groups)

or

    mothur > parse.list(list=abrecovery.fn.unique_list, count=abrecovery.count_table)

Output to the screen looks like:

    unique
    0.00
    0.01
    0.02
    0.03
    0.04
    0.05
    ...

    Output File Names: 
    abrecovery.fn.A.list
    abrecovery.fn.B.list
    abrecovery.fn.C.list

## Options

### label

There may only be a couple of lines in your list file that you are
interested in. There are two options. You could: (i) manually delete the
lines you aren't interested in from your list file; (ii) or use the
label option.

    mothur > parse.list(list=abrecovery.fn.list, group=abrecovery.groups, label=unique-0.03-0.05-0.10)

In the file abrecovery.fn.A.list you would see something like:

    unique 84  AY457831    AY457830    AY457829    AY457828    AY457827    AY457826 ...    
    0.03   61  AY457783,AY457769,AY457786  AY457829    AY457776,AY457831   AY457754 ...    
    0.05   53  AY457783,AY457769,AY457786  AY457829    AY457749,AY457776,AY457831 ...  
    0.10   42  AY457783,AY457769,AY457786  AY457829 AY457813,AY457793,AY457818,AY457785,AY457775,AY457788,AY457815,...

## Revisions

-   1.29.0 Added count parameter


