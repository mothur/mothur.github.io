---
title: 'chop.seqs'
tags: 'commands'
redirect_from: '/wiki/Chop.seqs.html'
---
The **chop.seqs** command reads a fasta file and outputs a .chop.fasta
containing the trimmed sequences. It works on both aligned and unaligned
sequences.


## Default settings

The **chop.seqs** command parameters are fasta, fastq, name, group, count,
numbases, countgaps and keep. fasta or fastq is required unless you have a valid
current file. numbases is also required.

    mothur > chop.seqs(fasta=abrecovery.fasta, numbases=100)
    
or

    mothur > chop.seqs(fastq=test.fastq, numbases=100)

## Options

### qfile

The qfile option to allows for chopping quality files associated with
your fasta file.

    mothur > chop.seqs(fasta=abrecovery.fasta, qfile=abrecovery.qual, numbases=100)

### numbases

The numbases parameter is required, and indicates the number of bases
you want to keep.

### keep

The keep parameter is set to front by default, meaning you want to keep
the front of the sequence. You can also set keep to back.

Here's what abrecovery.fasta looks like before the **chop.seqs** command:

    >AY457915
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGC
    ATTTAAGACAGATTACTTCGGTTTGAAGTCTTTTATGACTGAGTGGCGGACGGGTGAGTAACGCGTGGGT
    AACCTGCCTCATACAGGGGGATAGCAGCTGGAAACGGCTGGTAATACCGCATAAGCGCACAGTACCACAT
    GGTACAGTGTGAAAAACTCCGGTGGTATGAGATGGACCCGCGTCTGATTAGCTTGTTGGCGGGGTAACGG
    CCCACCAAGGCGACGATCAGTAGCCGACCTGAGAGGGTGACCGGCCACATTGGGACTGAGACACGGCCCA
    GACTCCTACGGGAGGCAGCAGTGGGGAATATTGCACAATGGAGGAAACTCTGATGCAGCGACGCCGCGTG
    AGTGAAGAAGTAGTTCGCTATGTAAAGCTCTATCAGCAGGGAAGATAGAGACGGTACCTGACTAAGAAGC
    TCCGGCAAATC

    >AY457914
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGC
    ATTTAGAACAGATTACTTCGGTTTGAAGTTCTTTATGACTGAGTGGCGGACGGGTGAGTAACGCGTGGGT
    AACCTGCCTTGTACTGGGGGATAGCAGCTGGAAACGGCTGGTAATACCGCATAAGCGCACAATGTTGCAT
    GACATGGTGTGAAAAACTCCGGTGGTATAAGATGGACCCGCGTCTGATTAGCTAGTTGGTGAGATAACAG
    CCCACCAAGGCGACGATCAGTAGCCGACCTGAGAGGGTGACCGGCCACATTGGGACTGAGACACGGCCCA
    GACTCCTACGGGAGGCAGCAGTGGGGAATATTGCACAATGGAGGAAACTCTGATGCAGCGACGCCGCGTG
    AGTGAAGAAGTAATTCGTTATGTAAAGCTCTATCAGCAGGGAAGATAGAGACGGTACCTAACTAAGAAGC
    TCCGGCTAA

    >AY457913
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGC
    ACTTTTACAGATTTCTTCGGAATGAAGTTTTAGTGACTGAGTGGCGGACGGGTGAGTAACGCGTGGGTAA
    CCTGCCTCACACAGGGGGATAACAGTTGGAAACGGCTGCTAATACCGCATAAGCGCACAGTACCGCATGG
    TACAGTGTGAAAAACTCCGGTGGTGTGAGATGGACCCGCGTCTGATTAGCTAGTTGGCAGGGTAACGGCC
    TACCAAGGCGACGATCAGTAGCCGACCTGAGAGGGTGACCGGCCACATTGGGACTGAGACACGGCCCAAA
    CTCCTACGGGAGGCAGCAGTGGGGAATATTGCACAATGGGGGAAACCCTGATGCAGCGACGCCGCGTGAG
    CGAAGAAGTATTTCGGTATGTAAAGCTCTATCAGCAGGGAAGAAGAAATGACGGTACCTGACTAAGAAGC
    ACCGGCAAATCTG

    >AY457912
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGC
    ATTTGCGACAGATTTCTTCGGATTGAAGTTGCTTATGACTGAGTGGCGGACGGGTGAGTAACGCGTGGGT
    AACCTGCCTCACACAGGGGGATAGCAGTTGGAAACGGCTGATAATACCGCATAAGCGCACAGTACCGCAT
    GGTACAGTGTGAAAAACTCCGGTGGTGTGAGATGGACCCGCGTCTGATTAGCTTGTTGGCAGGGTAACGG
    CCTACCAAGGCAACGATCAGTAGCCGACCTGAGAGGGTGACCGGCCACATTGGGACTGAGACACGGCCCA
    GACTCCTACGGGAGGCAGCAGTGGGGAATATTGCACAATGGAGGAAACTCTGATGCAGCGACGCCGCGTG
    AGTGAAGAAGTAATTCGTTATGTAAAGCTCTATCAGCAGGGAAGATAGTGACGGTACCTGACTAAGAAGC
    TCCGGCTAATCGT

