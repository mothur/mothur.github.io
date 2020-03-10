---
title: 'Summary.tax'
---
The [summary.tax](summary.tax) command reads a taxonomy file
and an optional name and or group file, and summarizes the taxonomy
information. To run this tutorial please download, [ Example Data
](Media:sumTaxData.zip)

## Default settings

You must provide a taxonomy file.

    mothur > summary.tax(taxonomy=stool.trim.unique.good.filter.unique.precluster.pick.rdp.taxonomy)

This command will produce a
stool.trim.unique.good.filter.unique.precluster.pick.rdp.tax.summary,
which should look like:

    0  0   Root    1   3714    
    1  0.1 Bacteria    10  3714    
    2  0.1.1   "Acidobacteria" 1   5   
    3  0.1.1.1 Holophagae  1   5   
    4  0.1.1.1.1   Holophagales    1   5   
    5  0.1.1.1.1.1 Holophagaceae   1   5   
    6  0.1.1.1.1.1.1   Holophaga   0   5   
    2  0.1.2   "Actinobacteria"    1   38  
    ...

### name

The name parameter allows you add a names file with your taxonomy file.

    mothur > summary.tax(taxonomy=stool.trim.unique.good.filter.unique.precluster.pick.rdp.taxonomy, name=stool.trim.unique.good.filter.unique.precluster.pick.names)

    0  0   Root    1   27517   
    1  0.1 Bacteria    10  27517   
    2  0.1.1   "Acidobacteria" 1   270 
    3  0.1.1.1 Holophagae  1   270 
    4  0.1.1.1.1   Holophagales    1   270 
    5  0.1.1.1.1.1 Holophagaceae   1   270 
    6  0.1.1.1.1.1.1   Holophaga   0   270 
    2  0.1.2   "Actinobacteria"    1   258 
    ...

### group

The group parameter allows you add a group file to be used to generate
group totals in the .summary file.

    mothur > summary.tax(taxonomy=stool.trim.unique.good.filter.unique.precluster.pick.rdp.taxonomy, name=stool.trim.unique.good.filter.unique.precluster.pick.names, group=stool.good.pick.groups)

    taxlevel    rankID  taxon   daughterlevels  total  F11Fcsw F12Fcsw F13Fcsw F14Fcsw F21Fcsw ... 
    0  0   Root    1   27517   699 666 925 1301    707 ... 
    1  0.1 Bacteria    10  27517   699 666 925 1301    707  ...    
    2  0.1.1   "Acidobacteria" 1   270 61  52  46  75  2   ... 
    3  0.1.1.1 Holophagae  1   270 61  52  46  75  2   ... 
    4  0.1.1.1.1   Holophagales    1   270 61  52  46  75  2   ... 
    5  0.1.1.1.1.1 Holophagaceae   1   270 61  52  46  75  2   ... 
    6  0.1.1.1.1.1.1   Holophaga   0   270 61  52  46  75  2   ... 
    2  0.1.2   "Actinobacteria"    1   258 44  31  55  79  1   ...
    ...    

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > summary.tax(taxonomy=stool.trim.unique.good.filter.unique.precluster.pick.rdp.taxonomy, count=stool.trim.unique.good.filter.unique.precluster.pick.count_table)

### relabund

The relabund parameter allows you to indicate you want the summary file
values to be relative abundances rather than raw abundances. Default=F.

    mothur > summary.tax(taxonomy=stool.trim.unique.good.filter.unique.precluster.pick.rdp.taxonomy, name=stool.trim.unique.good.filter.unique.precluster.pick.names, group=stool.good.pick.groups, relabund=t)

### threshold

The threshold parameter allows you to specify a cutoff for the taxonomy
file that is being inputted. Once the classification falls below the
threshold the mothur will refer to it as unclassified when calculating
the summary. This feature is similar to adjusting the cutoff in
classify.seqs. Default=0.

### output

The output parameter allows you to specify format of your \*tax.summary
file. Options are simple and detail. The detail format outputs the
totals at each level, where as the simple format outputs the highest
level. The default is detail.

