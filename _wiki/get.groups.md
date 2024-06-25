---
title: 'get.groups'
tags: 'commands'
redirect_from: '/wiki/Get.groups.html'
---
The **get.groups** command selects sequences from a
specific group or set of groups from the following file types: fasta, count, shared,
list, taxonomy, phylip, column, design, name and group. 
To run through the example below, download [Example Data Set](https://mothur.s3.us-east-2.amazonaws.com/wiki/ExampleDataSet.zip) 

## Default Settings

The count parameter is required, unless you have a current count file, or are using a shared file. The command will
generate a \*.pick.\* file. To select the groups F3D0, F3D1 and F3D8, run the following:

    mothur > get.groups(count=final.count_table, groups=F3D0-F3D1-F3D8)

or you may wish to list your groups in a file instead of manually typing
them. This can be done by using an accnos file.
 
    mothur > get.groups(count=final.count_table, accnos=final.groupsToSelect.accnos) 

final.groupsToSelect.accnos looks like:

    F3D0
    F3D1
    F3D8


Both commands will output the file final.pick.count_table containing the 569 unique sequences that represent the
15096 sequences in groups F3D0, F3D1 or F3D8.

## Options

### fasta

To use the fasta option, follow this example:

    mothur > get.groups(count=final.count_table, fasta=final.fasta, groups=F3D0-F3D1-F3D8)

This generates the file final.pick.fasta as well as the final.pick.count_table with the same sequences. 
If you open the final.pick.fasta file you will see something like:

    >M00967_43_000000000-A3JHG_1_2103_24256_12640
    TAC--GT-AG-GGG--GCG-A-G-C-G-T-T--GT-C-CGG-AA--TG-A-C-T--GG-GC--GT-A-AA-GG-GA-GT-G-TA-GGC-G-G-C-....
    >M00967_43_000000000-A3JHG_1_1101_6929_7655
    TAC--GG-AG-GAT--GCG-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-T-T--GG-GT--TT-A-AA-GG-GT-GC-G-TA-GGC-G-G-T-...
    >M00967_43_000000000-A3JHG_1_2110_20081_2854
    TAC--GT-AG-GGG--GCA-A-G-C-G-T-T--AT-C-CGG-AT--TC-A-C-T--GG-GC--GT-A-AA-GG-GA-GC-G-CA-GGC-G-G-C-...
    >M00967_43_000000000-A3JHG_1_2103_6640_14822
    TAC--GT-AG-GGG--GCA-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-C-T--GG-GT--GT-A-AA-GG-GA-GC-G-TA-GGC-G-G-C-...
    >M00967_43_000000000-A3JHG_1_1105_23929_25607
    ACC--GG-AG-GAT--GCG-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-T-T--GG-GT--TT---AA-GG-GT-GC-G-TA-GGC-G-G-G-...
    >M00967_43_000000000-A3JHG_1_1110_13542_25768
    TAC--GT-AG-GGG--GCA-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-C-T--GG-GT--GT-A-AA-GG-GA-GC-G-TA-GAC-G-G-C-...
    ...

### list

To use the list option, follow this example:

    mothur > get.groups(count=final.count_table, list=final.opti_mcc.list, groups=F3D0-F3D1-F3D8)

This generates the file final.opti_mcc.0.03.pick.list, which contains the 256 otus containing sequences from the groups F3D0, F3D1 or F3D8.

    label	numOtus	Otu001	Otu002	Otu003	Otu004	Otu005	Otu006	Otu007	Otu008	Otu009	Otu010	Otu011	...
    0.03	256	M00967_43_000000000-A3JHG_1_2101_13320_3436,M00967_43_000000000-A3JHG_1_2114_4499_18914,M00967_43_000000000-_10834_8009,M00967_43_000000000-0 ...

as well as a final.pick.count_table with the same sequences.

### taxonomy

To use the taxonomy option, follow this example:

    mothur > get.groups(count=final.count_table, taxonomy=final.taxonomy, groups=F3D0-F3D1-F3D8)

This generates the file final.pick.taxonomy, which looks like:

    M00967_43_000000000-A3JHG_1_2108_22189_18381	Bacteria(100);"Proteobacteria"(100);Gammaproteobacteria(100);Xanthomonadales(100);Xanthomonadaceae(100);Stenotrophomonas(81);
    M00967_43_000000000-A3JHG_1_1106_24198_4737	Bacteria(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);
    M00967_43_000000000-A3JHG_1_1105_27296_22083	Bacteria(100);Firmicutes(100);Clostridia(98);Clostridiales(98);Lachnospiraceae(97);Lachnospiraceae_unclassified(97);
    M00967_43_000000000-A3JHG_1_2102_12696_27241	Bacteria(100);Firmicutes(96);Clostridia(96);Clostridiales(96);Lachnospiraceae(96);Lachnospiraceae_unclassified(96);
    M00967_43_000000000-A3JHG_1_2108_22647_16398	Bacteria(100);Firmicutes(91);Clostridia(91);Clostridiales(91);Ruminococcaceae(90);Ruminococcaceae_unclassified(90);
    M00967_43_000000000-A3JHG_1_2107_14096_15016	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(98);Lachnospiraceae_unclassified(98);
    M00967_43_000000000-A3JHG_1_1106_17362_26015	Bacteria(100);"Actinobacteria"(100);Actinobacteria(100);Coriobacteriales(100);Coriobacteriaceae(100);Enterorhabdus(100);
    M00967_43_000000000-A3JHG_1_2109_9416_24199	Bacteria(100);Firmicutes(99);Clostridia(99);Clostridiales(98);Lachnospiraceae(96);Lachnospiraceae_unclassified(96);
    ...

as well as a final.pick.count_table with the same sequences.

### shared

To use the shared option, follow this example:

    mothur > get.groups(shared=final.opti_mcc.shared, groups=F3D0-F3D1-F3D8)

This generates the file final.opti_mcc.0.03.pick.shared, which contains
the following lines:

    label	Group	numOtus	Otu001	Otu002	Otu003	Otu004	Otu005	Otu006	Otu007	Otu008	Otu009	Otu010	Otu011	Otu012	
    0.03	F3D0	256	499	306	394	403	632	356	168	164	136	19	27	110	52	104	84	78	35	57	61	37	285	32	59	147	64	67	...
    0.03	F3D1	256	351	311	189	64	73	117	127	174	83	111	53	35	115	252	287	0	7	90	27	53	59	14	26	57	60	94	...
    0.03	F3D8	256	236	309	295	128	2	174	547	278	181	15	74	18	129	50	43	6	4	18	14	108	49	6	58	55	51	35	...

You can see that some OTU's were entirely eliminated because they do not contain sequences from groups F3D0, F3D1 or F3D8.

### design

To use the design option, follow this example:

    mothur > get.groups(shared=final.opti_mcc.shared, design=mouse.time.design, groups=F3D0-F3D1-F3D8)

mouse.time.design looks like:

    group	treatment
    F3D0   Early
    F3D1   Early
    F3D141 Late
    F3D142 Late
    F3D143 Late
    F3D144 Late
    F3D145 Late
    F3D146 Late
    F3D147 Late
    F3D148 Late
    F3D149 Late
    F3D150 Late
    F3D2   Early
    F3D3   Early
    F3D5   Early
    F3D6   Early
    F3D7   Early
    F3D8   Early
    F3D9   Early
 
 The resulting mouse.time.pick.design file will look like:
 
    group	treatment
    F3D0	Early
    F3D1	Early
    F3D8	Early


### sets

The sets parameter allows you to specify which of the sets in your
designfile you would like to select. You can separate set names with
dashes. If you want to select all the groups in the Early treatment, try this:

    mothur > get.groups(shared=final.opti_mcc.shared, design=mouse.time.design, sets=Early)

The resulting mouse.time.pick.design file will look like:

    group	treatment
    F3D0	Early
    F3D1	Early
    F3D2	Early
    F3D3	Early
    F3D5	Early
    F3D6	Early
    F3D7	Early
    F3D8	Early
    F3D9	Early
    
And the shared file will look like:

    label	Group	numOtus	Otu001	Otu002	Otu003	Otu004	Otu005	Otu006	Otu007	Otu008	Otu009 ...
    0.03	F3D0	350	499	306	394	403	632	356	168	164	136	19	27	110	52	104	84	78	35	57	61	...
    0.03	F3D1	350	351	311	189	64	73	117	127	174	83	111	53	35	115	252	287	0	7	90	27	...
    0.03	F3D2	350	3076	1439	1065	451	148	410	354	1222	572	60	306	143	308	550	337	...
    0.03	F3D3	350	831	543	400	187	23	213	448	398	268	175	221	65	84	16	47	22	13	328	89	...
    0.03	F3D5	350	278	235	236	148	20	137	142	193	191	67	115	66	45	83	78	29	12	13	40	...
    0.03	F3D6	350	902	608	507	381	12	356	501	250	218	48	128	59	392	72	54	0	6	66	34	...
    0.03	F3D7	350	576	449	385	294	9	235	517	223	251	13	117	43	106	25	35	2	7	37	15	...
    0.03	F3D8	350	236	309	295	128	2	174	547	278	181	15	74	18	129	50	43	6	4	18	14	...
    0.03	F3D9	350	435	374	429	189	5	255	610	419	203	28	97	22	166	98	94	0	8	39	33	...


### phylip

The phylip option is used to specify the name of the [ phylip
formatted](/wiki/phylip-formatted_distance_matrix) distance file
you would like to select distances from. To generate the .dist file, run the following:

    mothur > dist.shared(shared=final.opti_mcc.shared, subsample=t)

The final.opti_mcc.thetayc.0.03.lt.ave.dist file contains:

    19
    F3D0
    F3D1	0.474922
    F3D141	0.210618	0.536193
    F3D142	0.245883	0.522963	0.159277
    F3D143	0.178547	0.587579	0.075820	0.111769
    F3D144	0.245769	0.614136	0.150278	0.164039	0.081844
    F3D145	0.240859	0.592020	0.113041	0.099472	0.069555	0.034270
    F3D146	0.193530	0.559788	0.104369	0.182698	0.064180	0.103431	0.097991
    F3D147	0.231679	0.593135	0.152776	0.105287	0.081308	0.054359	0.050777	0.122631
    F3D148	0.214540	0.587721	0.067956	0.125263	0.048796	0.090400	0.075236	0.100006	0.085041
    F3D149	0.213746	0.516693	0.037621	0.148458	0.066224	0.129811	0.105153	0.083807	0.134928	0.068088
    F3D150	0.239095	0.565672	0.122289	0.225027	0.124343	0.224982	0.184366	0.123207	0.206566	0.189054	0.101765
    F3D2	0.486915	0.388567	0.451548	0.422166	0.528051	0.530900	0.486701	0.565963	0.496491	0.524713	0.469993	0.531830
    F3D3	0.508477	0.460610	0.383161	0.325817	0.463416	0.462134	0.389007	0.498920	0.436586	0.444289	0.386265	0.458765	0.168128
    F3D5	0.396747	0.287033	0.347348	0.377409	0.434369	0.478551	0.425063	0.422747	0.468263	0.440300	0.337063	0.340654	0.322947	0.299151
    F3D6	0.426449	0.406230	0.361172	0.249032	0.409600	0.443616	0.362942	0.431433	0.396574	0.440542	0.357365	0.358107	0.200769	0.156920	0.237299
    F3D7	0.485061	0.512503	0.357344	0.257352	0.418828	0.444764	0.338009	0.448287	0.408318	0.429156	0.369801	0.375126	0.271915	0.125416	0.296154	0.093075
    F3D8	0.534782	0.447580	0.458594	0.385501	0.517817	0.598668	0.503624	0.523409	0.575409	0.523240	0.451311	0.461517	0.485066	0.320019	0.273138	0.260956	0.217905
    F3D9	0.485800	0.378642	0.407103	0.359453	0.477310	0.563293	0.469351	0.485860	0.539667	0.485885	0.404651	0.416494	0.380421	0.266538	0.190510	0.192757	0.191119	0.056494


To select the distances for the Early treatment, run the following:

    mothur > get.groups(phylip=final.opti_mcc.thetayc.0.03.lt.ave.dist, design=mouse.time.design, sets=Early)

creates a final.opti_mcc.thetayc.0.03.lt.ave.pick.dist file:

    9
    F3D0	
    F3D1	0.474922	
    F3D2	0.486915	0.388567	
    F3D3	0.508477	0.46061	0.168128	
    F3D5	0.396747	0.287033	0.322947	0.299151	
    F3D6	0.426449	0.40623	0.200769	0.15692	0.237299	
    F3D7	0.485061	0.512503	0.271915	0.125416	0.296154	0.093075	
    F3D8	0.534782	0.44758	0.485066	0.320019	0.273138	0.260956	0.217905	
    F3D9	0.4858	0.378642	0.380421	0.266538	0.19051	0.192757	0.191119	0.056494	
    
Alternatively, you can select distances between sequences. To generate the distance matrix, run the following:

    mothur > dist.seqs(fasta=final.fasta, output=lt)
    
This will create the final.phylip.dist file. You can select the distances related to sequences from groups F3D0, F3D1 or F3D8, as follows:

    mothur > get.groups(phylip=final.phylip.dist, count=final.count_table, groups=F3D0-F3D1-F3D8)

### column

The column option is used to specify the name of the [ column
formatted](/wiki/column-formatted_distance_matrix) distance file
you would like to select distances from.

    mothur > dist.shared(shared=final.opti_mcc.shared, subsample=t, output=column)

The final.opti_mcc.thetayc.0.03.column.ave.dist file contains:

    F3D1	F3D0	0.474922
    F3D141	F3D0	0.210618
    F3D141	F3D1	0.536193
    F3D142	F3D0	0.245883
    F3D142	F3D1	0.522963
    F3D142	F3D141	0.159277
    F3D143	F3D0	0.178547
    F3D143	F3D1	0.587579
    F3D143	F3D141	0.075820
    F3D143	F3D142	0.111769
    F3D144	F3D0	0.245769
    F3D144	F3D1	0.614136
    F3D144	F3D141	0.150278
    F3D144	F3D142	0.164039
    F3D144	F3D143	0.081844
    F3D145	F3D0	0.240859
    F3D145	F3D1	0.592020
    ...
    
To select the distances for the Early treatment, run the following:

    mothur > get.groups(column=final.opti_mcc.thetayc.0.03.column.ave.dist, design=mouse.time.design, sets=Early)

creates a final.opti_mcc.thetayc.0.03.column.ave.pick.dist file:
    
    F3D1	F3D0	0.474922
    F3D2	F3D0	0.486915
    F3D2	F3D1	0.388567
    F3D3	F3D0	0.508477
    F3D3	F3D1	0.46061
    F3D3	F3D2	0.168128
    F3D5	F3D0	0.396747
    F3D5	F3D1	0.287033
    F3D5	F3D2	0.322947
    F3D5	F3D3	0.299151
    F3D6	F3D0	0.426449
    F3D6	F3D1	0.40623
    F3D6	F3D2	0.200769
    F3D6	F3D3	0.15692
    F3D6	F3D5	0.237299
    F3D7	F3D0	0.485061
    ...
    
Alternatively, you can select distances between sequences. To generate the distance matrix, run the following:

    mothur > dist.seqs(fasta=final.fasta, cutoff=0.03)
    
This will create the final.dist file. You can select the distances related to sequences from groups F3D0, F3D1 or F3D8, as follows:

    mothur > get.groups(column=final.dist, count=final.count_table, groups=F3D0-F3D1-F3D8)

You may see a warning similar to:

    Selected 15096 sequences from your count file.
    [WARNING]: Your accnos file contains 569 groups or sequences, but I only found 476 of them in the column file.
    Selected 476 groups or sequences from your column file.

This warning can be disregarded. When you use a cutoff with the dist.seqs command, sequences with distance above the cutoff are NOT added to the distance file. This means you can have sequences in the count file, that are not in the distance file. Mothur assumes reads missing from the distance file but present in the count file only have distances above the cutoff.

### flow


### name - not recommended

The name option allows you to provide a name file associated with your group file.

We DO NOT recommend using the name file. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

### group - not recommended

The group parameter allows you to provide a group file to use when
selecting items from your files. 

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


## Revisions

-   1.23.0 file mismatch bug -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1396&p=3560#p3560](https://forum.mothur.org/viewtopic.php?f=4&t=1396&p=3560#p3560)
-   1.24.0 added design option
-   1.28.0 added count option
-   1.37.0 Adds phylip and column options
    [\#79](https://github.com/mothur/mothur/issues/79)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.44.0 - Adds sets parameter.
    [\#277](https://github.com/mothur/mothur/issues/277)
-   1.48.0 Adds flow parameter.

