---
title: 'Cluster'
tags: 'commands'
---
Once a distance matrix gets read into mothur, the
**cluster** command can be used to assign sequences to
OTUs. Presently, mothur implements three clustering methods:

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
-   [Unique](Unique): Creates a list file from a name or
    count file where every unique sequence is assigned to it\'s own OTU

If there is an algorithm that you would like to see implemented, please
consider either contributing to the mothur project or contacting the
developers and we\'ll see what we can do. The opticlust algorithm is the
default option. For this tutorial you should download the [
Final.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/final.zip) file and decompress it.


## Default settings

Either a [phylip-formatted distance
matrix](phylip-formatted_distance_matrix) or a
[column-formatted distance
matrix](column-formatted_distance_matrix) must be inputted
for **cluster** to be successful, the default output of the dist.seqs
command is the column-format. If you have a favorite format, please let
us know and we can work with you to incorporate that feature into
mothur. Because the phylip format is so popular most software can
generate this format for you.

### phylip

To read in a [phylip-formatted distance
matrix](phylip-formatted_distance_matrix) you need to use the
phylip option:

    mothur > cluster(phylip=final.phylip.dist)

Whereas dotur required you to indicate whether the matrix was square or
lower-triangular, mothur is able to figure this out for you.

Once you execute the command, mothur reads in the matrix and generates a
progress bar:

    mothur > cluster(phylip=final.phylip.dist)
    *******************#****#****#****#****#****#****#****#****#****#****#
    Reading matrix:    |||||||||||||||||||||||||||||||||||||||||||||||||||
    **********************************************************************

### column & name or count

To read in a [column-formatted distance
matrix](column-formatted_distance_matrix) you must provide a
filename for the name or count option. The .names file was generated
during the [unique.seqs](unique.seqs) command.

    mothur > cluster(column=final.dist, name=final.names)

or

    mothur > cluster(column=final.dist, count=final.count_table)

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

    mothur > cluster(phylip=final.phylip.dist, name=final.names)

mothur remembers that the distances for the reference sequence also
apply to all of the sequences listed in the second column. Using a name
file can considerably accelerate the amount of processing time required
to analyze some data sets.

By default cluster() executes the opticlust clustering algorithm. For a
detailed description of this and the other algorithms check out the
[example clustering
calculations](example_clustering_calculations) page. Next
lets run the cluster() command:

    mothur > cluster(phylip=final.phylip.dist, name=final.names)

This command will generate the following output:

    Clustering /Users/sarahwestcott/desktop/release/final.phylip.dist


    iter   time    label   num_otus    cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0  0   0.03    3772    0.03    0   7059666 0   52440   0   1   0   0.992627    0   0.992627    0   0   
    1  0   0.03    1261    0.03    27541   7053368 6298    24899   0.525191    0.999108    0.813883    0.996482    0.186117    0.995614    0.651823    0.638417    
    2  0   0.03    1184    0.03    30143   7052434 7232    22297   0.574809    0.998976    0.806502    0.996848    0.193498    0.995848    0.678933    0.671224    
    3  0   0.03    1176    0.03    30254   7052676 6990    22186   0.576926    0.99901 0.812319    0.996864    0.187681    0.995898    0.682669    0.67468 
    4  0   0.03    1175    0.03    30283   7052713 6953    22157   0.577479    0.999015    0.813272    0.996868    0.186728    0.995907    0.683404    0.675387    
    5  0   0.03    1176    0.03    30256   7052761 6905    22184   0.576964    0.999022    0.814187    0.996864    0.185813    0.99591 0.683487    0.67535 

Running the cluster() command generates a [list](list_file).
The data outputted to the screen is the same as that in the sabund file.
You will notice that the list file has a \".opti.\" tag inserted after
the name of the distance matrix. opti corresponds to the algorithm that
was used to perform the clustering. In this case opticlust (opti) was
used. Other possibilities include \"an\" for average neighbor, \"fn\"
for furthest neighbor, \"nn\" for nearest neighbor. Vsearch clustering
algorithms include: \"agc\" and \"dgc\".

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

    mothur > cluster(phylip=final.phylip.dist, count=final.count_table)

## Options

### method

The methods available in mothur include opticlust (opti), average
neighbor (average), furthest neighbor (furthest), nearest neighbor
(nearest), Vsearch agc (agc), Vsearch dgc (dgc) and Unique (unique). By
default cluster() uses the opticlust algorithm; this can be changed with
the method option.

    mothur > cluster(column=final.dist, count=final.count_table, method=opti)

