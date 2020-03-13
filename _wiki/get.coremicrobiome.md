---
title: 'get.coremicrobiome'
tags: 'commands'
redirect_from: '/wiki/Get.coremicrobiome.html'
---
The **get.coremicrobiome** command
determines the fraction of OTUs that are found in varying numbers of
samples for different minimum relative abundances. To run this tutorial
download, [ example files ](https://mothur.s3.us-east-2.amazonaws.com/wiki/_temp.job2.shared.zip)

## Default Settings

The get.coremicrobiom command reads a shared or relabund file and
creates a \*.core.microbiome file.

    mothur > get.coremicrobiome(shared=temp.job2.shared)

or

    mothur > get.coremicrobiome(relabund=temp.job2.relabund)

If you open the temp.job2.unique.core.microbiome file you will see:

    NumSamples Relabund-0% Relabund-1% Relabund-2% Relabund-3% Relabund-4% ... Relabund-98%    Relabund-99%    Relabund-100%   
    1  1.000000    0.615385    0.461538    0.307692    0.307692 ...    0.000000    0.000000    0.000000    
    2  1.000000    0.538462    0.307692    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    3  1.000000    0.384615    0.307692    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    4  1.000000    0.384615    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    5  1.000000    0.384615    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    6  1.000000    0.230769    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    7  1.000000    0.230769    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    8  1.000000    0.230769    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    9  1.000000    0.230769    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    10 1.000000    0.230769    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    11 1.000000    0.230769    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    12 1.000000    0.230769    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    13 1.000000    0.230769    0.230769    0.230769    0.230769 ...    0.000000    0.000000    0.000000    
    14 1.000000    0.230769    0.230769    0.230769    0.153846 ...    0.000000    0.000000    0.000000    
    15 1.000000    0.230769    0.230769    0.153846    0.153846 ...    0.000000    0.000000    0.000000    
    16 1.000000    0.230769    0.230769    0.153846    0.153846 ...    0.000000    0.000000    0.000000    
    17 1.000000    0.230769    0.230769    0.153846    0.153846 ...    0.000000    0.000000    0.000000    
    18 1.000000    0.230769    0.230769    0.153846    0.153846 ...    0.000000    0.000000    0.000000    
    19 1.000000    0.230769    0.153846    0.153846    0.153846 ...    0.000000    0.000000    0.000000    

The entries in the table represents the fraction of OTUs in a study that
have a relative abundance at or above %X in at least %Y samples. X goes
from 0 to 100, Y from 1 to the number of samples in your dataset. From
the above file we can see that 0.615385 (roughly 62%) of the OTUs have a
relative abundance at or above 0.01 in at least one sample, but only

0\.230769 (roughly 23%) have a relative abundance at or above 0.01 in all
the samples.

## Options

### output

The output parameter is used to specify whether you would like the
fraction of OTU\'s or OTU count outputted. Options are fraction or
count. Default=fraction.

    mothur > get.coremicrobiome(shared=temp.job2.shared, output=count)

If you open the temp.job2.unique.core.microbiome file you will see:

    NumSamples Relabund-0% Relabund-1% Relabund-2% Relabund-3% Relabund-4% ... Relabund-98%    Relabund-99%    Relabund-100%   
    1  13  8   6   4   4 ... 0 0   0   
    2  13  7   4   3   3 ... 0 0   0   
    3  13  5   4   3   3 ... 0 0   0   
    4  13  5   3   3   3 ... 0 0   0   
    5  13  5   3   3   3 ... 0 0   0   
    6  13  3   3   3   3 ... 0 0   0   
    7  13  3   3   3   3 ... 0 0   0   
    8  13  3   3   3   3 ... 0 0   0   
    9  13  3   3   3   3 ... 0 0   0   
    10 13  3   3   3   3 ... 0 0   0   
    11 13  3   3   3   3 ... 0 0   0   
    12 13  3   3   3   3 ... 0 0   0   
    13 13  3   3   3   3 ... 0 0   0   
    14 13  3   3   3   2 ... 0 0   0   
    15 13  3   3   2   2 ... 0 0   0   
    16 13  3   3   2   2 ... 0 0   0   
    17 13  3   3   2   2 ... 0 0   0   
    18 13  3   3   2   2 ... 0 0   0   
    19 13  3   2   2   2 ... 0 0   0   

From the above file we can see that 8 of the OTUs have a relative
abundance at or above 0.01 in at least one sample, but only 3 have a
relative abundance at or above 0.01 in all the samples.

### abundance && samples

Using the abundance and samples parameters will cause mothur to create a
\*.core.microbiomelist file. The abundance parameter allows you to
specify an abundance you would like the OTU names outputted for. Must be
an integer between 0 and 100, indicating the relative abundance. The
samples parameter allows you to specify the minimum number of samples
you would like the OTU names outputted for. Must be an interger between
1 and number of samples in your file.

To list the OTU\'s that have a relative abundance at or above 0.01 at
for each number of samples, you would run:

    mothur > get.coremicrobiome(shared=temp.job2.shared, abundance=1)

If you open the temp.job2.unique.core.microbiomelist file you will see:

    Samples    OTUList_for_abund=1
    1  Otu02,Otu04,Otu06,Otu07,Otu08,Otu09,Otu12,Otu13
    2  Otu02,Otu04,Otu07,Otu08,Otu09,Otu12,Otu13
    3  Otu02,Otu07,Otu08,Otu09,Otu12
    4  Otu02,Otu07,Otu08,Otu09,Otu12
    5  Otu02,Otu07,Otu08,Otu09,Otu12
    6  Otu07,Otu08,Otu09
    7  Otu07,Otu08,Otu09
    8  Otu07,Otu08,Otu09
    9  Otu07,Otu08,Otu09
    10 Otu07,Otu08,Otu09
    11 Otu07,Otu08,Otu09
    12 Otu07,Otu08,Otu09
    13 Otu07,Otu08,Otu09
    14 Otu07,Otu08,Otu09
    15 Otu07,Otu08,Otu09
    16 Otu07,Otu08,Otu09
    17 Otu07,Otu08,Otu09
    18 Otu07,Otu08,Otu09
    19 Otu07,Otu08,Otu09

To list the OTU\'s that have a given relative abundance for at least 8
samples, you would run:

    mothur > get.coremicrobiome(shared=temp.job2.shared, samples=8)

If you open the temp.job2.unique.core.microbiomelist file you will see:

    Relabund%  OTUList_for_samples=8
    0  Otu01,Otu02,Otu03,Otu04,Otu05,Otu06,Otu07,Otu08,Otu09,Otu10,Otu11,Otu12,Otu13
    1  Otu07,Otu08,Otu09
    2  Otu07,Otu08,Otu09
    3  Otu07,Otu08,Otu09
    4  Otu07,Otu08,Otu09
    5  Otu07,Otu08,Otu09
    6  Otu07,Otu08,Otu09
    7  Otu07,Otu08,Otu09
    8  Otu07,Otu08,Otu09
    9  Otu07,Otu08,Otu09
    10 Otu07,Otu09
    11 Otu07,Otu09
    12 Otu07,Otu09
    ...    
    98 
    99 
    100    

To list the OTU\'s that have a relative abundance at or above 0.01 at
for at least 8 samples, you would run:

    mothur > get.coremicrobiome(shared=temp.job2.shared, abundance=1, samples=8)

If you open the temp.job2.unique.core.microbiomelist file you will see:

    Relabund%  OTUList_for_samples=8
    1  Otu07,Otu08,Otu09

### groups

The groups parameter allows you to specify which of the groups in your
shared or relabund file you would like included. The group names are
separated by dashes.

### label

The label parameter allows you to select what distance levels you would
like, and are also separated by dashes.

## Revisions

-   1.26.0 - First Introduced
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.3 - Bug Fix: segfault with shared option.
    [\#445](https://github.com/mothur/mothur/issues/445)


