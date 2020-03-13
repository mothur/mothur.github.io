---
title: 'classify.svm'
tags: 'commands'
redirect_from: '/wiki/Classify.svm'
---
The **classify.svm** command generates a summary
file of ranked OTUs. This ranking is determined by the method of
*support vector machine recursive feature elimination* (SVM-RFE). The
summary file format is similar to that produced by
[classify.shared](classify.shared). The first column gives
OTU label and the second column gives OTU rank. Unlike the ranks
produced by [classify.shared](classify.shared),
**classify.svm** only gives an ordering of OTUs.

Support vector machine learning has been extensively studied and is
widely used, but the first-time user is presented with many obstacles to
achieving good performance. The **classify.svm**
command by default will apply several different parameters and report
the results although this adds time to the process. The user may be able
to reduce the run time by examining the summary and selecting the
best-performing parameters to be specified as part of the command.


## Default settings

A shared file and a design file must be specified. Other parameters may
be specified, otherwise default parameter ranges will be used.

    classify.svm(shared=Stool.0.03.subsample.0.03.filter.shared, design=Stool.0.03.subsample.0.03.filter.mix.design)

The output will indicate which parameters were chosen. It may be that
parameter ranges other than the defaults will give better results.
Reducing the number of parameters can also reduce training time.

OTU ranks are given at the end of the output. The ranks correspond to
the RFE round in which the OTU was removed from consideration, and since
in most rounds multiple OTUs are eliminated there will groups of OTUs
with the same rank.

    ...
    SVM-RFE round 18:
    3 unranked features
    multiclass SVM accuracy: 0.591
    two-class SVM performance
          class 1      class 2 precision    recall         f  accuracy
      Partition_2  Partition_1     0.709     0.984     0.824     0.782
      Partition_3  Partition_1     0.731         1     0.845     0.787
      Partition_3  Partition_2     0.837     0.456      0.59     0.645
    eliminating 1 feature(s) of 3 total features

    SVM-RFE round 19:
    2 unranked features
    multiclass SVM accuracy: 0.518
    two-class SVM performance
          class 1      class 2 precision    recall         f  accuracy
      Partition_2  Partition_1     0.705         1     0.827     0.782
      Partition_3  Partition_1     0.747     0.925     0.827     0.774
      Partition_3  Partition_2     0.563         1     0.721     0.563
    eliminating 1 feature(s) of 2 total features


    ordered features:
    index         OTU Rank
        1    Otu29741    1
        2    Otu29678    2
        3    Otu19061    3
        4    Otu29409    4
        5    Otu29664    5
        6    Otu29836    5
        7    Otu07696    6
        8    Otu29781    6
        9    Otu19310    6
       10    Otu19349    7
       11    Otu29279    7
       12    Otu04405    7
       13    Otu04840    8
       14    Otu27999    8
       15    Otu29641    8
       16    Otu04824    8
       17    Otu19278    9
       18    Otu19204    9
       19    Otu29733    9
       20    Otu10883    9

    Output File Names: 
    ../data/Stool.0.03.subsample.0.03.filter.0.03.summary

While the output shows the best multi-class SVM score is 0.518 in the
final round, this does not necessarily indicate poor performance on the
part of SVM-RFE.

Finally the command will produce a *summary file* in the folder of the
shared file, which will be similar to this:

    index         OTU Rank
        1    Otu29741    1
        2    Otu29678    2
        3    Otu19061    3
        4    Otu29409    4
        5    Otu29664    5
        6    Otu29836    5
        7    Otu07696    6
        8    Otu29781    6
        9    Otu19310    6
       10    Otu19349    7
       11    Otu29279    7
       12    Otu04405    7
       13    Otu04840    8
       14    Otu27999    8
       15    Otu29641    8
       16    Otu04824    8
       17    Otu19278    9
       18    Otu19204    9
       19    Otu29733    9
       20    Otu10883    9
    ...

The first column denotes the names of the OTUs and the second column
gives a comparative rank (importance) of the OTUs. In this case the
recursive feature elimination process has found `Otu29741`, `Otu29678`,
and `Otu19061` to be the top three most important features.

## Options

### mode

By default **classify.svm** will use recursive feature elimination to rank
OTUs in order of relevance for discriminating among the design file
groups. If \'mode=classify\' is specified **classify.svm** will train
support vector machines on the specified data and report the best
classification performance.

### transform

SVM performance depends on scaling the features. By default the data
will be transformed so that each feature has zero mean and unit variance
\'zeromeanunitvariance\'. If SVM performance is poor with the default
normalization the optional normalization \'zeroone\' may give better
results. This option transforms all feature values to lie in the range
\[0.0, 1.0\].

### evaluationfoldcount

Option `evaluationfoldcount` specifies the number of cross validation
folds to be used for assessing the performance of SVMs with the best
parameters chosen during training. For example,     evaluationfoldcount=5
means 4/5 of the data will be used for training and choosing the best
parameters while 1/5 of the data will be used to test the performance of
the best SVMs. The larger fraction of the data will be referred to as
the \'development\' dataset and the smaller fraction as \'evaluation\'
dataset.

