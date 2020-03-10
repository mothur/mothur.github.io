---
title: 'Mothur v.1.19.0'
---
We are pleased to be releasing [mothur
v.1.19.0](mothur_v.1.19.0); however, we wish it were under
better circumstances. Recently it came to our attention that the testing
approach we were using to measure our ability to detect true chimeras
(sensitivity) while limiting the risk of falsely calling sequences
chimeric (specificity) was flawed. It turns out that while we had
significantly increased the sensitivity compared to the original version
of ChimeraSlayer (http://microbiomeutil.sourceforge.net/), we also
increased the false positive rate. For example, using the test set
available with the original ChimeraSlayer on test sequences that were
200 bp, the sensitivity increased from 63% to 70% and the specificity
decreased from 99.4% to 87.4%. With longer sequences the difference in
sensitivity and specificity increases. This approach to measuring
specificity is conservative; however, it is much more reliable than what
we had been doing. In summary, while chimera.slayer did a better job of
identifying true chimeras, it also mistakenly called many good sequences
chimeric. The practical upshot is that it if you used the default
settings in chimera.slayer it is likely that extra sequences were
removed. Since learning of this problem, we have been trying to modify
our version of chimera.slayer to be more faithful to the original
ChimeraSlayer. At this point, the main differences between ours and the
original is the ability to use any reference alignment and significantly
improved speed. We are removing the distance and kmer search methods for
the time being and will do as the original does and use megablast to do
the parent searching.

This is a pretty critical update and insist that everyone update their
version of mothur. Please spread the word to colleagues that have not
received this notice. We know you trust us to give you a robust and
reliable software package and hope you can accept our apology for any
problems this may cause in your analysis. Feel free to contact Pat if
you have any question, concerns, or flames.

## Feature updates

-   [chimera.slayer](chimera.slayer) - significant overhaul
    to make it more faithful to the original ChimeraSlayer program
-   [screen.seqs](screen.seqs) - added qfile parameter
-   [get.current](get.current) - now displays the current
    number of processors and flow file type is now saved with the
    current feature

## Bug fixes

-   [filter.seqs](filter.seqs),
    [align.seqs](align.seqs), etc. - current can now be used
    in a list of file names. example - fasta=current-silva.gold.align
    now works.
