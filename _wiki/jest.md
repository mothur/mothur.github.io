---
title: 'Jest'
tags: 'calculators'
redirect_from: '/wiki/Jest'
---
The **jest** calculator returns an estimate of the
traditional [ jaccard](jclass) index using Chao1 richness
estimates for the richness of [ individual](chao) samples and
the richness of the [ shared](sharedchao) OTUs. This
calculator can be used in the
[summary.shared](summary.shared) and
[collect.shared](collect.shared) commands.

$$C_{Jaccard} =1- \frac{S_{AB, Chao}}{S_{A,Chao} + S_{B,Chao} - S_{AB,Chao}}$$

where,

$$S_{AB,Chao}$$ = estimated number of OTUs shared between A and B using
the [sharedchao](sharedchao) calculator.

$$S_{A,Chao}$$ = number of OTUs estimated in A using the
[chao](chao) calculator.

$$S_{B,Chao}$$ = number of OTUs estimated in B using the
[chao](chao) calculator.

Open the file 98\_lt\_phylip\_amazon.fn.sabund generated using the [
Amazonian dataset](https://mothur.s3.us-east-2.amazonaws.com/wiki/amazondata.zip) with the following
commands:

    mothur > cluster(phylip=98_lt_phylip_amazon.dist, cutoff=0.10)
    mothur > make.shared(list=98_lt_phylip_amazon.fn.list, group=amazon.groups, label=0.10)

The 98\_lt\_phylip\_amazon.fn.[shared file](shared_file) will
contain the following two lines:

    0.10   forest  55  1   1   1   1   1   1   3   3   2   2   1   1   3   2   1   1   1   1   2   1   1   2   5   1   1   1   1   2   1   1   1   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   
    0.10   pasture 55  0   0   0   1   1   0   1   0   0   5   0   0   0   0   0   2   0   0   0   3   0   0   2   1   0   1   0   0   0   0   0   0   1   2   1   1   1   1   1   7   1   1   2   1   1   1   1   1   1   1   1   1   2   1   1   

This indicates that the label for the OTU definition was 0.10. The first
line is from the forest sample and the second is from the pasture
sample. There are a total of 55 OTUs between the two communities.
Elsewhere, we used the [sharedchao](sharedchao) calculator to
estimate that the shared richness was 30.5 OTUs. The following commands
using the [chao](chao) calculator will provide the single
sample Chao1 richness estimates:

    mothur > summary.single(rabund=98_lt_phylip_amazon.fn.forest.rabund, calc=chao)
    mothur > summary.single(rabund=98_lt_phylip_amazon.fn.pasture.rabund, calc=chao)

The output of these commands indicates Chao1 richness estimates of 78
((95% CI=48 to 164) and 69.1 (95% CI=46 to 136) for the pasture and
forest samples, respectively. Basically, we would predict that all of
the forest OTUs are shared.

$$D_{Jaccard} = 1- \frac{30.5}{78+69.1-30.5}=0.738518$$

Running\...

    mothur > summary.shared(shared=98_lt_phylip_amazon.fn.shared, calc=jest)

\...and opening 98\_lt\_phylip\_amazon.fn.shared.summary gives:

    label  comparison      Jest
    0.10   forest  pasture     0.738518

These are the same values that we found above for a cutoff of 0.10.