To obtain a average neighbor clustering of the data use the method
option to produce the subsequent output:

    mothur > cluster(column=final.dist, count=final.count_table, method=average, cutoff=0.15)

    unique 4652    2678    442 124 69  59  35  32  20  17  16  18  12  9   7   6   6   3   2   9   9   7   9   6   5   6   3   21
    0.01   4964    1896    316 115 65  40  24  20  19  13  10  12  9   11  4   9   5   7   4   2   3   7   7   7   4   6   8   51
    0.02   5451    986 184 84  49  28  17  14  17  7   10  7   9   3   6   2   6   4   2   1   3   2   1   3   3   2   3   01
    0.03   6129    624 144 49  39  17  14  11  8   10  7   5   8   6   5   1   4   5   0   2   1   0   3   2   1   0   1   11
    0.04   6159    411 108 44  22  11  9   6   7   7   8   5   7   3   4   1   4   3   2   1   1   1   2   1   2   0   1   11
    0.05   7023    258 92  36  23  11  2   5   2   6   8   4   6   2   5   1   3   3   1   1   0   1   2   1   0   0   1   01
    changed cutoff to 0.0533794

### metric

The metric parameter allows to select the metric in the opticluster
method. Options are Matthews correlation coefficient (mcc), sensitivity
(sens), specificity (spec), true positives + true negatives (tptn),
false positives + false negatives (fpfn), true positives (tp), true
negative (tn), false positive (fp), false negative (fn), f1score
(f1score), accuracy (accuracy), positive predictive value (ppv),
negative predictive value (npv), false discovery rate (fdr).
Default=mcc.

    mothur > cluster(column=final.dist, count=final.count_table, metric=tptn)

    iter   time    label   num_otus    cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0  0   0.03    3772    0.03    0   7059666 0   52440   0   1   0   0.992627    0   0.992627    0   0   
    1  0   0.03    1341    0.03    26876   7054616 5050    25564   0.51251 0.999285    0.841822    0.996389    0.158178    0.995696    0.654974    0.637129    
    2  0   0.03    1268    0.03    28633   7054797 4869    23807   0.546014    0.99931 0.854665    0.996637    0.145335    0.995968    0.681349    0.666333    
    3  0   0.03    1265    0.03    28733   7054853 4813    23707   0.547921    0.999318    0.856525    0.996651    0.143475    0.99599 0.683295    0.668318    

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
The cutoff can be set for the **cluster** command as follows:

    mothur > cluster(column=final.dist, count=final.count_table, cutoff=0.05) 

    iter   time    label   num_otus    cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0  0   0.05    3772    0.05    0   6918676 0   193430  0   1   0   0.972803    0   0.972803    0   0   
    1  0   0.05    699 0.05    126630  6892041 26635   66800   0.654655    0.99615 0.826216    0.990401    0.173784    0.986863    0.729012    0.730498    
    2  1   0.05    625 0.05    133759  6887952 30724   59671   0.691511    0.995559    0.813209    0.991411    0.186791    0.98729 0.743526    0.747439    
    3  0   0.05    620 0.05    134033  6887845 30831   59397   0.692928    0.995544    0.812991    0.99145 0.187009    0.987313    0.744201    0.748173    
    4  0   0.05    621 0.05    133952  6888036 30640   59478   0.692509    0.995571    0.813843    0.991439    0.186157    0.987329    0.744378    0.748289    
    5  0   0.05    621 0.05    133952  6888036 30640   59478   0.692509    0.995571    0.813843    0.991439    0.186157    0.987329    0.744378    0.748289    

