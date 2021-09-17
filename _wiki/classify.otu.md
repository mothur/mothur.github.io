---
title: 'classify.otu'
tags: 'commands'
redirect_from: '/wiki/Classify.otu.html'
---
The **classify.otu** command is used to get a consensus taxonomy for an otu.
To run through the example below, download [Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/ExampleDataSet.zip) 
and [mothur-formatted version of the RDP training set
    (v.9)](https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset9_032012.pds.zip).
    
## Default Setting

The **classify.otu** command parameters are list, taxonomy, name, count,
cutoff, label and probs. The taxonomy and list parameters are required.

First you must classify your sequences, you can do so by running the
following command:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)
    
Then you can use your taxonomy file to find the consensus taxonomy for your otus at various distances.

    mothur > classify.otu(taxonomy=final.taxonomy, list=final.opti_mcc.list, count=final.count_table)

When you open final.opti_mcc.0.03.cons.taxonomy you will see something like:

    OTU	Size	Taxonomy
    Otu001	12288	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);"Porphyromonadaceae"(100);"Porphyromonadaceae"_unclassified(100);
    Otu002	8892	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);"Porphyromonadaceae"(100);"Porphyromonadaceae"_unclassified(100);
    Otu003	7794	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);"Porphyromonadaceae"(100);"Porphyromonadaceae"_unclassified(100);
    Otu004	7473	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);"Porphyromonadaceae"(100);Barnesiella(100);
    Otu005	7450	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);"Porphyromonadaceae"(100);"Porphyromonadaceae"_unclassified(100);
    Otu006	6621	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);"Porphyromonadaceae"(100);"Porphyromonadaceae"_unclassified(100);
    Otu007	6304	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);Bacteroidaceae(100);Bacteroides(100);
    Otu008	5337	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);"Rikenellaceae"(100);Alistipes(100);
    Otu009	3606	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);"Porphyromonadaceae"(100);"Porphyromonadaceae"_unclassified(100);
    Otu010	3061	Bacteria(100);Firmicutes(100);Bacilli(100);Lactobacillales(100);Lactobacillaceae(100);Lactobacillus(100);
    ...

The first column is the OTU label, the second column is the number of
sequences in the otu and the third column is the consensus taxonomy.


## count

The [ count](/wiki/Count_File) file is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > classify.otu(taxonomy=final.taxonomy, list=final.opti_mcc.list, count=final.count_table) 

## cutoff

The cutoff parameter allows you to specify a consensus confidence
threshold for your taxonomy. The default is 51, meaning 51%. Cutoff
cannot be below 51.

    mothur > classify.otu(taxonomy=final.taxonomy, list=final.opti_mcc.list, count=final.count_table, cutoff=80) 


## basis

The basis parameter allows you indicate what you want the summary file
to represent, options are otu and sequence. Default is otu. For example
consider the following basis=sequence could give Clostridiales 3 105 16
43 46, where 105 is the total number of sequences whose otu classified
to Clostridiales. 16 is the number of sequences in the otus from groupA,
43 is the number of sequences in the otus from groupB, and 46 is the
number of sequences in the otus from groupC. Now for basis=otu could
give Clostridiales 3 7 6 1 2, where 7 is the number of otus that
classified to Clostridiales. 6 is the number of otus containing
sequences from groupA, 1 is the number of otus containing sequences from
groupB, and 2 is the number of otus containing sequences from groupC.

## relabund

The relabund parameter allows you to indicate you want the summary file
values to be relative abundances rather than raw abundances. Default=F.

## output

The output parameter allows you to specify format of your \*tax.summary
file. Options are simple and detail. The detail format outputs the
totals at each level, where as the simple format outputs the highest
level. The default is detail.

