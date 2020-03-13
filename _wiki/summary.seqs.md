---
title: 'summary.seqs'
tags: 'commands'
redirect_from: '/wiki/Summary.seqs.html'
---
The **summary.seqs** command will summarize the
quality of sequences in an unaligned or aligned fasta-formatted sequence
file.


## Default Setting

Fasta is the only required parameter:

    mothur > summary.seqs(fasta=amazon.fasta)


           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   422 422 0   4   1
    2.5%-tile: 1   436 436 0   4   3
    25%-tile:  1   507 507 1   5   25
    Median:    1   530 530 3   5   50
    75%-tile:  1   961 961 6   6   74
    97.5%-tile:    1   973 973 15  8   96
    Maximum:   1   978 978 20  9   98
    Mean:  1   678.235 678.235 4.54082 5.44898
    # of Seqs: 98

For this unaligned fasta file, we see that all of the sequences started
at position 1 (they\'re unaligned) and had between 422 and 978 bases in
them. The median length was 530 bases. We can also see that more than
75% of the sequences had at least one ambiguous base in them and at
least one had 20. The final column indicates the length of the longest
homopolymer in each sequence - 95% of the sequences had a homopolymer
length between 4 and 8 bases long.

An output file (e.g. amazon.fasta.summary) lists each of these
parameters for each sequence. For example:

    seqname    start   end nbases  ambigs  polymer numSeqs
    U68589 1   943 943 10  5     1
    U68590 1   497 497 0   6     1
    U68591 1   930 930 1   4     1
    ...

So we see that sequence U68589 was 943 bases long, had 10 ambiguous
bases in it and the longest homopolymer in the sequence was 5 bases
long. The numSeqs column is 1 because no name file was provided so we
assume this sequence is unique.

If we had instead analyzed an aligned sequence file such as the
greengenes [alignment database](alignment_database):

    mothur > summary.seqs(fasta=core_set_aligned.imputed.fasta)

           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   69  6849    1423    0   4   1
    2.5%-tile: 97  6849    1469    0   5   124
    25%-tile:  109 6849    1507    0   5   1235
    Median:    109 6849    1524    0   6   2470
    75%-tile:  109 6849    1538    0   6   3704
    97.5%-tile:    109 6857    1563    3   8   4815
    Maximum:   109 6885    1609    30  11  4938
    Mean:  107.857 6849.47 1521.43 0.222155    5.67294
    # of Seqs: 4938

Now we see that all of the sequences are at least 1,423 bases long, very
few have any ambiguous bases and most sequences start by position 109
and end by position 6,849. These data can be useful for removing
sequences that don\'t overlap or that have features indicating poor
quality using the [screen.seqs](screen.seqs) command.

## name

You can also use a name file with the **summary.seqs** command.

    mothur > summary.seqs(fasta=stool.unique.fasta)

           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   183 183 0   3   1
    2.5%-tile: 1   242 242 0   4   507
    25%-tile:  1   258 258 0   5   5061
    Median:    1   267 267 0   5   10121
    75%-tile:  1   274 274 0   5   15181
    97.5%-tile:    1   287 287 0   6   19735
    Maximum:   1   373 373 0   6   20241
    Mean:  1   265.647 265.647 0   4.9541
    # of Seqs: 20241

or

    mothur > summary.seqs(fasta=stool.unique.fasta, name=stool.names)

           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   183 183 0   3   1
    2.5%-tile: 1   243 243 0   4   929
    25%-tile:  1   259 259 0   5   9282
    Median:    1   267 267 0   5   18564
    75%-tile:  1   274 274 0   5   27845
    97.5%-tile:    1   287 287 0   6   36198
    Maximum:   1   373 373 0   6   37126
    Mean:  1   265.768 265.768 0   4.96205
    # of unique seqs:  20241
    total # of seqs:   37126

## count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence.

    mothur > summary.seqs(fasta=stool.unique.fasta, count=stool.count_table)

## summary && contigsreport && alignreport

The summary parameter allows you to provide a \*.summary file as an
input file.

    mothur > summary.seqs(summary=stability.trim.contigs.good.unique.good.summary)

           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1250    11550   250 0   3   1
    2.5%-tile: 1968    11550   252 0   4   4711
    25%-tile:  1968    11550   252 0   4   47109
    Median:    1968    11550   252 0   4   94218
    75%-tile:  1968    11550   253 0   5   141326
    97.5%-tile:    1968    11550   253 0   6   183724
    Maximum:   1968    13383   259 0   8   188434
    Mean:  1967    11550   252 0   4
    # of unique seqs:  20336
    total # of seqs:   188434

The contigsreport parameter allows you to provide the \*contigs.report
file as input.

    mothur > summary.seqs(contigsreport=stability.contigs.report)

           Length  Overlap_Length  Overlap_Start   Overlap_End MisMatches  Num_Ns  NumSeqs
    Minimum:   246 0   0   83  0   0   1
    2.5%-tile: 252 248 1   251 0   0   5699
    25%-tile:  252 249 1   251 0   0   56989
    Median:    252 249 2   251 2   0   113978
    75%-tile:  253 250 2   251 7   0   170967
    97.5%-tile:    253 250 3   252 31  7   222257
    Maximum:   501 254 251 263 124 238 227955
    Mean:  252 248 2   251 5   0
    # of Seqs: 227955

The align report parameter allows you to provide an align.report file as
input.

    mothur > summary.seqs(alignreport=stability.MISeq_SOP.trim.contigs.good.unique.align.report)

           Length  SimBtwnQueryTemplate    LongestInsert   SearchScore NumSeqs
    Minimum:   250 70  0   12  1
    2.5%-tile: 252 86  0   48  411
    25%-tile:  252 92  0   63  4107
    Median:    253 94  0   71  8214
    75%-tile:  253 97  0   87  12320
    97.5%-tile:    254 99  0   96  16016
    Maximum:   270 100 3   100 16426
    Mean:  252 94  0   74
    # of Seqs: 16426

## processors

The processors option enables you to accelerate the summary process by
using multiple processors. Default processors=Autodetect number of
available processors and use all available. You can use 2 processors
with the following option:

    mothur > summary.seqs(fasta=stool.unique.fasta, name=stool.names, processors=2)

## Revisions

-   1.22.0 - Added processors option for Windows users.
-   1.22.0 - Added NumSeqs and mean values to output.
-   1.28.0 - Added count option
-   1.31.0 - Bug Fix: 32bit machines processing a file larger than 4G
    could hang
-   1.39.1 - Adds file mismatch check
-   1.40.0 - Adds summary, contigsreport, alignreport parameters.
    [\#319](https://github.com/mothur/mothur/issues/319)
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.42.0 Removes extra space from output file names.
    [\#603](https://github.com/mothur/mothur/issues/603)


