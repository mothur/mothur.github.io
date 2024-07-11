---
title: 'remove.groups'
tags: 'commands'
redirect_from: '/wiki/Remove.groups.html'
---

The **remove.groups** command removes sequences from a
specific group or set of groups from the following file types: fasta, count, shared,
list, taxonomy, phylip, column, design, name and group. 
To run through the example below, download [Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/exampledataset.zip) 

## Default Settings

The count parameter is required, unless you have a current count file, or are using a shared file. The command will
generate a \*.pick.\* file. To remove the groups F3D0, F3D1 and F3D8, run the following:

    mothur > remove.groups(count=final.count_table, groups=F3D0-F3D1-F3D8)

or you may wish to list your groups in a file instead of manually typing
them. This can be done by using an accnos file.
 
    mothur > remove.groups(count=final.count_table, accnos=final.groupsToRemove.accnos) 

final.groupsToRemove.accnos looks like:

    F3D0
    F3D1
    F3D8


Both commands will output the file final.pick.count_table containing the 2132 unique sequences that represent the
98863 sequences in groups F3D141, F3D142, F3D143, F3D144, F3D145, F3D146, F3D147, F3D148, F3D149, F3D150, F3D2, F3D3, F3D5, F3D6, F3D7 and F3D9.

## Options

### fasta

To use the fasta option, follow this example:

    mothur > remove.groups(count=final.count_table, fasta=final.fasta, groups=F3D0-F3D1-F3D8)

This generates the file final.pick.fasta as well as the final.pick.count_table with the same sequences. 
If you open the final.pick.fasta file you will see something like:

    >M00967_43_000000000-A3JHG_1_2102_22092_15614
    TAC--GG-AG-GAT--GCG-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-T-T--GG-GT--TT-AAGA-GG-GT-GC-G-TA-GGC-G-G-A-CA-G-T-T-AA-G-T-C-T-G-C-...
    >M00967_43_000000000-A3JHG_1_1102_8406_20325
    TAC--GG-AG-GAT--CCG-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-T-T--GG-GT--TT-A-AA-GG-GA-GC-C-TA-GGT-G-G-A-TT-G-T-T-AA-G-T-C-A-G-T-...
    >M00967_43_000000000-A3JHG_1_1106_15955_6621
    TAC--GT-AG-GTG--GCA-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-C-T--GG-GT--GT-A-AA-GG-GA-GC-G-TA-GAC-G-G-C-AG-G-G-C-AA-G-T-C-T-G-G-...
    >M00967_43_000000000-A3JHG_1_2103_24256_12640
    TAC--GT-AG-GGG--GCG-A-G-C-G-T-T--GT-C-CGG-AA--TG-A-C-T--GG-GC--GT-A-AA-GG-GA-GT-G-TA-GGC-G-G-C-CT-T-T-T-AA-G-T-T-A-T-G-...
    >M00967_43_000000000-A3JHG_1_1101_6929_7655
    TAC--GG-AG-GAT--GCG-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-T-T--GG-GT--TT-A-AA-GG-GT-GC-G-TA-GGC-G-G-T-TT-G-T-C-AA-G-T-C-A-G-C-...
    >M00967_43_000000000-A3JHG_1_1105_5520_9241
    TAC--GT-AG-GGG--GCA-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-C-T--GG-GT--GT-A-AA-GG-GA-GC-G-TA-GAC-G-G-C-GA-T-G-C-AA-G-T-C-T-G-A-...
    >M00967_43_000000000-A3JHG_1_1112_5981_8948
    TAC--GT-GG-GAT--GCG-A-G-C-G-T-T--AT-C-CGG-AT--TT-A-T-T--GG-GT--TT-A-AA-GG-GT-GC-G-CA-GGC-G-G-A-AG-A-T-C-AA-G-T-C-A-G-C-...
    ...

### list

To use the list option, follow this example:

    mothur > remove.groups(count=final.count_table, list=final.opti_mcc.list, groups=F3D0-F3D1-F3D8)

This generates the file final.opti_mcc.0.03.pick.list, which contains the 500 otus containing sequences from the groups F3D141, F3D142, F3D143, F3D144, F3D145, F3D146, F3D147, F3D148, F3D149, F3D150, F3D2, F3D3, F3D5, F3D6, F3D7 or F3D9.

    label	numOtus	Otu001	Otu002	Otu003	Otu004	Otu005	Otu006	Otu007	Otu008	Otu009	Otu010	Otu011	Otu012	...
    0.03	500	M00967_43_000000000-A3JHG_1_1101_20262_22075,M00967_43_000000000-A3JHG_1_2101_13755_8645,M00967_43_000000000-A3JHG_1_1110_16292_27414,M00967_43_000000000-A3JHG_1_2108_7751_22068,M00967_43_000000000-A3JHG_1_1110_19425_20093,M00967_43_000000000-A3JHG_1_2101_7036_14239,M00967_43_000000000-A3JHG_1_2103_14884_16027,M00967_43_000000000-...

