---
title: 'Cluster.split'
---
The **cluster.split** command can be used to assign sequences to OTUs and
outputs a .list file. It splits large distance matrices into smaller
peices \...

-   [Nearest neighbor](Nearest_neighbor): Each of the
    sequences within an OTU are at most X% distant from the most similar
    sequence in the OTU.
-   [Furthest neighbor](Furthest_neighbor): All of the
    sequences within an OTU are at most X% distant from all of the other
    sequences within the OTU.
-   [Average neighbor](Average_neighbor): This method is a
    middle ground between the other two algorithms.
-   [AGC](AGC):
-   [DGC](DGC):
-   [Opti](Opti): OTUs are assembled using metrics to
    determine the quality of clustering.

If there is an algorithm that you would like to see implemented, please
consider either contributing to the mothur project or contacting the
developers and we\'ll see what we can do. The opticlust algorithm is the
default option. For this tutorial you should download the [
Final.zip](Media:Final.zip) file and decompress it.


There are two part to the **cluster.split** command the splitting of your
files into distinct groupings and the clustering of these groupings.

## Splitting your files

The **cluster.split** command can split your files in 3 ways. Splitting by
distance file, by classification, or by classification also using a
fasta file. The splitmethod parameter allows you to specify how you want
to split your files before you cluster, default=distance, options
distance, classify or fasta.

### Splitting by distance

For the distance file method, you need only provide your distance file
and mothur will split the file into distinct groups.

    mothur > cluster.split(phylip=final.phylip.dist)

or

    mothur > cluster.split(column=final.dist, name=final.names)

#### large

The large parameter allows you to indicate that your distance matrix is
too large to fit in RAM. The default value is false.

    mothur > cluster.split(phylip=final.phylip.dist, large=T)

### Splitting by classification

For the classification method, you need to provide your distance file
and taxonomy file, and set the splitmethod to classify. You will also
need to set the taxlevel you want to split by. mothur will split the
sequences into distinct taxonomy groups, and split the distance file
based on those groups.

    mothur > cluster.split(column=final.dist, name=final.names, taxonomy=final.taxonomy, splitmethod=classify)

### Splitting by classification using fasta

For the classification method using a fasta file, you need to provide
your fasta file, names file and taxonomy file. You will also need to set
the taxlevel you want to split by. mothur will split the sequence into
distinct taxonomy groups, and create distance files for each grouping.

First you need to classify your sequences using the classify.seqs
command.

    mothur > cluster.split(fasta=final.fasta, name=final.names, taxonomy=final.taxonomy, splitmethod=fasta)

#### taxonomy

The taxonomy parameter allows you to enter the taxonomy file for your
sequences, this is only valid if you are using splitmethod=classify or
fasta.

#### taxlevel

The taxlevel parameter allows you to specify the taxonomy level you want
to use to split the distance file, default=3, meaning use the third
taxon in each list.

    mothur > cluster.split(fasta=final.fasta, name=final.names, taxonomy=final.taxonomy, taxlevel=4)

### cluster

The cluster parameter allows you to indicate whether you want to run the
clustering or just split the distance matrix, default=T. The cluster=f
option is used with the file option, see below.

    mothur > cluster.split(fasta=final.fasta, name=final.names, taxonomy=final.taxonomy, splitmethod=fasta, taxlevel=4, cluster=f)

## Clustering

### file

The file option which allows you to enter your file containing your list
of column and names/count files as well as the singleton file. This file
is mothur generated, when you run cluster.split() with the cluster=f
parameter, see above. This can be helpful when you have a large dataset
that you may be able to use all your processors for the splitting step,
but have to reduce them for the cluster step due to RAM constraints. For
example:

    cluster.split(fasta=final.fasta, name=final.names, taxonomy=final.taxonomy, taxlevel=4, cluster=f, processors=8) 
    cluster.split(file=final.file, processors=4)

This allows your to maximize your processors during the splitting step.
Also, if you are unsure if the cluster step will have RAM issue with
multiple processors, you can avoid running the first part of the command
multiple times.

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
In this simple example, the final dataset contains 51474 sequences. The
distance matrix in the file final.phylip.dist is a lower triangle matrix
for the 3772 unique sequences. While you could just read the matrix in
and analyze the set of 3772 unqiue sequences, this would give a
considerably different analysis than if you used the entire 51474
sequence data set. Considering the frequency of sequences is critical
for pretty much every analysis in mothur, we want to use the name or
count file to artificially inflate the matrix to its full size. In this
case we use the namefile option:

    mothur > cluster.split(phylip=final.phylip.dist, name=final.names)