The detail format looks like:

    taxlevel	rankID	taxon	daughterlevels	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    0	0	Root	1	532	188	171	170	162	145	174	197	181	230	216	212	184	209	143	158	177	141	174	188
    1	0.1	Bacteria	9	532	188	171	170	162	145	174	197	181	230	216	212	184	209	143	158	177	141	174	188
    2	0.1.1	"Actinobacteria"	1	15	3	2	4	4	4	6	4	3	7	5	6	5	4	4	1	2	3	3	2
    3	0.1.1.1	Actinobacteria	3	15	3	2	4	4	4	6	4	3	7	5	6	5	4	4	1	2	3	3	2
    4	0.1.1.1.1	Actinomycetales	2	3	0	0	0	1	0	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    5	0.1.1.1.1.1	Actinomycetaceae	1	2	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    6  	0.1.1.1.1.1.1	Actinomyces	0	2	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    5	0.1.1.1.1.2	Promicromonosporaceae	1	1	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    6	0.1.1.1.1.2.1	Promicromonospora	0	1	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    4	0.1.1.1.2	Bifidobacteriales	1	3	1	0	1	2	1	1	1	1	2	1	1	1	1	1	0	0	0	0	0
    5	0.1.1.1.2.1	Bifidobacteriaceae	1	3	1	0	1	2	1	1	1	1	2	1	1	1	1	1	0	0	0	0	0
    6	0.1.1.1.2.1.1	Bifidobacterium	0	3	1	0	1	2	1	1	1	1	2	1	1	1	1	1	0	0	0	0	0
    4	0.1.1.1.3	Coriobacteriales	1	9	2	2	3	1	3	5	1	2	5	4	5	4	3	3	1	2	3	3	2
    5	0.1.1.1.3.1	Coriobacteriaceae	3	9	2	2	3	1	3	5	1	2	5	4	5	4	3	3	1	2	3	3	2
    6	0.1.1.1.3.1.1	Coriobacteriaceae_unclassified	0	5	1	1	1	1	1	3	0	1	3	2	4	3	2	1	0	1	2	2	1
    ...

The simple format looks like:

    taxonomy	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    Root	532	188	171	170	162	145	174	197	181	230	216	212	184	209	143	158	177	141	174	188
    Bacteria;"Actinobacteria";Actinobacteria;Actinomycetales;Actinomycetaceae;Actinomyces;	2	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Actinomycetales;Promicromonosporaceae;Promicromonospora;	1	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Bifidobacteriales;Bifidobacteriaceae;Bifidobacterium;	3	1	0	1	2	1	1	1	1	2	1	1	1	1	1	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Coriobacteriales;Coriobacteriaceae;Coriobacteriaceae_unclassified;	5	1	1	1	1	1	3	0	1	3	2	4	3	2	1	0	1	2	2	1
    Bacteria;"Actinobacteria";Actinobacteria;Coriobacteriales;Coriobacteriaceae;Enterorhabdus;	3	1	1	1	0	2	1	1	1	1	1	1	1	1	2	1	1	1	1	1
    Bacteria;"Actinobacteria";Actinobacteria;Coriobacteriales;Coriobacteriaceae;Olsenella;	1	0	0	1	0	0	1	0	0	1	1	0	0	0	0	0	0	0	0	0
    Bacteria;"Bacteroidetes";"Bacteroidetes"_unclassified;"Bacteroidetes"_unclassified;"Bacteroidetes"_unclassified;"Bacteroidetes"_unclassified;	7	0	0	1	0	0	0	2	0	2	0	0	1	2	1	0	1	0	0	0
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Bacteroidales"_unclassified;"Bacteroidales"_unclassified;	14	1	2	1	4	1	2	2	2	2	1	3	1	5	1	1	3	1	1	1
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";"Porphyromonadaceae"_unclassified;	91	12	12	19	16	13	23	24	18	38	33	29	17	21	18	12	11	12	11	10
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";Barnesiella;	10	1	1	1	1	1	2	4	2	4	4	1	3	1	1	1	1	1	1	1
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Rikenellaceae";Alistipes;	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";Bacteroidaceae;Bacteroides;	2	1	1	1	1	1	2	1	1	1	1	1	1	1	1	1	1	1	1	1
    Bacteria;"Bacteroidetes";Flavobacteria;"Flavobacteriales";Cryomorphaceae;Cryomorphaceae_unclassified;	1	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0
    ...