as well as a final.pick.count_table with the same sequences.

### taxonomy

To use the taxonomy option, follow this example:

    mothur > remove.groups(count=final.count_table, taxonomy=final.taxonomy, groups=F3D0-F3D1-F3D8)

This generates the file final.pick.taxonomy, which looks like:

    M00967_43_000000000-A3JHG_1_1106_24198_4737	Bacteria(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);
    M00967_43_000000000-A3JHG_1_2109_10445_7921	Bacteria(100);Firmicutes(97);Clostridia(97);Clostridiales(97);Lachnospiraceae(94);Lachnospiraceae_unclassified(94);
    M00967_43_000000000-A3JHG_1_1106_7807_21999	Bacteria(100);Firmicutes(92);Clostridia(91);Clostridiales(91);Lachnospiraceae(89);Lachnospiraceae_unclassified(89);
    M00967_43_000000000-A3JHG_1_2113_27238_12024	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(98);Dorea(82);
    M00967_43_000000000-A3JHG_1_2109_21713_13835	Bacteria(100);Firmicutes(99);Clostridia(99);Clostridiales(99);Lachnospiraceae(99);Lachnospiraceae_unclassified(99);
    M00967_43_000000000-A3JHG_1_1104_18175_14208	Bacteria(100);"Bacteroidetes"(99);"Bacteroidia"(93);"Bacteroidales"(93);"Porphyromonadaceae"(83);"Porphyromonadaceae"_unclassified(83);
    M00967_43_000000000-A3JHG_1_2104_19276_2046	Bacteria(100);Firmicutes(100);Clostridia(99);Clostridiales(99);Lachnospiraceae(97);Lachnospiraceae_unclassified(97);
    M00967_43_000000000-A3JHG_1_1101_26300_8238	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(96);"Bacteroidales"(96);"Porphyromonadaceae"(90);"Porphyromonadaceae"_unclassified(90);
    M00967_43_000000000-A3JHG_1_2111_18339_15747	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Ruminococcaceae(91);Butyricicoccus(89);
    M00967_43_000000000-A3JHG_1_1114_7614_20887	Bacteria(100);"Bacteroidetes"(98);"Bacteroidia"(91);"Bacteroidales"(91);"Porphyromonadaceae"(91);"Porphyromonadaceae"_unclassified(91);
    ...

as well as a final.pick.count_table with the same sequences.

### shared

To use the shared option, follow this example:

    mothur > remove.groups(shared=final.opti_mcc.shared, groups=F3D0-F3D1-F3D8)

This generates the file final.opti_mcc.0.03.pick.shared, which contains
the following lines:

    label	Group	numOtus	Otu001	Otu002	Otu003	Otu004	Otu005	Otu006	Otu007	Otu008	Otu009	Otu010	Otu011	Otu012	...
    0.03	F3D141	500	388	335	301	482	425	279	206	331	119	175	111	101	8	13	28	96	60	4	37	45	48	76	11	42	6	...
    0.03	F3D142	500	244	258	142	152	253	193	201	81	72	43	51	81	96	6	8	45	24	5	21	4	9	28	20	7	4	...
    0.03	F3D143	500	189	152	173	207	308	183	116	92	62	76	70	43	37	2	7	36	26	1	15	9	8	56	17	13	3	...
    0.03	F3D144	500	346	243	260	316	469	282	132	36	140	256	96	84	13	7	10	100	38	5	39	39	14	13	17	23	3	...
    0.03	F3D145	500	566	445	461	527	665	471	362	127	217	319	131	188	18	8	14	107	81	5	81	32	11	12	18	11	5	...
    0.03	F3D146	500	270	204	225	365	397	257	193	66	78	185	80	71	4	39	22	35	47	3	29	18	21	68	24	24	19	...
    0.03	F3D147	500	1316	1107	819	1052	1619	1051	545	89	240	498	526	476	135	22	70	277	358	31	117	139	...
    0.03	F3D148	500	750	666	520	830	1230	725	499	542	186	419	283	239	17	47	43	248	186	44	106	105	24	87	88	24	...
    0.03	F3D149	500	770	701	650	861	879	651	454	542	257	497	290	159	74	39	37	163	155	3	99	133	41	245	32	59	8	...
    0.03	F3D150	500	265	207	343	436	281	276	182	110	132	57	161	71	55	19	18	30	58	4	40	19	12	128	29	22	6	...
    0.03	F3D2	500	3076	1439	1065	451	148	410	354	1222	572	60	306	143	308	550	337	17	32	378	173	29	148	...
    0.03	F3D3	500	831	543	400	187	23	213	448	398	268	175	221	65	84	16	47	22	13	328	89	115	34	1	18	19	35	...
    0.03	F3D5	500	278	235	236	148	20	137	142	193	191	67	115	66	45	83	78	29	12	13	40	7	38	2	116	32	47	...
    0.03	F3D6	500	902	608	507	381	12	356	501	250	218	48	128	59	392	72	54	0	6	66	34	26	50	5	72	52	57	...
    0.03	F3D7	500	576	449	385	294	9	235	517	223	251	13	117	43	106	25	35	2	7	37	15	35	13	2	32	12	10	...
    0.03	F3D9	500	435	374	429	189	5	255	610	419	203	28	97	22	166	98	94	0	8	39	33	22	37	3	79	45	37	...