mothur remembers that the distances for the reference sequence also
apply to all of the sequences listed in the second column. Using a name
file can considerably accelerate the amount of processing time required
to analyze some data sets.

By default cluster.split() executes the opticlust clustering algorithm.
For a detailed description of this and the other algorithms check out
the [example clustering
calculations](example_clustering_calculations) page.

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. Mothur will use this information to form
the correct OTU\'s. Unlike, when you use a names file the list file
generated will contain only the unique names, so be sure to include the
count file in downstream analysis with the list file.

    mothur > make.table(name=final.names)

    Example from final.count_table:
     
     Representative_Sequence   total
    GQY1XT001CFHYQ 467
    GQY1XT001C44N8 3677
    GQY1XT001C296C 4652
    GQY1XT001ARCB1 2202
    GQY1XT001CFWVZ 1967
    GQY1XT001DHF2X 2137
    GQY1XT001AEGCJ 2140
    GQY1XT001CPCVN 2837
     ...

    mothur > cluster.split(phylip=final.phylip.dist, count=final.count_table, taxonomy=final.taxonomy, taxlevel=4)

    label  cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0.03   0.03    31138   7044624 7501    21302   0.5938  0.9989  0.8059  0.997   0.1941  0.9959  0.6898  0.6838

### method

The methods available in mothur include opticlust (opti), average
neighbor (average), furthest neighbor (furthest), nearest neighbor
(nearest), Vsearch agc (agc), Vsearch dgc (dgc). By default cluster()
uses the opticlust algorithm; this can be changed with the method
option.

    mothur > cluster.split(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, taxlevel=4, method=opti)

To obtain a average neighbor clustering of the data use the method
option to produce the subsequent output:

    mothur > cluster.split(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, taxlevel=4, method=average, cutoff=0.15)

### metric

The metric parameter allows to select the metric in the opticluster
method. Options are Matthews correlation coefficient (mcc), sensitivity
(sens), specificity (spec), true positives + true negatives (tptn),
false positives + false negatives (fpfn), true positives (tp), true
negative (tn), false positive (fp), false negative (fn), f1score
(f1score), accuracy (accuracy), positive predictive value (ppv),
negative predictive value (npv), false discovery rate (fdr).
Default=mcc.

    mothur > cluster.split(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, taxlevel=4, metric=tptn)

    abel   cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0.03   0.03    28828   7054934 4826    23518   0.5507  0.9993  0.8566  0.9967  0.1434  0.996   0.6851  0.6704

### initialize

The initialize parameter allows to select the initial randomization for
the opticluster method. Options are singleton, meaning each sequence is
randomly assigned to its own OTU, or oneotu meaning all sequences are
assigned to one otu. We have found initialize=singleton to produce
better clustering in less time. Default=singleton.

### delta

The delta parameter allows to set the stable value for the metric in the
opticluster method Default delta=0.0001. To reach a full convergence,
set delta=0.

### iters

The iters parameter allow you to set the maxiters for the opticluster
method. Default=100.

### cutoff

With the opticlust method the list file is created for the cutoff you
set. The default cutoff is 0.03. With the average neighbor, furthest
neighbor and nearest neighbor methods the cutoff should be significantly
higher than the desired distance in the list file. We suggest
cutoff=0.20. This will provide a boost in speed and less RAM will be
required than if you didn\'t set the cutoff for reading in the matrix.
The cutoff can be set for the cluster command as follows:

    mothur > cluster.split(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, taxlevel=4, cutoff=0.05) 

    label  cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0.05   0.05    133482  6888777 30337   59510   0.6916  0.9956  0.8148  0.9914  0.1852  0.9874  0.7444  0.7482

### precision

If you want greater precision, there is a precision option in the
cluster() command:

    mothur > cluster.split(column=final.dist, count=final.count_table, method=average,  precision=1000, cutoff=0.10)

    The final.an.unique_list.list file will look like:

    unique 3772    GQY1XT001C296C  GQY1XT001C44N8  GQY1XT001DC1IC ...
    0.004  3772    GQY1XT001C296C  GQY1XT001C44N8  GQY1XT001DC1IC...
    0.005  3317    GQY1XT001C296C,GQY1XT001B9EHX   GQY1XT001C44N8...
    0.006  3259    GQY1XT001C296C,GQY1XT001B9EHX   GQY1XT001C44N8...
    ... 

