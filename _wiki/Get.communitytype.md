---
title: 'Get.communitytype'
---
The **get.communitytype** command employs probabilistic modelling to cluster
microbial communities into metacommunities, or enterotypes. The approach
attempts to model the data as an increasing number of enterotypes using
several techniques to identify the best fit to the data. The default
method is based on [Dirichlet multinomial mixtures as described by
Holmes et
al.](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0030126).
This approach was developed as it allows for clustering from unevenly
sampled populations (i.e. different numbers of sequences per group).
Several statistical techniques are employed to evalulate the fit of each
number of metacommunities to the data, including the Bayesian
information crition, Akaike information criterion and Laplace
approximation. The Laplace approximation is recommended for selecting
the best number of metacommunities.

Output files on the **get.communitytype** command include a [
relabund](Relabund_file) file describing the OTU distribution
for each number of metacommunities, and a posterior file that displays
the membership of each sample group to the metacommunities described.
The results of the best fitting number of metacommunities is also
summarised in a design file. It is important to note that mothur will
find the optimal number of metacommunities by increasing the number of
partitions until a local minimum Laplace value is observed. As a result
a number of output files will be generated and it is up to the user to
select the correct [ relabund](Relabund_file) file to
describe the metacommunities.

## Defaults

The shared file is required.

    mothur > get.communitytype(shared=test.0.03.subsample.shared)

## Options

### minpartitions

The minpartitions parameter is used to \.... Default=5.

### maxpartitions

The maxpartitions parameter is used to set the maximum number of
partitions to be tested. If a minimum Laplace value is observed before
reaching the maxpartitions value the command will exit before reaching
it. Default=10.

### optimizegap

The optimizegap parameter is used to set how many additional partitions
to be tested after observing a new best fit. Default=3.

### groups

The groups parameter allows you to specify which of the groups in your
shared file you would like analyzed. Group names are separated by
dashes.

    mothur > get.communitytype(shared=test.0.03.subsample.shared, groups=F3D0-F3D1-F3D11-F3D125-F3D13)

### label

The label parameter is used to analyze specific labels in your input.
Labels are separated by dashes.

    mothur > get.communitytype(shared=test.0.03.subsample.shared, label=0.03)

### method

The method parameter allows to select the method you would like to use.
Options are dmm, kmeans and pam. Default=dmm.

### calc

The calc parameter allows to select the calculator you would like to use
to calculate the distance matrix used by the pam and kmeans methods. By
default the rjsd calculator is used.

### iters

The iters parameter allows you to choose the number of times you would
like to run the subsample while calculating the distance matrix for the
pam and kmeans methods.

### subsample

The subsample parameter allows you to enter the size pergroup of the
sample or you can set subsample=T and mothur will use the size of your
smallest group while calculating the distance matrix for the pam and
kmeans methods.

### withreplacement

The withreplacement parameter allows you to indicate you want to
subsample your data allowing for the same read to be included multiple
times. Default=f.

## Revisions

-   1.31.0 - First Introduced
-   1.32.0 - Name changed from get.metacommunity to get.communitytype.
-   1.32.0 - Bug Fix: order of sample names was not correct in
    .mix.posterior file if the shared file was not sorted.
-   1.33.0 - added dmm, pam and kmeans methods.
-   1.33.0 - added the method, calc, iters and subsample parameters.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Fixes segfault error for commands that use subsampling.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.5 - Fixes crash **get.communitytype** crash.
    [\#472](https://github.com/mothur/mothur/issues/472)
-   1.42.0 - Adds withreplacement parameter to sub.sample command.
    [\#262](https://github.com/mothur/mothur/issues/262)

[Category:Commands](Category:Commands)
