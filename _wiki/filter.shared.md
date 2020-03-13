---
title: 'Filter.shared'
redirect_from: '/wiki/Filter.shared.html'
---
The **filter.shared** command is used to remove OTUs based on various
criteria. It creates a .filter.shared file.


## Default settings

The **filter.shared** command requires a shared file.

    mothur > filter.shared(shared=final.an.shared)

## Options

### minabund

The minabund parameter allows you indicate the minimum abundance
required for each sample in a given OTU. If any samples abundance falls
below the minimum, the OTU is removed. Default=1.

    mothur > filter.shared(shared=final.an.shared, minabund=1)

Let\'s look at an example:

    0.16   A   13  1   0   0   0   0   27  0   2   37  0   0   16  1   
    0.16   B   13  0   2   1   13  2   14  0   6   14  0   4   28  0   
    0.16   C   13  0   0   0   0   0   0   1   4   4   4   25  11  25

would become:

    label  Group   numOtus Otu008  Otu009  Otu012  Otu242  
    0.16   A   4   2   37  16  29  
    0.16   B   4   6   14  28  36  
    0.16   C   4   4   4   11  55

where OTU242 is the \"rare\" OTU created by mothur to preserve the
abundance of each group.

### minpercent

The minpercent parameter allows you indicate the minimum relative
abundance of an OTU. For example, if the OTUs total abundance across all
samples is 8, and the total abundance across all OTUs is 1000, and
minpercent=1. The OTU\'s relative abundance is 0.008, the minimum is

0\.01, so the OTU will be removed. Default=0.

    mothur > filter.shared(shared=final.an.shared, minpercent=1)

minpercent=1 requires each OTU to have a minimum relative abundance of

0\.01 or abundance \> 2.42.

Let\'s look at an example:

    0.16   A   13  1   0   0   0   0   27  0   2   37  0   0   16  1   
    0.16   B   13  0   2   1   13  2   14  0   6   14  0   4   28  0   
    0.16   C   13  0   0   0   0   0   0   1   4   4   4   25  11  25

would become:

    label  Group   numOtus Otu004  Otu006  Otu008  Otu009  Otu010  Otu011  Otu012  Otu013  Otu242  
    0.16   A   9   0   27  2   37  0   0   16  1   1   
    0.16   B   9   13  14  6   14  0   4   28  0   5   
    0.16   C   9   0   0   4   4   4   25  11  25  1   

where OTU242 is the \"rare\" OTU created by mothur to preserve the
abundance of each group.

### mintotal

The mintotal parameter allows you indicate the minimum abundance
required for a given OTU. If abundance across all samples falls below
the minimum, the OTU is removed. Default=0.

    mothur > filter.shared(shared=final.an.shared, mintotal=10)

Let\'s look at an example:

    0.16   A   13  1   0   0   0   0   27  0   2   37  0   0   16  1   
    0.16   B   13  0   2   1   13  2   14  0   6   14  0   4   28  0   
    0.16   C   13  0   0   0   0   0   0   1   4   4   4   25  11  25

would become:

    label  Group   numOtus Otu004  Otu006  Otu008  Otu009  Otu011  Otu012  Otu013  Otu242  
    0.16   A   8   0   27  2   37  0   16  1   1   
    0.16   B   8   13  14  6   14  4   28  0   5   
    0.16   C   8   0   0   4   4   25  11  25  5   

where OTU242 is the \"rare\" OTU created by mothur to preserve the
abundance of each group.

### minnumsamples

The minnumsamples parameter allows you indicate the minimum number of
samples present in an OTU. If the number of samples present falls below
the minimum, the OTU is removed. Default=0.

    mothur > filter.shared(shared=final.an.shared, minnumsamples=2)

Let\'s look at an example:

    0.16   A   13  1   0   0   0   0   27  0   2   37  0   0   16  1   
    0.16   B   13  0   2   1   13  2   14  0   6   14  0   4   28  0   
    0.16   C   13  0   0   0   0   0   0   1   4   4   4   25  11  25

would become:

    label  Group   numOtus Otu006  Otu008  Otu009  Otu011  Otu012  Otu013  Otu242  
    0.16   A   7   27  2   37  0   16  1   1   
    0.16   B   7   14  6   14  4   28  0   18  
    0.16   C   7   0   4   4   25  11  25  5       

where OTU242 is the \"rare\" OTU created by mothur to preserve the
abundance of each group.

### minpercentsamples

The minpercentsamples parameter allows you indicate the minimum
percentage of samples present in an OTU. For example, if the total
number of samples is 10, the number present is 3, and the
minpercentsamples=50. The OTU\'s precent of samples is 0.333, the
minimum is 0.50, so the OTU will be removed. Default=0.

    mothur > filter.shared(shared=final.an.shared, minpercentsamples=50)

minpercentsamples=50 requires each OTU to have a minimum percent of
samples present of 0.50 or \> 1.5.

Let\'s look at an example:

    0.16   A   13  1   0   0   0   0   27  0   2   37  0   0   16  1   
    0.16   B   13  0   2   1   13  2   14  0   6   14  0   4   28  0   
    0.16   C   13  0   0   0   0   0   0   1   4   4   4   25  11  25

would become:

    label  Group   numOtus Otu006  Otu008  Otu009  Otu011  Otu012  Otu013  Otu242  
    0.16   A   7   27  2   37  0   16  1   1   
    0.16   B   7   14  6   14  4   28  0   18  
    0.16   C   7   0   4   4   25  11  25  5       

where OTU242 is the \"rare\" OTU created by mothur to preserve the
abundance of each group.

### makerare

The makerare parameter allows you indicate you want the abundances of
any removed OTUs to be saved and a new \"rare\" OTU created with its
abundances equal to the sum of the OTUs removed. This will preserve the
number of reads in your dataset. Default=T.

### rarepercent

The rarepercent parameter allows you indicate the percentage of otus to
remove. The OTUs chosen to be removed are the rarest. For example if you
have 1000 OTUs, rarepercent=20 would remove the 200 OTUs with the lowest
abundance. Default=0.

### keepties

The keepties parameter is used with the rarepercent parameter. It allows
you indicate you want to keep the OTUs with the same abundance as the
first \'not rare\' OTU. For example if you have 10 OTUs, rarepercent=20
abundances of 20, 18, 15, 15, 10, 5, 3, 3, 3, 1. keepties=t, would
remove the 10th OTU, but keep the 9th because its abundance ties the 8th
OTU. keepties=f would remove OTUs 9 and 10. Default=T.

### groups

The groups parameter allows you to specify which of the groups you would
like included. The group names are separated by dashes.

    mothur > filter.shared(shared=final.an.shared, mintotal=10, groups=A-B)

### accnos

You may wish to list your groups in a file instead of manually typing
them. This can be done by using an accnos file.

    mothur > filter.shared(shared=final.an.shared, mintotal=10, accnos=myGroups.accnos)

### label

The label parameter allows you to select what distance levels you would
like, and are also separated by dashes.

    mothur > filter.shared(shared=final.an.shared, mintotal=10, label=0.03)

## Revisions

-   1.29.0 - First Introduced
-   1.31.0 - Added rarepercent and keepties parameters.
    [https://forum.mothur.org/viewtopic.php?f=5&t=2007](https://forum.mothur.org/viewtopic.php?f=5&t=2007)
-   1.37.0 - Modifies rareOtus label to prevent mothurConvert error.
    [\#137](https://github.com/mothur/mothur/issues/137)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.41.0 - Adds accnos parameter to filter.shared.
    [\#293](https://github.com/mothur/mothur/issues/293)