The detail format looks like:

    taxlevel   rankID  taxon   daughterlevels  total   A   B   C
    0  0   Root    1   28  14  20  9
    1  0.1 "k__Bacteria"   5   28  14  20  9
    2  0.1.1   "p__Actinobacteria" 1   3   0   3   0
    3  0.1.1.1 "c__Actinobacteria" 1   3   0   3   0
    4  0.1.1.1.1   "o__Bifidobacteriales"  1   3   0   3   0
    5  0.1.1.1.1.1 "f__Bifidobacteriaceae" 1   3   0   3   0
    6  0.1.1.1.1.1.1   "g__Bifidobacterium"    3   3   0   3   0
    7  0.1.1.1.1.1.1.1 "s__"   0   1   0   1   0
    7  0.1.1.1.1.1.1.2 "s__adolescentis"   0   1   0   1   0
    7  0.1.1.1.1.1.1.3 "s__longum" 0   1   0   1   0
    2  0.1.2   "p__Bacteroidetes"  1   6   5   3   3
    3  0.1.2.1 "c__Bacteroidia"    1   6   5   3   3
    4  0.1.2.1.1   "o__Bacteroidales"  2   6   5   3   3
    5  0.1.2.1.1.1 "f__Bacteroidaceae" 1   4   4   3   1
    6  0.1.2.1.1.1.1   "g__Bacteroides"    4   4   4   3   1
    7  0.1.2.1.1.1.1.1 "s__"   0   1   1   1   0
    ...

The simple format looks like:

    taxon  total   A   B   C
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__";   1   0   1   0
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__adolescentis";   1   0   1   0
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__longum"; 1   0   1   0
    ...

### printlevel

The printlevel parameter allows you to specify taxlevel of your
\*tax.summary file to print to. Options are 1 to the maz level in the
file. The default is -1, meaning max level. If you select a level
greater than the level your sequences classify to, mothur will print to
the level your max level.

    mothur > biom.info(biom=abrecovery.an.0.03.biom, label=0.03, printlevel=4)

Detail format:

    taxlevel   rankID  taxon   daughterlevels  total   A   B   C 
    0  0   Root    1   28  14  20  9
    1  0.1 "k__Bacteria"   5   28  14  20  9
    2  0.1.1   "p__Actinobacteria" 1   3   0   3   0
    3  0.1.1.1 "c__Actinobacteria" 1   3   0   3   0
    4  0.1.1.1.1   "o__Bifidobacteriales"  1   3   0   3   0
    2  0.1.2   "p__Bacteroidetes"  1   6   5   3   3
    3  0.1.2.1 "c__Bacteroidia"    1   6   5   3   3
    4  0.1.2.1.1   "o__Bacteroidales"  2   6   5   3   3
    2  0.1.3   "p__Firmicutes" 2   13  8   10  2
    3  0.1.3.1 "c__Bacilli"    1   1   1   0   0
    4  0.1.3.1.1   "o__Turicibacterales"   1   1   1   0   0
    ...

Simple Format:

    taxon  total   A   B   C
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";  3   0   3   0
    "k__Bacteria";"p__Bacteroidetes";"c__Bacteroidia";"o__Bacteroidales";  6   5   3   3
    "k__Bacteria";"p__Firmicutes";"c__Bacilli";"o__Turicibacterales";  1   1   0   0
    ...

## Revisions

-   1.22.0 First Introduced
-   1.28.0 Added count parameter
-   1.37.0 Adds output, printlevel and threshold parameters
    [\#204](https://github.com/mothur/mothur/issues/204)
    [\#158](https://github.com/mothur/mothur/issues/158)
    [\#31](https://github.com/mothur/mothur/issues/31)
-   1.38.0 Removes reftaxonomy parameter
-   1.38.0 Fixes bug with command not including name file counts in
    \*tax.summary
-   1.39.0 Taxonomy files can now contain spaces in the taxon names
-   1.39.2 Fixes summary file printing issue
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)

[Category:Commands](Category:Commands)
