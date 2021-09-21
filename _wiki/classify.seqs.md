---
title: 'classify.seqs'
tags: 'commands'
redirect_from: '/wiki/Classify.seqs.html'
---
The **classify.seqs** command allows the user to
use several different methods to assign their sequences to the taxonomy
outline of their choice. Current methods include the Wang approach, using a k-nearest
neighbor consensus and zap. Taxonomy outlines and reference
sequences can be obtained from the [taxonomy
outline](/wiki/taxonomy_outline) page. The command requires that
you provide a fasta-formatted input and database sequence file and a
taxonomy file for the reference sequences. To run through the example below, download [Example Data](https://mothur.s3.us-east-2.amazonaws.com/wiki/ExampleDataSet.zip) 
and [mothur-formatted version of the RDP training set
    (v.9)](https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset9_032012.pds.zip).

## Default Settings

The classify.seqs command uses reference files to assign the taxonomies of the sequences in your fasta file. 

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)

mothur will output two files from the **classify.seqs** command: a
\*.taxonomy file which contains a taxonomy string for each sequence and
a \*.tax.summary file which contains a taxonomic outline indicating the
number of sequences that were found for your collection at each level.
For example, final.pds.wang.taxonomy may look like:

    M00967_43_000000000-A3JHG_1_2102_22092_15614	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(95);"Bacteroidales"(95);"Porphyromonadaceae"(88);"Porphyromonadaceae"_unclassified(88);
    M00967_43_000000000-A3JHG_1_1102_8406_20325	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);Bacteroidaceae(100);Bacteroides(100);
    M00967_43_000000000-A3JHG_1_1106_15955_6621	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(100);Lachnospiraceae_unclassified(100);
    M00967_43_000000000-A3JHG_1_2103_24256_12640	Bacteria(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);
    M00967_43_000000000-A3JHG_1_1101_6929_7655	Bacteria(100);"Bacteroidetes"(99);"Bacteroidia"(98);"Bacteroidales"(98);"Porphyromonadaceae"(95);"Porphyromonadaceae"_unclassified(95);
    M00967_43_000000000-A3JHG_1_1105_5520_9241	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(100);Clostridium_XlVa(87);
    M00967_43_000000000-A3JHG_1_1112_5981_8948	Bacteria(100);"Bacteroidetes"(95);"Bacteroidia"(82);"Bacteroidales"(82);"Bacteroidales"_unclassified(82);"Bacteroidales"_unclassified(82);
    M00967_43_000000000-A3JHG_1_2105_24795_12844	Bacteria(100);Firmicutes(96);Clostridia(94);Clostridiales(94);Lachnospiraceae(92);Lachnospiraceae_unclassified(92);
    M00967_43_000000000-A3JHG_1_1112_18411_17052	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(98);"Bacteroidales"(98);"Porphyromonadaceae"(97);"Porphyromonadaceae"_unclassified(97);
    M00967_43_000000000-A3JHG_1_1110_19644_17655	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(99);"Bacteroidales"(99);"Porphyromonadaceae"(92);"Porphyromonadaceae"_unclassified(92);
    M00967_43_000000000-A3JHG_1_1110_15641_10799	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Clostridiales_unclassified(100);Clostridiales_unclassified(100);
    M00967_43_000000000-A3JHG_1_1107_13819_9393	Bacteria(100);Firmicutes(90);Clostridia(90);Clostridiales(90);Lachnospiraceae(88);Lachnospiraceae_unclassified(88);
    M00967_43_000000000-A3JHG_1_2110_20081_2854	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(95);Lachnospiraceae_unclassified(95);
    ...
    
This output indicates the sequence identifier in the first column as
well as it's taxonomy. The bootstrap values are
provided. 

