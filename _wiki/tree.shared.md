---
title: 'tree.shared'
tags: 'commands'
redirect_from: '/wiki/Tree.shared.html'
---
The **tree.shared** command will generate a
newick-formatted tree file that describes the dissimilarity
(1-similarity) among multiple groups. Groups are clustered using the
UPGMA algorithm using the distance between communities as calculated
using any of the calculators describing the similarity in community [
membership](/wiki/calculators#similarity-in-community-membership)
or [
structure](/wiki/calculators#similarity-in-community-structure).
Dissimilarity is calculated as one minus the similarity. This tutorial
uses the data files in [
Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/exampledataset.zip).


## Default settings

Using the antibiotic recover data do the following:

    mothur >  cluster.split(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, cutoff=0.03)
    mothur >  make.shared(list=final.opti_mcc.list, count=final.count_table)
    mothur >  tree.shared(shared=final.opti_mcc.shared)

This will generate newick-formatted file for the classical [
Jaccard](/wiki/jclass) and [ Yue & Clayton
theta](/wiki/thetayc) values. The tree can be visualized in a
number of programs such as
[FigTree](https://github.com/rambaut/figtree/). The
output files are as follows:

**final.opti_mcc.jclass.0.03.tre**

       ((((((((F3D9:0.139151,F3D6:0.139151):0.0164516,F3D8:0.155603):0.0127169,F3D5:0.168319):0.020567,F3D2:0.188886):0.0112337,F3D0:0.20012):0.0185825,F3D1:0.218703):0.0144676,(F3D7:0.202247,F3D3:0.202247):0.0309232):0.0428793,((((((((F3D150:0.17364,F3D149:0.17364):0.0174629,F3D148:0.191103):0.0109951,F3D147:0.202098):0.0166998,(F3D146:0.204545,F3D141:0.204545):0.0142525):0.0107437,F3D145:0.229542):0.00181842,F3D144:0.23136):0.00737765,F3D143:0.238738):0.0249593,F3D142:0.263697):0.0123527):0.22395;


**final.opti_mcc.thetayc.0.03.tre**

    (((((F3D9:0.023675,F3D8:0.023675):0.0896665,F3D5:0.113342):0.0446344,(((F3D7:0.0433061,F3D6:0.0433061):0.0249141,F3D3:0.0682202):0.0290023,F3D2:0.0972225):0.0607534):0.0323079,F3D1:0.190284):0.0479489,((F3D150:0.0957974,(((((F3D149:0.0140495,F3D141:0.0140495):0.0173798,(F3D148:0.0212928,F3D143:0.0212928):0.0101364):0.00924471,F3D146:0.0406739):0.0107216,(F3D147:0.0231375,(F3D145:0.0148696,F3D144:0.0148696):0.00826788):0.0282581):0.0164228,F3D142:0.0678183):0.0279791):0.0179119,F3D0:0.113709):0.124523):0.261767;

## Options

### calc

Using the calc option allows one to select any of the calculators of
similarity of community membership and structure. The different
calculators can be separated with hyphens (i.e. "-"). For example the
following command will generate distance matrices for the [ Jaccard
coefficient using richness estimators](/wiki/jest), the [ Yue &
Clayton theta](/wiki/thetayc), and the [ Bray-Curtis
index](/wiki/braycurtis):

    mothur > tree.shared(shared=final.opti_mcc.shared, calc=jest-thetayc-braycurtis)

Keep in mind that these are distances, which are calculated as one minus
the similarity value.

### Raw Distance Matrix

#### phylip

To read in a [phylip-formatted distance
matrix](/wiki/phylip-formatted_distance_matrix) you need to use the
phylip option:

    mothur > dist.shared(shared=final.opti_mcc.shared)
    mothur > tree.shared(phylip=final.opti_mcc.jclass.0.03.lt.dist)

#### column & name or count

To read in a [column-formatted distance
matrix](/wiki/column-formatted_distance_matrix) you must provide a
filename for a [name file](/wiki/name_file) or
[ count file](/wiki/Count_File):

    mothur > tree.shared(column=..., count=...)

or

    mothur > tree.shared(column=..., name=...)
    
NOTE: We DO NOT recommend using the name file. Instead we recommend using a count file. 
The count file reduces the time and resources needed to process commands. 
It is a smaller file and can contain group information.


### groups

At this point, if you run the following command:

    mothur > get.group()

You would have seen that there were 19 groups here: F3D0, F3D1, F3D141, F3D142, F3D143, F3D144, 
F3D145, F3D146, F3D147, F3D148, F3D149, F3D150, F3D2, F3D3, F3D5, F3D6, F3D7, F3D8 and F3D9. If you
just want the distances between groups F3D0 and F3D1, F3D3 and F3D7, or F3D8 and F3D149
enter the following (this is an admittedly silly example):

    mothur > tree.shared(shared=final.opti_mcc.shared, groups=F3D0-F3D1)
    mothur > tree.shared(shared=final.opti_mcc.shared, groups=F3D3-F3D7)
    mothur > tree.shared(shared=final.opti_mcc.shared, groups=F3D8-F3D149)

Keep in mind that these will output to files with the same name. So, it
is important to change the file name between commands. The following
reverts to the default behavior:

    mothur > tree.shared(shared=final.opti_mcc.shared, groups=all)

This is the same as:

    mothur > tree.shared(shared=final.opti_mcc.shared, groups=F3D0-F3D1-F3D141-F3D142-F3D143-F3D144-
    F3D145-F3D146-F3D147-F3D148-F3D149-F3D150-F3D2-F3D3-F3D5-F3D6-F3D7-F3D8-F3D9)

### label

There may only be a couple of lines in your OTU data that you are
interested in summarizing. There are two options. You could: (i)
manually delete the lines you aren't interested in from you rabund,
sabund, list, or shared file; (ii) or use the label option. 

### subsample

The subsample parameter allows you to enter the size pergroup of the
sample or you can set subsample=T and mothur will use the size of your
smallest group.

### iters

The iters parameter allows you to choose the number of times you would
like to run the subsample. Default=1000.

### processors

The processors option enables you to accelerate the alignment by using
multiple processors. Default processors=Autodetect number of available
processors and use all available.

### withreplacement

The withreplacement parameter allows you to indicate you want to
subsample your data allowing for the same read to be included multiple
times. Default=f.

## Revisions

-   1.28.0 Added count parameter
-   1.29.0 added subsampling parameters
-   1.29.0 Bug Fix: - if shared file was not in alphabetical order. All
    shared files created by make.shared after 6/10 are sorted.
-   1.29.2 Bug Fix: - subsampling with eliminated groups caused crashes.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.0 - Fixes segfault error for commands that use subsampling.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.41.0 - Fixes results with shared file.
    [\#535](https://github.com/mothur/mothur/issues/535)
-   1.42.0 - Adds withreplacement parameter to sub.sample command.
    [\#262](https://github.com/mothur/mothur/issues/262)
-   1.44.0 - BUG FIX: Fixes **tree.shared** distance being used instead of
    similarity.
