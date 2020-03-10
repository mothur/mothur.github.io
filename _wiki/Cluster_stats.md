---
title: 'Cluster stats'
---
## Used Version 1.27.0

with [
stool.final.phylip.dist](Media:stool.final.phylip.dist.zip)
which is \~80M. 4800 sequences

### [cluster](cluster)

    mothur > cluster(phylip=stool.final.phylip.dist)

Used 360M and took 309 seconds.

    mothur > cluster(phylip=stool.final.phylip.dist, cutoff=0.20)

Used 89M and took 31 secs.

### [cluster.classic](cluster.classic)

    mothur > cluster.classic(phylip=stool.final.phylip.dist) 

Used 45M and 110 seconds.

## Used Version 1.22.0

with [
stool.final.phylip.dist](Media:stool.final.phylip.dist.zip)
which is \~80M.

### [cluster](cluster)

    mothur > cluster(phylip=stool.final.phylip.dist)

Used 774M to cluster and took 690 seconds.

    mothur > cluster(phylip=stool.final.phylip.dist, cutoff=0.20)

Used 162M to cluster and took 74 seconds.

### [cluster.classic](cluster.classic)

    mothur > cluster.classic(phylip=stool.final.phylip.dist) 

Used 90M to cluster and took 147 seconds.

### [cluster.split](cluster.split)

    mothur > cluster.split(phylip=stool.final.phylip.dist, cutoff=0.20)

Used 166M to cluster. It took 73 seconds to convert the distance file.
It took 29 seconds to split the distance file. It took 61 seconds to
cluster. Cluster.split can use multiple processors to save time, but
this uses more memory. Cluster.split can also split by taxonomy.
