---
title: 'Cooccurrence'
tags: 'commands'
---
The **cooccurrence** command calculates four
metrics and tests their significance to assess whether presence-absence
patterns are different than what one would expect by chance.

## Default Settings

    mothur > cooccurrence(shared=final.an.shared)

## Options

### iters

The iters parameter allows you to set number of null matrices generated.
The default is 1000.

    mothur > cooccurrence(shared=final.an.shared, iters=10000)

### metric

The metric parameter options are cscore, checker, combo and vratio.
Default=cscore. The cscore or checkerboard score \[1\] is a metric that
measures species segregation. It is the mean number of checkerboard
units per species pair. The checker metric \[2\] counts the number of
species pairs forming a perfect checkerboard. The combo metric \[3\] is
the number of unique species pairs. The vratio or variance ratio \[4\]
is a measure of the species association calculated by the ratio of the
variance in total species number to the sum of the variances of the
species.

    mothur > cooccurrence(shared=final.an.shared, metric=combo)

\[1\] Stone, L., and A. Roberts. 1990. The checkerboard score and
species distributions. Ocelogia. 85:74-79.

\[2\] Diamond, J. M. 1975. Assembly of species communities. Pages
342-444 in M. L. Cody and J. M. Diamond, editors. Ecology and evolution
of communities. Harvard University Press, Cambridge, Massachusetts, USA.

\[3\] Pielou, D. P., and E. C. Pielou. 1968 Association among species of
infrequent occurrence: the insect and spider fauna of *Polypours
betulinus* (Bulliard) Fries. Journal of Theoretical Biology 21:202-216.

\[4\] Schluter, D. 1984. A variance test for detecting species
associations, with some example applications. Ecology 65:998-1005.

### matrixmodel

The matrixmodel parameter allows you to select the model you would like
to use. Options are sim1, sim2, sim3, sim4, sim5, sim6, sim7, sim8 and
sim9. Default=sim2.

    mothur > cooccurrence(shared=final.an.shared, matrixmodel=sim7)

Each sim implements a different algorithm for generating null matrices
with constraints on the rows (species) and columns (sites).

                          Columns equiprobable   Columns proportional   Column totals fixed
  ----------------------- ---------------------- ---------------------- ---------------------
  **Rows equiprobable**   sim1                   sim6                   sim3
  **Rows proportional**   sim7                   sim8                   sim5
  **Row totals fixed**    sim2                   sim4                   sim9

Equiprobable rows or columns means that each row, column or both is not
dependent on the original co-occurrence matrix. Each species or site has
an equal change of occurring in the null matrix.

Proportional rows or columns means that the proportion of occurrences in
rows, columns or both in the original co-occurrence matrix are preserved
but the totals may differ. Each species or site\'s chances of occurring
are proportional to their occurrence in the original co-occurrence
matrix.

Fixed row or column totals preserves the total number of occurrences in
rows, columns or both in the original co-occurrence matrix. Sim9 is a
special case that is not probabilistic. Since both the row and column
totals are preserved the only way to randomize the matrix is with a
checkerboard swap. When a checkerboard appears in the matrix the 1s and
0s are swapped to their mirror image to preserve the species and site
totals.

**Checkerboard:**

    10
    01

**Swap:**

    01
    10

### suggested metric/matrixmodel combinations

  cscore   checker   combo   vratio
  -------- --------- ------- --------
  sim9     sim9      sim9    sim2
  sim2     sim2      sim2    sim4
                     sim4    sim8
                     sim8    

Careful readers will note that none of the suggested matrixmodels have
equiprobable rows (species). This is because tests of co-occurrence are
quite sensitive to the frequency of species occurrence. As such,
rowtotals should be maintained or at least kept proportional in the null
models. Sim9 is well suited to co-occurrence matrices that have an
\"island list\" structure. Island lists are often found in classical
ecology datasets that contain species with well defined habitat patches
and are rarely degenerate (matrices that contain empty rows or columns).
Sim2 is well suited for co-occurrence matrices that have a \"sample
list\" structure. Sample list structured data are found where species
have relatively homogeneous habitats and degenerate matrices are common.
In these matrices species will often occur in only one site.

The default values of cscore and sim2 have been selected because the
c-score is not very sensitive to noise in the data and when used with
sim9 or sim2 is not particularly prone to false positives. Sim2 has been
chosen because of the prevalence of degenerate matrices. These are just
guidelines, however, be sure to select a metric and matrix model that is
best suited to the type of data you are analyzing.

It should be noted that sim9 cannot be used with vratio because in sim9
both the column and row totals are maintained, hence there will be no
variance.

Please see \[5\] for more details on metric/null model selection.

\[5\] Gotelli, Nicholas J. 2000. NULL MODEL ANALYSIS OF SPECIES
CO-OCCURRENCE PATTERNS. Ecology 81:2606--2621.

### groups

The groups parameter allows you to specify which of the groups in your
groupfile you would like included. The group names are separated by
dashes.

### label

The label parameter allows you to select what distance levels you would
like, and are also separated by dashes.

## Revisions

-   1.25.0 - First Introduced
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)


