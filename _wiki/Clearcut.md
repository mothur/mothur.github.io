---
title: 'Clearcut'
---
The **clearcut** command allows mothur users to run the **clearcut** program
from within mothur. The **clearcut** program written by Initiative for
Bioinformatics and Evolutionary Studies (IBEST) at the University of
Idaho. For more information about **clearcut** please refer to
[https://bioinformatics.hungry.com/clearcut/](https://bioinformatics.hungry.com/clearcut/) Note: In version 1.13.0 the
clearcut source was added to mothur, so you no longer need the clearcut
executable. You can still download the **clearcut** executable if you would
like, [Download Clearcut](Download_Clearcut).

## Default settings

You must provide either an aligned fasta file or a [phylip formatted
distance matrix](phylip_formatted_distance_matrix). If you
provide a fasta file, you must specify DNA or protein.

    mothur > clearcut(phylip=abrecovery.dist)

Note: **clearcut** requires sequence names to be at least 10 characters
long.

or

    mothur > clearcut(fasta=abrecovery.align, DNA=T)

In both cases **clearcut** will generate a file called abrecovery.tre.

## Options

### version

The version parameter prints out the version of **clearcut** you are using,
default=F.

    mothur > clearcut(fasta=abrecovery.align, DNA=T, version=t)
    Clearcut Version: 1.0.9

### verbose

The verbose parameter prints out more output from clearcut, default=F.

    mothur > clearcut(fasta=abrecovery.align, DNA=T, verbose=t)
    PRNG SEED: 1274107574
    Tree is not additive
    RNJ tree built in 0.001938 secs
    Relaxed NJ tree(s) in abrecovery.tre

### quiet

The quiet parameter turns on silent operation mode, default=F.

    mothur > clearcut(fasta=abrecovery.align, DNA=T, quiet=t)

### seed

The seed parameter allows you to explicitly set the PRNG seed to a
specific value.

    mothur > clearcut(fasta=abrecovery.align, DNA=t, seed=12345)

### norandom

The norandom parameter allows you to attempt joins deterministically,
default=F.

    mothur > clearcut(fasta=abrecovery.align, DNA=t, norandom=t)

### shuffle

The shuffle parameter allows you to randomly shuffle the distance
matrix, default=F.

    mothur > clearcut(fasta=abrecovery.align, DNA=t, shuffle=t)

### neighbor

The neighbor parameter allows you to use traditional Neighbor-Joining
algorithm, default=F.

    mothur > clearcut(fasta=abrecovery.align, DNA=t, neighbor=t)

### stdout

The stdout parameter outputs your tree to STDOUT, default=F.

    mothur > clearcut(fasta=abrecovery.align, DNA=t, stdout=t)

### DNA

The DNA parameter allows you to indicate your fasta file contains DNA
sequences, default=F.

    mothur > clearcut(fasta=abrecovery.align, DNA=t)

### protein

The protein parameter allows you to indicate your fasta file contains
protein sequences, default=F

    mothur > clearcut(fasta=abrecovery.align, protein=t)

### matrixout

The matrixout parameter allows you to specify a filename to output a
distance matrix to.

     mothur > clearcut(fasta=abrecovery.align, DNA=t, matrixout=myDist.dist)

### ntrees

The ntrees parameter allows you to specify the number of output trees
you want **clearcut** to generate, default=1.

     mothur > clearcut(fasta=abrecovery.align, DNA=t, ntrees=5)

### expblen

The expblen parameter allows you to use exponential notation for branch
lengths, default=F.

     mothur > clearcut(fasta=abrecovery.align, DNA=t, expblen=t)

### expdist

The expdist parameter allows you to use exponential notation for
distance outputs, default=F.

     mothur > clearcut(fasta=abrecovery.align, DNA=t, expdist=t, matrixout=myDist.dist)

Evans, J., L. Sheneman, and J.A. Foster (2006) Relaxed Neighbor-Joining:
A Fast Distance-Based Phylogenetic Tree Construction Method, J. Mol.
Evol., 62, 785-792

## Revisions

-   1.28.0 Bug Fix - windows crash

[Category:Commands](Category:Commands)
