---
title: 'otu.hierarchy'
tags: 'commands'
redirect_from: '/wiki/Otu.hierarchy.html'
---
The **otu.hierarchy** command relates OTUs at
different distances


## Default settings

There are two ways to use the otu.hierarchy command. You can compare clusters from 2 different distances, 
or create a cons.taxonomy file relating ASVs to OTUs.

### To relate OTUs from 2 different distances, run the following:

A [ list](/wiki/list_file) file and two labels must be inputted for
this method

    mothur > otu.hierarchy(list=final.opti_mcc.list, label=0.03-0.05)

In the final.opti_mcc.0.03-0.05.otu.hierarchy output file, the first
column is what the OTU looked like at distance 0.05 followed by the list
of sequences in the OTUs at distance 0.03 that merged together.

### To find the classifications and OTUs your ASVs belong to, run the following:

    mothur > make.shared(count=count=final.count_table) - create an ASV list and shared file
    mothur > cluster.split(fasta=final.fasta, taxonomy=final.taxonomy, count=final.count_table) - create distance based OTU list file
    mothur > otu.hierarchy(list=final.opti_mcc.list, asvlist=final.asv.list, taxonomy=final.taxonomy, count=final.count_table) 

The output file, final.opti_mcc.ASV_0.03.asv.cons.taxonomy, will look like:

    ASVLabel	ASV_Abundance	Taxonomy_OTULabel
    ASV0001	12196	Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";"Porphyromonadaceae"_unclassified;Otu001;
    ASV0002	8829	Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";"Porphyromonadaceae"_unclassified;Otu002;
    ASV0003	7698	Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";"Porphyromonadaceae"_unclassified;Otu003;
    ASV0004	7436	Bacteria;"Bacteroidetes";"Bacteroidia";"Bacteroidales";"Porphyromonadaceae";Barnesiella;Otu004;
    ...
    

## Options

The output parameter allows you to either specify the output to display
the names of the sequences in the otus or the otu numbers, the default
is name.

    mothur > otu.hierarchy(list=final.opti_mcc.list, label=0.03-0.05, output=otulabel)

    Otu001	Otu001	Otu219	Otu226	Otu266	Otu271	Otu297	Otu336	Otu377	Otu409	
    Otu002	Otu006	Otu009	Otu237	Otu252	Otu270	Otu277	Otu341	Otu385	
    Otu003	Otu002	Otu213	Otu241	Otu279	Otu302	Otu334	Otu417	
    ...

So Otu003 at distance 0.05 is made up of OTUs Otu002, Otu213, Otu241, Otu279, Otu302, Otu334 and Otu417 at distance 0.03.

## Revisions

1.46.0 - Adds ASV to OTU mapping for otu.hierarchy command. [\#777](https://github.com/mothur/mothur/issues/777)