The second output file, final.pds.wang.tax.summary may look something like
the following:

    taxlevel	rankID	taxon	daughterlevels	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    0	0	Root	1	113959	6191	4652	4656	2423	2403	3452	5532	3828	12431	9465	10014	4121	15686	5199	3469	6394	4055	4253	5735
    1	0.1	Bacteria	9	113959	6191	4652	4656	2423	2403	3452	5532	3828	12431	9465	10014	4121	15686	5199	3469	6394	4055	4253	5735
    2	0.1.1	"Actinobacteria"	1	371	24	4	19	25	11	27	10	9	44	72	40	28	19	20	3	4	4	4	4
    3	0.1.1.1	Actinobacteria	3	371	24	4	19	25	11	27	10	9	44	72	40	28	19	20	3	4	4	4	4
    4	0.1.1.1.1	Actinomycetales	2	3	0	0	0	1	0	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    5	0.1.1.1.1.1	Actinomycetaceae	1	2	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    6	0.1.1.1.1.1.1	Actinomyces	0	2	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    5	0.1.1.1.1.2	Promicromonosporaceae	1	1	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    6	0.1.1.1.1.2.1	Promicromonospora	0	1	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    4	0.1.1.1.2	Bifidobacteriales	1	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    5	0.1.1.1.2.1	Bifidobacteriaceae	1	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    6	0.1.1.1.2.1.1	Bifidobacterium	0	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    ...

The first column indicates the taxonomic level in the outline.
Obviously, the Root is the highest one can go. In this case the deepest
any of the sequences go is to level 6. The second column indicates the
"pedigree" for each lineage. The third column is the name of the
lineage. Column four indicates the number of children lineages that the
current lineage has. The fifth column indicates the number of
sequences that were found in that lineage. Finally the remaining columns are the number of sequences in each sample.

## method

### wang
When finding the taxonomy of a given query sequence in
the fasta file, the wang method looks at the query sequence kmer by
kmer. The method looks at all taxonomies represented in the template,
and calculates the probability a sequence from a given taxonomy would
contain a specific kmer. Then calculates the probability a query
sequence would be in a given taxonomy based on the kmers it contains,
and assign the query sequence to the taxonomy with the highest
probability. This method also runs a bootstrapping algorithmn to find
the confidence limit of the assignment by randomly choosing with
replacement 1/8 of the kmers in the query and then finding the taxonomy.
This is the method that is implemented by the RDP and is described by
Wang et al. This is the default method in classify.seqs.

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)

or

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, method=wang)

    Reading template taxonomy...     DONE.
    Reading template probabilities...     DONE.
    It took 5 seconds get probabilities.
    Classifying sequences from /Users/swestcott/Desktop/release/final.fasta ...
    100
    100
    100
    ...
    
    It took 21 secs to classify 2424 sequences.
    
### knn

The k-Nearest Neighbor algorithm involves identifying the
k-most similar sequences in a database that are similar to your
sequence. By default, mothur will find the 10 most similar sequences in
the database. Once mothur has identified the k-most similar sequences,
she will use the taxonomy information for each sequence to determine the
consensus taxonomy. mothur gives you the ability to determine the method
that is used to find the closest matches, the value of k This
classification method can be implemented by the following.

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, method=knn)

Note: With the knn method using a distance search, mothur will create a
\.match.dist file containing the sequence name, the name of the best
match in the template and the distance.

### zap

## count

The [ count](/wiki/Count_File) file is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

## cutoff

By default, the cutoff value is set to 80. If you set cutoff=0,
classify.seqs will return a full taxonomy for every sequence, regardless
of the bootstrap value for that taxonomic assignment. 

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, cutoff=0, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)

