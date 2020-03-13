---
title: 'cluster.classic'
tags: 'commands'
redirect_from: '/wiki/Cluster.classic.html'
---
The **cluster.classic** command can be used to
assign sequences to OTUs. It is the dotur implementation of cluster.
Presently, mothur implements three clustering methods:

-   [nearest neighbor](Nearest_neighbor): Each of the
    sequences within an OTU are at most X% distant from the most similar
    sequence in the OTU.
-   [furthest neighbor](Furthest_neighbor): All of the
    sequences within an OTU are at most X% distant from all of the other
    sequences within the OTU.
-   [average neighbor](Average_neighbor): This method is a
    middle ground between the other two algorithms.
-   [weighted neighbor](Weighted_neighbor):

If there is an algorithm that you would like to see implemented, please
consider either contributing to the mothur project or contacting the
developers and we\'ll see what we can do. The furthest neighbor
algorithm is the default option. For this tutorial you should download
the [amazondata.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) file and
decompress it.


## Default settings

In order for the cluster.classic() command to work, a distance matrix
needs to be stored in memory.

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist)

By default **cluster.classic** executes the furthest neighbor clustering
algorithm. For a detailed description of this and the other algorithms
check out the [example clustering
calculations](example_clustering_calculations) page. Next
lets run the cluster.classic() command:

This command will generate the following output:

    unique 2   94  2   
    0.00   2   92  3   
    0.01   2   88  5   
    0.02   4   84  2   2   1   
    0.03   4   75  6   1   2   
    0.04   4   69  9   1   2   
    0.05   4   55  13  3   2   
    0.06   4   48  14  2   4   
    0.07   4   44  16  2   4   
    0.08   7   36  15  4   2   1   0   1   
    0.09   7   36  12  4   3   0   0   2   
    0.10   7   35  12  2   3   0   0   3
    0.11   14  30  9   3   5   0   0   1   0   0   0   0   0   0   1   
    ...

Outputted to the screen is a label describing the distance cutoff used
to form OTUs, the number of sequences in the largest OTU, the number of
OTUs with only one sequence, with two, etc. Running the
cluster.classic() command generates three output files whose names end
in [sabund](sabund_file), [rabund](rabund_file),
and [list](list_file). The data outputted to the screen is
the same as that in the sabund file. You will notice that the sample
rabund, sabund, and list files each have a \".fn.\" tag inserted after
the name of the distance matrix. fn corresponds to the algorithm that
was used to perform the clustering. In this case furthest neighbor (fn)
was used. Other possibilities include \"an\" for average neighbor and
\"nn\" for nearest neighbor.

## Options

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
[1](https://www.pnas.org/content/103/32/12115.full) found that less than
50% of their sequences were unique. Because the alignments and distances
for the duplicate sequences are the same, re-processing each duplicate
sequence takes a considerable amount of computing time and memory.

Example from amazon.names:

    ...
    U68616 U68616
    U68617 U68617
    U68618 U68618,U68620
    U68619 U68619
    U68621 U68621
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

A names file is not required, but depending on the data set to be
analyzed, could significantly accelerate the processing time of
downstream calculations. Although this is a simple example, the 98
sequence amazon data set has two pairs of duplicate sequences (U68618
and U68620) and (U68667 and U68641). The distance matrix in the file
96\_lt\_phylip\_amazon.dist is a lower triangle matrix for the 96 unique
sequences. While you could just read the matrix in and analyze the set
of 96 unqiue sequences, this would give a considerably different
analysis than if you used the entire 98 sequence data set. Considering
the frequency of sequences is critical for pretty much every analysis in
mothur, we want to use the name file to artificially inflate the matrix
to its full size. In this case we use the namefile option:

    mothur > cluster.classic(phylip=96_lt_phylip_amazon.dist, name=amazon.names)

mothur remembers that the distances for the reference sequence also
apply to all of the sequences listed in the second column. Using a name
file can considerably accelerate the amount of processing time required
to analyze some data sets.

### count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. Mothur will use this information to form
the correct OTU\'s. Unlike, when you use a names file the list file
generated will contain only the unique names, so be sure to include the
count file in downstream analysis with the list file.

    mothur > make.table(name=amazon.names)

    Example from amazon.count_table:
     ...
     U68616    1
     U68617    1
     U68618    2
     U68619    1
     U68621    1
     ...

    mothur > cluster.classic(phylip=96_lt_phylip_amazon.dist, count=amazon.count_table)

### method

By default **cluster.classic** uses the furthest neighbor algorithm; this
can be changed with the method option. By running the following command
you will get the same output as just running cluster():

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist, method=furthest)

To obtain a nearest neighbor clustering of the data use the method
option to produce the subsequent output:

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist, method=nearest)
    ********************#****#****#****#****#****#****#****#****#****#****#
    Reading matrix:     ||||||||||||||||||||||||||||||||||||||||||||||||||||
    ***********************************************************************
    unique 2   94  2   
    0.00   2   92  3   
    0.01   4   86  4   0   1   
    0.02   4   83  2   1   2   
    0.03   4   75  6   1   2   
    0.04   4   68  8   2   2   
    0.05   5   53  13  2   2   1   
    0.06   13  47  12  2   2   0   0   0   0   0   0   0   0   1   
    0.07   16  41  10  2   2   0   0   1   0   0   0   0   0   0   0   0   1   
    ...