## printlevel

The printlevel parameter allows you to specify taxlevel of your
\*tax.summary file to print to. Options are 1 to the maz level in the
file. The default is -1, meaning max level. If you select a level
greater than the level your sequences classify to, mothur will print to
the level your max level.

    mothur > classify.otu(taxonomy=final.taxonomy, list=final.opti_mcc.list, count=final.count_table, printlevel=4)

Detail format:

    taxlevel	rankID	taxon	daughterlevels	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    0	0	Root	1	532	188	171	170	162	145	174	197	181	230	216	212	184	209	143	158	177	141	174	188
    1	0.1	Bacteria	9	532	188	171	170	162	145	174	197	181	230	216	212	184	209	143	158	177	141	174	188
    2	0.1.1	"Actinobacteria"	1	15	3	2	4	4	4	6	4	3	7	5	6	5	4	4	1	2	3	3	2
    3	0.1.1.1	Actinobacteria	3	15	3	2	4	4	4	6	4	3	7	5	6	5	4	4	1	2	3	3	2
    4	0.1.1.1.1	Actinomycetales	2	3	0	0	0	1	0	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    4	0.1.1.1.2	Bifidobacteriales	1	3	1	0	1	2	1	1	1	1	2	1	1	1	1	1	0	0	0	0	0
    4	0.1.1.1.3	Coriobacteriales	1	9	2	2	3	1	3	5	1	2	5	4	5	4	3	3	1	2	3	3	2
    2	0.1.2	"Bacteroidetes"	3	127	16	17	24	23	17	31	34	24	48	40	35	24	31	23	16	18	16	15	15
    3	0.1.2.1	"Bacteroidetes"_unclassified	1	7	0	0	1	0	0	0	2	0	2	0	0	1	2	1	0	1	0	0	0
    4	0.1.2.1.1	"Bacteroidetes"_unclassified	1	7	0	0	1	0	0	0	2	0	2	0	0	1	2	1	0	1	0	0	0
    ...

Simple Format:

    taxonomy	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    Root	532	188	171	170	162	145	174	197	181	230	216	212	184	209	143	158	177	141	174	188
    Bacteria;"Actinobacteria";Actinobacteria;Actinomycetales;	3	0	0	0	1	0	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Bifidobacteriales;	3	1	0	1	2	1	1	1	1	2	1	1	1	1	1	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Coriobacteriales;	9	2	2	3	1	3	5	1	2	5	4	5	4	3	3	1	2	3	3	2
    Bacteria;"Bacteroidetes";"Bacteroidetes"_unclassified;"Bacteroidetes"_unclassified;	7	0	0	1	0	0	0	2	0	2	0	0	1	2	1	0	1	0	0	0
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";	118	16	17	23	23	17	30	32	24	46	40	35	23	29	22	16	17	16	15	14
    Bacteria;"Bacteroidetes";Flavobacteria;"Flavobacteriales";	2	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	1
    Bacteria;"Deinococcus-Thermus";Deinococci;Deinococcales;	3	0	0	1	2	1	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Proteobacteria";Betaproteobacteria;Neisseriales;	1	0	0	0	1	0	1	1	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Proteobacteria";Gammaproteobacteria;"Enterobacteriales";	7	1	1	2	0	0	1	2	1	1	1	1	1	1	1	1	1	1	1	2
    Bacteria;"Proteobacteria";Gammaproteobacteria;Aeromonadales;	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Proteobacteria";Gammaproteobacteria;Gammaproteobacteria_unclassified;	1	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0
    Bacteria;"Proteobacteria";Gammaproteobacteria;Pseudomonadales;	5	1	2	0	1	1	2	2	0	0	1	1	1	2	1	1	1	1	1	1
    Bacteria;"Proteobacteria";Gammaproteobacteria;Xanthomonadales;	1	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Tenericutes";Mollicutes;Anaeroplasmatales;	3	1	1	0	1	0	0	1	0	2	0	1	0	1	1	1	1	2	1	1
    Bacteria;"Verrucomicrobia";Verrucomicrobiae;Verrucomicrobiales;	1	1	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0
    Bacteria;Bacteria_unclassified;Bacteria_unclassified;Bacteria_unclassified;	18	7	4	4	3	7	5	6	4	11	13	8	7	4	3	4	3	4	4	4
    Bacteria;Firmicutes;Bacilli;Bacillales;	4	0	0	2	3	0	1	1	0	0	0	0	0	1	0	0	1	0	0	0
    Bacteria;Firmicutes;Bacilli;Bacilli_unclassified;	2	0	0	0	0	0	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;Firmicutes;Bacilli;Lactobacillales;	10	5	4	4	3	4	3	6	3	3	4	4	3	6	4	3	4	5	5	4
    Bacteria;Firmicutes;Clostridia;Clostridia_unclassified;	10	0	1	1	3	2	4	2	1	2	1	2	2	3	2	1	1	1	1	1
    Bacteria;Firmicutes;Clostridia;Clostridiales;	289	141	132	121	105	101	112	126	138	146	139	143	133	149	97	126	140	100	136	149
    Bacteria;Firmicutes;Erysipelotrichia;Erysipelotrichales;	4	2	0	2	3	1	1	2	2	2	3	1	1	1	2	1	0	2	2	1
    Bacteria;Firmicutes;Firmicutes_unclassified;Firmicutes_unclassified;	20	7	3	3	6	6	6	6	4	7	7	8	5	4	3	2	4	4	4	5
    Bacteria;TM7;TM7_class_incertae_sedis;TM7_order_incertae_sedis;	10	2	3	2	4	1	1	1	1	1	2	1	2	1	2	1	1	2	1	3