For example, running with cutoff=0 will yield the following output:

    M00967_43_000000000-A3JHG_1_2102_22092_15614	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(95);"Bacteroidales"(95);"Porphyromonadaceae"(88);Tannerella(47);
    M00967_43_000000000-A3JHG_1_1102_8406_20325	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);Bacteroidaceae(100);Bacteroides(100);
    M00967_43_000000000-A3JHG_1_1106_15955_6621	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(100);Lachnospiracea_incertae_sedis(36);
    M00967_43_000000000-A3JHG_1_2103_24256_12640	Bacteria(100);Firmicutes(78);Bacilli(28);Lactobacillales(18);Aerococcaceae(15);Abiotrophia(15);
    M00967_43_000000000-A3JHG_1_1101_6929_7655	Bacteria(100);"Bacteroidetes"(99);"Bacteroidia"(98);"Bacteroidales"(98);"Porphyromonadaceae"(95);Barnesiella(59);
    M00967_43_000000000-A3JHG_1_1105_5520_9241	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(100);Clostridium_XlVa(87);
    M00967_43_000000000-A3JHG_1_1112_5981_8948	Bacteria(100);"Bacteroidetes"(95);"Bacteroidia"(82);"Bacteroidales"(82);"Porphyromonadaceae"(66);Tannerella(7);
    M00967_43_000000000-A3JHG_1_2105_24795_12844	Bacteria(100);Firmicutes(96);Clostridia(94);Clostridiales(94);Lachnospiraceae(92);Acetitomaculum(12);
    M00967_43_000000000-A3JHG_1_1112_18411_17052	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(98);"Bacteroidales"(98);"Porphyromonadaceae"(97);Barnesiella(40);
    M00967_43_000000000-A3JHG_1_1110_19644_17655	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(99);"Bacteroidales"(99);"Porphyromonadaceae"(92);Tannerella(39);
    M00967_43_000000000-A3JHG_1_1110_15641_10799	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Clostridiaceae_1(34);Anaerosporobacter(34);
    M00967_43_000000000-A3JHG_1_1107_13819_9393	Bacteria(100);Firmicutes(90);Clostridia(90);Clostridiales(90);Lachnospiraceae(88);Johnsonella(51);
    M00967_43_000000000-A3JHG_1_2110_20081_2854	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(95);Lachnospiracea_incertae_sedis(36);
    M00967_43_000000000-A3JHG_1_1102_6774_6343	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(94);"Bacteroidales"(94);"Porphyromonadaceae"(88);Tannerella(36);

You will notice that sequence M00967_43_000000000-A3JHG_1_2102_22092_15614 has a bootstrap value of 47% for
the assignment to the *Tannerella*. This isn't much of a
vote of confidence for this assignment. mothur's default is set to a
value of 80%, which mirrors the original implementation in the Wang
paper and the general approach to using 80% confidene in bootstrap
values for phylogenetics.:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, cutoff=80, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)


    M00967_43_000000000-A3JHG_1_2102_22092_15614	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(95);"Bacteroidales"(95);"Porphyromonadaceae"(88);"Porphyromonadaceae"_unclassified(88);
    M00967_43_000000000-A3JHG_1_1102_8406_20325	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(100);"Bacteroidales"(100);Bacteroidaceae(100);Bacteroides(100);
    M00967_43_000000000-A3JHG_1_1106_15955_6621	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(100);Lachnospiraceae_unclassified(100);
    M00967_43_000000000-A3JHG_1_2103_24256_12640	Bacteria(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);Bacteria_unclassified(100);
    M00967_43_000000000-A3JHG_1_1101_6929_7655	Bacteria(100);"Bacteroidetes"(99);"Bacteroidia"(98);"Bacteroidales"(98);"Porphyromonadaceae"(95);"Porphyromonadaceae"_unclassified(95);
    M00967_43_000000000-A3JHG_1_1105_5520_9241	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(100);Clostridium_XlVa(87);
    M00967_43_000000000-A3JHG_1_1112_5981_8948	Bacteria(100);"Bacteroidetes"(95);"Bacteroidia"(82);"Bacteroidales"(82);"Bacteroidales"_unclassified(82);"Bacteroidales"_unclassified(82);
    M00967_43_000000000-A3JHG_1_2105_24795_12844	Bacteria(100);Firmicutes(96);Clostridia(94);Clostridiales(94);Lachnospiraceae(92);Lachnospiraceae_unclassified(92);
    M00967_43_000000000-A3JHG_1_1112_18411_17052	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(98);"Bacteroidales"(98);"Porphyromonadaceae"(97);"Porphyromonadaceae"_unclassified(97);
    M00967_43_000000000-A3JHG_1_1110_19644_17655	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(99);"Bacteroidales"(99);"Porphyromonadaceae"(92);"Porphyromonadaceae"_unclassified(92);
    M00967_43_000000000-A3JHG_1_1110_15641_10799	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Clostridiales_unclassified(100);Clostridiales_unclassified(100);
    M00967_43_000000000-A3JHG_1_1107_13819_9393	Bacteria(100);Firmicutes(90);Clostridia(90);Clostridiales(90);Lachnospiraceae(88);Lachnospiraceae_unclassified(88);
    M00967_43_000000000-A3JHG_1_2110_20081_2854	Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Lachnospiraceae(95);Lachnospiraceae_unclassified(95);
    M00967_43_000000000-A3JHG_1_1102_6774_6343	Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(94);"Bacteroidales"(94);"Porphyromonadaceae"(88);"Porphyromonadaceae"_unclassified(88);
    ...
    
