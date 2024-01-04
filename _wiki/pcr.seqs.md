---
title: 'pcr.seqs'
tags: 'commands'
redirect_from: '/wiki/Pcr.seqs.html'
---
The **pcr.seqs** will trim inputted sequences based
on a variety of user-defined options.

## Default Settings

The fasta parameter is required.

    mothur > pcr.seqs(fasta=silva.bacteria.fasta)

## Options

### oligos

The oligos file allows you to provide primer information.

    mothur > pcr.seqs(fasta=silva.bacteria.fasta, oligos=pcrTest.oligos)

### pdiffs

The pdiffs parameter is used to allow differences in the forward
primers. pdiffs is maximum number of differences to the forward primer
sequence, default=0.

### rdiffs

The rdiffs parameter is used to allow differences in the reverse
primers. rdiffs is maximum number of differences to the reverse primer
sequence, default=0.

### checkorient

The checkorient parameter will look for the reoriented and reverse compliment of the primers if the primers are not found. The default is true.

### name && group && count && taxonomy

If you apply **pcr.seqs** as we have in the previous sections and then
attempt to run any downstream commands that need a name, group and
taxonomy file, the files will be incompatible since those files will
still contain information for sequences that you culled. To get around
this you can use the group and name or count option:

    mothur > pcr.seqs(fasta=silva.bacteria.fasta, taxonomy=silva.bacteria.rdp.tax)

### ecoli

The ecoli parameter is used to provide a fasta file containing a single
reference sequence (e.g. for e. coli) this must be aligned. mothur will
trim to the start and end positions of the reference sequence.

### start && end

The start parameter allows you to provide a starting position to trim
to. The end parameter allows you to provide a ending position to trim
from.

    mothur > pcr.seqs(fasta=silva.bacteria.fasta, start=1044, end=6500)

### nomatch

The nomatch parameter allows you to decide what to do with sequences
where the primer is not found. Default=reject, meaning remove from fasta
file. if nomatch=keep, then do nothing to sequence.

### keepprimer

The keepprimer parameter allows you to keep the primer, default=false.
Note that even if keepprimer=FALSE, mothur will not remove primers if it
finds multiple potential matches to a given primer sequence.

### keepdots

The keepdots parameter allows you to keep the leading and trailing .'s,
default=true.

### processors

The processors parameter allows you to use multiple processors. Default
processors=Autodetect number of available processors and use all
available.

## Revisions

-   1.25.0 - First Introduced
-   1.28.0 - Added count option
-   1.29.2 - Bug Fix: If file was aligned and both forward and reverse
    primers were given, reverse primer was not trimmed properly.
-   1.30.0 - Added pdiffs parameter
-   1.30.2 - Bug Fix: For forward primer trimming with aligned sequences
    and keepdots=t. If the character before the first primer base was a
    base and not a gap the base was not trimmed.
    [https://forum.mothur.org/viewtopic.php?f=4&t=2209](https://forum.mothur.org/viewtopic.php?f=4&t=2209)
-   1.31.0 - Added primer to oligos types **pcr.seqs** can read.
-   1.31.0 - Bug Fix: removing primers from aligned sequences with
    keepdots=f could result in an unaligned dataset if primers were not
    found at the same locations. Added gaps to preserve alignment.
-   1.33.0 - Bug Fix: keepdots=f could cause an aligned template to
    become unaligned.
    [https://forum.mothur.org/viewtopic.php?f=3&t=2653&p=7354#p7354](https://forum.mothur.org/viewtopic.php?f=3&t=2653&p=7354#p7354)
-   1.38.0 - Adds rdiffs to allow for setting different diffs for the
    forward and reverse primers.
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.0 - Bug Fix: Trimming extra base when using the start and end
    parameters. [\#348](https://github.com/mothur/mothur/issues/348)
-   1.40.0 - Bug Fix: "name mismatch" error when using paired primers
    and keepdots=f.
-   1.40.4 - Bug Fix: **pcr.seqs** and screen.seqs (with no bad reads
    detected), causing accnos file issue.
-   1.41.0 - Bug Fix: Fixes **pcr.seqs** file mismatch.
    [\#522](https://github.com/mothur/mothur/issues/522)
-   1.42.0 - Bug Fix: Fixes file extensions of output files in pcr.seqs.
-   1.42.0 - Bug Fix: Fixes **pcr.seqs** end issue with keepdots=f.
-   1.46.0 - Adds checkorient parameter. Change Includes functions to reorient and reverse unpaired primers. [\#768](https://github.com/mothur/mothur/issues/768)
-   1.47.0 - Fixes bug with pcr.seqs If keepdots=f, and start and end are used, then first base was removed by mistake.

