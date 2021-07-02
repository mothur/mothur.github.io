---
title: 'Dereplicate parameter example'
---

This page includes a short example to highlight the dereplicate parameter used by several of mothur's chimera command. 

The dereplicate parameter can be used when checking for chimeras by group. When the dereplicate parameter is false, if one group finds the sequence to be chimeric, then all groups find it to be chimeric, default=f. If you set dereplicate=t, and then when a sequence is found to be chimeric it is removed from it’s group, not the entire dataset.

**Note: When you set dereplicate=t, mothur generates a new count table with the chimeras removed and counts adjusted by sample.**

Let's look at a small example. Lets assume that seq1 and seq5 are flagged as chimeric in group2, seq1 is chimeric in group1, seq8 is chimeric in group3.

    small.fasta file (original):
    
    >seq1
    ……
    >seq4
    …….
    >seq5
    …….
    >seq8
    …….
    
    small.count_table file (original):
    
    Representative_Sequence	total	group1	group2	group3
    Seq1	25	15	10	0
    Seq4	10	5	3	2
    Seq5	15	0	7	8
    Seq8	20	10	5	5


    mothur > chimera.vsearch(fasta=small.fasta, count=small.count_table, dereplicate=f)

When derepilcate=f, no modified count file is created. The accnos file will contain seq1, seq5, and seq8. Next you will run the remove.seqs command WITH the count and fasta files

    mothur > remove.seqs(fasta=small.fasta, count=small.count_table, accnos=current)

and the resulting files will look like:

    Fasta file (derepilcate=f, remove.seqs with count file):

    >seq8
    …….

    Count file:

    Representative_Sequence	total	group1	group2	group3
    Seq4	10	5	3	2

When derepilcate=t, mothur creates a modified count file. The accnos file will contain seq1, the only read where all samples found seq1 to be chimeric. You will run the remove.seqs command with ONLY the fasta file because the chimeras were already removed.

    mothur > remove.seqs(fasta=small.fasta, accnos=current)

and the resulting files will look like:

    Fasta file (dereplicate=t, remove.seqs WITHOUT count file):

    >seq4
    …….
    >seq5
    …….
    >seq8
    …….

    Count file (modified -> dereplicate=t, created by chimera command):

    Representative_Sequence	total	group1	group2	group3
    Seq4	10	5	3	2
    Seq5	8	0	0	8
    Seq8	15	10	5	0

You can see dereplicate=t is a much more conservative approach to chimera removal, and the method we recommend.

## One common mistake when using the dereplicate=t parameter and the remove.seqs command that may result in unintended results:

Using the original fasta and count file in the remove.seqs command. Consider the results from the example above:

As above, lets assume that seq1 and seq5 are flagged as chimeric in group2, seq1 is chimeric in group1, seq8 is chimeric in group3. The accnos file will contain seq1, the only read where all samples found seq1 to be chimeric. 

Running remove.seqs with the original count file

    mothur > remove.seqs(fasta=small.fasta, small.count_table, accnos=current)

results in this:

    Fasta file (original):

    seq4
    …….
    seq5
    …….
    seq8
    …….

    Count file (after remove.seqs):

    Representative_Sequence	total	group1	group2	group3
    Seq4	10	5	3	2
    Seq5	15	0	7	8
    Seq8	20	10	5	5

Instead of 

    Count file (modified -> dereplicate=t, created by chimera command):

    Representative_Sequence	total	group1	group2	group3
    Seq4	10	5	3	2
    Seq5	8	0	0	8
    Seq8	15	10	5	0

As you can see, the sequences flagged as chimeric in some samples, but not all samples, are not removed from the dataset. This results in a falsely inflated number of good reads, 45 instead of 33.



