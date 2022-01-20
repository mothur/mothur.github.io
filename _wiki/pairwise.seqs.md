---
title: 'pairwise.seqs'
tags: 'commands'
redirect_from: '/wiki/Pairwise.seqs.html'
---
The **pairwise.seqs** command will calculate
uncorrected pairwise distances between sequences. The command will
generate a [column-formatted distance
matrix](/wiki/column-formatted_distance_matrix) that is compatible
with the [cluster](/wiki/cluster) command. The command is also able
to generate a phylip-formatted distance matrix. There are several
options for how to handle gap comparisons and terminal gaps. This
tutorial uses the data files in [
AmazonData.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip).


## Default settings

To run **pairwise.seqs** an file must be provided in fasta format. By
default, the sequences are aligned to each other using the needleman
alignment method with match, mismatch, gapopen and gapextend set to 1.0,
-1.0, -2.0, -1.0, respectively. A gap is only penalized once, terminal
gaps are penalized, all distances are calculated, and only one processor
is used.

    mothur > pairwise.seqs(fasta=amazon.fasta)

By default, **pairwise.seqs** will only count a string of gaps as a single
gap and will penalize for terminal gaps

## Options

### calc

mothur has several ways of calculating a distance based on how gaps are
treated. First, the default option - onegap - only counts a string of
gaps as a single gap. For example:

    SequenceA  ATGCATGCATGC
    SequenceB  ACGC---CATCC

Would have two mismatches and one gap. The length of the shorter
sequence is 10 nt, since the gap is considered as a single position.
Therefore the distance would be 3/10 or 0.30. This is the distance
calculating method employed by Sogin et al. (1995). The logic behind
this type of penalty is that a gap represents an insertion and it is
likely that a gap of any length represents a single insertion. This can
be called within mothur by the command:

    mothur > pairwise.seqs(fasta=amazon.fasta, calc=onegap)

DNADIST actually ignores gaps. For example the two sequences above would
have a distance of 2/9 or 0.2222. This type of distance calculation does
not make much sense for sequences that are known to have a significant
number of insertions. This can be used in mothur using the nogaps
option. mothur can use this distance calculating method with the
command:

    mothur > pairwise.seqs(fasta=amazon.fasta, calc=nogaps)

A final option is to penalize each gap. For the two sequences above, the
distance would be 5/12 or 0.4167. This can be used in mothur using the
eachgap option. mothur can use this distance calculating method with the
command:

    mothur > pairwise.seqs(fasta=amazon.fasta, calc=eachgap)

### countends

There is some discussion over whether to penalize gaps that occur at the
end of sequences. For example, consider the following sequences:

    Sequence1 ATGCATGCATGC
    Sequence2 ---CAAGTA---

If terminal gaps are penalized, as is the default (and we are using the
calc=onegap option), then the distance would be 4/8 or 0.5000. If they
are not penalized, then the distance would be 2/6 or 0.3333. Ideally,
all sequences would be aligned over the same region; however, if this is
not possible or desired for some reason the ends option can be employed
to tell mothur to ignore the penalization:

    mothur > pairwise.seqs(fasta=amazon.fasta, countends=F)

The default is for countends to equal T.

### cutoff

If you know that you are not going to form OTUs with distances larger
than 0.10, you can tell mothur to not save any distances larger than

0\.10. This will significantly cut down on the amount of hard drive space
required to store the matrix. This can be done as follows:

    mothur > pairwise.seqs(fasta=amazon.fasta, cutoff=0.10)