To obtain an average neighbor clustering of the data again use the
method option to produce the subsequent output:

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist, method=average)
    ********************#****#****#****#****#****#****#****#****#****#****#
    Reading matrix:     ||||||||||||||||||||||||||||||||||||||||||||||||||||
    ***********************************************************************
    unique 2   94  2    
    0.00   2   92  3   
    0.01   3   87  4   1   
    0.02   4   83  2   1   2   
    0.03   4   75  6   1   2   
    0.04   4   69  9   1   2   
    0.05   4   55  13  3   2   
    0.06   4   48  14  2   4   
    0.07   7   42  15  2   2   1   0   1   
    ...

To obtain an weighted neighbor clustering of the data again use the
method option to produce the subsequent output:

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist, method=weighted)
    ********************#****#****#****#****#****#****#****#****#****#****#
    Reading matrix:     ||||||||||||||||||||||||||||||||||||||||||||||||||||
    ***********************************************************************
    unique 2   94  2   
    0.00   2   92  3   
    0.01   3   87  4   1   
    0.02   4   83  2   1   2   
    0.03   4   75  6   1   2   
    0.04   4   69  9   1   2   
    0.05   4   55  13  3   2   
    0.06   7   48  14  1   3   0   0   1   
    0.07   7   43  15  2   3   0   0   1   
    ...

### cutoff

You can set a cutoff value for performing the clustering operation. The
cutoff can be set for the cluster command as follows:

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist, cutoff=0.05) 
    ********************#****#****#****#****#****#****#****#****#****#****#
    Reading matrix:     ||||||||||||||||||||||||||||||||||||||||||||||||||||
    ***********************************************************************
    unique 2   94  2   
    0.00   2   92  3   
    0.01   2   88  5   
    0.02   4   84  2   2   1   
    0.03   4   75  6   1   2   
    0.04   4   69  9   1   2   
    0.05   4   55  13  3   2   

### precision

Perhaps the most commonly asked question is why the cluster.classic
command produces data for both the \"unique\" and \"0.00\" lines.
Aren\'t they the same? No. The \"unique\" line represents data for the
situation where all of the sequences in an OTU are identical; the
\"0.00\" line represents data for the situation where all of the
sequences in an OTU have pairwise distances less than 0.0049. We made
the decision that because there is error in everything, we should round
these distances as well and not apply a hard cutoff at 0.01, 0.02, etc.
If you want greater precision, there is a precision option in the
cluster.classic command:

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist, cutoff=0.02, precision=1000)
    ********************#****#****#****#****#****#****#****#****#****#****#
    Reading matrix:     ||||||||||||||||||||||||||||||||||||||||||||||||||||
    ***********************************************************************
    unique 2   94  2   
    0.003  2   92  3    
    0.006  2   90  4   
    0.008  2   88  5   
    0.017  3   87  4   1   
    0.018  3   86  3   2   
    0.020  4   84  2   2   1

Remember that the 16S rRNA gene is roughly 1,500 bp long. So it would
seem silly to have a precision greater than 1,000. Just because you can
calculate a number to 20 digits, doesn\'t mean they\'re all significant.

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

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist)
    ********************#****#****#****#****#****#****#****#****#****#****#
    Reading matrix:     ||||||||||||||||||||||||||||||||||||||||||||||||||||
    ***********************************************************************
    unique 2   94  2   
    0.00   2   92  3   
    0.01   2   88  5   
    0.02   4   84  2   2   1   
    0.03   4   75  6   1   2   
    0.04   4   69  9   1   2   
    0.05   4   55  13  3   2   
    0.06   4   48  14  2   4   
    0.07   4   44  16  2   4   
    0.08   7   35  17  3   2   1   0   1   
    ...

    mothur > cluster.classic(phylip=98_sq_phylip_amazon.dist)
    ********************#****#****#****#****#****#****#****#****#****#****#
    Reading matrix:     ||||||||||||||||||||||||||||||||||||||||||||||||||||
    ***********************************************************************
    unique 2   94  2   
    0.00   2   92  3   
    0.01   2   88  5   
    0.02   4   84  2   2   1   
    0.03   4   75  6   1   2   
    0.04   4   69  9   1   2   
    0.05   4   55  13  3   2   
    0.06   4   48  14  2   4   
    0.07   4   44  16  2   4   
    0.08   7   36  15  4   2   1   0   1   
    ...

At a distance of 0.08 these two executions diverge from one another.
This is because there was a tie. A sequence could have joined more than
one pre-existing OTU. mothur is programmed to randomly select the OTU
that it should join. Because of this, it is possible to get differences
between runs. This is just a byproduct of using an algorithm-based
approach to clustering.

## Revisions

-   1.27.0 - reduced memory by 50% and increased speed by 55%.
-   1.28.0 - added count parameter
-   1.38.1 - Removes hard parameter.
-   1.40.4 - Bug Fix: Cluster commands printing of list file.
    [\#454](https://github.com/mothur/mothur/issues/454)


