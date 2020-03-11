---
title: 'Align.seqs'
---
The **align.seqs** command aligns a user-supplied
fasta-formatted candidate sequence file to a user-supplied
fasta-formatted template alignment. The general approach is to i) find
the closest template for each candidate using kmer searching, blastn, or
suffix tree searching; ii) to make a pairwise alignment between the
candidate and de-gapped template sequences using the Needleman-Wunsch,
Gotoh, or blastn algorithms; and iii) to re-insert gaps to the candidate
and template pairwise alignments using the NAST algorithm so that the
candidate sequence alignment is compatible with the original template
alignment. We provide several [ alignment
databases](alignment_database) for 16S and 18S rRNA gene
sequences that are compatible with the
[greengenes](https://greengenes.jgi.doe.gov) or
[SILVA](https://arb-silva.de) alignments; however, custom alignments for
any DNA sequence can be used as a template and users are encouraged to
share their alignment for others to use. In general the alignment is
very fast - we are able to align over 186,000 full-length sequences to
the SILVA alignment in less than 3 hrs with a quality as good as the
SINA aligner. Furthermore, this rate can be accelerated using multiple
processors. While the aligner doesn\'t explicitly take into account the
secondary structure of the 16S rRNA gene, if the template database is
based on the secondary structure, then the resulting alignment will at
least be implicitly based on the secondary structure. To demonstrate the
various features of this command, we will use the [ AbRecovery
dataset](Media:AbRecovery.zip).


## Default settings

The **align.seqs** command requires the user to enter a candidate and
template file. First, obtain an [alignment
database](alignment_database) and make sure that it is
located in the same folder as your candidate file and where you are
running mothur from. We will use the greengenes alignment with 7,682
positions. To run the aligner enter the following command:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta)

This will generate the following output:

    Reading in the core_set_aligned.imputed.fasta template sequences...    DONE.
    Generating the core_set_aligned.imputed.8mer database...   DONE.

    It took 7 secs to align 242 sequences

Note that once the database was generated, it took 7 seconds. The
command will generate two files - abrecovery.align and
abrecovery.align.report. The align file is a fasta-formatted file that
contains the 242 aligned sequences. We put periods (i.e. \'.\') leading
up to the first base in the sequence and following the last base of the
sequence. The report file contains information about the quality of the
alignment. For example\...

    QueryName  QueryLength TemplateName    TemplateLength  SearchMethod    SearchScore AlignmentMethod QueryStart  QueryEnd    TemplateStart   TemplateEnd PairwiseAlignmentLength GapsInQuery GapsInTemplate  LongestInsert   SimBtwnQuery&Template
    AY457915   501     82283       1525        kmer        89.07       needleman   5       501     1       499     499         2       0       0       97.60

In this example we see that candidate sequence AY457915 was 501 bases
long and we used kmer searching (i.e. using 8mers) to find template
sequence 82283 as the best match. Sequence 82283 had 89% of the 8mers
found in AY457915. Next, we see that we used the needleman alignment
method, which resulted in a pairwise alignment that was 501 characters
long. In this example we see that the alignment actually starts at
candidate sequence position 5. This occurred because the sequence
actually has vector sequence at the 5\' end, which is not represented in
the reference alignment, which includes the traditional 27f and 1492r
primer sites. Next, we see that during the pairwise alignment stage, 2
gaps were entered into the candidate sequence and none were introduced
into the template sequence - none of the template gaps needed to be
corrected with the NAST algorithm. Finally, the aligned candidate
sequence was 97.6% identical to the template sequence (including gaps).

By default, **align.seqs** will use kmer searching with 8mers and will use
the Needleman-Wunsch pairwise alignment method with a reward of +1 for a
match and penalties of -1 and -2 for a mismatch and gap, respectively.
Also, only one processor will be used with the default settings.

## Options

### search

mothur offers three methods of finding the template sequence - kmer
searching, blast, and suffix tree searching. Our experience has shown
that kmer searching is the fastest and best method of searching for a
template sequence. The default is to use kmers:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, search=kmer)

Alternatively, you can use blastn:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, search=blast)

If you use blast, you need to install the blast folder in your source
code folder or with the executable so that the path from the mothur
executable to the blast executables is /blast/bin/. For the search, you
need to have formatdb and blastall in the bin folder. Also, be
forewarned that to make this as fast as possible, we chose a word size
of 28 (-W 28), which has the unintended consequence of returning more
\"no significant\" searches.

