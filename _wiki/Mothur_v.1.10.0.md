---
title: 'Mothur v.1.10.0'
---
We are happy to announce the release of the [mothur
v.1.10.0](mothur_v.1.10.0)! This release contains a number of
new commands and additional features, many of which were suggested by
our loyal users over on the mothur forum. There are three notable
additions to this release. First, users can now generate neighbor
joining trees within mothur using the [clearcut](clearcut)
command, which is a wrapper for the program by the same name. Second, we
have added an additional \"phylogenetic\" method for assessing alpha
diversity by using the [phylo.diversity](phylo.diversity)
command. Third, we offer the [make.group](make.group)
command, which should lighten the load of our in-box - if you give
mothur the names of your fasta files that contain sequences for
different groups, mothur will make the group file for you. We\'ve also
added a number of features to expand the utility of mothur including
adding parallelization to many commands and the ability to have inexact
matches to your primers and barcodes in the
[trim.seqs](trim.seqs) command.

As always, we appreciate your feedback and suggestions. Hopefully, you
can see that we take your comments seriously and are happy to
incorporate good ideas into mothur!

## New commands

-   added [set.logfile](set.logfile) command - allows user to
    set logfile name and/or append the log to an existing file
-   added [phylo.diversity](phylo.diversity) command -
    [phylogenetic diversity](phylogenetic_diversity)
-   added [make.group](make.group) command -
    [https://forum.mothur.org/viewtopic.php?f=3&t=385&sid=6260346b9aab4bf74e20f667fd135cb4](https://forum.mothur.org/viewtopic.php?f=3&t=385&sid=6260346b9aab4bf74e20f667fd135cb4)
-   added [chop.seqs](chop.seqs) command -
    [https://forum.mothur.org/viewtopic.php?f=3&t=399&sid=ecc7b9a7e046fb48f5a5345713ef3fd2](https://forum.mothur.org/viewtopic.php?f=3&t=399&sid=ecc7b9a7e046fb48f5a5345713ef3fd2)
-   added [clearcut](clearcut) command - wrapper for
    [clearcut](https://bioinformatics.hungry.com/clearcut/)

## Feature updates

-   [https://forum.mothur.org/viewtopic.php?f=5&t=300&p=749&sid=80af1914178877c36516229d2fe8d809#p749](https://forum.mothur.org/viewtopic.php?f=5&t=300&p=749&sid=80af1914178877c36516229d2fe8d809#p749) -
    added group parameter to [classify.seqs](classify.seqs),
    reworked summary file so the taxids are based on the reference
    taxonomy.
-   made taxonomy static between runs
-   speed comparison between our classify.seqs with bayesian and the
    RDPs. Have received reports that ours is much slower.
-   added name option for [phylotype](phylotype) command
-   parallelized [screen.seqs](screen.seqs) - made it MPI
    Enabled
-   parallelized [trim.seqs](trim.seqs)
-   added tdiffs, bdiffs and pdiffs parameters to
    [trim.seqs](trim.seqs) command
-   made get.oturep command be made more memory efficient by breaking
    processing into 2 parts so distance and list files are not in memory
    at the same time as fasta, name and group files.
-   added hard parameter to [cluster](cluster),
    [hcluster](hcluster) and
    [read.dist](read.dist) for a hard cutoff (hard=T), where
    the cutoff is 0.03, not 0.0349, etc.
-   [remove.seqs](remove.seqs) can remove sequences from
    multiple files at once.
-   mothur now recognizes \~, so you can enter filenames like
    \~/desktop/myFile.fasta, or set.dir(output=\~)
-   added 3 constructors to sequence class that just fill unaligned
    field to save space when we don\'t need an aligned sequence.
-   made freq a percentage of number of sequences -
    [https://forum.mothur.org/viewtopic.php?f=5&t=402&sid=22d323d5316be7937cb6de9f3ea8cac4](https://forum.mothur.org/viewtopic.php?f=5&t=402&sid=22d323d5316be7937cb6de9f3ea8cac4)
-   doubled the size of venn diagrams created.

## Bug fixes

-   fixed bug with MPI Enabled version that would cause a malloc error
    if the number of seqs in your input file did not divide evenly
    between processes.
-   [https://forum.mothur.org/viewtopic.php?f=4&t=392&sid=54ce67de05b106db5435ba67e0583723](https://forum.mothur.org/viewtopic.php?f=4&t=392&sid=54ce67de05b106db5435ba67e0583723),
    fixed bug that caused file mismatch issues because the read of qfile
    was based on sequence length in fasta file. It now reads the length
    directly from the qfile.
-   fixed bug with [classify.seqs](classify.seqs) that caused
    cutoff not to work if iters was not equal to 100.
-   fixed bug with [get.seqs](get.seqs) that would cause the
    command to abort if both the input and output are redirected. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=398&sid=271fe0ebe8c7e8cf2a9ffe87e30d4cbb](https://forum.mothur.org/viewtopic.php?f=4&t=398&sid=271fe0ebe8c7e8cf2a9ffe87e30d4cbb)
-   [filter.seqs](filter.seqs) says it only uses 0 sequences
    to build filter
-   you can now use the readline library with the mpi-enabled version -
    [https://forum.mothur.org/viewtopic.php?f=4&t=396&sid=ed88315308710479c553039fdfd21d7e](https://forum.mothur.org/viewtopic.php?f=4&t=396&sid=ed88315308710479c553039fdfd21d7e)
-   fixed bug with mothur\'s interface to blast, caused
    \[NULL\_Caption\] FATAL ERROR.