You should notice two things. First, there are no bootstrap values below
80 for any of the taxonomy assignments. Second, the bootstrap values may
change slightly. This is acceptable as the bootstrapping is a randomized
process. The default number of iterations is 100.

## probs

Sometimes you may find the output of bootstrap values with your taxonomy
to be tedious. To get around this you can use the probs option to have
the probabilities excluded from the output:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, probs=F, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)


    M00967_43_000000000-A3JHG_1_2102_22092_15614	Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";"Porphyromonadaceae"_unclassified;
    M00967_43_000000000-A3JHG_1_1102_8406_20325	Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";Bacteroidaceae;Bacteroides;
    M00967_43_000000000-A3JHG_1_1106_15955_6621	Bacteria;Firmicutes;Clostridia;Clostridiales;Lachnospiraceae;Lachnospiraceae_unclassified;
    M00967_43_000000000-A3JHG_1_2103_24256_12640	Bacteria;Bacteria_unclassified;Bacteria_unclassified;Bacteria_unclassified;Bacteria_unclassified;Bacteria_unclassified;
    M00967_43_000000000-A3JHG_1_1101_6929_7655	Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";"Porphyromonadaceae"_unclassified;
    M00967_43_000000000-A3JHG_1_1105_5520_9241	Bacteria;Firmicutes;Clostridia;Clostridiales;Lachnospiraceae;Clostridium_XlVa;
    M00967_43_000000000-A3JHG_1_1112_5981_8948	Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Bacteroidales"_unclassified;"Bacteroidales"_unclassified;

## output

The output parameter allows you to specify format of your \*tax.summary
file. Options are simple and detail. The detail format outputs the
totals at each level, where as the simple format outputs the highest
level. The default is detail.

The detail format looks like:

    taxlevel	rankID	taxon	daughterlevels	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    0	0	Root	1	113959	6191	4652	4656	2423	2403	3452	5532	3828	12431	9465	10014	4121	15686	5199	3469	6394	4055	4253	5735
    1	0.1	Bacteria	9	113959	6191	4652	4656	2423	2403	3452	5532	3828	12431	9465	10014	4121	15686	5199	3469	6394	4055	4253	5735
    2	0.1.1	"Actinobacteria"	1	371	24	4	19	25	11	27	10	9	44	72	40	28	19	20	3	4	4	4	4
    3	0.1.1.1	Actinobacteria	3	371	24	4	19	25	11	27	10	9	44	72	40	28	19	20	3	4	4	4	4
    4	0.1.1.1.1	Actinomycetales	2	3	0	0	0	1	0	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    5	0.1.1.1.1.1	Actinomycetaceae	1	2	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    6	0.1.1.1.1.1.1	Actinomyces	0	2	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    5	0.1.1.1.1.2	Promicromonosporaceae	1	1	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    6	0.1.1.1.1.2.1	Promicromonospora	0	1	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    4	0.1.1.1.2	Bifidobacteriales	1	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    5	0.1.1.1.2.1	Bifidobacteriaceae	1	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    6	0.1.1.1.2.1.1	Bifidobacterium	0	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    ...

