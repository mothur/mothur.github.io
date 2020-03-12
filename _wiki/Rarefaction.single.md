---
title: 'Rarefaction.single'
tags: 'commands'
---
The **rarefaction.single** command will
generate intra-sample rarefaction curves using a re-sampling without
replacement approach. Rarefaction curves provide a way of comparing the
richness observed in different samples. Roughly speaking you get the
number of OTUs, on average, that you would have been expected to have
observed if you hadn\'t sampled as many individuals. Although a formula
exists to generate a rarefaction curve (see the [ example
calculation](rarefaction)), mothur uses a randomization
procedure. It can also help you to assess your sampling intensity. If a
rarefaction curve becomes parallel to the x-axis, you can be reasonably
confident that you have done a good job of sampling and can trust the
observed level of richness. Otherwise, you need to keep sampling.
Rarefaction is actually a better measure of diversity than it is of
richness. For this tutorial you should download and decompress
[AmazonData.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip)


## Default settings

Enter either of the following sets of commands:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list)

or to run the single analysis with multiple samples:

    mothur > make.shared(list=98_lt_phylip_amazon.fn.list, group=amazon.groups)
    mothur > rarefaction.single(shared=98_lt_phylip_amazon.fn.shared)

mothur implements its rarefaction calcualtions via randomization. There
is a formula for calculating the values, but because it involves a
number of factorial calculations, it takes a lot of time and memory to
evaluate. By default, the rarefaction.single() command uses 1,000
randomizations to generate the rarefaction curve data for the observed
number of OTUs (i.e. sobs). To run rarefaction.single() enter:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list)

This will result in output to the screen looking like:

    unique 1
    0.00   2
    0.01   3
    0.02   4
    0.03   5
    0.04   6
    0.05   7
    0.06   8
    0.07   9
    0.08   10
    0.09   11
    0.10   12

The left column indicates the label for each line in the data set and
the right column indicates the row number in the data set. Execution of
rarefaction.single() will generate the
98\_sq\_phylip\_amazon.fn.rarefaction file, which will look something
like:

    numsampled unique  lci hci 0.00    lci hci 0.01    lci hci 0.02    lci hci
    1      1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000
    98     96.0000 96.0000 96.0000 95.0000 95.0000 95.0000 93.0000 93.0000 93.0000 89.0000 89.0000 89.0000

The first column indicates the level of sampling intensity; by default
this information is provided every 100 individuals. The subsequent
columns are triplets. The first column of the triplet is the average
number of OTUs that were observed for that sampling intensity based on
the number of iterations, which is 1,000 by default. The second and
third columns are the bounds on the upper and lower 95% confidence
intervals for that average. In other words, the observed richness was
between those two numbers in 950 of the 1,000 iterations. Obviously, the
average and the confidence interval values are the same when one
individual or all of the individuals have been sampled.

## Options

### calc

In the paper by Hughes et al.
[1](https://aem.asm.org/cgi/content/full/67/10/4399?view=long&pmid=11571135)
it was suggested that people may want to rarefy various non-parametric
richness estimators. Our experience indicates that for some reason this
generates very weird and misleading results. Regardless, it is possible
to rarefy any of the estimators and the output file will end in the name
of the estimator with an \"r\_\" prefix:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, calc=chao)

This command will rarefy the Chao1 estimator. You can rarefy multiple
estimators with the command:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, calc=sobs-chao-ace)

The above command will generate files ending in \"rarefaction\",
\"r\_chao\", and \"r\_ace\". They will have the same format as described
above. It is important to note that the 95% confidence interval data
will be the confidence interval for the estimator, not the estimator\'s
95% confidence interval.

### abund

By default the [ACE estimator](ACE_estimator) uses 10 as the
cutoff between OTUs that are rare and abundant. So if an OTU has more
than 10 individuals in it, then it is considered abundant. This is
really just an empirical decision and we are merely following the lead
of Anne Chao and others who implement 10 in their software. If you would
like to use a different cutoff, you can use the abund option:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, calc=ace, abund=5)