The final option is to use suffix trees for searching:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, search=suffix)

This approach is fairly comparable to blast in terms of quality and
speed.

### ksize

If you use the kmer option, you can change the size of kmers that are
used in align.seqs. By default this is set to use 8mers. Alternatively,
you can use kmers ranging in size between 5 and 12. We have noticed that
the best kmer size is typically the one that is the fastest. For full
length alignment databases, kmers of 8 or 9 are generally appropriate.
If you use another database, be sure to experiment with the settings to
see what works best. To change the kmer size:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, ksize=6)

### align

The **align.seqs** command allows you to select between three alignment
methods - blastn, gotoh, and needleman - needleman is the default
setting:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, align=needleman)

The needleman algorithm penalizes the same amount for opening and
extending a gap. Alternatively, you could use the gotoh algorithm, which
charges a different penalty for opening (default=-2) and extending
(default=-1) gaps:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, align=gotoh)

Our experience has shown that the added parameters in the gotoh
algorithm do not improve the pairwise alignment and increases the time
required for the alignment. Finally, blastn can be used as a heuristic
approach to the gotoh alignment:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, align=blast)

As with the search option, if you use blast, you need to install the
blast folder in your source code folder or with the executable so that
the path from the mothur executable to the blast executables is
/blast/bin/. For the align=blast option, you need to have bl2seq in the
bin folder. In our implementation, blast is the slowest option of the
three and also generates the worst alignments. The quality suffers
particularly because it generates a local alignment (needleman and gotoh
are global) and will truncate the alignment if the similarity drops
below a threshold.

### match, mismatch, gapopen, and gapextend

In the pairwise alignment portion of the aligning procedure, the default
reward for a match is +1 and the penalties for a mismatch, opening and
extending a gap are -1, -2, and -1. Our experience has shown that these
produce the best alignments for 16S rRNA gene sequences. You are
encouraged to play around with these to suit your own purposes as shown
below:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, align=gotoh, match=1, mismatch=-3)

or

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, align=gotoh, gapopen=-5)

etc.

Keep in mind that if you are using the align=blast option, blast will
limit the combinations of match, mismatch, gapopen, and gapextend that
you can use. Hopefully, we\'ve scared you off of using blast at all so
that this won\'t be an issue.

### flip and threshold

The threshold parameter is used to specify a cutoff at which an
alignment is deemed \'bad\' and the reverse complement may be tried. The
default threshold is 0.50, meaning if 50% of the bases are removed in
the alignment process. The flip parameter is used to specify whether or
not you want mothur to try the reverse complement of a sequence if the
sequence falls below the threshold. The default is true. If the flip
parameter is set to true the reverse complement of the sequence is
aligned and the better alignment is reported.

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, flip=t)

or

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, flip=t, threshold=0.75)

### processors

The processors option enables you to accelerate the alignment by using
multiple processors. Default processors=Autodetect number of available
processors and use all available. You are able to use 2 processors with
the following option:

    mothur > align.seqs(candidate=abrecovery.fasta, template=core_set_aligned.imputed.fasta, processors=2)

Running this command on my laptop doesn\'t exactly cut the time in half,
but it\'s pretty close. There is no software limit on the number of
processors that you can use.

## Fine points

### Differences in implementation

The most similar implementation of the **align.seqs** command is the online
greengenes aligner. The NAST paper describes using 7mer searching and
blast alignments, which could align 10 sequences per minute. In
contrast, **align.seqs** can align about 18 16S rRNA gene sequences per
second to a 50,000 character alignment and 22 sequences per second to a
8,000 character alignment. Since the publication of the NAST aligner,
the strategy has changed to using blast to find a template and the
alignment. To select the template, the greengenes aligner selects the
longest among the top-ten most similar template sequences.

Another important difference between **align.seqs** and the other aligners
that are available is that the aligner is not tied to any one alignment.
You could use the greengenes, SILVA, or RDP alignments. You could even
design a recA alignment and use that.

### Performance considerations

There are several considerations to remember when aligning your
sequences:

1.  **The number of sequences to be aligned.** If you use a program such
    as muscle or clustal, doubling the number of sequences will increase
    the amount of time required by 16-fold and the amount of RAM
    required by 4-fold. In contrast, doubling the number of sequences
    will double the amount of time required and require no extra RAM.
