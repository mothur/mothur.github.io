---
title: 'otu.hierarchy'
tags: 'commands'
redirect_from: '/wiki/Otu.hierarchy.html'
---
The **otu.hierarchy** command relates OTUs at
different distances


## Default settings

A [ list](/wiki/list_file) file and two labels must be inputted for
otu.hierarchy to be successful.

    mothur > otu.hierarchy(list=abrecovery.fn.list, label=0.03-0.35)

In the abrecovery.fn.0.03-0.35.otu.hierarchy output file, the first
column is what the OTU looked like at distance 0.35 followed by the list
of sequences in the OTUs at distance 0.03 that merged together.

## Options

The output parameter allows you to either specify the output to display
the names of the sequences in the otus or the otu numbers, the default
is name.

    mothur > otu.hierarchy(list=abrecovery.fn.list, label=0.03-0.35, output=number)

    Otu001  Otu004  Otu005  Otu007  Otu008  Otu010  Otu012  Otu013  Otu021  Otu022 ... 
    Otu002  Otu001  Otu003  Otu009  Otu011  Otu014  Otu015  Otu017  Otu018  Otu019 ...
    Otu003  Otu002  Otu006  Otu016  Otu020  Otu026  Otu029  Otu030  Otu031  Otu033 ...
    ...

So Otu003 at distance 0.35 is made up of OTUs Otu002 Otu006 Otu016
Otu020 Otu026 Otu029 Otu030 Otu031 Otu033\... at distance 0.03.


