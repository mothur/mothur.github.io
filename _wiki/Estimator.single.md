---
title: 'Estimator.single'
---
[estimator.single](estimator.single) This command implements
the diversity estimators from
<https://github.com/chrisquince/DiversityEstimates>.
<https://www.ncbi.nlm.nih.gov/pubmed/18650928>. Here are the sabund
files representing the data provided by the authors,
[EstimatorSingleData.zip](Media:_EstimatorSingleData.zip)


{% include toc.html %}

## Default settings

By default, the estimator.single() command will run the metroig (ig):

    mothur > estimator.single(sabund=Brazil.sabund)

Mothur will try to auto adjust the parameters for you, and this will
result in output to the screen looking like:

    MetroIG - D = 2880 L = 26079 Chao = 4604.41

    MetroIG - ML simplex: a = 0.742867 b = 4.52778 S = 5760.13 NLL = 337.44

    MCMC iter = 1000 sigmaX = 0.1 sigmaY = 0.1 sigmaS = 100 
    0: a = 0.742867 b = 4.52778 S = 5760.13
    1: a = 0.942867 b = 4.72778 S = 5960.13
    2: a = 0.542867 b = 4.32778 S = 5560.13
    0: accept. ratio 141/1000 = 0.141
    1: accept. ratio 155/1000 = 0.155
    2: accept. ratio 163/1000 = 0.163

    MCMC iter = 1000 sigmaX = 1e-05 sigmaY = 1e-05 sigmaS = 100
    0: a = 0.742867 b = 4.52778 S = 5760.13
    1: a = 0.742887 b = 4.5278 S = 5960.13
    2: a = 0.742847 b = 4.52776 S = 5560.13
    0: accept. ratio 651/1000 = 0.651
    1: accept. ratio 623/1000 = 0.623
    2: accept. ratio 660/1000 = 0.66

    MCMC iter = 1000 sigmaX = 0.0001 sigmaY = 0.0001 sigmaS = 100
    0: a = 0.742867 b = 4.52778 S = 5760.13
    1: a = 0.743067 b = 4.52798 S = 5960.13
    2: a = 0.742667 b = 4.52758 S = 5560.13
    0: accept. ratio 649/1000 = 0.649
    1: accept. ratio 631/1000 = 0.631
    2: accept. ratio 650/1000 = 0.65
     
    MCMC iter = 1000 sigmaX = 0.001 sigmaY = 0.001 sigmaS = 100
    0: a = 0.742867 b = 4.52778 S = 5760.13
    1: a = 0.744867 b = 4.52978 S = 5960.13
    2: a = 0.740867 b = 4.52578 S = 5560.13
    0: accept. ratio 649/1000 = 0.649
    1: accept. ratio 617/1000 = 0.617
    2: accept. ratio 635/1000 = 0.635
     
    MCMC iter = 1000 sigmaX = 0.01 sigmaY = 0.01 sigmaS = 100
    0: a = 0.742867 b = 4.52778 S = 5760.13
    1: a = 0.762867 b = 4.54778 S = 5960.13
    2: a = 0.722867 b = 4.50778 S = 5560.13
    0: accept. ratio 622/1000 = 0.622
    1: accept. ratio 581/1000 = 0.581
    2: accept. ratio 578/1000 = 0.578

    MCMC iter = 1000 sigmaX = 0.15 sigmaY = 0.15 sigmaS = 100
    0: a = 0.742867 b = 4.52778 S = 5760.13
    1: a = 1.04287 b = 4.82778 S = 5960.13
    2: a = 0.442867 b = 4.22778 S = 5560.13
    0: accept. ratio 85/1000 = 0.085
    1: accept. ratio 115/1000 = 0.115
    2: accept. ratio 98/1000 = 0.098

    MCMC iter = 1000 sigmaX = 0.2 sigmaY = 0.2 sigmaS = 100
    0: a = 0.742867 b = 4.52778 S = 5760.13
    1: a = 1.14287 b = 4.92778 S = 5960.13
    2: a = 0.342867 b = 4.12778 S = 5560.13
    0: accept. ratio 62/1000 = 0.062
    1: accept. ratio 70/1000 = 0.07
    2: accept. ratio 69/1000 = 0.069

    Fit try: 1

    MCMC iter = 1000 sigmaX = 0.015 sigmaY = 0.015 sigmaS = 100
    0: a = 0.742867 b = 4.52778 S = 5760.13
    1: a = 0.772867 b = 4.55778 S = 5960.13
    2: a = 0.712867 b = 4.49778 S = 5560.13
    0: accept. ratio 572/1000 = 0.572
    1: accept. ratio 539/1000 = 0.539
    2: accept. ratio 556/1000 = 0.556

    Output File Names: 
    brazil.0.03.0.ig
    brazil.0.03.1.ig
    brazil.0.03.2.ig

