---
title: 'indicator'
tags: 'commands'
redirect_from: '/wiki/Indicator'
---
The **indicator** command can be run in 3 ways: with a shared or relabund
file and a design file, or with a shared or relabund file and a tree
file, or with a shared or relabund file, tree file and design file. The
indicator command outputs a .indicator.summary file and a .indicator.tre
if a tree is given. The new tree contains labels at each internal node.
The label is the node number so you can relate the tree to the summary
file. The summary file lists the **indicator** value for each OTU for each
node. To run this tutorial please download
[jczdata.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/jczdata.zip).

For background on the **indicator** metric, see:

Dufrene M, Legendre P (1997). Species assemblages and **indicator** species:
The need for a flexible asymmetrical approach. Ecol Monogr 67: 345-66.

McCune B, Grace JB, Urban DL (2002). Analysis of ecological communities.
MjM Software Design: Gleneden Beach, OR.

Legendre P, Legendre L (1998). Numerical Ecology. Elsevier: New York.

## Default Settings

First let's run the **indicator** command with a tree and shared file:

    mothur > indicator(tree=jcz.tx.morisitahorn.1.tre, shared=jcz.tx.shared)
    You did not provide a label, I will use the first label in your inputfile.

    Node   Species Indicator_Groups    IndicatorValue  pValue
    121    Otu015  M1S2    99.447250   0.026000
    121    Otu044  M2S13   91.346153   0.047000
    121    Otu054  M2S13   88.144333   0.041000
    121    Otu056  M2S13   98.901100   0.038000
    121    Otu060  M2S13   77.068680   0.035000
    121    Otu073  M2S13   88.888893   0.047000
    121    Otu089  P2S4    100.000000  0.045000
    121    Otu139  M2S13   100.000000  0.048000
    121    Otu148  M2S13   100.000000  0.048000
    122    Otu002  P1S11-P1S18-P1S19-P1S20-P1S5    76.412704   0.003000
    122    Otu003  P2S18-P2S19-P2S20-P3S8  45.613029   0.011000
    122    Otu007  P2S1-P2S2-P2S3-P2S4 59.255600   <0.001000
    122    Otu008  M3S3-M3S6-P3S9  64.915779   0.020000
    122    Otu009  M3S10-M3S11-M3S12-M3S9  79.820976   0.004000
    122    Otu011  P1S12-P3S1  48.265816   0.024000
    122    Otu014  M3S10-M3S11-M3S12-M3S9  93.424797   0.002000
    ...

mothur will output any OTU with a pValue \<= 0.05 for each tree node.
All values are reported in the .indicator.summary file.

Now let's run it with a shared, tree and design file. When using a
design file the tree file should represent how the groupings relate to
each other.

    mothur > indicator(tree=jcz.tx.merge.morisitahorn.1.tre, shared=jcz.tx.shared, design=jcz.design)
    You did not provide a label, I will use the first label in your inputfile.

    Node   Species Indicator_Groups    IndicatorValue  pValue
    7  Otu002  M3S12-M3S2-M3S3-M3S4-M3S5-M3S6-M3S7-M3S8-M3S9-P1S1-P1S10-P1S11-P1S12-P1S13-P1S14-P1S15-P1S16-P1S17-P1S18-P1S19  38.001118   0.022000
    7  Otu003  P1S2-P1S20-P1S3-P1S4-P1S5-P1S6-P1S7-P1S8-P1S9-P2S1-P2S10-P2S11-P2S12-P2S13-P2S14-P2S15-P2S16-P2S17-P2S18-P2S19  37.174728   0.012000
    7  Otu005  M3S12-M3S2-M3S3-M3S4-M3S5-M3S6-M3S7-M3S8-M3S9-P1S1-P1S10-P1S11-P1S12-P1S13-P1S14-P1S15-P1S16-P1S17-P1S18-P1S19  37.466076   0.015000
    7  Otu007  P2S2-P2S20-P2S21-P2S22-P2S23-P2S24-P2S25-P2S26-P2S27-P2S28-P2S29-P2S3-P2S4-P2S5-P2S6-P2S7-P2S8-P2S9-P3S1-P3S10  41.481815   0.016000
    7  Otu010  M3S12-M3S2-M3S3-M3S4-M3S5-M3S6-M3S7-M3S8-M3S9-P1S1-P1S10-P1S11-P1S12-P1S13-P1S14-P1S15-P1S16-P1S17-P1S18-P1S19  47.395081   0.007000
    7  Otu011  M3S12-M3S2-M3S3-M3S4-M3S5-M3S6-M3S7-M3S8-M3S9-P1S1-P1S10-P1S11-P1S12-P1S13-P1S14-P1S15-P1S16-P1S17-P1S18-P1S19  44.400589   0.011000
    7  Otu013  P1S2-P1S20-P1S3-P1S4-P1S5-P1S6-P1S7-P1S8-P1S9-P2S1-P2S10-P2S11-P2S12-P2S13-P2S14-P2S15-P2S16-P2S17-P2S18-P2S19  49.684628   0.006000
    7  Otu014  M3S12-M3S2-M3S3-M3S4-M3S5-M3S6-M3S7-M3S8-M3S9-P1S1-P1S10-P1S11-P1S12-P1S13-P1S14-P1S15-P1S16-P1S17-P1S18-P1S19  28.282827   0.028000
    7  Otu016  M3S12-M3S2-M3S3-M3S4-M3S5-M3S6-M3S7-M3S8-M3S9-P1S1-P1S10-P1S11-P1S12-P1S13-P1S14-P1S15-P1S16-P1S17-P1S18-P1S19  29.833334   0.046000
    7  Otu026  M3S12-M3S2-M3S3-M3S4-M3S5-M3S6-M3S7-M3S8-M3S9-P1S1-P1S10-P1S11-P1S12-P1S13-P1S14-P1S15-P1S16-P1S17-P1S18-P1S19  29.753695   0.018000
    7  Otu028  M3S12-M3S2-M3S3-M3S4-M3S5-M3S6-M3S7-M3S8-M3S9-P1S1-P1S10-P1S11-P1S12-P1S13-P1S14-P1S15-P1S16-P1S17-P1S18-P1S19  46.837257   0.005000
    ...

