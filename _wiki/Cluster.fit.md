---
title: 'Cluster.fit'
---
The [cluster.fit](cluster.fit) command can be used to assign
sequences to OTUs or fit sequences to existing OTUs. Currently, mothur
has two options for doing this:

-   [Closed](Closed): Fit reads to existing OTUs, scrapping
    any reads unable to be fitted.
-   [Open](Open): Fit reads to existing OTUs, any unfitted
    reads are clustered separately into new OTUs.

If there is an algorithm that you would like to see implemented, please
consider either contributing to the mothur project or contacting the
developers and we\'ll see what we can do. The open method is the default
option. For this tutorial you should download the [
OptiFitDataSets.zip](Media:OptiFitDataSets.zip) file and
decompress it.


## Default settings

You may run the command in denovo or reference mode. Either a
[phylip-formatted distance
matrix](phylip-formatted_distance_matrix) or a
[column-formatted distance
matrix](column-formatted_distance_matrix) must be inputted
for cluster to be successful, the default output of the dist.seqs
command is the column-format. If you have a favorite format, please let
us know and we can work with you to incorporate that feature into
mothur. Because the phylip format is so popular most software can
generate this format for you.

### denovo

The denovo method allows you to use your dataset as a reference. Mothur
will randomly select a portion of your dataset to be the reference. The
reference is then clustered and the remaining sequences are fitted into
the \"reference\" otus. This process is repeated x number of times with
the best list file chosen as the output.

    mothur > cluster.fit(column=marine.0_2.01.dist, count=marine.0_2.01.count_table)

The best sensspec results were found on the 4th iteration:

    iter   label   cutoff  numotus tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    4  0.03    0.03    5581    315417  114823776   76333   53810   0.854263    0.999336    0.805149    0.999532    0.805149    0.998871    0.828779    0.828979

### reference

The reference method uses a user provided reference and fits the new
dataset\'s sequences into the reference otus. For example, perhaps you
have a study where 20 patients were sampled, and you want to see how a
new patient\'s data would fit in with the existing results. You could
use the reference method to do so. Or if you want to fit your reads to a
mothur formatted reference you could run the following:

    mothur > unique.seqs(fasta=silva.v4.fasta, output=count)
    mothur > dist.seqs(fasta=current, cutoff=0.03)
    mothur > cluster(column=current, count=current)
    mothur > cluster.fit(fasta=marine.0_2.01.fasta, column=marine.0_2.01.dist, count=marine.0_2.01.count_table, reffasta=silva.v4.unique.fasta, refcolumn=silva.v4.unique.dist, reflist=silva.v4.unique.opti_mcc.list)

The sens.spec results:

    iter   label   cutoff  numotus tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    1  0.03    0.03    3080    284781  114851257   48852   84446   0.77129 0.999575    0.853576    0.999265    0.853576    0.998844    0.810817    0.810349

### phylip

To read in a [phylip-formatted distance
matrix](phylip-formatted_distance_matrix) you need to use the
phylip option:

    mothur > ...... enter command ... 

Whereas dotur required you to indicate whether the matrix was square or
lower-triangular, mothur is able to figure this out for you.

### column & name or count

To read in a [column-formatted distance
matrix](column-formatted_distance_matrix) you must provide a
filename for the name or count option. The .names file was generated
during the [unique.seqs](unique.seqs) command.

    mothur > cluster.fit(column=marine.0_2.01.dist, name=marine.0_2.01.names)

or

    mothur > cluster.fit(column=marine.0_2.01.dist, count=marine.0_2.01.count_table)

Again, the column-formatted distance matrix can be square or
lower-triangle and mothur will figure it out.

### name

A [ names file](Names_file) contains two columns. The first
column contains the name of a reference sequence that is in a distance
matrix and the second column contains the names of the sequences
(separated by commas) that the reference sequence represents. The list
of names in the second column should always contain at least the
reference sequence name.

