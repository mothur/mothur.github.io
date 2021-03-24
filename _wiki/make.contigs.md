---
title: 'make.contigs'
tags: 'commands'
redirect_from: '/wiki/Make.contigs.html'
---
The **make.contigs** command reads a forward fastq file and a reverse fastq
file and outputs new fasta and report files.

## Default Settings

The **make.contigs** command parameters are file, ffastq, rfastq, ffasta,
rfasta, fqfile, rqfile, findex, rindex, oligos, format, tdiffs, bdiffs,
pdiffs, align, match, mismatch, gapopen, gapextend, insert, deltaq,
maxee, allfiles and processors.

    mothur > make.contigs(ffastq=test_1.fastq, rfastq=test_2.fastq)

or **(Mac and Linux only, not available for Windows)**

     mothur > make.contigs(ffastq=test_1.fastq.gz, rfastq=test_2.fastq.gz)

or

    mothur > make.contigs(file=combo.file)

or

    mothur > make.contigs(ffastq=forward.fastq, rfastq=reverse.fastq, findex=forwardIndex.fastq, rindex=reverseIndex.fastq)

or

    mothur > make.contigs(ffasta=test_1.fasta, rfasta=test_2.fasta, rqfile=test_1.qual, fqfile=test_1.qual)

This command will create a test\_1.contigs.trim.fasta,
test\_1.contigs.scrap.fasta, test\_1.trim.contigs.report and
test\_1.scrap.contigs.report file.

## Options

### file

The file parameter is 2, 3 or 4 column file containing the fastq files.
Tired of creating the file file? Let mothur help with the
[make.file](/wiki/make.file) command!

The 2 column format consists of the forward fastq file in the first
column and their matching reverse fastq files in the second column. This
type can be used with an oligos file create a group file for your
dataset.

    small.forward.fastq    small.reverse.fastq
    test.forward2.fastq    test.reverse2.fastq
    ...

The 3 column format is used for datasets where the sequences have
already had the barcodes and primers removed and been split into
separate files. The first column is the group, the second is the forward
fastq and the third column contains the reverse fastq.

    F8D0   F8D0_S345_L001_R1_001.fastq F8D0_S345_L001_R2_001.fastq
    F8D125 F8D125_S358_L001_R1_001.fastq   F8D125_S358_L001_R2_001.fastq
    F8D141 F8D141_S359_L001_R1_001.fastq   F8D141_S359_L001_R2_001.fastq
    F8D142 F8D142_S360_L001_R1_001.fastq   F8D142_S360_L001_R2_001.fastq
    F8D143 F8D143_S361_L001_R1_001.fastq   F8D143_S361_L001_R2_001.fastq
    F8D144 F8D144_S362_L001_R1_001.fastq   F8D144_S362_L001_R2_001.fastq
    F8D145 F8D145_S363_L001_R1_001.fastq   F8D145_S363_L001_R2_001.fastq
    F8D146 F8D146_S364_L001_R1_001.fastq   F8D146_S364_L001_R2_001.fastq
    F8D147 F8D147_S365_L001_R1_001.fastq   F8D147_S365_L001_R2_001.fastq
    F8D148 F8D148_S366_L001_R1_001.fastq   F8D148_S366_L001_R2_001.fastq
    F8D149 F8D149_S367_L001_R1_001.fastq   F8D149_S367_L001_R2_001.fastq
    F8D150 F8D150_S368_L001_R1_001.fastq   F8D150_S368_L001_R2_001.fastq
    ...

The 4 column format is for use with index files. The format is forward
fastq file then reverse fastq then forward index and reverse index file.
If you only have one index file add 'none' for the other one. Here's
an example with just a reverse index file:

    My.forward.fastq My.reverse.fastq none My.index.fastq

mothur will process each pair and create a combined fasta and report
file with all the sequences.

### ffastq & rfastq

The ffastq and rfastq parameters are used to provide a forward fastq and
reverse fastq file to process. If you provide one, you must provide the
other.

