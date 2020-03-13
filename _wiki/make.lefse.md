---
title: 'make.lefse'
tags: 'commands'
redirect_from: '/wiki/Make.lefse'
---
The **make.lefse** command takes mothur\'s [ shared
file](Shared_file) or [ relabund](Relabund_file)
and creates a lefse formatted file. The LEfSe formatted file is can be
used as an input to the LEfSe program. Segata, N., J. Izard, L. Waldron,
D. Gevers, L. Miropolsky, W. S. Garrett, and C. Huttenhower. 2011.
Metagenomic biomarker discovery and explanation. Genome Biol 12:R60

## Default Setting

The **make.lefse** command requires a shared or relabund file.

    mothur > make.lefse(shared=final.an.shared)

or

    mothur > make.lefse(relabund=final.an.relabund)

If you open final.an.0.03.lefse, you will see:

    group   F003D000    F003D002    F003D004    F003D006    F003D008 ...   
    Otu001  0.075336    0.208835    0.203947    0.165535    0.067498 ...   
    Otu002  0.053969    0.109913    0.138816    0.130548    0.092043 ...
    ...    

## Options

### design

design file with headers can be used to add more categories to your
lefse file. NOTE: The lefse program will error when you format your data
if you have more category lines than what can be assigned for class,
subclass and id.

    mothur > make.lefse(shared=final.an.shared, design=mouse.sex_time2.design)

If you open final.an.0.03.lefse, you will see:

    age     old     old     old2    young   young  ...
    treatment   F003Early   F003Early   F003Early   F003Early   F003Mid    ...
    group   F003D000    F003D002    F003D004    F003D006    F003D008   ...
    Otu001  0.0753362   0.208835    0.203947    0.165535    0.067498   ...
    Otu002  0.0539694   0.109913    0.138816    0.130548    0.0920428  ...
    Otu003  0.0760729   0.0391038   0.0949561   0.0823325   0.0635392  ...
    ...

### constaxonomy

The constaxonomy parameter can be used to assign the OTUs classificaton
instead of the OTULabel.

    mothur > make.lefse(shared=final.an.shared, constaxonomy=final.an.0.03.cons.taxonomy)

If you open final.an.0.03.lefse, you will see:

    group   F003D000    F003D002    F003D004    F003D006    F003D008   ...
    Bacteria_Otu001|"Bacteroidetes"_Otu001|"Bacteroidia"_Otu001|"Bacteroidales"_Otu001|"Porphyromonadaceae"_Otu001|unclassified     0.0753362   0.208835    0.203947    0.165535    0.067498   ...
    Bacteria_Otu002|"Bacteroidetes"_Otu002|"Bacteroidia"_Otu002|"Bacteroidales"_Otu002|"Porphyromonadaceae"_Otu002|unclassified     0.0539694   0.109913    0.138816    0.130548    0.0920428  ...
    ...

### groups

The groups parameter allows you to specify which of the groups in your
shared file you would like included. The group names are separated by
dashes.

    mothur > make.lefse(shared=final.an.shared, groups=F003D000-F003D004)

### scale

The scale parameter allows you to select what scale you would like to
use to convert your shared file abundances to relative abundances.
Choices are totalgroup, totalotu, averagegroup, averageotu, default is
totalgroup.

### label

The label parameter allows you to select what distance level you would
like used, if none is given the first distance is used.

## Revisions

-   1.32.0 - First Introduced
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)