There are several reasons to be interested in providing a name file with
your distance matrix. First, as sequencing collections increase in size,
the number of duplicate sequences is increasing. This is especially the
case with sequences generated via pyrosequencing. Sogin and colleagues
[1](http://www.pnas.org/content/103/32/12115.full) found that less than
50% of their sequences were unique. Because the alignments and distances
for the duplicate sequences are the same, re-processing each duplicate
sequence takes a considerable amount of computing time and memory.

Example from final.names:

    ...
    GQY1XT001EYE6M GQY1XT001EYE6M,GQY1XT001D69D7,GQY1XT001A1LWJ
    GQY1XT001EXZXC GQY1XT001EXZXC
    GQY1XT001EXZLY GQY1XT001EXZLY
    GQY1XT001EXOOM GQY1XT001EXOOM
    GQY1XT001EX24Z GQY1XT001EX24Z,GQY1XT001AMCGM
    GQY1XT001EWUBU GQY1XT001EWUBU,GQY1XT001DJLCH,GQY1XT001B50B7
    GQY1XT001EWJBM GQY1XT001EWJBM
    ...

Second, if you pre-screen a clone library using ARDRA then you may only
have a sequence for a handful of clones, but you know the number of
times that you have seen a sequence like it. In such a case the second
column of the names file would contain the sequence name as well as
dummy sequence names

    ...
    AA1234 AA1234,AA1234.1,AA1234.2
    AA1235 AA1235
    AA1236 AA1236,AA1236.1
    AA1237 AA1237,AA1237.1,AA1237.2,AA1237.3
    AA1238 AA1238,AA1238.1
    ...

A count or name file is not required (unless you are using the column=
option), but depending on the data set to be analyzed, could
significantly accelerate the processing time of downstream calculations.
Considering the frequency of sequences is critical for pretty much every
analysis in mothur, we want to use the name or count file to
artificially inflate the matrix to its full size.

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. Mothur will use this information to form
the correct OTU\'s. Unlike, when you use a names file the list file
generated will contain only the unique names, so be sure to include the
count file in downstream analysis with the list file.

    mothur > cluster.fit(column=marine.0_2.01.dist, count=marine.0_2.01.count_table)

### reffasta

The reffasta parameter allows you to enter a fasta file for your
reference dataset.

### refcolumn && refphylip

The refcolumn and refphylip parameters allow you to enter a reference
data distance file, to reduce processing time. It is not required, but
recommended when using reference mode.

### reflist

The reflist parameter allows you to enter a list file for your reference
dataset.

## Options

### accnos

The accnos parameter allows you to assign reference seqeunces by name.
This can save time by allowing you to provide a distance matrix
containing all the sequence distances rather than a sample matrix and
reference matrix and mothur calculating the distances between the sample
and reference.

### method

The options for the method parameter are open or closed. The default is
open.

-   [Closed](Closed): Fit reads to existing OTUs, scrapping
    any reads unable to be fitted.
-   [Open](Open): Fit reads to existing OTUs, any unfitted
    reads are clustered separately into new OTUs.

### metric

The metric parameter allows to select the metric in the opticluster
method. Options are Matthews correlation coefficient (mcc), sensitivity
(sens), specificity (spec), true positives + true negatives (tptn),
false positives + false negatives (fpfn), true positives (tp), true
negative (tn), false positive (fp), false negative (fn), f1score
(f1score), accuracy (accuracy), positive predictive value (ppv),
negative predictive value (npv), false discovery rate (fdr).
Default=mcc.

    mothur > cluster.fit(column=marine.0_2.01.dist, count=marine.0_2.01.count_table, metric=tptn)

    iter   label   cutoff  numotus tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    2  0.03    0.03    5996    294554  114847888   52221   74673   0.797759    0.999546    0.84941 0.99935 0.84941 0.998899    0.82263 0.822774

### fitpercent

The fitpercent parameter allow you to set percentage of reads to be
fitted. Default=50. Max=100, min=0.01.

### delta

The delta parameter allows to set the stable value for the metric in the
opticluster algorithm. Default delta=0.0001. To reach a full
convergence, set delta=0.

### iters

The iters parameter allow you to set the maxiters for the opticluster
algorithm. Default=100.

### denovoiters

The denovoiters parameter allow you to set the maxiters for the denovo
sampling. Default=10.

### cutoff

With the opticlust method the list file is created for the cutoff you
set. The default cutoff is 0.03.

### precision

If you want greater precision, there is a precision option in the
cluster.fit() command:

## Finer points

### Variability

You may notice that if you run the same command multiple times for the
same dataset you might get slightly different out for some distances:

The variability is caused by the randomization of the sequences.

## Revisions

-   1.41.0 First Introduced

[Category:Commands](Category:Commands)
