---
title: 'mgcluster'
tags: 'commands'
redirect_from: '/wiki/Mgcluster'
---
The **mgcluster** command \....

For this tutorial you should download the [ Example
Files](https://mothur.s3.us-east-2.amazonaws.com/wiki/_bap_files.zip) file and decompress it.


## Default settings

The blast parameter is required\...

    mgcluster(blast=bap.100.blast)

## Options

### name

    mgcluster(blast=bap.100.blast, name=bap.100.names)

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. mothur will use this information to form
the correct OTU's. Unlike, when you use a names file the list file
generated will contain only the unique names, so be sure to include the
count file in downstream analysis with the list file.

    mothur > make.table(name=bap.100.names)
    mothur > mgcluster(blast=bap.100.blast, count=bap.100.count_table)

### method

-   [nearest neighbor](Nearest_neighbor): Each of the
    sequences within an OTU are at most X% distant from the most similar
    sequence in the OTU.
-   [furthest neighbor](Furthest_neighbor): All of the
    sequences within an OTU are at most X% distant from all of the other
    sequences within the OTU.
-   [average neighbor](Average_neighbor): This method is a
    middle ground between the other two algorithms.
-   [opticlust](OptiClust): OTUs are assembled using metrics
    to determine the quality of clustering.

    cluster method: opti, furthest, nearest or average. 

default = opti

### metric

The metric parameter allows to select the metric in the opticluster
method. Options are Matthews correlation coefficient (mcc), sensitivity
(sens), specificity (spec), true positives + true negatives (tptn),
false positives + false negatives (fpfn), true positives (tp), true
negative (tn), false positive (fp), false negative (fn), f1score
(f1score), accuracy (accuracy), positive predictive value (ppv),
negative predictive value (npv), false discovery rate (fdr).
Default=mcc.

### initialize

The initialize parameter allows to select the initial randomization for
the opticluster method. Options are singleton, meaning each sequence is
randomly assigned to its own OTU, or oneotu meaning all sequences are
assigned to one otu. We have found initialize=singleton to produce
better clustering in less time. Default=singleton.

### delta

The delta parameter allows to set the stable value for the metric in the
opticluster method Default delta=0.0001. To reach a full convergence,
set delta=0.

### iters

The iters parameter allow you to set the maxiters for the opticluster
method. Default=100.

### cutoff

    default = 0.70
    mgcluster(blast=bap.100.blast, cutoff=1.0)

### precision

default = 100

### merge

Default = true, meaning merge after clustering
mgcluster(blast=bap.100.blast, merge=f)

### min

    default = true, meaning use minimum blast score ratio
    mgcluster(blast=bap.100.blast, min=f)

### length

default = 5, minimum overlap

    mgcluster(blast=bap.100.blast, length=10)

### penalty

default = 0.10

    mgcluster(blast=bap.100.blast, penalty=0.15)

## Revisions

-   1.28.0 - Added the count parameter
-   1.40.0 - Adds opti method
-   1.40.4 - Bug Fix: Cluster commands printing of list file.
    [\#454](https://github.com/mothur/mothur/issues/454)