To obtain the OTUs for more than one cutoff using the opti, agc or dgc
method, run the following:

    mothur > cluster(column=final.dist, count=final.count_table, cutoff=0.03-0.05) 

    Clustering /Users/sarahwestcott/desktop/release/final.dist


    iter   time    label   num_otus    cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score

    0.03
    0  0   0.03    3772    0.03    0   7059666 0   52440   0   1   0   0.992627    1   0.992627    0   0   
    1  0   0.03    1252    0.03    30175   7051303 8363    22265   0.57542 0.998815    0.782993    0.996852    0.782993    0.995694    0.66919 0.663347    
    2  1   0.03    1167    0.03    32229   7050338 9328    20211   0.614588    0.998679    0.775537    0.997142    0.775537    0.995847    0.688374    0.685745    
    3  0   0.03    1162    0.03    32317   7050391 9275    20123   0.616266    0.998686    0.777   0.997154    0.777   0.995866    0.689977    0.687362    
    4  0   0.03    1161    0.03    32167   7050686 8980    20273   0.613406    0.998728    0.781758    0.997133    0.781758    0.995887    0.690497    0.687425        
    5  0   0.03    1158    0.03    32165   7050714 8952    20275   0.613368    0.998732    0.78228 0.997133    0.78228 0.995891    0.690708    0.687602    
    6  0   0.03    1158    0.03    32177   7050699 8967    20263   0.613596    0.99873 0.782058    0.997134    0.782058    0.99589 0.690739    0.68766 



    0.05
    0  0   0.05    3772    0.05    0   6918676 0   193430  0   1   0   0.972803    1   0.972803    0   0   
    1  1   0.05    685 0.05    130804  6888303 30373   62626   0.676234    0.99561 0.811555    0.99099 0.811555    0.986924    0.734292    0.737741    
    2  0   0.05    628 0.05    133982  6887553 31123   59448   0.692664    0.995502    0.811496    0.991443    0.811496    0.987265    0.74334 0.747386    
    3  1   0.05    624 0.05    133831  6887977 30699   59599   0.691883    0.995563    0.813414    0.991422    0.813414    0.987304    0.743829    0.747743    
    4  0   0.05    623 0.05    133899  6887991 30685   59531   0.692235    0.995565    0.81356 0.991431    0.81356 0.987315    0.744092    0.74801 
    5  1   0.05    623 0.05    133916  6888006 30670   59514   0.692323    0.995567    0.813654    0.991434    0.813654    0.98732 0.744185    0.748101    

### precision