Here's what abrecovery.chop.fasta looks like after running:

     mothur > chop.seqs(fasta=abrecovery.fasta, numbases=100, keep=front)

    >AY457915
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGCATTTAAGACAGATTACTTCGGTTTGAAGT
    >AY457914
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGCATTTAGAACAGATTACTTCGGTTTGAAGT
    >AY457913
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGCACTTTTACAGATTTCTTCGGAATGAAGTT
    >AY457912
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGCATTTGCGACAGATTTCTTCGGATTGAAGT

Here's what abrecovery.chop.fasta looks like after running:

     mothur > chop.seqs(fasta=abrecovery.fasta, numbases=100, keep=back)

    >AY457915
    ATGCAGCGACGCCGCGTGAGTGAAGAAGTAGTTCGCTATGTAAAGCTCTATCAGCAGGGAAGATAGAGACGGTACCTGACTAAGAAGCTCCGGCAAATC
    >AY457914
    TGATGCAGCGACGCCGCGTGAGTGAAGAAGTAATTCGTTATGTAAAGCTCTATCAGCAGGGAAGATAGAGACGGTACCTAACTAAGAAGCTCCGGCTAA
    >AY457913
    AGCGACGCCGCGTGAGCGAAGAAGTATTTCGGTATGTAAAGCTCTATCAGCAGGGAAGAAGAAATGACGGTACCTGACTAAGAAGCACCGGCAAATCTG
    >AY457912
    GCAGCGACGCCGCGTGAGTGAAGAAGTAATTCGTTATGTAAAGCTCTATCAGCAGGGAAGATAGTGACGGTACCTGACTAAGAAGCTCCGGCTAATCGT

### countgaps

The countgaps parameter allows you to specify whether you want to count
gaps as bases, default=false.

### short

The short parameter allows you to specify you want to keep sequences
that are too short to chop, default=false.

    mothur > chop.seqs(fasta=abrecovery.fasta, numbases=1000, short=T)

### processors

The processors option enables you to accelerate the chopping process by
using multiple processors. Default processors=Autodetect number of
available processors and use all available. You are able to 2 processors
with the following option:

    mothur > chop.seqs(fasta=abrecovery.fasta, numbases=1000, processors=2)

### name && group && count

If you provide a name, group or count file any sequences removed from
the fasta file will also be removed from those files.

### format

The format parameter is used to indicate whether your sequences are sanger, solexa, illumina1.8+ or illumina, default=illumina1.8+.

## Revisions

-   1.23.0 - fixed an off by one error - if you put numbases=200 the
    sequence come out as 199 bases.
-   1.27.0 - added processors option.
-   1.31.0 - added name, group and count options.
-   1.36.0 - adds qfile option to allows for chopping quality files.
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.47.0 Adds fastq and format parameters to chop.seqs  [\#790](https://github.com/mothur/mothur/issues/790) 