The simple format looks like:

    taxonomy	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    Root	113959	6191	4652	4656	2423	2403	3452	5532	3828	12431	9465	10014	4121	15686	5199	3469	6394	4055	4253	5735
    Bacteria;"Actinobacteria";Actinobacteria;Actinomycetales;Actinomycetaceae;Actinomyces;	2	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Actinomycetales;Promicromonosporaceae;Promicromonospora;	1	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Bifidobacteriales;Bifidobacteriaceae;Bifidobacterium;	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Coriobacteriales;Coriobacteriaceae;Coriobacteriaceae_unclassified;	45	1	1	1	1	1	3	0	2	6	3	5	6	5	1	0	2	2	2	3
    Bacteria;"Actinobacteria";Actinobacteria;Coriobacteriales;Coriobacteriaceae;Enterorhabdus;	78	2	3	1	0	2	3	3	4	10	8	12	6	10	4	3	2	2	2	1
    Bacteria;"Actinobacteria";Actinobacteria;Coriobacteriales;Coriobacteriaceae;Olsenella;	8	0	0	2	0	0	1	0	0	4	1	0	0	0	0	0	0	0	0	0
    Bacteria;"Bacteroidetes";"Bacteroidetes"_unclassified;"Bacteroidetes"_unclassified;"Bacteroidetes"_unclassified;"Bacteroidetes"_unclassified;	14	0	0	1	0	0	0	3	0	5	0	0	1	2	1	0	1	0	0	0
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Bacteroidales"_unclassified;"Bacteroidales"_unclassified;	1115	62	33	37	23	15	39	81	30	118	106	102	43	184	92	42	37	15	15	41
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";"Porphyromonadaceae"_unclassified;	53143	2564	1220	2130	1326	1211	1982	3242	1648	7577	4820	4531	1803	7220	2585	1292	2800	2076	1294	1822
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";Barnesiella;	7485	401	63	482	152	207	320	535	367	1054	834	866	438	445	186	147	378	294	128	188
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Rikenellaceae";Alistipes;	5337	164	174	331	81	92	36	127	66	89	542	542	110	1222	398	193	250	223	278	419
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";Bacteroidaceae;Bacteroides;	6305	168	127	206	201	116	133	362	193	545	499	454	182	354	448	142	501	517	547	610
    Bacteria;"Bacteroidetes";Flavobacteria;"Flavobacteriales";Cryomorphaceae;Cryomorphaceae_unclassified;	1	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Bacteroidetes";Flavobacteria;"Flavobacteriales";Cryomorphaceae;Lishizhenia;	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1
    Bacteria;"Deinococcus-Thermus";Deinococci;Deinococcales;Deinococcaceae;Deinococcus;	6	0	0	1	2	1	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    ...

## printlevel

The printlevel parameter allows you to specify taxlevel of your
\*tax.summary file to print to. Options are 1 to the maz level in the
file. The default is -1, meaning max level. If you select a level
greater than the level your sequences classify to, mothur will print to
the level your max level.

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, printlevel=4, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)

Detail format:

    taxlevel	rankID	taxon	daughterlevels	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    0	0	Root	1	113959	6191	4652	4656	2423	2403	3452	5532	3828	12431	9465	10014	4121	15686	5199	3469	6394	4055	4253	5735
    1	0.1	Bacteria	9	113959	6191	4652	4656	2423	2403	3452	5532	3828	12431	9465	10014	4121	15686	5199	3469	6394	4055	4253	5735
    2	0.1.1	"Actinobacteria"	1	371	24	4	19	25	11	27	10	9	44	72	40	28	19	20	3	4	4	4	4
    3	0.1.1.1	Actinobacteria	3	371	24	4	19	25	11	27	10	9	44	72	40	28	19	20	3	4	4	4	4
    4	0.1.1.1.1	Actinomycetales	2	3	0	0	0	1	0	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    4	0.1.1.1.2	Bifidobacteriales	1	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    4	0.1.1.1.3	Coriobacteriales	1	131	3	4	4	1	3	7	3	6	20	12	17	12	15	5	3	4	4	4	4
    2	0.1.2	"Bacteroidetes"	3	73401	3359	1617	3187	1783	1641	2511	4350	2304	9388	6801	6495	2577	9427	3710	1816	3967	3125	2262	3081
    3	0.1.2.1	"Bacteroidetes"_unclassified	1	14	0	0	1	0	0	0	3	0	5	0	0	1	2	1	0	1	0	0	0
    4	0.1.2.1.1	"Bacteroidetes"_unclassified	1	14	0	0	1	0	0	0	3	0	5	0	0	1	2	1	0	1	0	0	0
    ...