If you want greater precision, there is a precision option in the
cluster() command:

    mothur > cluster(column=final.dist, count=final.count_table, method=average,  precision=1000, cutoff=0.10)
    unique 4652    2678    442 124 69  59  35  32  20  17  16  18  12  9   7   6   6   3   2   9   9   7   9   6   5   6   3   21
    0.004  4964    2300    411 112 72  38  31  23  21  10  16  15  12  14  12  4   3   8   4   5   6   7   8   4   7   5   5   31
    0.005  4964    2276    396 103 70  40  29  23  19  10  15  16  13  12  9   6   5   6   4   7   6   6   8   4   6   6   6   41
    0.006  4964    2259    371 110 71  36  28  25  21  8   15  16  12  11  5   7   6   6   5   7   4   6   9   4   4   5   7   51
    0.007  4964    2253    361 104 65  38  27  25  21  8   15  15  10  11  5   7   7   7   5   6   4   6   9   6   4   6   7   51
    0.008  4964    1970    361 121 69  39  23  24  20  12  14  12  13  11  7   9   6   7   3   5   4   8   6   5   5   8   5   71
    0.009  4964    1937    353 111 68  36  27  22  20  11  13  13  9   10  4   10  7   8   4   4   3   7   4   6   4   5   8   71
    0.010  4964    1901    313 114 68  39  25  20  20  13  10  12  8   11  2   8   6   7   4   2   3   7   7   7   6   5   8   51
    0.011  4983    1603    296 127 64  33  27  20  17  14  9   11  10  7   3   6   8   7   5   4   3   6   7   7   3   4   6   61
    0.012  5011    1500    282 118 57  27  27  19  14  18  7   9   7   6   5   5   8   4   4   5   3   4   4   6   5   3   3   61
    0.013  5371    1453    258 113 55  25  26  16  13  14  7   9   6   6   7   5   7   4   3   4   3   3   4   5   5   4   4   51
    0.014  5380    1419    247 100 55  19  22  19  12  12  8   8   8   6   5   5   6   4   3   1   6   3   2   6   3   4   5   61
    0.015  5447    1249    236 111 54  22  21  17  13  13  8   6   7   5   7   3   8   2   3   1   5   3   3   4   4   3   5   31
    0.016  5450    1207    223 100 54  22  19  16  14  11  9   7   8   4   6   5   7   2   2   2   4   2   2   3   4   3   4   31
    0.017  5450    1173    200 97  56  25  21  14  15  10  9   7   8   4   6   5   7   1   1   1   4   2   2   3   3   3   4   31
    0.018  5450    1154    192 89  52  26  19  14  15  11  9   7   8   3   4   5   7   2   1   1   3   3   2   3   3   3   3   21
    0.019  5450    1020    207 85  53  29  19  15  15  13  8   6   7   2   6   5   5   2   2   1   3   3   1   4   3   2   3   11
    0.020  5451    987 186 80  49  29  16  16  16  9   9   7   8   3   7   2   6   4   2   1   3   2   1   3   3   2   3   01
    0.021  5451    968 172 70  44  29  16  19  14  9   9   8   9   3   6   2   6   5   2   1   2   2   1   3   3   1   2   11
    0.022  6114    884 185 69  39  29  13  18  14  9   8   7   9   4   5   2   7   5   2   2   1   1   2   3   3   1   2   11
    0.023  6114    846 180 66  39  25  14  17  12  8   10  6   9   4   6   2   6   5   2   2   1   1   2   2   2   2   2   11
    0.024  6114    817 166 69  41  23  11  16  13  10  10  5   8   4   5   0   8   6   2   2   2   1   2   2   2   1   3   11
    0.025  6115    802 162 62  40  23  11  14  12  9   12  6   7   4   5   0   8   6   1   1   1   1   3   2   1   1   2   01
    0.026  6115    744 168 62  37  20  13  11  11  10  11  7   7   5   3   1   5   6   0   2   2   1   3   2   1   1   2   01
    0.027  6115    725 163 57  38  18  15  10  11  10  11  7   7   4   4   1   4   6   0   2   2   1   3   1   1   0   3   01
    0.028  6115    705 146 52  40  17  15  12  12  9   8   7   9   3   5   1   4   5   0   2   2   1   2   2   1   0   2   01
    0.029  6118    671 147 51  39  16  15  13  10  7   7   8   9   5   5   1   4   5   0   2   2   1   2   2   1   0   2   01
    0.030  6129    622 148 50  39  17  14  12  9   8   6   7   9   6   5   1   4   5   0   2   1   0   3   2   1   0   1   11
    0.031  6129    603 133 54  37  17  15  10  9   9   7   5   7   8   6   1   4   5   0   2   1   0   3   2   1   0   1   11
    0.032  6130    583 127 46  38  15  16  7   9   8   7   6   6   6   6   2   4   5   0   2   0   1   3   2   1   0   0   11
    0.033  6136    533 130 50  37  14  14  6   8   7   6   7   7   5   5   2   4   4   0   2   0   1   3   2   1   0   0   11
    0.034  6153    525 125 47  35  15  13  6   8   8   6   7   7   4   3   2   4   4   0   2   1   1   3   2   1   0   0   11
    changed cutoff to 0.0342406

Remember that the 16S rRNA gene is roughly 1,500 bp long. So it would
seem silly to have a precision greater than 1,000. Just because you can
calculate a number to 20 digits, doesn\'t mean they\'re all significant.

### sim

The sim parameter is used to indicate that your input file contains
similarity values instead of distance values. The default is false, if
sim=true then mothur will convert the similarity values to distances.

## Clustering with vsearch