You can see that some OTU's were entirely eliminated because they do not contain sequences from the groups F3D141, F3D142, F3D143, F3D144, F3D145, F3D146, F3D147, F3D148, F3D149, F3D150, F3D2, F3D3, F3D5, F3D6, F3D7 or F3D9.

### design

To use the design option, follow this example:

    mothur > remove.groups(shared=final.opti_mcc.shared, design=mouse.time.design, groups=F3D0-F3D1-F3D8)

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
    F3D141	Late
    F3D142	Late
    F3D143	Late
    F3D144	Late
    F3D145	Late
    F3D146	Late
    F3D147	Late
    F3D148	Late
    F3D149	Late
    F3D150	Late
    F3D2	Early
    F3D3	Early
    F3D5	Early
    F3D6	Early
    F3D7	Early
    F3D9	Early


### sets

The sets parameter allows you to specify which of the sets in your
designfile you would like to remove. You can separate set names with
dashes. If you want to remove all the groups in the Early treatment, try this:

    mothur > remove.groups(shared=final.opti_mcc.shared, design=mouse.time.design, sets=Early)

The resulting mouse.time.pick.design file will look like:

    group	treatment
    F3D141	Late
    F3D142	Late
    F3D143	Late
    F3D144	Late
    F3D145	Late
    F3D146	Late
    F3D147	Late
    F3D148	Late
    F3D149	Late
    F3D150	Late
    
And the shared file will look like:

    label	Group	numOtus	Otu001	Otu002	Otu003	Otu004	Otu005	Otu006	Otu007	Otu008	Otu009	Otu010	Otu011	Otu012	...
    0.03	F3D141	428	388	335	301	482	425	279	206	331	119	175	111	101	8	13	28	96	60	4	37	45	48	76	11	42	6	...
    0.03	F3D142	428	244	258	142	152	253	193	201	81	72	43	51	81	96	6	8	45	24	5	21	4	9	28	20	7	4	...
    0.03	F3D143	428	189	152	173	207	308	183	116	92	62	76	70	43	37	2	7	36	26	1	15	9	8	56	17	13	3	...
    0.03	F3D144	428	346	243	260	316	469	282	132	36	140	256	96	84	13	7	10	100	38	5	39	39	14	13	17	23	3	...
    0.03	F3D145	428	566	445	461	527	665	471	362	127	217	319	131	188	18	8	14	107	81	5	81	32	11	12	18	11	5	...
    0.03	F3D146	428	270	204	225	365	397	257	193	66	78	185	80	71	4	39	22	35	47	3	29	18	21	68	24	24	19	...
    0.03	F3D147	428	1316	1107	819	1052	1619	1051	545	89	240	498	526	476	135	22	70	277	358	31	117	139	...
    0.03	F3D148	428	750	666	520	830	1230	725	499	542	186	419	283	239	17	47	43	248	186	44	106	105	24	87	88	24	...
    0.03	F3D149	428	770	701	650	861	879	651	454	542	257	497	290	159	74	39	37	163	155	3	99	133	41	245	32	59	8	...
    0.03	F3D150	428	265	207	343	436	281	276	182	110	132	57	161	71	55	19	18	30	58	4	40	19	12	128	29	22	6	...