### ffasta & rfasta

The ffasta and rfasta parameters are used to provide a forward fasta and
reverse fasta file to process. If you provide one, you must provide the
other.

### fqfile & rqfile

The fqfile and rqfile parameters are used to provide a forward quality
and reverse quality files to process with the ffasta and rfasta
parameters. If you provide one, you must provide the other.

### findex & rindex

The findex and rindex parameters are used to provide a forward index and
reverse index files to process. If you use an index file, you must
provide an oligos file.

The index file is a fastq file containing barcodes for the reads. It
looks like:

    @M00704:50:000000000-A3G0K:1:1101:15777:1541 1:N:0:0
    NAGAGAGGATCT
    +
    #>>3A3A>CFFF
    @M00704:50:000000000-A3G0K:1:1101:15370:1541 1:N:0:0
    NAGAGAGGATCT
    +
    #>>ABCCCFFFF
    ...

### format

The format parameter is used to indicate whether your sequences are
sanger, solexa, illumina1.8+ or illumina, default=illumina1.8+.

### oligos

The oligos option takes a file that can contain the sequences of the
paired primers and barcodes and their sample identifier. Each line of
the oligos file can start with the key words "primer" and "barcode"
or it can start with a "\#" to tell mothur to ignore that line of the
oligos file. Here's an example:

    primer CCTACGGGAGGCAGCAG ATTACCGCGGCTGCTGG V3
    primer ATTAGAWACCCBDGTAGTCC    CCCGTCAATTCMTTTRAGT V5
    primer ACTYAAAKGAATTGACGGG ACRACACGAGCTGACGAC  V6
    BARCODE    ccaac   cactg   F01R2A
    BARCODE    ccaac   aacca   F01R2B
    BARCODE    ccaac   tgtca   F01R2C
    BARCODE    ccaac   aaacc   F01R2D
    ...

    mothur > make.contigs(ffastq=test_1.fastq, rfastq=test_2.fastq, oligos=test.oligos)

### bdiffs & pdiffs & tdiffs

These parameters are used to allow differences in the barcode and
primers. pdiffs is maximum number of differences to the primer sequence,
default=0. bdiffs is maximum number of differences to the barcode
sequence, default=0. tdiffs is maximum total number of differences to
the barcode and primer (default to pdiffs + bdiffs). To clarify, the
make.contigs command with pdiffs=2 sets the total allowed primer diffs
to 2. mothur will allow for a max of 2 diffs on the forward read and 2
diffs on the reverse read, but the total number of primer diffs cannot
exceed 2. This means if you have a read with 2 diffs on the forward and
2 diffs on the reverse, the total primer diffs are 4, and the read would
be scrapped.

### checkorient

If you are running the **make.contigs** command with paired barcodes or
primers, you can use the checkorient parameter. When checkorient=t and
mothur can't find the barcodes and primers, it will search the reverse
compliment. The default is true.

### oligos scrap code meanings

When you run mothur with an oligos file and the barcodes and or primers
are not found mothur will assign the read to the \*scrap file. mothur
includes scrap codes to indicate why the read failed. Let's look at an
example:

-   seqName \| failureCode(checkorientFailureCode) ee=expectedError
    fbdiffs=forwardBarcodeDiffs(forwardBarcodeResult),
    rbdiffs=reverseBarcodeDiffs(reverseBarcodeResult),
    fpdiffs=forwardPrimerDiffs(forwardPrimerResult),
    rpdiffs=reversePrimerDiffs(reversePrimerResult)

<!-- -->

-   failureCode and checkOrientFailureCode: b(barcode), f(primer),
    t(totalDiffs)
-   forwardBarcodeResult, reverseBarcodeResult, forwardPrimerResult,
    reversePrimerResult options: match, multipleMatches, noMatch,
    shortSeq.
    -   match - mothur found the barcode or primer. Alternatively, no
        barcode or primer.
    -   multipleMatches - more than one barcode or primer matches this
        read.
    -   noMatch - mothur did not find a barcode or primer that matches
        this read.
    -   shortSeq - the read is shorter than the barcode and primer, no
        match.