The vsearch program is written by [the vsearch
team](https://github.com/torognes/vsearch). You can now use vsearch
clustering methods through mothur.

### fasta

Vsearch requires a fasta file to cluster.

    mothur > cluster(fasta=final.fasta, count=final.count_table, method=agc)

### Vsearch methods

The available clustering methods are agc and dgc.

    mothur > cluster(fasta=final.fasta, count=final.count_table, method=dgc)

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

    mothur > cluster(column=final.dist, count=final.count_table)
     
    iter   time    label   num_otus    cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0  0   0.03    3772    0.03    0   7059666 0   52440   0   1   0   0.992627    0   0.992627    0   0   
    1  0   0.03    1249    0.03    27469   7053405 6261    24971   0.523818    0.999113    0.814379    0.996472    0.185621    0.995609    0.651167    0.637554    
    2  0   0.03    1178    0.03    30311   7052546 7120    22129   0.578013    0.998991    0.809783    0.996872    0.190217    0.995887    0.682234    0.674545    
    3  0   0.03    1174    0.03    30877   7052133 7533    21563   0.588806    0.998933    0.803879    0.996952    0.196121    0.995909    0.686061    0.679736    
    4  0   0.03    1172    0.03    31138   7051940 7726    21302   0.593783    0.998906    0.801204    0.996988    0.198796    0.995919    0.687808    0.682073    
    5  0   0.03    1173    0.03    31237   7051921 7745    21203   0.595671    0.998903    0.801319    0.997002    0.198681    0.99593 0.688956    0.683358    
    6  0   0.03    1173    0.03    31268   7051953 7713    21172   0.596262    0.998907    0.802134    0.997007    0.197866    0.995939    0.689655    0.684044    
    7  0   0.03    1172    0.03    31336   7051924 7742    21104   0.597559    0.998903    0.801883    0.997016    0.198117    0.995944    0.6903  0.684805    
    8  0   0.03    1172    0.03    31394   7051880 7786    21046   0.598665    0.998897    0.801276    0.997024    0.198724    0.995946    0.690677    0.685309    
    9  0   0.03    1173    0.03    31367   7051922 7744    21073   0.59815 0.998903    0.801999    0.997021    0.198001    0.995948    0.690694    0.685236    

    mothur > cluster(column=final.dist, count=final.count_table)
     
    iter   time    label   num_otus    cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0  0   0.03    3772    0.03    0   7059666 0   52440   0   1   0   0.992627    0   0.992627    0   0   
    1  0   0.03    1250    0.03    29483   7051666 8000    22957   0.562223    0.998867    0.78657 0.996755    0.21343 0.995647    0.66296 0.655739    
    2  0   0.03    1165    0.03    31938   7050687 8979    20502   0.609039    0.998728    0.780556    0.997101    0.219444    0.995855    0.687484    0.684212    
    3  0   0.03    1167    0.03    32087   7050748 8918    20353   0.61188 0.998737    0.782514    0.997122    0.217486    0.995884    0.68997 0.686757    
    4  0   0.03    1169    0.03    31986   7051007 8659    20454   0.609954    0.998773    0.78696 0.997108    0.21304 0.995907    0.690857    0.687243    
    5  0   0.03    1168    0.03    31948   7051085 8581    20492   0.60923 0.998785    0.788275    0.997102    0.211725    0.995912    0.691029    0.687283    
    6  0   0.03    1170    0.03    31966   7051075 8591    20474   0.609573    0.998783    0.788175    0.997105    0.211825    0.995913    0.69118 0.687463    
    7  0   0.03    1170    0.03    31932   7051142 8524    20508   0.608924    0.998793    0.789302    0.9971  0.210698    0.995918    0.69131 0.687478    
    8  0   0.03    1170    0.03    31905   7051185 8481    20535   0.60841 0.998799    0.790001    0.997096    0.209999    0.99592 0.691326    0.687415    

The variability is caused by the randomization of the sequences.

## Revisions

-   1.27.0 - reduced memory by 50% and increased speed by 55%.
-   1.28.0 - added count parameter
-   1.34.0 - Bug Fix: nearest method caused crash.
-   1.35.0 - Clustering commands did not include the count file info.
    when printing list file OTU order. Only effects clustering commands.
    \*.pick commands must preserve otuLabels order. -
    [https://forum.mothur.org/viewtopic.php?f=3&t=3460&p=10483#p10483](https://forum.mothur.org/viewtopic.php?f=3&t=3460&p=10483#p10483).
-   1.37.0 - Adds vsearch clustering methods: agc and dgc.
    [\#169](https://github.com/mothur/mothur/issues/169)
-   1.38.0 - Fixes bug with age method.
-   1.38.1 - Removes hard parameter.
-   1.39.0 - Adds opticlust method. opti new default clustering method.
-   1.39.0 - Adds agc and dgc methods of Windows users.
-   1.39.1 - Corrects printing issues with opticlust method.
-   1.40.4 - Bug Fix: Cluster commands printing of list file.
    [\#454](https://github.com/mothur/mothur/issues/454)
-   1.40.4 - Bug Fix: method agc and dgc do not require distance matrix.
    [\#456](https://github.com/mothur/mothur/issues/456)
-   1.41.0 - Adds multiple cutoffs to **cluster** command for opti, agc and
    dgc. [\#305](https://github.com/mothur/mothur/issues/305)
-   1.41.0 - Nearest neighbor bug fix.
-   1.43.0 - Changes datatype for opti method to correct overflow.


