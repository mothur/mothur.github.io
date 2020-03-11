---
title: 'Anosim'
---
Referenced: Clarke, K. R. (1993). Non-parametric multivariate analysis
of changes in community structure. \_Australian Journal of Ecology\_ 18,
117-143.

To run the tutorial below please download the [
files](https://mothur.s3.us-east-2.amazonaws.com/wiki/dunedata.zip) and follow along\...

## Default Settings

The phylip and design parameter are required. The phylip option allow
you to enter your phylip formatted distance matrix. The design parameter
allows you to assign your samples to groups when you are running anosim.

    mothur > anosim(phylip=dune.dist, design=dune.design)

opening the dune.anosim file you will see:

    comparison R-value P-value
    BF-HF-NM-SF    0.257871    0.007*
    BF-HF  0.14359 0.247
    BF-NM  0.228395    0.116
    BF-SF  0.265432    0.127
    HF-NM  0.334667    0.056
    HF-SF  0.148   0.115
    NM-SF  0.384259    0.009
     

## Options

### alpha

The default for the alpha parameter is 0.05.

### iters

The default for iters is 1000.

[Category:Commands](Category:Commands)