M00278\_49\_000000000-CPBKN\_1\_1108\_23033\_3567 \| b(b) ee=6.87543
fbdiffs=3(noMatch), rbdiffs=1001(noMatch) fpdiffs=0(match),
rpdiffs=0(match)

    fbdiffs=3(noMatch) - mothur found a barcode, but the number of diffs=3, bdiffs=1 so no match is found.
    rbdiffs=1001(noMatch) - 1001 indicates the reverse barcode was not searched for because the forward barcode was not found. (1000+bdiffs) = 1001 - no search and noMatch.
    fpdiffs=0(match) - perfect match to forward primer or no primers in oligos file.
    rpdiffs=0(match) - perfect match to reverse primer or no primers in oligos file.

### align

The align parameter allows you to specify the alignment method to use.
Your options are: gotoh and needleman. The default is needleman.

    mothur > make.contigs(ffastq=test_1.fastq, rfastq=test_2.fastq, align=gotoh)

### match & mismatch & gapopen & gapextend

These parameters are used while aligning the sequence read to determine
the overlap. The match parameter allows you to specify the bonus for
having the same base. The default is 1.0. The mistmatch parameter allows
you to specify the penalty for having different bases. The default is
-1.0. The gapopen parameter allows you to specify the penalty for
opening a gap in an alignment. The default is -2.0. The gapextend
parameter allows you to specify the penalty for extending a gap in an
alignment. The default is -1.0.

### insert

The insert parameter allows you to set a quality scores threshold. When
we are merging the overlapping regions, in the case where we are trying
to decide whether to keep a base or remove it because the base is
compared to a gap in the other fragment, if the base has a quality score
below the threshold we eliminate it. Default=20.

### deltaq

The deltaq parameter allows you to specify the delta allowed between
quality scores of a mismatched base. For example in the overlap, if
deltaq=5 and in the alignment seqA, pos 200 has a quality score of 30
and the same position in seqB has a quality score of 20, you take the
base from seqA (30-20 \>= 5). If the quality score in seqB is 28 then
the base in the consensus will be an N (30-28\<5) The default is 6.

### maxee

The maxee parameter allows you to specify the maximum number of errors
to allow in a sequence. Makes sense to use with deltaq=0. The expected
number of errors is based on Edgar's approach used in USEARCH/VSEARCH.

### allfiles

With the barcodes it is possible to sequence many different samples in a
single run. It may happen that some of these samples should not be
analyzed together for your analysis. To parse apart the sequences that
belong to each sample, use the allfiles option. This will generate a
fasta and groups file for each barcode defined in your oligos file:

### qfile

