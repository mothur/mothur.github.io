---
title: 'Chimera.perseus'
---
The **chimera.perseus** command reads a fasta and name file, and outputs
potentially chimeric sequences.


## Default Settings

The fasta and name or [ count](Count_File) parameters are
required.

    mothur > chimera.perseus(fasta=stool.trim.unique.good.filter.unique.precluster.fasta, name=stool.trim.unique.good.filter.unique.precluster.names)

or

    mothur > chimera.perseus(fasta=stool.trim.unique.good.filter.unique.precluster.fasta, count=stool.trim.unique.good.filter.unique.precluster.count_table)

The output to the screen should look like:

    Checking sequences from /Users/SarahsWork/Desktop/release/stool.trim.unique.good.filter.unique.precluster.fasta ...
    Processing sequence: 100
    Processing sequence: 200
    Processing sequence: 300
    Processing sequence: 400
    ...

Output in
stool.trim.unique.good.filter.unique.precluster.perseus.chimeras:

    SequenceIndex  Name    DiffsToBestMatch    BestMatchIndex  BestMatchName   DiffstToChimera IndexofLeftParent   IndexOfRightParent  NameOfLeftParent    NameOfRightParent   DistanceToBestMatch cIndex  (cIndex - singleDist)   loonIndex   MismatchesToChimera MismatchToTrimera   ChimeraBreakPoint   LogisticProbability TypeOfSequence
    0  F21Fcsw_12128   0   0   Null    0   0   0   Null    Null    0.0 0.0 0.0 0   0   0   0.0 0.0 good
    1  F11Fcsw_6529    0   0   Null    0   0   0   Null    Null    0.0 0.0 0.0 0   0   0   0.0 0.0 good
    2  F11Fcsw_112161  0   0   Null    0   0   0   Null    Null    0.0 0.0 0.0 0   0   0   0.0 0.0 good
    3  F21Fcsw_11639   40  0   F21Fcsw_12128   37  1   0   F11Fcsw_6529    F21Fcsw_12128   2.0468  1.93577 -0.111032   6.404   37  2147483647  55  0   good
    4  F31Fcsw_127820  21  1   F11Fcsw_6529    20  1   0   F11Fcsw_6529    F21Fcsw_12128   1.07821 1.06372 -0.0144896  5.24698 20  2147483647  55  0   good
    5  F11Fcsw_56988   12  1   F11Fcsw_6529    12  0   1   F21Fcsw_12128   F11Fcsw_6529    0.681584    0.681584    0   0.186912    12  2147483647  0   0   good
    6  F21Fcsw_22694   39  1   F11Fcsw_6529    36  1   0   F11Fcsw_6529    F21Fcsw_12128   2.03523 1.91816 -0.117074   7.44773 36  2147483647  55  0   good
    7  M11Fcsw_34015   25  1   F11Fcsw_6529    23  2   1   F11Fcsw_112161  F11Fcsw_6529    1.37518 1.26758 -0.107599   4.60899 23  21  15  0   good
    8  F21Fcsw_85352   13  2   F11Fcsw_112161  12  1   2   F11Fcsw_6529    F11Fcsw_112161  0.739483    0.4676  -0.271884   14.2579 12  8   45  0   good
    9  F11Fcsw_63768   53  2   F11Fcsw_112161  52  2   2   F11Fcsw_112161  F11Fcsw_112161  2.8013  2.79471 -0.00658628 0   52  50  28  0   good
    10 F11Fcsw_46282   61  0   F21Fcsw_12128   58  0   2   F21Fcsw_12128   F11Fcsw_112161  3.33036 3.19547 -0.13489    8.87805 58  57  46  0   good
    ...

## Options

### group

If you provide a [ groupfile](Group_file) or a [
countfile](Count_File) that contains group information,
mothur will process each sample individually and then combine the
results.

    mothur > chimera.perseus(fasta=stool.trim.unique.good.filter.unique.precluster.fasta, name=stool.trim.unique.good.filter.unique.precluster.names, group=stool.good.groups)

### processsors

The processors parameter allows you to specify how many processors you
would like to use. Default processors=Autodetect number of available
processors and use all available.

### alpha

The alpha parameter \... The default is -5.54.

### beta

The beta parameter \... The default is 0.33.

### cutoff

The cutoff parameter \... The default is 0.50.

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

## Revisions

-   1.23.0 - First Introduced.
-   1.28.0 - added count parameter
-   1.29.0 - added dereplicate parameter
-   1.29.0 - Bug Fix:
    [https://forum.mothur.org/viewtopic.php?f=3&t=1656](https://forum.mothur.org/viewtopic.php?f=3&t=1656) - ignore N\'s
-   1.30.0 - with count file and dereplicate=t will create a
    \*.pick.count\_table file.
-   1.30.0 - Bug Fix: dereplicate=t, remove.seqs(dups=f) was not
    removing all redundant chimeras.
-   1.32.1 - Bug Fix: count table and dereplicate=t caused total=0 error
    message. - [https://forum.mothur.org/viewtopic.php?f=4&t=2620](https://forum.mothur.org/viewtopic.php?f=4&t=2620)
-   1.33.0 - Improved work balance load between processors when
    processing by group.
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.

[Category:Commands](Category:Commands)
