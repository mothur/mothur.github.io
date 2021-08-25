---
title: 'lefse'
tags: 'commands'
redirect_from: '/wiki/Lefse'
---
The **lefse** command is modeled after the LEfSe program [written and
published by the Huttenhower
lab](https://genomebiology.biomedcentral.com/articles/10.1186/gb-2011-12-6-r60).
See [ make.lefse](/wiki/Make.lefse) for formating files for input
into the original LEfSe program.

## Default Setting

The shared and design parameters are required.

    mothur > lefse(shared=final.an.shared, design=mouse.sex_time2.design)

If you open the final.an.0.03.lefse\_summary file, you will see:

    OTU     LogMaxMean  Class   LDA     pValue
    Otu001  5.21329     -
    Otu002  5.06449     -
    Otu003  5.08958     -
    Otu004  5.06121     -
    Otu005  4.82611     -
    Otu006  4.76942     -
    Otu007  4.81303     -
    Otu008  4.69046     -
    Otu009  4.71183     -
    Otu010  4.77212     -
    Otu011  4.63326     -
    Otu012  4.80072      F003Late   4.43296     0.0363836
    Otu013  4.58877      F003Late   4.02028     0.0363836
    Otu014  4.5691  -
    Otu015  4.42951     -
    ...

## Options

### class

The class parameter is used to indicate the which category you would
like used as the class. If none is provided first category is used.

### subclass

The subclass parameter is used to indicate the which category you would
like used as the subclass. If none is provided the class is used.

### sets

The sets parameter allows you to specify which of the sets in your
design file you would like to analyze. The set names are separated by
dashes. The default is all sets in the designfile.

### label

The label parameter is used to indicate which distances in the shared
file you would like to use. labels are separated by dashes.

### pairwise

The pairwise parameter allows you to run all pairwise comparisons of the sets in your design file. Default=f.

### walpha

The walpha parameter is used to set the alpha value for the Wilcoxon
test. Default=0.05.

### aalpha

The aalpha parameter is used to set the alpha value for the Krukal
Wallis Anova test Default=0.05.

### lda

The lda parameter is used to set the threshold on the absolute value of
the logarithmic LDA score. Default=2.0.

### wilc

The wilc parameter is used to indicate whether to perform the Wilcoxon
test. Default=T.

### iters

The iters parameter is used to set the number of bootstrap iteration for
LDA. Default=30.

### curv

The curv parameter is used to set whether perform the wilcoxon testing
the Curtis's approach \[beta version\] Default=F.

### fboots

The fboots parameter is used to set the subsampling fraction value for
each bootstrap iteration. Default=0.67.

### strict

The strict parameter is used to set the multiple testing correction
options. 0 no correction (more strict, default), 1 correction for
independent comparisons, 2 correction for independent comparison.
Options = 0,1,2. Default=0.

### minc

The minc parameter is used to minimum number of samples per subclass for
performing wilcoxon test. Default=10.

### multiclass

The multiclass parameter is used to (for multiclass tasks) set whether
the test is performed in a one-against-one ( onevone - more strict!) or
in a one-against-all setting ( onevall - less strict). Default=onevall.

### norm

The norm parameter is used to multiply relative abundances by 1000000.
Recommended when very low values are present. Default=T.

## Revisions

-   1.32.0 - First Introduced
-   1.37.0 - Fixes "Skipping x iter\..." warning.
-   1.38.0 - Adds sets parameter
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 Bug Fix: Fixes seeded random issue.
    [\#416](https://github.com/mothur/mothur/issues/416)
-   1.45.0 Fixes lefse screen output.
-   1.46.0 Adds pairwise parameter. [\#781](https://github.com/mothur/mothur/issues/781)