The qfile parameter is used to indicate you want a quality file
assembled. Default=false. NOTE: The assembled quality scores outputted
by mothur cannot be used for downstream quality screening. The score
calculations are modeled after pandseq's method. Here's a link to the
explanation from their documentation,
[https://github.com/neufeld/pandaseq#the-scores-of-the-output-bases-seem-really-low-whats-wrong](https://github.com/neufeld/pandaseq#the-scores-of-the-output-bases-seem-really-low-whats-wrong).

### trimoverlap

The trimoverlap parameter allows you to trim the sequences to only the
overlapping section. The default is F. Use this option if you have
2x300bp sequences that are longer than your amplicon.

### rename

Renames sequences to reduce file sizes and greatly reduce the size of
the column formatted distance matrix downstream. Uses the rename.seqs
command to rename which creates a map file so you can revert to original
names at any time. Default=F.

### processors

The processors parameter allows you to specify how many processors you
would like to use. Default processors=Autodetect number of available
processors and use all available.

### Assembled Quality Scores

The assembled quality scores outputted by mothur **cannot** be used for
downstream quality screening. The score calculations are modeled after
pandseq's method. Here's a link to the explanation from their
documentation,
[https://github.com/neufeld/pandaseq#the-scores-of-the-output-bases-seem-really-low-whats-wrong](https://github.com/neufeld/pandaseq#the-scores-of-the-output-bases-seem-really-low-whats-wrong).

## Revisions

-   1.26.0 - First Introduced
-   1.30.0 - Officially released
-   1.31.2 - Bug Fix: -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2451](https://forum.mothur.org/viewtopic.php?f=3&t=2451)
-   1.32.0 - Bug Fix: if file option is used with group provided, and
    one or more files contain less good reads than number of processors,
    group assignments were incorrect. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=2571&p=7025#p7025](https://forum.mothur.org/viewtopic.php?f=4&t=2571&p=7025#p7025)
-   1.32.0 - Added findex and rindex parameters. Modified file options
    to add 4 column option - ffastq rfastq findex rindex. May use NONE
    as option for findex and rindex. Modified oligos file option to
    allow none as option for paired barcodes for index files. BARCODE
    NONE GCTGATGAGCTG Group1 would indicate you have a reverse index
    file, but no forward index file.
-   1.34.0 - Added checkorient parameter. -
    [https://forum.mothur.org/viewtopic.php?f=3&t=2993](https://forum.mothur.org/viewtopic.php?f=3&t=2993).
-   1.36.0 - Bug Fix: when using index files in version 1.35 quality
    data was over trimmed by the length of the barcode.
-   1.36.0 - allow for missing reads in files.
-   1.36.0 - allow for gzipped version of fastq files as inputs. Mac and
    Linux only.
-   1.37.0 - Adds rename parameter.
    [\#132](https://github.com/mothur/mothur/issues/132)
-   1.37.0 - Bug Fix: File mismatch error with certain sequence name
    formats and multiple processors. Three column format gz file not
    producing group file.
-   1.37.0 - Bug Fix: Fixes name mismatch error for rare names and gives
    a slight speed boost.
    [\#167](https://github.com/mothur/mothur/issues/167)
-   1.38.0 - Removes indexFile requirement for using NONE option in
    oligos file.
-   1.38.0 - Skips blanks files and continues.
-   1.38.1 - Fixes filename expansion issue.
    [https://forum.mothur.org/viewtopic.php?f=3&t=5869&p=14857#p14857](https://forum.mothur.org/viewtopic.php?f=3&t=5869&p=14857#p14857)
-   1.39.0 - Fixes bug where mothur was not finding matches for sequence
    names "off by one character" in the name.
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.2 - Fixes \*contigs.report file append issue that resulted in
    reads missing from report.
-   1.40.5 - Fixes gz file read issues.
    [\#471](https://github.com/mothur/mothur/issues/471)
-   1.40.5 - Change to quality score calculation.
    [\#468](https://github.com/mothur/mothur/issues/468)
-   1.41.0 - Updates boost version to 1.68.0.
-   1.41.0 - Fixes group file issue with \*.gz files.
    [\#480](https://github.com/mothur/mothur/issues/480)
-   1.41.0 - Fixes group names appending issue.
    [https://forum.mothur.org/t/make-contigs-with-oligo-creating-new-names/3542](https://forum.mothur.org/t/make-contigs-with-oligo-creating-new-names/3542)
-   1.43.0 - Adds qfile option to make.contigs.
    [\#650](https://github.com/mothur/mothur/issues/650)
-   1.43.0 - Adds auto decompress feature to **make.contigs** if gz read
    fails. [\#634](https://github.com/mothur/mothur/issues/634)
-   1.43.0 - Windows users can now run **make.contigs** with \*.gz files.
-   1.44.0 - Improves mothur's checkorient option in make.contigs. Also
    sets checkorient=t by default.
-   1.45.0 Fixes bug with qfile option in make.contigs. [\#745](https://github.com/mothur/mothur/issues/745)