2.  **The number of sequences in the template database.** Since the
    templates are stored in RAM, you need to consider how many sequences
    to use. Our version of the SILVA SEED database can be loaded in less
    than 2GB of RAM. The number of sequences in the database will have
    an effect on search times. Roughly speaking, doubling the number of
    template sequences should double the amount of time required to find
    the best match.
3.  **The length of candidate sequences.** Doubling the sequence length
    will approximately double the time required to find the best match.
    In the alignment step, doubling the length of the sequences will
    quadruple the amount of time required. For comparison, align.seqs
    will align 18 full-length sequences per second with 8mers and the
    needleman algorithm and 31 750-bp fragments (27f-787r) per second.
    There are optimizations that we do in the kmer searching which
    probably explain the differences.
4.  **The length of the alignment.** Using a 50,000 character alignment
    vs. a 7,700 character alignment means that an extra 42,300 gaps need
    to be inserted into the alignment, which is pretty easy, but still
    takes time. The bigger problem is the effect that it has on storing
    the database in RAM and for downstream processing. Using the
    [filter.seqs](filter.seqs) command we are able to remove
    the vertical gaps from the template database and the aligned
    candidate sequences. When we aligned the 186,000 full-length
    sequences to a version of the SILVA database with all vertical gaps
    removed, the sequence quality was just as high as with the full
    alignment. We were able to align 22 sequences per second with the
    filtered template database vs. 18 sequences per second with the full
    database.

For purposes of comparison, when we aligned 186,000 full-length
sequences to the SILVA template library the search with 8mers required
3,800 seconds and the alignment required about 6,500 seconds.

### Variable regions

Sub-regions of the 16S rRNA gene align very well, when the template
database is well curated in that region. Depending on the region you use
it may be necessary to tweak the search and alignment parameters. The
align.seqs defaults work well for aligning variable region sequences to
a full-length alignment template database. If you are analyzing V6
pyrotags, you might consider using ksize=9. We have experimented with
alignments using region-specific template databases and have found that
the alignment quality is not significantly better; however, there is a
considerable speed up. For example using 9mer searching with needleman
to align 186,000 V6 fragments against the full-length database allowed
us to align 78 sequences per second. In contrast, aligning the same tags
against a template alignment of just the V6 region with 5mers allowed us
to align 145 sequences per second. There was no significant difference
in alignment quality.

### Caveat emptor

There are two very important things to consider:

1.  **Your alignment is only as good as the database you are aligning
    to.** The old adage - garbage in, garbage out - hold true in
    sequence alignment. If you are interested in a particular variable
    region, then it would be worth your while to make sure that the
    database you are using is well aligned in that region. This is the
    only reason we might suggest the SILVA alignment over the greengenes
    alignment.
2.  **Don\'t instinctively trust the alignment you get from any
    aligner.** It would be worth your while to import your sequences
    into an alignment editor that takes into account the secondary
    structure (e.g. [ARB](https://arb-home.de)) to make sure that things
    look right.

## Help

### Common Questions

Can\'t find your question? Please feel free to ask questions on our
forum, <https://forum.mothur.org>.

### Common Issues

1.  **\...template is not aligned, aborting. What do I do?** Mothur
    requires the reference file to be aligned to generate aligned
    sequences. You can download mothur\'s aligned silva references here,
    <https://mothur.org/wiki/Silva_reference_files>. For ITS sequences,
    see \'how to\' below.
2.  **\...xxx of your sequences generated alignments that eliminated too
    many bases\... What does this mean?** By default, mothur will align
    the reverse compliment of your sequences when the alignment process
    removes more than 50% of the bases indicating the read may be
    flipped. This process assembles the best possible alignment, and
    downstream analysis will remove any poor quality reads remaining.

### How To

1.  **How do I \'align\' ITS sequences?** You really can\'t do an
    alignment because there isn\'t positional homology. You can use the
    pre.cluster and pairwise.seqs commands to generate a distance matrix
    from unaligned sequences.
2.  **How do I create a custom reference for the region I am studying?**
    You can tailor your reference using this method:
    <https://blog.mothur.org/2016/07/07/Customization-for-your-region/>.

## Revisions

-   1.22.0 Added processors option for Windows users.
-   1.28.0 Added check to make sure template is aligned.
-   1.33.2 Bug Fix: Windows **align.seqs** flip=t caused segfault.
-   1.38.0 Removes save option
-   1.40.0 Changes flip parameter default to true.
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.43.0 Improves speed and resource management for align.seqs
    command. [\#647](https://github.com/mothur/mothur/issues/647)

[Category:Commands](Category:Commands)