Looking at the file, 98\_lt\_phylip\_amazon.fn.r\_ace, you\'ll see that
when the distance is 0.10, the final ACE estimate value is 101.1 (95%
CI=75.5-158.8) compared to 161.4 (95% CI=120.3-228.4) when abund was 10.
You will not see a difference when the maximum abundance is below the
threshold.

### iters

To improve the accuracy of the calculations you can change the number of
randomizations that are performed using the iters option; the default
value is 1,000. Running 10,000 randomization should take 10-times as
long as the default:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, iters=10000)

### label

There may only be a couple of lines in your OTU data that you are
interested in generating rarefaction curves for. There are two options.
You could: (i) manually delete the lines you aren\'t interested in from
you rabund, sabund, or list file; (ii) or use the label option. To use
the label option with the rarefaction.single() command you need to know
the labels you are interested in. If you want the rarefaction curve data
for the lines labeled unique, 0.03, 0.05 and 0.10 you would enter:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, label=unique-0.03-0.05-0.10)

In the file 98\_sq\_phylip\_amazon.fn.rarefaction you would see
something like:

    numsampled unique  lci hci 0.03    lci hci 0.05    lci hci 0.10    lci hci
    1      1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000
    98     96.0000 96.0000 96.0000 84.0000 84.0000 84.0000 73.0000 73.0000 73.0000 55.0000 55.0000 55.0000

### freq

For larger datasets you might not be interested in obtaining all of the
data for the number of sequences sampled. For instance, if you have
100,000 sequences, you may only want to output the data every 1,000
sequences. Alternatively, if you only have 100 sequences, you may only
want to output all of the data. The default setting is to output data
every 100 sequences. By altering the freq option you can set the
frequency that the analysis is performed:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, freq=1)

or

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, freq=10, label=unique-0.03-0.10)

or you set set the frequency as a percentage of the number of sequences.
For example to output after 25%:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, freq=0.25)

The second command would generate data such as this:

    numsampled unique  lci hci 0.03    lci hci 0.10    lci hci
    1      1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000
    10     9.9833  9.7298  10.2368 9.8000  8.9230  10.6769 9.1609  7.5355  10.7864
    20     19.9181 19.3687 20.4675 19.2251 17.6100 20.8402 16.8868 14.0094 19.7642
    30     29.8093 28.9977 30.6209 28.3290 26.0098 30.6482 23.5292 19.8495 27.2089
    40     39.6552 38.6139 40.6965 37.1185 34.3295 39.9075 29.4920 25.3805 33.6035
    50     49.4790 48.2302 50.7278 45.7026 42.5904 48.8148 34.8402 30.5755 39.1049
    60     59.2311 57.8653 60.5969 53.9839 50.6660 57.3018 39.6871 35.3682 44.0060
    70     68.9740 67.5473 70.4007 62.1261 58.8171 65.4351 44.1730 40.1165 48.2295
    80     78.6610 77.3396 79.9824 70.0759 67.1926 72.9592 48.3181 44.8728 51.7634
    90     88.3342 87.2957 89.3727 77.8635 75.7349 79.9921 52.1346 49.5628 54.7064
    98     96.0000 96.0000 96.0000 84.0000 84.0000 84.0000 55.0000 55.0000 55.0000

### processors

The processors option allows you to reduce the processing time by using
multiple processors. By default mothur will use all the processors
found. You can set the processors with the following option:

    mothur > rarefaction.single(list=98_lt_phylip_amazon.fn.list, processors=2)

Running this command on my laptop doesn\'t exactly cut the time in half,
but it\'s pretty close. There is no software limit on the number of
processors that you can use.

### groupmode

Default=T. If you run **rarefaction.single** with a shared file and
groupmode=F, you will get a separate output file for each sample.

### Visualization with R

To visual your data follow Pat\'s tutorial
[here](https://www.riffomonas.org/minimalR/06_line_plots.html).

## Revisions

-   1.22.0 - When running with a shared file, only one file is outputted
    instead of one for each group.
-   1.25.0 - groupnames that include \"\_\" causes parsing error in the
    creation of the groups.rarefaction file.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)


