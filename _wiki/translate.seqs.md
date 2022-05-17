---
title: 'translate.seqs'
tags: 'commands'
---
The **translate.seqs** command reads a fastafile containing dna and translates it to amino acids. 
Alternatively, you can provide an amino file with aligned amino acids and fasta file with unaligned dna 
sequences and mothur will align the dna to the amino acid. Mothur expects the aligned amino acids and the 
fasta file to contain the same sequence names.


## fasta 

The fasta parameter is used to provide a file containing DNA sequences. It is required.

    mothur > translate.seqs(fasta=final.fasta)


## amino

The amino parameter is used to provide a file related to the fasta file containing amino acid sequences. 
The amino file should be aligned and mothur will align the DNA reads to the amino acids. 
Mothur assumes both files are in the same frame.

     mothur > translate.seqs(fasta=final.fasta, amino=final.aligned.amino)

## frames

The frames parameter is used to indicate the reading frames you want to use. Options are 1, 2, 3, -1, -2, -3. 
You can select multiple frames by separating them with '|' characters. 

    mothur > translate.seqs(fasta=final.fasta, frames=1|-1|2)

## stop

The stop parameter is used to indicate when to stop the translation. If T, then if the translation
hits a stop codon, it stops before that codon. If F, it returns the full translation with a * as the stop codon. 
Default=t.

    mothur > translate.seqs(fasta=final.fasta, stop=false)

## processors

The processors parameter allows you to specify how many processors you would like to use.  The default is all available.


## Revisions

-   1.48.0 Initially introduced