Simple Format:

    taxonomy	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    Root	113959	6191	4652	4656	2423	2403	3452	5532	3828	12431	9465	10014	4121	15686	5199	3469	6394	4055	4253	5735
    Bacteria;"Actinobacteria";Actinobacteria;Actinomycetales;	3	0	0	0	1	0	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Bifidobacteriales;	237	21	0	15	23	8	20	5	3	24	60	23	16	4	15	0	0	0	0	0
    Bacteria;"Actinobacteria";Actinobacteria;Coriobacteriales;	131	3	4	4	1	3	7	3	6	20	12	17	12	15	5	3	4	4	4	4
    Bacteria;"Bacteroidetes";"Bacteroidetes"_unclassified;"Bacteroidetes"_unclassified;	14	0	0	1	0	0	0	3	0	5	0	0	1	2	1	0	1	0	0	0
    Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";	73385	3359	1617	3186	1783	1641	2510	4347	2304	9383	6801	6495	2576	9425	3709	1816	3966	3125	2262	3080
    Bacteria;"Bacteroidetes";Flavobacteria;"Flavobacteriales";	2	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	1
    Bacteria;"Deinococcus-Thermus";Deinococci;Deinococcales;	6	0	0	1	2	1	0	2	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Proteobacteria";Betaproteobacteria;Neisseriales;	6	0	0	0	1	0	2	3	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Proteobacteria";Gammaproteobacteria;"Enterobacteriales";	39	3	2	2	0	0	1	2	1	4	1	1	1	6	1	4	3	2	3	2
    Bacteria;"Proteobacteria";Gammaproteobacteria;Aeromonadales;	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    Bacteria;"Proteobacteria";Gammaproteobacteria;Gammaproteobacteria_unclassified;	1	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0
    ...
    
## processors

The processors parameter allows you to run the command with multiple
processors. Default processors=Autodetect number of available processors
and use all available. To use 2 processors, run the following:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, processors=2, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)
     
    
## iters

The iters option allows you to specify how many iterations to do when
calculating the bootstrap confidence score for your taxonomy. The
default is 100.

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, iters=1000, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)



## search
By default, the k-nearest neighbor approach
searches for nearest neighbors by kmer searching as is done in the
[align.seqs](/wiki/align.seqs) command. The default size of kmers
is 8, which seems to be a fairly decent choice regardless of which part
of the 16S rRNA gene you are interested in. As we pointed out in the
development of the [align.seqs](/wiki/align.seqs) command, kmer
searching is superior in accuracy and speed compared to blast or suffix
tree searching methods.

### kmer and ksize

The only valid search option with the wang method is kmer and by default
mothur uses kmer size 8. If you would like to use the kmer search with the knn method you
can run:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, method=knn, search=kmer)

If you would like to change the kmer size you use the ksize option:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, method=knn, search=kmer, ksize=6)

### blast, match, mismatch, gapopen, and gapextend
Assuming that you have put the blast binaries into your PATH variable, it is
possible to use blastn to find nearest neighbors. It can be implemented
as:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, method=knn, search=blast)

You can also change the various blast-related options for match,
mismatch, gapopen, and gapextend values:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, method=knn, search=blast, gapopen=-5, gapextend=-1)

### suffix
An alternative method for finding the k-nearest
neighbors is to use a suffix tree to perform the search. Again, this is
the same method that is available within the
[align.seqs](/wiki/align.seqs) command. It can be implemented as:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, method=knn, search=suffix)