## label

The label parameter allows you to select what distance levels you would
like an output files created for, and is separated by dashes. The default
value for label is all labels in your list file.

    mothur > classify.otu(taxonomy=final.taxonomy, list=final.opti_mcc.list, count=final.count_table, label=0.03) 

## probs

The probs parameter shuts off the outputting of the consensus confidence
results. The default is true, meaning you want the confidence to be
shown.

    mothur > classify.otu(taxonomy=final.taxonomy, list=final.opti_mcc.list, count=final.count_table, probs=f) 

## persample

The persample parameter allows you to find a consensus taxonomy for each
group. Default=false.

## threshold

The threshold parameter allows you to specify a cutoff for your taxonomy
input file. It's a way to after the fact "adjust" the cutoff used in
classify.seqs command without having to reclassify.

    mothur > classify.otu(taxonomy=final.taxonomy, list=final.opti_mcc.list, count=final.count_table, threshold=90) 

## name - not recommended

The name option allows you to provide a name file associated with your taxonomy file.

We DO NOT recommend using the name file. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

## group - not recommended

The group parameter allows you to provide a group file to use when
creating the summary file. 

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.


## Revisions

-   1.28.0 Added count parameter
-   1.29.0 Added persample parameter
-   1.29.0 Bug Fix - if basis=sequence and count file is used, redundant
    sequences were not added to .tax.summary file counts.
-   1.32.0 Bug Fix: error in \*.tax.summary counts with basis=sequence
    when using a count file.
    [https://forum.mothur.org/viewtopic.php?f=4&t=2492&p=7420#p7420](https://forum.mothur.org/viewtopic.php?f=4&t=2492&p=7420#p7420)
-   1.36.0 Adds threshold parameter. The threshold parameter allows you
    to specify a cutoff for the taxonomy file that is being inputted.
-   1.37.0 Adds output, print level and relabund parameters
    [\#204](https://github.com/mothur/mothur/issues/204)
    [\#158](https://github.com/mothur/mothur/issues/158)
    [\#101](https://github.com/mothur/mothur/issues/101)
-   1.37.0 Adds parent taxons to unclassified taxons for outputs
    [\#29](https://github.com/mothur/mothur/issues/29)
-   1.38.0 Removes reftaxonomy parameter
-   1.38.0 Fixes bug with persample option
-   1.39.0 Taxonomy files can now contain spaces in the taxon names
-   1.40.0 Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)