### phylip

The phylip option is used to specify the name of the [ phylip
formatted](/wiki/phylip-formatted_distance_matrix) distance file
you would like to remove distances from. To generate the .dist file, run the following:

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


To remove the distances for the Early treatment, run the following:

    mothur > remove.groups(phylip=final.opti_mcc.thetayc.0.03.lt.ave.dist, design=mouse.time.design, sets=Early)

creates a final.opti_mcc.thetayc.0.03.lt.ave.pick.dist file:

    10
    F3D141
    F3D142	0.159277
    F3D143	0.07582	0.111769
    F3D144	0.150278	0.164039	0.081844
    F3D145	0.113041	0.099472	0.069555	0.03427
    F3D146	0.104369	0.182698	0.06418	0.103432	0.097991
    F3D147	0.152776	0.105287	0.081308	0.054359	0.050777	0.122631
    F3D148	0.067956	0.125263	0.048796	0.0904	0.075236	0.100006	0.085041
    F3D149	0.037621	0.148458	0.066224	0.129811	0.105153	0.083807	0.134928	0.068088
    F3D150	0.122289	0.225027	0.124343	0.224982	0.184366	0.123207	0.206566	0.189054	0.101765
    
Alternatively, you can select distances between sequences. To generate the distance matrix, run the following:

    mothur > dist.seqs(fasta=final.fasta, output=lt)
    
This will create the final.phylip.dist file. You can remove the distances related to sequences from groups F3D0, F3D1 or F3D8, as follows:

    mothur > remove.groups(phylip=final.phylip.dist, count=final.count_table, groups=F3D0-F3D1-F3D8)

### column

The column option is used to specify the name of the [ column
formatted](/wiki/column-formatted_distance_matrix) distance file
you would like to remove distances from.

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

    mothur > remove.groups(column=final.opti_mcc.thetayc.0.03.column.ave.dist, design=mouse.time.design, sets=Early)

creates a final.opti_mcc.thetayc.0.03.column.ave.pick.dist file:
    
    F3D142	F3D141	0.159277
    F3D143	F3D141	0.07582
    F3D143	F3D142	0.111769
    F3D144	F3D141	0.150278
    F3D144	F3D142	0.164039
    F3D144	F3D143	0.081844
    F3D145	F3D141	0.113041
    F3D145	F3D142	0.099472
    F3D145	F3D143	0.069555
    F3D145	F3D144	0.03427
    F3D146	F3D141	0.104369
    F3D146	F3D142	0.182698
    F3D146	F3D143	0.06418
    F3D146	F3D144	0.103431
    F3D146	F3D145	0.097991
    F3D147	F3D141	0.152776
    F3D147	F3D142	0.105287
    F3D147	F3D143	0.081308
    F3D147	F3D144	0.054359
    ...
    
Alternatively, you can remove distances between sequences. To generate the distance matrix, run the following:

    mothur > dist.seqs(fasta=final.fasta, cutoff=0.03)
    
This will create the final.dist file. You can remove the distances related to sequences from groups F3D0, F3D1 or F3D8, as follows:

    mothur > remove.groups(column=final.dist, count=final.count_table, groups=F3D0-F3D1-F3D8)

You may see a warning similar to:

    Removed 15096 sequences from your count file.
    [WARNING]: Your accnos file contains 292 groups or sequences, but I only found 276 of them in the column file.
    Removed 276 groups or sequences from your column file.

This warning can be disregarded. When you use a cutoff with the dist.seqs command, sequences with distance above the cutoff are NOT added to the distance file. This means you can have sequences in the count file, that are not in the distance file. Mothur assumes reads missing from the distance file but present in the count file only have distances above the cutoff.

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

-   1.23.0 File mismatch bug -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1396&p=3560#p3560](https://forum.mothur.org/viewtopic.php?f=4&t=1396&p=3560#p3560)
-   1.24.0 Added design option
-   1.28.0 Added count option
-   1.31.0 Bug Fix: remove.groups(groups=notValidGroupName, \...) mothur
    removes all of the groups. Fix will ignore invalid group and
    continue.
-   1.36.0 Bug Fix: not creating a list file for each label.
-   1.37.0 Adds phylip and column options
    [\#79](https://github.com/mothur/mothur/issues/79)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.44.0 - Adds sets parameter.
    [\#277](https://github.com/mothur/mothur/issues/277)
-   1.47.0 - Fixes bug with remove.groups phylip file option.