Remember that the 16S rRNA gene is roughly 1,500 bp long. So it would
seem silly to have a precision greater than 1,000. Just because you can
calculate a number to 20 digits, doesn\'t mean they\'re all significant.

### showabund

### timing

### runsensspec

The runsensspec parameter allows to run the sens.spec command on the
completed list file. Default=true.

### processors

Default processors=Autodetect number of available processors and use all
available. You can set processors to 2 with the following option:

    mothur> cluster.split(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, taxlevel=4, processors=2)

## Clustering with Vsearch

The vsearch program is written by [the vsearch
team](https://github.com/torognes/vsearch). You can now use vsearch
clustering methods through mothur.

### fasta

Vsearch requires a fasta file to cluster.

    mothur > cluster.split(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, method=agc)

### Vsearch methods

The available clustering methods are agc and dgc.

    mothur > cluster(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, method=dgc)

## Finer points

### Missing distances

Perhaps the second most commonly asked question is why there isn\'t a
line for distance 0.XX. If you notice the previous example the distances
jump from 0.003 to 0.006. Where are 0.004 and 0.005? mothur only outputs
data if the clustering has been updated for a distance. So if you don\'t
have data at your favorite distance, that means that nothing changed
between the previous distance and the next one. Therefore if you want
OTU data for a distance of 0.005 in this case, you would use the data
from 0.003.

### Variability

You may notice that if you run the same command multiple times for the
same dataset you might get slightly different out for some distances:

    mothur > cluster.split(column=final.dist, count=final.count_table)
     
    label  cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0.03   0.03    30772   7052222 7538    21574   0.5879  0.9989  0.8032  0.997   0.1968  0.9959  0.6852  0.6789

    mothur > cluster.split(column=final.dist, count=final.count_table)

    label  cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0.03   0.03    31313   7051732 8028    21033   0.5982  0.9989  0.7959  0.997   0.2041  0.9959  0.6881  0.683

The variability is caused by the randomization of the sequences.

## Revisions

-   1.27.0 - reduced memory by 50% and increased speed by 55%.
-   1.28.0 - added count parameter
-   1.29.0 - added cluster parameter
-   1.30.0 - no longer creates concatenated distance matrix for
    splitmethod=fasta.
-   1.31.0 - Bug Fix: - when splitting by taxonomy mothur was saving
    temp fasta files as the \"current\" fasta file.
-   1.34.0 - added the file option which allows you to enter your file
    containing your list of column and names/count files as well as the
    singleton file. This file is mothur generated, when you run
    cluster.split() with the cluster=f parameter. This can be helpful
    when you have a large dataset that you may be able to use all your
    processors for the splitting step, but have to reduce them for the
    cluster step due to RAM constraints. For example:
    cluster.split(fasta=yourFasta, taxonomy=yourTax, count=yourCount,
    taxlevel=3, cluster=f, processors=8) then
    cluster.split(file=yourFile, processors=4). This allows your to
    maximize your processors during the splitting step. Also, if you are
    unsure if the cluster step will have RAM issue with multiple
    processors, you can avoid running the first part of the command
    multiple times.
-   1.35.0 - Clustering commands did not include the count file info.
    when printing list file OTU order. Only effects clustering commands.
    \*.pick commands must preserve otuLabels order. -
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=3460&p=10483#p10483>
-   1.35.0 - Bug Fix: MPI version compile issue,
    <http://www.mothur.org/forum/viewtopic.php?f=4&t=3453&p=10073#p10073>.
    fixed in 1.34.1.
-   1.36.0 - Bug Fix: did not allow you to use the classic option with
    the file option.
-   1.37.0 - Adds vsearch clustering methods: agc and dgc.
    [\#169](https://github.com/mothur/mothur/issues/169)
-   1.37.0 - Bug Fix: Removes OS limit on open files.
    [\#142](https://github.com/mothur/mothur/issues/142)
-   1.38.0 - Fixes bug with age method.
-   1.38.1 - Removes hard parameter.
-   1.39.0 - Adds opticlust method. opti new default clustering method.
-   1.39.0 - Adds agc and dgc methods of Windows users.
-   1.39.1 - Corrects printing issues with opticlust method.
-   1.39.1 - Adds runsensspec parameter
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.4 - Bug Fix: Cluster commands printing of list file.
    [\#454](https://github.com/mothur/mothur/issues/454)
-   1.43.0 - Changes datatype for opti method to correct overflow.

[Category:Commands](Category:Commands)