Lastly, you can run the **indicator** command with a shared and design file.

    mothur > indicator(shared=stool.final.an.shared, design=stool.design)
    Species    Indicator_Groups    IndicatorValue  pValue
    Otu0001    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 93.725014   0.002000
    Otu0003    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 90.909096   <0.001000
    Otu0004    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 64.701805   0.030000
    Otu0009    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 63.636364   0.015000
    Otu0011    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 68.012146   0.043000
    Otu0012    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 82.823242   0.010000
    Otu0013    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 64.501587   0.029000
    Otu0015    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 54.545456   0.027000
    Otu0022    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 54.545456   0.031000
    Otu0028    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 66.666672   0.013000
    Otu0033    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 95.897446   <0.001000
    Otu0043    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 63.636364   0.017000
    Otu0045    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 70.710602   0.036000
    Otu0046    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 81.007751   0.003000
    Otu0065    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 66.666672   0.010000
    Otu0067    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 61.002953   0.039000
    Otu0082    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 56.619896   0.045000
    Otu0090    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 66.666672   0.013000
    Otu0096    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 70.734909   0.036000
    Otu0099    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 79.519569   0.006000
    Otu0108    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 91.666672   <0.001000
    Otu0114    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 53.501976   0.044000
    Otu0126    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 60.707493   0.022000
    Otu0127    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 67.988068   0.028000
    Otu0135    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 58.333332   0.026000
    Otu0142    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 54.815739   0.035000
    Otu0146    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 60.642685   0.043000
    Otu0148    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 63.636364   0.021000
    Otu0197    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 67.274681   0.021000
    Otu0201    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 50.000000   0.036000
    Otu0227    F11Fcsw-F12Fcsw-F13Fcsw-F14Fcsw-F21Fcsw-F22Fcsw-F24Fcsw-F31Fcsw-F32Fcsw-F33Fcsw-F34Fcsw 63.636364   0.016000
    Otu0290    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 58.333332   0.015000
    Otu0308    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 56.410252   0.038000
    Otu0332    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 59.459461   0.024000
    Otu0409    M11Fcsw-M12Fcsw-M13Fcsw-M14Fcsw-M21Fcsw-M22Fcsw-M23Fcsw-M24Fcsw-M41Fcsw-M42Fcsw-M43Fcsw-M44Fcsw 50.000000   0.039000

    It took 92 secs to find the indicator species.

## Options

### iters

The iters parameter allows you to set number of randomization for the P
value. The default is 1000.

     mothur > indicator(shared=stool.final.an.shared, design=stool.design, iters=10000) 

### processors

The processors option allows you to speed up the processing time.
Default processors=Autodetect number of available processors and use all
available.

     mothur > indicator(shared=stool.final.an.shared, design=stool.design, processors=2)

### groups

The groups parameter allows you to specify which of the groups in your
shared or relabund you would like analyzed. The groups may be entered
separated by dashes.

    mothur > indicator(tree=jcz.tx.morisitahorn.1.tre, shared=jcz.tx.shared, groups=P3S9-M3S3-M3S6-P3S5-P1S4-M2S10-M1S19-P3S15)

### label

The label parameter indicates at what distance your tree relates to the
shared or relabund. If label is not provided, then the first label in
the shared or relabund file will be used.

     mothur > indicator(tree=jcz.tx.morisitahorn.1.tre, shared=jcz.tx.shared, label=1)

### design

The design file is used to group your groups. It looks just like a
[group\_file](/wiki/group_file), but the first column contains
group names and the second column contains the grouping that the group
belongs to. When using a design file the tree file should represent how
the groupings relate to each other.

    mothur > indicator(tree=jcz.tx.merge.morisitahorn.1.tre, shared=jcz.tx.shared, design=jcz.design)

## Revisions

-   1.29.0 Added group info to **indicator** results.
-   1.31.0 Added multiple processors for Windows.
-   1.31.0 Bug Fix: problem with pvalues when multiple processors were
    used.
-   1.40.0 Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.45.0 Fixes bug with indicator command pvalues. [\#729](https://github.com/mothur/mothur/issues/729)

