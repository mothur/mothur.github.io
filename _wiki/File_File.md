---
title: 'File File'
---
The File file is 2, 3 or 4 column file containing the fastq files. Tired
of creating the file file? Let mothur help with the
[make.file](make.file) command!

The 2 column format consists of the forward fastq file in the first
column and their matching reverse fastq files in the second column. This
type can be used with an oligos file create a group file for your
dataset.

    small.forward.fastq    small.reverse.fastq
    test.forward2.fastq    test.reverse2.fastq

\... The 3 column format is used for datasets where the sequences have
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

\... The 4 column format is for use with index files. The format is
forward fastq file then reverse fastq then forward index and reverse
index file. If you only have one index file add \'none\' for the other
one. Here\'s an example with just a reverse index file:

    My.forward.fastq My.reverse.fastq none My.index.fastq

Mothur will process each pair and create a combined fasta and report
file with all the sequences.

Note: You can add comments to the file file, or ignore files by adding a
\'\#\' to the beginning of the line.

    #My sample comment ...
    F8D0   F8D0_S345_L001_R1_001.fastq F8D0_S345_L001_R2_001.fastq
    #F8D125    F8D125_S358_L001_R1_001.fastq   F8D125_S358_L001_R2_001.fastq - ignore F8D125 sample
    F8D141 F8D141_S359_L001_R1_001.fastq   F8D141_S359_L001_R2_001.fastq
    F8D142 F8D142_S360_L001_R1_001.fastq   F8D142_S360_L001_R2_001.fastq