Increasing `evaluationfoldcount` may result in better classification and
feature selection performance but will certainly increase the time
required to train SVMs. Furthermore, if `evalutionfoldcount` is made too
large the evaluation dataset may become very small or empty and SVM
training will fail.

The default value for `evaluationfoldcount` is 3.

    classify.svm(shared=Stool.0.03.subsample.0.03.filter.shared, design=Stool.0.03.subsample.0.03.filter.mix.design, evaluationfoldcount=5)

### trainingfoldcount

Option `trainigfoldcount` specifies the number of cross validation folds
that will be used when training SVMs. For example, if
`trainingfoldcount=5` then 4/5 of the \'development\' dataset will be
used to train and 1/5 of the \'development\' dataset will be used to
measure and compare performance of the SVMs. The larger fraction of data
will be referred to as the \'training\' dataset and the smaller as the
\'testing\' dataset.

Increasing `trainingfoldcount` may improve classification score but will
certainly increase the training time. Choosing a large
`trainingfoldcount` with a small dataset may result in failure to train
SVMs by reducing the testing dataset size to 0.

The default value for `trainingfoldcount` is 10.

    classify.shared(shared=inpatient.shared, design=inpatient.design, trainingfoldcount=5)

### kernel

For simple classification, but not feature selection with SVM-RFE, one
or more kernel functions may be specified. SVMs will be trained with all
specified kernel functions and the best performing kernel will chosen by
cross validation. The allowed values are \'linear\', \'rbf\',
\'polynomial\', and \'sigmoid\'.

Training time will increase with each additional kernel.

The default is `kernel=linear-rbf-polynomial`.

Each kernel has one more more additional parameters which are detailed
below. These parameters may be set to a single value or a list. If a
list is specified the best value will be selected by cross validation,
but classification performance may be improved by refining parameter
values over repeated runs. Training time will increase as more parameter
values are used.

### linearconstant

The linear kernel has only one parameter, an additive constant. Any
floating point value is allowed for this parameter.

The default is     linearconstant=0.0;-1.0;1.0;-10.0;10.0

### rbfgamma

The radial basis function (rbf) kernel has only one parameter, a
multiplicative constant usually referred to as gamma. Only positive,
non-zero floating point values are allowed.

The default is `rbfgamma=0.0001;0.001;0.01;0.1;1.0;10.0;100.0`.

### polynomialdegree,polynomialcoefficient,polynomialconstant

The polynomial kernel has three parameters, an exponent (or degree), a
multiplicative constant, and an additive constant. Positive integers are
allowed for the degree. Any positive, non-zero floating point value is
allowed for the multiplicative constant. Any floating point value is
allowed for the additive constant.

The default values are `polynomialdegree=2;3;4` and
`polynomialconstant=0.0;-1.0;1.0;-2.0;2.0;-3.0;3.0`.

### sigmoidalpha,sigmoidconstant

The sigmoid kernel has two parameters, a multiplicative constant
referred to here as \'alpha\' and an additive constant.

### linearsmoc,rbfsmoc,polynomialsmoc,sigmoidsmoc

The Sequential Minimal Optimization (SMO) algorithm is used to train
SVMs. This algorithm has one tunable parameter generally known as \'C\'.
This parameter scales the penalty for misclassified observations during
training. A list of C values can be specified for each kernel with the
`linearsmoc`,`rbfsmoc`, and `polynomialsmoc` options and the best value
will be selected by cross validation. Only positive, non-zero values
make sense. Zero or negative values will cause an error.

Classification performance may be improved by refining the SMO C
parameter over repeated training runs. For example, if training with
default SMO C values results in C=10.0 being selected from the default
list then a second round of training with     smoc=6.0,8.0,10.0,12.0,14.0
may result in a better score.

Training time increases with the number of SMO C values.

By default `smoc=0.001,0.01,0.1,1.0,10.0,100.0,1000.0`.

### stdthreshold

The microbial ecology data that we get sometimes is filled with OTUs
(features) that effectively has no *variance* in them, some of them can
be all zero or similar value filled. These features actually contribute
negatively to the algorithm and we normally want to filter them out. The
`stdthreshold` parameter does this for us. You can specify a small
standard deviation value, any feature that has a standard deviation less
than this will be filtered out.

    classify.shared(shared=inpatient.shared, design=inpatient.design, stdthreshold=0.1)

## Sample Command

Here is a sample command with all the options turned on.

    classify.shared(shared=inpatient.final.an.0.03.subsample.avg.shared,
                    design=inpatient.final.an.0.03.subsample.avg.design, numtrees=100,
                    splitcriteria=gainratio, prune=t, pruneaggressiveness=0.9, 
                    discarderrortrees=t, errorthreshold=0.4, otupersplit=log2, stdthreshold=0.1)

## Revisions


