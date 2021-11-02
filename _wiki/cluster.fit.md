---
title: 'cluster.fit'
tags: 'commands'
redirect_from: '/wiki/Cluster.fit.html'
---
The **cluster.fit** command can be used to assign
sequences to OTUs or fit sequences to existing OTUs. Currently, mothur
has two methods for doing this:

-   Closed: Fit reads to existing OTUs, scrapping
    any reads unable to be fitted.
-   Open: Fit reads to existing OTUs, any unfitted
    reads are clustered separately into new OTUs.

For this tutorial you should download the 
[OptiFitDataSets.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/optifitdatasets.zip) 
file and decompress it.

<!-- TODO: add citation for OptiFit once it's published.
If you use the `cluster.fit` command, please cite the OptiFit paper:

> TODO

See the 
[citation file](https://github.com/mothur/mothur/blob/master/CITATION.md#cite-optifit) 
for a BibTeX entry.
-->

## Default settings

You may run the command in _de novo_ or reference mode. Either a
[phylip-formatted distance
matrix](/wiki/phylip-formatted_distance_matrix) or a
[column-formatted distance
matrix](/wiki/column-formatted_distance_matrix) must be inputted
for cluster to be successful, the default output of the dist.seqs
command is the column-format. If you have a favorite format, please let
us know and we can work with you to incorporate that feature into
mothur. Because the phylip format is so popular most software can
generate this format for you.

### _de novo_ fitting

The _de novo_ method allows you to use your dataset as a reference. mothur
will randomly select a portion of your dataset to be the reference. 
The reference is then clustered with [OptiClust](/wiki/cluster), 
and the remaining sequences are fitted to the reference otus with OptiFit.
This process is repeated n times with the best OTU assignments chosen as the output.

    mothur > cluster.fit(column=marine.0_2.01.dist, count=marine.0_2.01.count_table)

The best sensspec results were found on the 4th iteration:

    iter   label   cutoff  numotus tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    4  0.03    0.03    5581    315417  114823776   76333   53810   0.854263    0.999336    0.805149    0.999532    0.805149    0.998871    0.828779    0.828979

### reference fitting

The reference fitting methods use a reference list and fit the new dataset's 
sequences into the reference otus. 
Perhaps you have a study where 20 patients were sampled and you clustered 
sequences into _de novo_ OTUs with [OptiClust](/wiki/cluster), and you want to 
fit a new patient's data to the existing OTUs. 
There are several ways to fit new data to an existing dataset. 

The reference method takes a user-provided reference and fits the new
dataset's sequences into the reference otus.  

    mothur > unique.seqs(fasta=silva.v4.fasta, format=count)
    mothur > dist.seqs(fasta=current, cutoff=0.03)
    mothur > cluster(column=current, count=current)
    mothur > cluster.fit(fasta=marine.0_2.01.fasta, column=marine.0_2.01.dist, count=marine.0_2.01.count_table, reffasta=silva.v4.unique.fasta, refcolumn=silva.v4.unique.dist, reflist=silva.v4.unique.opti_mcc.list)

The sens.spec results:

    iter   label   cutoff  numotus tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    1  0.03    0.03    3080    284781  114851257   48852   84446   0.77129 0.999575    0.853576    0.999265    0.853576    0.998844    0.810817    0.810349

or

The accnos parameter may be used to indicate a subset of your data as the 
reference. 
You can merge the count and fasta files containing the old and new data. 
Mothur will cluster the references using [OptiClust](/wiki/cluster) and then fit 
the query reads to the reference OTUs.
     
     mothur > list.seqs(fasta=reference.fasta)
     mothur > merge.files(input=reference.fasta-query.fasta, output=combined.fasta)
     mothur > merge.count(count=reference.count_table-query.count_table, output=combined.count_table)
     mothur > dist.seqs(fasta=combined.fasta, cutoff=0.03)
     mothur > cluster.fit(accnos=ref.accnos, column=current, fasta=combined.fasta, count=combined.count_table)

or

The reflist parameter can be used to provide a list file for the references. 
This can be helpful if you want to use existing OTUs from an earlier run of 
mothur's OptiClust algorithm.
    
     mothur > merge.files(input=reference.fasta-query.fasta, output=combined.fasta)
     mothur > merge.count(count=reference.count_table-query.count_table, output=combined.count_table)
     mothur > dist.seqs(fasta=combined.fasta, cutoff=0.03)
     mothur > cluster.fit(reflist=ref.opti_mcc.list, column=current, fasta=combined.fasta, count=combined.count_table)

## Options

### phylip

To read in a [phylip-formatted distance
matrix](/wiki/phylip-formatted_distance_matrix) you need to use the
phylip option:

    mothur > ...... enter command ... 

Whereas dotur required you to indicate whether the matrix was square or
lower-triangular, mothur is able to figure this out for you.

### column & name or count

To read in a [column-formatted distance
matrix](/wiki/column-formatted_distance_matrix) you must provide a
filename for the name or count option. The .name file was generated
during the [unique.seqs](/wiki/unique.seqs) command.

    mothur > cluster.fit(column=marine.0_2.01.dist, name=marine.0_2.01.names)

or

    mothur > cluster.fit(column=marine.0_2.01.dist, count=marine.0_2.01.count_table)

Again, the column-formatted distance matrix can be square or
lower-triangle and mothur will figure it out.

### name

A [name file](/wiki/name_file) contains two columns. The first
column contains the name of a reference sequence that is in a distance
matrix and the second column contains the names of the sequences
(separated by commas) that the reference sequence represents. The list
of names in the second column should always contain at least the
reference sequence name.

There are several reasons to be interested in providing a name file with
your distance matrix. First, as sequencing collections increase in size,
the number of duplicate sequences is increasing. This is especially the
case with sequences generated via pyrosequencing. Sogin and colleagues
[1](https://www.pnas.org/content/103/32/12115.full) found that less than
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
column of the name file would contain the sequence name as well as
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

The [count](/wiki/Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. mothur will use this information to form
the correct OTU's. Unlike, when you use a name file the list file
generated will contain only the unique names, so be sure to include the
count file in downstream analysis with the list file.

    mothur > cluster.fit(column=marine.0_2.01.dist, count=marine.0_2.01.count_table)

### reffasta

The `reffasta` parameter allows you to enter a fasta file for your
reference dataset.

### refcolumn && refphylip

The `refcolumn` and `refphylip` parameters allow you to enter a reference
data distance file, to reduce processing time. It is not required, but
recommended when using reference mode.

### reflist

The `reflist` parameter allows you to enter a list file for your reference
dataset.

### accnos

The `accnos` parameter allows you to assign reference seqeunces by name.
This can save time by allowing you to provide a distance matrix
containing all the sequence distances rather than a sample matrix and
reference matrix and mothur calculating the distances between the sample
and reference.

### method

The options for the `method` parameter are open or closed. The default is
open.

-   Closed: Fit reads to existing OTUs, scrapping
    any reads unable to be fitted.
-   Open: Fit reads to existing OTUs, any unfitted
    reads are clustered separately into new OTUs with OptiClust.

### printref

The `printref` option controls whether the reference sequences are printed to 
list file and included in the final [sensspec](/wiki/sens.spec) calculations.
Set `printref=t` (true) to include the reference sequences, 
or `printref=f` (false) to exclude the reference sequences.

We recommend using `printref=f` when the reference sequences are from a public 
external database such as SILVA or Greengenes, so that only the sequences from 
your dataset of interest are included in the list and sensspec files.

Using `printref=t` may be more appropriate when the reference is created by
selecting a random sample from a dataset followed by using the remaining 
sequences as the query for OptiFit.

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

The denovoiters parameter allow you to set the maxiters for the _de novo_
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
