---
title: 'dist.shared'
tags: 'commands'
redirect_from: '/wiki/Dist.shared.html'
---
The **dist.shared** command will generate a
phylip-formatted distance matrix that describes the dissimilarity
(1-similarity) among multiple groups. This command will calculate any of
the calculators describing the similarity in community [
membership](/wiki/calculators#similarity-in-community-membership)
or [
structure](/wiki/calculators#similarity-in-community-structure).

To run through the example below, download [Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/exampledataset.zip).


## Default settings

You can generate a shared file with the following commands:

    mothur > cluster.split(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy, cutoff=0.03)
    mothur > make.shared(list=final.opti_mcc.list, count=final.count_table)

Then you can run the dist.shared command:

    mothur > dist.shared(shared=final.opti_mcc.shared)

This will generate phylip-formatted lower-triangle distance matrices for
the classical [ jaccard](/wiki/jclass) and [ Yue & Clayton
theta](/wiki/thetayc) values. The output files are as follows:

**final.opti_mcc.jclass.0.03.dist**

    19
    F3D0
    F3D1	0.466102
    F3D141	0.518519	0.544681
    F3D142	0.549587	0.588983	0.495455
    F3D143	0.554113	0.589286	0.468293	0.540670
    F3D144	0.532258	0.564315	0.457399	0.524229	0.478469
    F3D145	0.537879	0.568093	0.455696	0.500000	0.468468	0.458333
    F3D146	0.469136	0.480687	0.414414	0.482301	0.490741	0.472103	0.469636
    F3D147	0.503546	0.546763	0.471483	0.528090	0.536965	0.473684	0.465950	0.449438
    F3D148	0.507353	0.546816	0.443548	0.527344	0.468085	0.464567	0.427481	0.426877	0.400000
    F3D149	0.463602	0.526923	0.399160	0.517928	0.476395	0.434959	0.452471	0.395918	0.412186	0.388679
    F3D150	0.463115	0.518672	0.408072	0.502165	0.469767	0.432314	0.432099	0.404348	0.396154	0.376518	0.350000
    F3D2	0.391129	0.399160	0.471774	0.549020	0.547325	0.532567	0.488806	0.442231	0.474048	0.471223	0.432836	0.454902
    F3D3	0.511211	0.445545	0.528302	0.550239	0.548223	0.576577	0.561702	0.478873	0.561538	0.550607	0.529167	0.527027	0.460526
    F3D5	0.423423	0.396135	0.486239	0.527523	0.517073	0.515556	0.485106	0.409302	0.509506	0.477733	0.473251	0.431818	0.381579	0.402116
    F3D6	0.416309	0.426009	0.469298	0.540773	0.504630	0.510549	0.487903	0.423581	0.483395	0.457031	0.427419	0.410480	0.362869	0.426471	0.338235
    F3D7	0.504505	0.460784	0.500000	0.514706	0.540816	0.537037	0.555556	0.464455	0.533333	0.526749	0.516807	0.506849	0.473913	0.386364	0.376344	0.410891
    F3D8	0.387665	0.403670	0.482456	0.515419	0.504673	0.504274	0.500000	0.401786	0.460377	0.474708	0.433198	0.450644	0.361702	0.448780	0.328358	0.333333	0.369231
    F3D9	0.386266	0.429825	0.458874	0.523404	0.506787	0.506224	0.478088	0.400000	0.468864	0.459770	0.430830	0.421277	0.381148	0.438095	0.352381	0.270142	0.392157	0.284360
    

**final.opti_mcc.thetayc.0.03.dist**

    19
    F3D0
    F3D1	0.467784
    F3D141	0.200970	0.530882
    F3D142	0.239879	0.520864	0.156886
    F3D143	0.173126	0.585864	0.072479	0.111842
    F3D144	0.238960	0.613608	0.144858	0.162919	0.079240
    F3D145	0.232203	0.588647	0.107915	0.097159	0.066403	0.029717
    F3D146	0.184757	0.558084	0.099157	0.179974	0.060261	0.096863	0.091673
    F3D147	0.220980	0.589134	0.146073	0.098548	0.076317	0.049223	0.043311	0.114373
    F3D148	0.205197	0.585151	0.058623	0.120294	0.042650	0.081693	0.066706	0.089601	0.073930
    F3D149	0.205419	0.510710	0.028117	0.144051	0.062294	0.123908	0.098087	0.075535	0.127204	0.058077
    F3D150	0.230092	0.562980	0.116270	0.222369	0.120337	0.219990	0.177784	0.117441	0.200202	0.178459	0.093350
    F3D2	0.475966	0.380856	0.442097	0.418148	0.523964	0.529063	0.480563	0.560674	0.491112	0.520358	0.463331	0.526857
    F3D3	0.501665	0.456360	0.378036	0.325260	0.462424	0.461422	0.384942	0.496843	0.432575	0.442618	0.381735	0.457285	0.159622
    F3D5	0.389512	0.279060	0.341331	0.374956	0.432542	0.476654	0.420015	0.421352	0.462750	0.437170	0.329308	0.337508	0.311072	0.292658
    F3D6	0.417659	0.402093	0.354543	0.245569	0.406905	0.441063	0.355320	0.427399	0.389443	0.435147	0.350073	0.354927	0.192843	0.151399	0.230311
    F3D7	0.477928	0.508112	0.351954	0.255068	0.416624	0.443394	0.332710	0.445590	0.402846	0.424137	0.363060	0.371960	0.265586	0.121449	0.289060	0.086599
    F3D8	0.531280	0.443728	0.455453	0.383646	0.516738	0.597693	0.499638	0.523192	0.570409	0.520859	0.445621	0.458872	0.479015	0.317462	0.270402	0.256547	0.212861
    F3D9	0.478498	0.370645	0.401997	0.355820	0.474813	0.561227	0.463472	0.483257	0.533170	0.482968	0.397608	0.411368	0.373744	0.263416	0.183329	0.186051	0.185002	0.047525


## Options

### calc

Using the calc option allows one to select any of the calculators of
similarity of community membership and structure. The different
[calculators](/wiki/calculators) can be separated with hyphens
(i.e. "-"). For example the following command will generate distance
matrices for the [ Jaccard coefficient using richness
estimators](/wiki/jest), the [ Yue & Clayton
theta](/wiki/thetayc), and the [ Bray-Curtis
index](/wiki/braycurtis):

    mothur > dist.shared(shared=final.opti_mcc.shared, calc=jest-thetayc-braycurtis)

Keep in mind that these are distances, which are calculated as one minus
the similarity value.

### groups

At this point, if you run the following command:

    mothur > get.group(shared=final.opti_mcc.shared)

You would have seen that there were 19 groups. If you
just want the distances between groups F3D8 and F3D1, F3D8 and F3D0, or F3D1 and F3D0
enter the following (this is an admittedly silly example):

    mothur > dist.shared(shared=final.opti_mcc.shared, groups=F3D8-F3D1)
    mothur > dist.shared(shared=final.opti_mcc.shared, groups=F3D8-F3D0)
    mothur > dist.shared(shared=final.opti_mcc.shared, groups=F3D0-F3D1)

Keep in mind that these will output to files with the same name. So, it
is important to change the file name between commands. The following
reverts to the default behavior:

    mothur > dist.shared(shared=final.opti_mcc.shared, groups=all)

### label

There may only be a couple of lines in your OTU data that you are
interested in summarizing. There are two options. You could: (i)
manually delete the lines you aren't interested in from you rabund,
sabund, list, or shared file; (ii) or use the label option. 

    mothur > dist.shared(shared=final.opti_mcc.shared, label=0.03)

### output

The output option allows you specify the form of the matrix generated by
dist.shared. By default, **dist.shared** will generate a phylip formatted
lower triangle matrix. If you set output to "square" a phylip
formatted square matrix will be generated. If you set output to
"column" a [ column](/wiki/Column-formatted_distance_matrix)
formatted distance matrix will be produced.

    mothur > dist.shared(shared=final.opti_mcc.shared, output=column)

### subsample

The subsample parameter allows you to enter the size pergroup of the
sample or you can set subsample=T and mothur will use the size of your
smallest group.

### withreplacement

The withreplacement parameter allows you to indicate you want to
subsample your data allowing for the same read to be included multiple
times. Default=f.

### iters

The iters parameter allows you to choose the number of times you would
like to run the subsample. Default=1000.

### processors

The processors option allows you to reduce the processing time by using
multiple processors. Default processors=Autodetect number of available
processors and use all available. You can use 2 processors with the
following option:

    mothur > dist.shared(shared=final.opti_mcc.shared, processors=2)

Running this command on my laptop doesn't exactly cut the time in half,
but it's pretty close. There is no software limit on the number of
processors that you can use.

## Revisions

-   1.24.0 - paralellized for Windows.
-   1.29.0 - added subsampling parameters.
-   1.30.0 - added column format to output parameter.
-   1.33.0 - added [Square Root Jensen-Shannon
    Divergence](/wiki/Square_Root_Jensen-Shannon_Divergence) and
    [jensen-shannon divergence](/wiki/Jensen-Shannon_Divergence)
    calculators.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.0 - Fixes segfault error for commands that use subsampling.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.42.0 - Adds withreplacement parameter to sub.sample command.
    [\#262](https://github.com/mothur/mothur/issues/262)
-   1.43.0 - Modifies output files from dist.shared, summary.single and
    summary.shared. You may run with or without rarefaction, but not
    both. [\#607](https://github.com/mothur/mothur/issues/607)