Without setting cutoff to 0.10 this command would have generated 4560
distances (i.e. 96x95/2 = 4560). With the cutoff only 56 distances are
saved. The savings can be substantial when there are a large number of
distances. The actual cutoff used by the command is 0.005 higher than
the value that is set to allow for rounding in the [ clustering
steps](/wiki/cluster#precision).

### kmercutoff
The kmercutoff parameter allows you to specify maximum kmer distance. The kmercutoff is used to reduce the processing time by avoiding the aligning and distance calculations for sequences with a kmer distance above the cutoff. Kmer distance are calculated using methods described here, Edgar, R. C. (2004). Muscle: a multiple sequence alignment method with reduced time and space complexity. BMC Bioinformatics, 5:113. The defaults vary based on the cutoff selected. 
Cutoff <= 0.05 -> kmerCutoff = -1.0, cutoff 0.05 - 0.15 -> kmerCutoff = -0.50, cutoff 0.15-0.25 -> kmerCutoff = -0.25, cutoff > 0.25 -> kmerCutoff = -0.10.

### ksize
The ksize parameter allows you to specify the kmer size for calculating the kmer distance.  The default is 7.

### processors

The processors option will allow you to multiple processors to calculate
a distance matrix. Default processors=Autodetect number of available
processors and use all available. Multiple processors can be called as
follows:

    mothur > pairwise.seqs(fasta=amazon.fasta, cutoff=0.10, processors=2)

### output

The output option allows you specify the form of the matrix generated by
pairwise.seqs. By default, **pairwise.seqs** will generate a
column-formatted matrix. You can set the output to "lt", for a phylip
formatted lower triangle matrix, or to "square" for a phylip formatted
square matrix. If output is set to lt or square the cutoff option is
ignored.

    mothur > pairwise.seqs(fasta=amazon.fasta, output=lt)

### align

The **pairwise.seqs** command allows you to select between two alignment
methods - gotoh, and needleman - needleman is the default
setting:

    mothur > pairwise.seqs(fasta=amazon.fasta, align=needleman)

The needleman algorithm penalizes the same amount for opening and
extending a gap. Alternatively, you could use the gotoh algorithm, which
charges a different penalty for opening (default=-2) and extending
(default=-1) gaps:

    mothur > pairwise.seqs(fasta=amazon.fasta, align=gotoh)

Our experience has shown that the added parameters in the gotoh
algorithm do not improve the pairwise alignment and increases the time
required for the alignment. 

### match, mismatch, gapopen, and gapextend

In the pairwise alignment portion of the aligning procedure, the default
reward for a match is +1 and the penalties for a mismatch, opening and
extending a gap are -1, -2, and -1. Our experience has shown that these
produce the best alignments for 16S rRNA gene sequences. You are
encouraged to play around with these to suit your own purposes as shown
below:

    mothur > pairwise.seqs(fasta=amazon.fasta, align=gotoh, match=1, mismatch=-3)

or

    mothur > pairwise.seqs(fasta=amazon.fasta, align=gotoh, gapopen=-5)

etc.

Keep in mind that if you are using the align=blast option, blast will
limit the combinations of match, mismatch, gapopen, and gapextend that
you can use. Hopefully, we've scared you off of using blast at all so
that this won't be an issue.

### oldfasta & column

These parameters are used to append to a column-formatted distance
matrix. Given a column matrix, a new fasta file and a old fasta file we
add distances to the original distance matrix calculated with the old
fasta file.

    mothur > pairwise.seqs(oldfasta=final.fasta, column=final.dist, fasta=amazon.fasta) 

## Revisions

-   1.24.0 - paralellized for Windows.
-   1.25.0 - added checks for positive values for gap open, gap extend,
    or mismatch.
-   1.30.1 - Bug Fix: Windows paralellization of **pairwise.seqs** cutoff
    was not passed to thread.
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.41.0 - Added oldfasta and column parameters.
    [\#468](https://github.com/mothur/mothur/issues/468)
-   1.43.0 - Improves speed of dist.seqs and
    pairwise.seqs.[\#653](https://github.com/mothur/mothur/issues/653)
-   1.46.0 - Improves speed of pairwise.seqs by up to 99%, using kmer distance cutoffs.[\#763](https://github.com/mothur/mothur/issues/763)
-   1.47.0 Removes blast [\#801](https://github.com/mothur/mothur/issues/801)