### distance
An alternative method for finding the k-nearest
neighbors is to find the distance from the query sequence to each
sequence in the template.

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, method=knn, search=distance)

### numwanted

The numwanted parameter is only valid with the knn method. If you instead only want the value of k to be 3, the following command
would be used:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, method=knn, numwanted=3, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)
  
If you are using the [phylotype](/wiki/phylotype) command as a down
stream analysis, you probably only want to consider 1 nearest neighbor:

    mothur > classify.seqs(fasta=final.fasta, count=final.count_table, method=knn, numwanted=1, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)

You should be able to see, these taxonomy lines are considerably
longer and probably should not be as trustworthy as those when you are
considering more neighbors.

## relabund

The relabund parameter allows you to indicate you want the summary file
values to be relative abundances rather than raw abundances. Default=F.

    taxlevel	rankID	taxon	daughterlevels	total	F3D0	F3D1	F3D141	F3D142	F3D143	F3D144	F3D145	F3D146	F3D147	F3D148	F3D149	F3D150	F3D2	F3D3	F3D5	F3D6	F3D7	F3D8	F3D9
    0	0	Root	1	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000
    1	0.1	Bacteria	9	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000
    2	0.1.1	"Actinobacteria"	1	0.003256	0.003877	0.000860	0.004081	0.010318	0.004578	0.007822	0.001808	0.002351	0.003540	0.007607	0.003994	0.006794	0.001211	0.003847	0.000865	0.000626	0.000986	0.000941	0.000697
    3	0.1.1.1	Actinobacteria	3	0.003256	0.003877	0.000860	0.004081	0.010318	0.004578	0.007822	0.001808	0.002351	0.003540	0.007607	0.003994	0.006794	0.001211	0.003847	0.000865	0.000626	0.000986	0.000941	0.000697
    4	0.1.1.1.1	Actinomycetales	2	0.000026	0.000000	0.000000	0.000000	0.000413	0.000000	0.000000	0.000362	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000
    5	0.1.1.1.1.1	Actinomycetaceae	1	0.000018	0.000000	0.000000	0.000000	0.000413	0.000000	0.000000	0.000181	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000
    6	0.1.1.1.1.1.1	Actinomyces	0	0.000018	0.000000	0.000000	0.000000	0.000413	0.000000	0.000000	0.000181	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000
    5	0.1.1.1.1.2	Promicromonosporaceae	1	0.000009	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000181	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000
    6	0.1.1.1.1.2.1	Promicromonospora	0	0.000009	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000181	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000
    4	0.1.1.1.2	Bifidobacteriales	1	0.002080	0.003392	0.000000	0.003222	0.009492	0.003329	0.005794	0.000904	0.000784	0.001931	0.006339	0.002297	0.003883	0.000255	0.002885	0.000000	0.000000	0.000000	0.000000	0.000000
    5	0.1.1.1.2.1	Bifidobacteriaceae	1	0.002080	0.003392	0.000000	0.003222	0.009492	0.003329	0.005794	0.000904	0.000784	0.001931	0.006339	0.002297	0.003883	0.000255	0.002885	0.000000	0.000000	0.000000	0.000000	0.000000
    6	0.1.1.1.2.1.1	Bifidobacterium	0	0.002080	0.003392	0.000000	0.003222	0.009492	0.003329	0.005794	0.000904	0.000784	0.001931	0.006339	0.002297	0.003883	0.000255	0.002885	0.000000	0.000000	0.000000	0.000000	0.000000

## name - not recommended

The name option allows you to provide a name file associated with your taxonomy file.

We DO NOT recommend using the name file. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

## group - not recommended

The group parameter allows you to provide a group file to use when
creating the summary file. 

We DO NOT recommend using the name / group file combination. Instead we recommend using a count file.
The count file reduces the time and resources needed to process commands. It is a smaller file and can contain group information.

## Help

### Common Questions