The output sampling files look like:

    #Be sure to use the correct sampling estimator with your calculator. IG is used for igabund and igrarefact. LN is used for lnabund, lnshift and lnrarefact. LS is used for lsabund and lsrarefaction. SI is used for siabund, sirarefact and sishift.
    #0.03
    0,0.772867,4.557782,5960,345.915161
    10,0.723479,4.534953,5916,336.209457
    20,0.716970,4.516920,6058,336.694896
    30,0.734100,4.478468,5842,336.679444
    40,0.689657,4.536660,5988,336.344615
    50,0.692898,4.489684,6047,335.305989
    60,0.719332,4.507192,6067,337.122935
    70,0.685814,4.495462,6191,335.259586
    80,0.710244,4.538294,5939,335.970890
    90,0.669338,4.472478,6333,335.398574
    100,0.633325,4.496830,6538,335.470400
    ...

If mothur is unable to determine the parameter values, you will see this
message:

    ...
    [ERROR]: Unable to reach acceptable ratio, please review and set sigma parameters manually.

    How do you create the sampling files?

    Run a short trial MCMC run of 1000 iterations with guessed std. dev.s for the proposal distributions say about 10% of the parameter values.  Adjust the std. dev.s untill the acceptance ratios are about 0.5. Then perform a longer run of say 250,000 iterations (mothur's default). Three  data files with posterior samples for three different sets of parameter values will be generated.

To run the single analysis with multiple samples:

    mothur > estimator.single(shared=amazon.shared)

## File Options

You can analyze your data using many of mothur\'s file types. These
include: [ list](list_file), [
sabund](sabund_file), [ rabund](rabund_file "wikilink") and [
shared](shared_file) files.

## Options

### sample

The sample file is used to provide mcmc sampling to the calculators. If
you do not provide one and the calculator requires it, mothur will
attempt to create it for you.

### calc

The calc option allows you to indicate the calculator you want to use
with the estimator.single command. Options include: default, erarefact,
ig, igabund, igrarefact, ln, lnabund, lnrarefact, lnshift, ls, lsabund,
lsrarefact, si, siabund, sirarefact, sishift. Be sure to use the correct
sampling estimator with your calculator. IG is used for igabund and
igrarefact. LN is used for lnabund, lnshift and lnrarefact. LS is used
for lsabund and lsrarefaction. SI is used for siabund, sirarefact and
sishift. Also don\'t forget to set the burn and burnsample values that
correspond with your sample file.

    mothur > estimator.single(sabund=brazil.sabund,  sample=brazil.0.03.0.ig, calc=igabund, burn=0, burnsample=100)

This command will generate a file named brazil.0.03.igabund, which looks
like this:

    label  num igabund
    0.03   1   1134.702703
    0.03   2   463.732495
    0.03   3   250.035021
    0.03   4   159.395752
    0.03   5   112.252906
    0.03   6   84.274785
    0.03   7   66.127464
    0.03   8   53.588337
    0.03   9   44.506118
    0.03   10  37.683606
    0.03   11  32.407730
    0.03   12  28.230316
    0.03   13  24.857123
    ...

### sigmaa && sigmab && sigman && sigmas

-   The sigmaa parameter is used to set the std. dev. of alpha / X /
    mean prop. distn for MetroIG / MetroLogNormal / MetroLogStudent /
    MetroSichel, respectively. Default = 0.10.
-   The sigmab parameter is used to set the std. dev. of beta / Y / V
    prop. distn for MetroIG / MetroLogNormal / MetroLogStudent /
    MetroSichel, respectively. Default = 0.10. n\";
-   The sigman parameter is used to set the std. dev. of N / Gamma prop.
    distn for MetroLogStudent / MetroSichel, respectively. Default =
    0.10.
-   The sigmas parameter is used to set the std. dev. of S prop. distn
    for MetroIG / MetroLogNormal / MetroLogStudent / MetroSichel.
    Default = 100.

### label

There may only be a couple of lines in your OTU data that you are
interested in There are two options. You could: (i) manually delete the
lines you aren\'t interested in from you rabund, sabund, or list file;
(ii) or use the label option. To use the label option with the
estimator.single() command you need to know the labels you are
interested in. If you want the data for the line labeled 0.03 you would
enter:

    mothur > estimator.single(sabund=brazil.sabund,  sample=brazil.0.03.0.ig, calc=igabund, burn=0, burnsample=100, label=0.03)

### freq

The freq parameter is used indicate when to output your data, by default
it is set to 100. But you can set it to a percentage of the number of
sequence. For example freq=0.10, means 10%.

    mothur > estimator.single(sabund=brazil.sabund,  sample=brazil.0.03.0.ig, calc=igabund, burn=0, burnsample=100, freq=10)

or

    mothur > estimator.single(sabund=brazil.sabund,  sample=brazil.0.03.0.ig, calc=igabund, burn=0, burnsample=100, freq=0.1)

### burn && burnsample

-   The burn parameter allows ignore part of the sampling file. Default
    = 200000 / 100000 for IGAbundance, LNShift, LSAbundance /
    IGRarefaction, LNRarefaction, LSRarefaction, SIAbundance,
    SIRarefaction, SIShift respectively.
-   The burnsample parameter allows you to set sampling frequency. The
    default is 1000 / 100 for IGAbundance, LNShift, LSAbundance /
    IGRarefaction, LNRarefaction, LSRarefaction, SIAbundance,
    SIRarefaction, SIShift respectively.

To ignore the first 1000 samplings and use sample data from every 100,
you would run the following:

    mothur > estimator.single(sabund=brazil.sabund,  calc=igabund, burn=1000, burnsample=100)

The sample file will be ignored until the line beginning with 1000:

    0,0.714335,4.309575,5599,348.214604
    10,0.679445,4.200580,5873,342.076803
    ...
    1000,0.661218,4.463443,6334,334.838815  - start samples here

The sampling data would be filled as follows:

    ...
    1000,0.661218,4.463443,6334,334.838815 - save values
    1010,0.659860,4.212680,6343,333.909537 - ignore
    1020,0.662209,4.210833,6265,333.998060 - ignore
    1030,0.627240,4.025682,6592,333.427298 - ignore
    1040,0.595380,3.707704,6915,333.875785 - ignore
    1050,0.585411,3.892519,6850,333.594446 - ignore
    1060,0.593695,3.954003,6704,334.142444 - ignore
    1070,0.609698,3.987714,6810,334.193220 - ignore
    1080,0.571781,3.984661,7032,334.345434 - ignore
    1090,0.625876,4.023356,6563,333.338209 - ignore
    1100,0.655481,3.900010,6326,334.286509 - save values
    ...

### iters

The iters parameter allows you to set number of mcmc samples to
generate. The default is 250000.

### coverage

The coverage parameter is used by the rarefaction calculators.

### fit

The fit parameter is used to indicate to mothur you want mothur to auto
adjust the sampling data parameters. default=10, meaning try fitting 10
times.

## Revisions

-   1.43.0 - First Introduced
    [\#164](https://github.com/mothur/mothur/issues/164)

[Category:Commands](Category:Commands)
