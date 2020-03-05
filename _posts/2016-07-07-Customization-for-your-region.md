---
layout: post
title: "Customize your reference alignment for your favorite region"
author: "PD Schloss"
date: "July 7, 2016"
blurb: You threw caution to the wind and decided to sequence something other than the V4 region of the 16S rRNA gene. How do you pick the start and end coordinates when running pcr.seqs?
comments: true
---


One of the surprisingly unique aspects of the [mothur-based SOP](http://www.mothur.org/wiki/MiSeq_SOP) that I encourage people to follow for their MiSeq and previously their [454](http://www.mothur.org/wiki/454_SOP) and [Sanger](http://www.mothur.org/wiki/Esophageal_community_analysis) data was to use an alignment-based approach to analyze their 16S rRNA gene sequence data. I laid this out in a [commentary](http://www.schlosslab.org/assets/pdf/2013_schloss.pdf) responding to a misguided article that claimed otherwise. The basic points are that you need to insure that your alignment preserves positional homology across the sequences. In addition to resulting in better inter-sequence comparisons, this also makes sure that your sequences actually overlap with each other. When you sequence DNA to high depth, you realize that non-specific PCR products also get sequenced and need to be culled from the analysis.

To carry out these steps we align 16S rRNA gene sequence data against a reference alignment that is based on the SILVA alignment using the mothur [align.seqs](http://www.mothur.org/wiki/align.seqs) command. As I've pointed out elsewhere ([here](http://www.schlosslab.org/assets/pdf/2010_schloss_a.pdf) and [here](http://www.schlosslab.org/assets/pdf/2009_schloss_b.pdf)), this reference is the superior alignment and there are no excuses for using a different reference. The problem with the SILVA reference alignment is that it is 50,000 columns wide. Keep in mind that there are only about 1,500 nt in the 16S rRNA gene and we are only generating a few hundred bases of sequence data. Why all the extra columns? One explanation is that the developers wanted to make it so people compare all SSU rRNAs across the tree of life and the 18S rRNA gene is longer than the 16S rRNA gene. Also, some lineages (e.g. TM7) have introns. Also, we haven't sequenced everything so we can't anticipate where all of the insertions will be along the gene. To accommodate all of these contingencies the alignment has ballooned to 50,000 columns. If you removed every column from the reference than only had a gap character that provides the extra padding, the alignment would be a more reasonable few thousand columns wide. When we align a 250 nt sequence against a 50,000 column wide alignment, we get a ridiculously long aligned sequence. When you repeat this a few hundred thousand times for MiSeq data, you get a ridiculously large file. To circumvent this, we have encouraged people to use [pcr.seqs](http://www.mothur.org/wiki/pcr.seqs) to trim the reference alignment to the region of the gene that they actually sequenced. In the MiSeq SOP we provide the coordinates for doing this with the V4 region of the gene.

Despite my best efforts, not everyone has taken our [paper](http://www.schlosslab.org/assets/pdf/2013_kozich.pdf) developing a [MiSeq-based protocol](https://github.com/SchlossLab/MiSeq_WetLab_SOP) for sequencing the V4 region of the 16S rRNA gene seriously. Not a week goes by that I don't end up referring someone to [my rant](http://blog.mothur.org/2014/09/11/Why-such-a-large-distance-matrix/) on why you really don't want to deviate from this protocol. The [tl;dr](https://en.wikipedia.org/wiki/Wikipedia:Too_long;_didn%27t_read) is that unless your sequence reads fully overlap, you are going to get a wicked high error rate and all sorts of horrible problems. You really want to sequence the V4 region with paired 250 nt reads. Honest. This hasn't changed with the advent of the v3 chemistry that generates paired 300 nt reads; that just seems to make things worse. Whatever. You're stuck with the data you've got. Your PI screwed up. The previous post-doc or previous student in your lab thought they new best. Alternatively, you're working with a group that has been sequencing a specific region forever and they aren't interested in changing because they want to compare new data to data generated on a first generation 454 machine. Ok, enough snark. How do you figure out the coordinates for your region? I have purposely been obtuse on the forum about this question because I really think it's a mistake to use regions like the V4-V5 or V3-V4 regions for the above mentioned reasons. Let me be a little less obtuse and show you how I'd figure this out for the V3 region and you can adapt it accordingly for your region.

First things first, get your PCR primer sequences. I'll assume that to amplify the V3 region you used the `CCTACGGGAGGCAGCAG` AND `TTACCGCGGCKGCTGGCAC` primer pair. Let's take an *E. coli* 16S rRNA gene sequence. This will do...


    >E.coli
    ATTGAACGCTGGCGGCAGGCCTAACACATGCAAGTCGAACGGTAACAGGAAGCAGCTTGCTGCTTCGCTGACGAGT
	GGCGGACGGGTGAGTAATGTCTGGGAAGCTGCCTGATGGAGGGGGATAACTACTGGAAACGGTAGCTAATACCGCA
	TAATGTCGCAAGACCAAAGAGGGGGACCTTCGGGCCTCTTGCCATCGGATGTGCCCAGATGGGATTAGCTTGTTGG
	TGGGGTAACGGCTCACCAAGGCGACGATCCCTAGCTGGTCTGAGAGGATGACCAGCCACACTGGAACTGAGACACG
	GTCCAGACTCCTACGGGAGGCAGCAGTGGGGAATATTGCACAATGGGCGCAAGCCTGATGCAGCCATGCCGCGTGT
	ATGAAGAAGGCCTTCGGGTTGTAAAGTACTTTCAGCGGGGAGGAAGGGAGTAAAGTTAATACCTTTGCTCATTGAC
	GTTACCCGCAGAAGAAGCACCGGCTAACTCCGTGCCAGCAGCCGCGGTAATACGGAGGGTGCAAGCGTTAATCGGA
	ATTACTGGGCGTAAAGCGCACGCAGGCGGTTTGTTAAGTCAGATGTGAAATCCCCGGGCTCAACCTGGGAACTGCA
	TCTGATACTGGCAAGCTTGAGTCTCGTAGAGGGGGGTAGAATTCCAGGTGTAGCGGTGAAATGCGTAGAGATCTGG
	AGGAATACCGGTGGCGAAGGCGGCCCCCTGGACGAAGACTGACGCTCAGGTGCGAAAGCGTGGGGAGCAAACAGGA
	TTAGATACCCTGGTAGTCCACGCCGTAAACGATGTCGACTTGGAGGTTGTGCCCTTGAGGCGTGGCTTCCGGAGCT
	AACGCGTTAAGTCGACCGCCTGGGGAGTACGGCCGCAAGGTTAAAACTCAAATGAATTGACGGGGGCCCGCACAAG
	CGGTGGAGCATGTGGTTTAATTCGATGCAACGCGAAGAACCTTACCTGGTCTTGACATCCACGGAAGTTTTCAGAG
	ATGAGAATGTGCCTTCGGGAACCGTGAGACAGGTGCTGCATGGCTGTCGTCAGCTCGTGTTGTGAAATGTTGGGTT
	AAGTCCCGCAACGAGCGCAACCCTTATCCTTTGTTGCCAGCGGTCCGGCCGGGAACTCAAAGGAGACTGCCAGTGA
	TAAACTGGAGGAAGGTGGGGATGACGTCAAGTCATCATGGCCCTTACGACCAGGGCTACACACGTGCTACAATGGC
	GCATACAAAGAGAAGCGACCTCGCGAGAGCAAGCGGACCTCATAAAGTGCGTCGTAGTCCGGATTGGAGTCTGCAA
	CTCGACTCCATGAAGTCGGAATCGCTAGTAATCGTGGATCAGAATGCCACGGTGAATACGTTCCCGGGCCTTGTAC
	ACACCGCCCGTCACACCATGGGAGTGGGTTGCAAAAGAAGTAGGTAGCTTAACCTTCGGGAGGGCGCTTACCACTT
	TGTGATTCATGACTGGGGTG


Now we want to trim our sequence to start and end with our primer pair. Note that you'll need to get the reverse complement of the reverse primer sequence (i.e. `GTGCCAGCMGCCGCGGTAA`)


    >E.coli.v3
    CCTACGGGAGGCAGCAGTGGGGAATATTGCACAATGGGCGCAAGCCTGATGCAGCCATGCCGCGTGTATGAAGAAG
	GCCTTCGGGTTGTAAAGTACTTTCAGCGGGGAGGAAGGGAGTAAAGTTAATACCTTTGCTCATTGACGTTACCCGC
	AGAAGAAGCACCGGCTAACTCCGTGCCAGCAGCCGCGGTAA

Save the content of this gray box to a new file that we'll call `ecoli_v3.fasta`. Also, you should feel free to remove the primers themselves. I tend to leave them in for no real good reason. Alrighty, now you'll want to download the SILVA seed reference file. Put `ecoli_v3.fasta` and `silva.seed_v123.align` (available [here](http://www.mothur.org/wiki/Silva_reference_files)) in the same folder and align the former to the latter. Then run summary.seqs on `ecoli_v3.align`

    mothur > align.seqs(fasta=ecoli_v3.fasta, reference=silva.seed_v123.align)

    mothur > summary.seqs(fasta=ecoli_v3.align)

You'll see the output of `summary.seqs` indicates the starting position was 6388 and the end position was 13861. Viola. You know what these are? They're the coordinates you'll use in `pcr.seqs` to trim `silva.seed_v123.align` to the V3 region.

    mothur > pcr.seqs(fasta=silva.seed_v123.align, start=6388, end=13861, keepdots=FALSE)

Finally, rename `silva.seed_v123.pcr.fasta` to `silva.v3.align` and you're good to go.