Can't find your question? Please feel free to ask questions on our
forum, [https://forum.mothur.org](https://forum.mothur.org).


1\.  **Does the reference need to be aligned?** No, mothur does not
    require an aligned reference to assign a taxonomy. This is because
    it uses k-mers to find the probabilities of the taxonomic
    assignment.

2\.  **What reference should I use to classify?** We provide mothur
    formatted references on the wiki.
    [rdp_reference_files](/wiki/RDP_reference_files)
    [silva_reference_files](/wiki/Silva_reference_files)
    [greengenes-formatted_databases](/wiki/Greengenes-formatted_databases)
    Alternatively, mothur allows you to create your own references as
    long as they are in fasta and taxonomy file format. You can find
    mothur's files formats [here](/wiki/tags#file_types).

### Common Issues


1\.  **Why are my sequences 'unclassifed'?** When it comes to
    classification there are two things main things that effect the
    number of unclassified results: the quality of the reads and the
    reference files. The bayesian classifier calculates the
    probabilities of reference sequences kmers being in a given genus
    and then uses those probabilities to classify the sequences. The
    quality of the query sequences affects the ability of the classifier
    to find enough kmers to find a good classification. A poor quality
    sequence is like turning up the noise in a crowded restaurant and
    trying to hear your date's father's name. Was that John, Tom or
    Ron? Uh oh\... A good reference is also needed for similar reasons.

### How To


1\.  **How do you recommend classifying to the species level?**
    Unfortunately I do not. You will never get species level
    classification if you are using the RDP or Silva references. They
    only go to the genus level. Even the greengenes database only has
    10% or so of sequences with species level names (greengenes hasn't
    been updated in quite a few years). I and many others would contend
    that using 16S and especially a fragment to get a species name is
    asking too much - you need a culture and genome sequencing to do
    that. If someone wanted to give it a shot, they would need to add
    the species level names to the taxonomy strings. Also, they would
    need to add many more sequences that represent each species. Outside
    of a few groups of bacteria where the researchers have carefully
    selected the region (e.g. Lactobacillus or Staphylococcus), I really
    think this would be a lot of work for little/no benefit.

## Revisions

-   1.22.0 Added processors option for Windows users.
-   1.23.0 - mothur couldn't handle parentheses in the taxonomy file. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1370](https://forum.mothur.org/viewtopic.php?f=4&t=1370)
-   1.23.0 - fixed memory leak with Windows paralellization.
-   1.24.0 - mothur will now check if a sequence is reversed before
    classifying.
-   1.25.0 - segfault if no files are given. Should return error message
    instead. - [https://forum.mothur.org/viewtopic.php?f=4&t=1525](https://forum.mothur.org/viewtopic.php?f=4&t=1525)
-   1.28.0 Added count parameter
-   1.28.0 Changed name of "bayesian" method to "wang"
-   1.28.0 mothur will ignore sequences present in the taxonomy file,
    but not in the reference file.
-   1.28.0 Bug Fix: - if taxonomy file contained file path information
    "cannot resolve path for" error was thrown.
-   1.29.0 Bug Fix: - if input directory was given with a group file,
    path was incorrect.
-   1.32.0 Removed extra name checks to speed up reading of taxonomy
    file
-   1.33.0 Added relabund parameter
-   1.37.0 Changes cutoff parameter default to 80. This change in the
    bootstrap threshold reflects the default values in the 454 and MiSeq
    SOPs. [\#192](https://github.com/mothur/mothur/issues/192)
-   1.37.0 Adds output and printlevel parameters
    [\#204](https://github.com/mothur/mothur/issues/204)
    [\#158](https://github.com/mothur/mothur/issues/158)
-   1.37.0 Adds parent taxons to unclassified taxons for outputs
    [\#29](https://github.com/mothur/mothur/issues/29)
-   1.38.0 Removes save option
-   1.39.0 Taxonomy files can now contain spaces in the taxon names.
-   1.39.0 Fixes bug with number of "taxon"\_unclassifeds appended to
    taxonomy
-   1.40.0 Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.0 Fixes blast path issue.
    [\#403](https://github.com/mothur/mothur/issues/403)
-   1.40.0 Bug Fix: Fixes seeded random issue.
    [\#416](https://github.com/mothur/mothur/issues/416)
