---
title: 'chimera.uchime'
tags: 'commands'
redirect_from: '/wiki/Chimera.uchime.html'
---
The **chimera.uchime** command reads a fasta file and reference file and
outputs potentially chimeric sequences. The original uchime program was
written by Robert C. Edgar and donated to the public domain,
[https://drive5.com/uchime](https://drive5.com/uchime). If you would like to follow along, please
download [ uchimeexample.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/uchimeexample.zip).


## Default Settings

The fasta parameter is required, and you must provide a name file or
reference file.

    mothur > chimera.uchime(fasta=stool.trim.unique.good.align, reference=silva.gold.align)

The output to the screen should look like:

    uchime by Robert C. Edgar
[`https://drive5.com/uchime`](https://drive5.com/uchime)
    This code is donated to the public domain.

    Checking sequences from stool.trim.unique.good.align ...
    00:41  23Mb  100.0% Reading stool.trim.unique.good.align
    00:41  23Mb 15.4k sequences                                                               
    00:52  31Mb  100.0% Reading silva.gold.align
    00:52  31Mb 5181 sequences                                                    
    Processing sequence: 100, 6 chimeras found.
    Processing sequence: 200, 9 chimeras found.
    Processing sequence: 300, 11 chimeras found.
    Processing sequence: 400, 16 chimeras found.
    Processing sequence: 500, 23 chimeras found.
    Processing sequence: 600, 28 chimeras found.
    ...

Output in stool.trim.unique.good.denova.uchime.chimeras:

    0.1101 F11Fcsw_92  S000546342  7000004128191216    98.7    83.8    98.2    82.5    98.2    1   0   0   36  2   2   0.45    N
    0.1335 F11Fcsw_455 7000004131499028    S000428418  82.3    74.7    75.3    74.7    78.3    14  1   12  20  5   16  9.40    N
    0.0489 F11Fcsw_966 S000366775  S000428418  83.3    81.7    75.8    78.0    79.2    22  9   19  3   0   2   1.97    N
    0.0000 F11Fcsw_1136    *   *   *   *   *   *   *   *   *   *   *   *   *   *   N
    0.1347 F11Fcsw_1915    S000436394  S000398603  82.5    75.9    75.0    67.9    76.1    15  1   5   32  15  16  8.70    N
    0.0140 F11Fcsw_2390    7000004131499064    S000539267  100.0   99.5    98.6    98.1    99.1    3   1   0   1   0   0   0.47    N
    ...

The chimeras file format is explained
[here](https://drive5.com/usearch/manual/uchimeout.html). Note: You may
also set reference=self, in this case mothur will run unique.seqs and
check for chimeras using more abundant sequences as the reference.

## Options

### name

You can provide a name file to check for chimeras using more abundant
sequences as the reference.

    mothur > chimera.uchime(fasta=stool.trim.unique.good.align, name=stool.trim.good.names)

### group

If you are using reference=self and provide a groupfile, mothur will use
the more abundant sequences from the same sample to check the query
sequence.

    mothur > chimera.uchime(fasta=stool.trim.unique.good.align, name=stool.trim.good.names, group=stool.good.groups)

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. The count file can also contain group
information.

    mothur > make.table(name=stool.trim.good.names, group=stool.good.groups)
    mothur > chimera.uchime(fasta=stool.trim.unique.good.align, count=stool.trim.good.count_table)

### processors

The processors parameter allows you to specify how many processors you
would like to use. Default processors=Autodetect number of available
processors and use all available.

### dereplicate

The dereplicate parameter can be used when checking for chimeras by
group. If the dereplicate parameter is false, then if one group finds
the sequence to be chimeric, then all groups find it to be chimeric,
default=f. If you set dereplicate=t, and then run remove.seqs with
dups=f you can remove only the redundant chimeric sequences.

Let\'s look at an example:

    >seq1
    attgacat....
    >seq4
    ttgacaga....

    seq1 seq1,seq2,seq3
    seq4 seq4,seq5,seq6

    seq1 group1
    seq2 group2
    seq3 group3
    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=f and dups=t, (default settings in mothur), and seq2 is
found to be chimeric by group2. The results would be:

    >seq4
    ttgacaga....

    seq4 seq4,seq5,seq6

    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=t and dups=t, and seq2 is found to be chimeric by group2.
The results would be:

    >seq4
    ttgacaga....

    seq4 seq4,seq5,seq6

    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=t and dups=f, and seq2 is found to be chimeric by group2.
The results would be:

    >seq1
    attgacat....
    >seq4
    ttgacaga....

    seq1 seq1,seq3
    seq4 seq4,seq5,seq6

    seq1 group1
    seq3 group3
    seq4 group1
    seq5 group2
    seq6 group3

### abskew

The abskew parameter can only be used with template=self. Minimum
abundance skew. Default 1.9. Abundance skew is: min \[ abund(parent1),
abund(parent2) \] / abund(query).

### chimealns

The chimealns parameter allows you to indicate you would like a file
containing multiple alignments of query sequences to parents in human
readable format. Alignments show columns with differences that support
or contradict a chimeric model.

### minh

The minh parameter - mininum score to report chimera. Default 0.3.
Values from 0.1 to 5 might be reasonable. Lower values increase
sensitivity but may report more false positives. If you decrease xn you
may need to increase minh, and vice versa.

### mindiv

The mindiv parameter - minimum divergence ratio, default 0.5. Div ratio
is 100%% - %%identity between query sequence and the closest candidate
for being a parent. If you don\'t care about very close chimeras, then
you could increase mindiv to, say, 1.0 or 2.0, and also decrease minh,
say to 0.1, to increase sensitivity. How well this works will depend on
your data. Best is to tune parameters on a good benchmark.

### xn

The xn parameter - weight of a no vote. Default 8.0. Decreasing this
weight to around 3 or 4 may give better performance on denoised data.

### dn

The dn parameter - pseudo-count prior on number of no votes. Default

1\.4. Probably no good reason to change this unless you can retune to a
good benchmark for your data. Reasonable values are probably in the
range from 0.2 to 2.

### xa

The xa parameter - weight of an abstain vote. Default 1. So far, results
do not seem to be very sensitive to this parameter, but if you have a
good training set might be worth trying. Reasonable values might range
from 0.1 to 2.

### chunks

The chunks parameter is the number of chunks to extract from the query
sequence when searching for parents. Default 4.

### minchunk

The minchunk parameter is the minimum length of a chunk. Default 64.

### idsmoothwindow

The idsmoothwindow parameter is the length of id smoothing window.
Default 32.

### minsmoothid

The minsmoothid parameter - minimum factional identity over smoothed
window of candidate parent. Default 0.95.

### maxp

The maxp parameter - maximum number of candidate parents to consider.
Default 2. In tests so far, increasing maxp gives only a very small
improvement in sensivity but tends to increase the error rate quite a
bit.

### skipgaps

The skipgaps parameter controls how gapped columns affect counting of
diffs. If skipgaps is set to T, columns containing gaps do not found as
diffs. Default=T.

### skipgaps2

The skipgaps2 parameter controls how gapped columns affect counting of
diffs. If skipgaps2 is set to T, if column is immediately adjacent to a
column containing a gap, it is not counted as a diff. Default=T.

### minlen

The minlen parameter is the minimum unaligned sequence length. Defaults

10\. Applies to both query and reference sequences.

### maxlen

The maxlen parameter is the maximum unaligned sequence length. Defaults

10000\. Applies to both query and reference sequences.

### ucl

The ucl parameter - use local-X alignments. Default is global-X or
false. On tests so far, global-X is always better; this option is
retained because it just might work well on some future type of data.

### queryfract

The queryfract parameter - minimum fraction of the query sequence that
must be covered by a local-X alignment. Default 0.5. Applies only when
ucl is true.

### strand

## Revisions

-   1.22.0 Added group option
-   1.22.0 mothur now calls the uchime executable.
-   1.23.0 Paralellized for Windows.
-   1.23.0 Added column headings to .chimera file.
-   1.23.0 fixed bug with uchime executable location. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1379](https://forum.mothur.org/viewtopic.php?f=4&t=1379)
-   1.28.0 Added count parameter
-   1.28.0 Bug Fix - spaces in uchime path causing crash
-   1.29.0 Added dereplicate and strand parameters.
-   1.30.0 With count file and dereplicate=t will create a
    \*.pick.count\_table file.
-   1.30.0 - Bug Fix: dereplicate=t, remove.seqs(dups=f) was not
    removing all redundant chimeras.
-   1.32.1 Bug Fix: count table and dereplicate=t caused total=0 error
    message. - [https://forum.mothur.org/viewtopic.php?f=4&t=2620](https://forum.mothur.org/viewtopic.php?f=4&t=2620)
-   1.33.0 Improved work balance load between processors when processing
    by group.
-   1.36.0 Adds method tag to output files. -
    [https://forum.mothur.org/viewtopic.php?f=5&t=3636&p=10748#p10748](https://forum.mothur.org/viewtopic.php?f=5&t=3636&p=10748#p10748)
-   1.38.0 Error generated when filenames are too long for uchime
    program.
-   1.39.0 Fixes Windows multiple processors with groups crash.
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.


