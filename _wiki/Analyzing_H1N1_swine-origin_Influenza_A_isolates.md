---
title: 'Analyzing H1N1 swine-origin Influenza A isolates'
---
[link=<http://commons.wikimedia.org/wiki/File:H1N1_influenza_virus.jpg%7Cright%7Cthumb%7C200px%7CH1N1>
influenza virus.](image:H1N1_influenza_virus.jpg)

The swine-origin Influenza A virus (S-OIV) has spread rapidly around the
world with [175
countries](http://gamapserver.who.int/h1n1/cases-deaths/h1n1_casesdeaths.html)
now reporting confirmed cases. Here we use mothur to analyze all
full-length [Hemagglutinin
(HA)](http://www.pdb.org/pdb/static.do?p=education_discussion/molecule_of_the_month/pdb76_1.html)
sequences available at the [NCBI Influenza Virus
Resource](http://www.ncbi.nlm.nih.gov/genomes/FLU/SwineFlu.html) as of
August 28, 2009 in order to assess if current sampling efforts are
sufficient to capture the diversity of this protein. . This protein is
of particular interest as it is responsible for binding to receptor
sites on a target cell.


## Data Preparation

A total of 599 full-length S-OIV HA sequences were obtained from the
[NCBI Influenza Virus
Resource](http://www.ncbi.nlm.nih.gov/genomes/FLU/SwineFlu.html). These
sequences were collected between March 30 to July 28, 2009. Due to the
short collection period, sequences are highly similar and possess only a
single insertion. A manual alignment of these sequences is possible, but
we used [MUSCLE](http://www.ncbi.nlm.nih.gov/pubmed/15034147) version
3.7 with a gap opening penalty of 20 and a gap extension penalty of 0 to
produce the desired alignment. Your can download the aligned S-OIV
sequences [here](Media:S-OIV_HA.zip).

## Generating a distance matrix

We will begin by identifying [ unique sequences](unique.seqs)
in our dataset. This can significantly reduce processing and memory
requirements as mothur will perform downstream calculations only on the
unique sequences. The following command identifies unique sequences:

    mothur > unique.seqs(fasta=HA.fasta)

This will generate two files:

-   HA.unique.fasta: a FASTA file containing the 259 unique sequences in
    our dataset
-   HA.names: a [name](Read.dist#name) file used by mothur to
    determine which sequences are identical to each other

We can now use the [dist.seqs](dist.seqs) command to generate
a distance matrix indicating the uncorrected pairwise distances between
our sequence. There are a few sequences in our dataset missing a few
initial nucleotides. The parameter *countends* should be set to false
(F) to indicate that missing data at the start or end of a sequence
should not be treated as an insertion/deletion. As our sequences are
highly similar, we will not consider operational taxonomic units (OTUs)
with distances larger than 0.01 in our downstream analysis. In order to
save memory, we can tell mothur to not bother saving any distances
larger than 0.01 by using the *cutoff* parameter. The distance matrix is
generated with the following command:

    mothur > dist.seqs(fasta=HA.unique.fasta, countends=F, cutoff=0.01)

This will generate a single file:

-   HA.unique.dist: a [ column-formatted distance
    matrix](Column-formatted_distance_matrix) indicating the
    uncorrected pairwise distances between our sequences

## Clustering sequences

We can now use our distance matrix to assign sequences to OTUs. A nice
feature of mothur is that it can quickly create OTUs at different
distances. For this analysis, we will only consider OTUs at distances up
to 0.01. To create OTUs, we need to execute the
[cluster](cluster) command after reading in our distance
matrix with the [read.dist](read.dist) command:

    mothur > read.dist(column=HA.unique.dist, name=HA.names, cutoff=0.01, precision=1000)
    mothur > cluster(cutoff=0.01, precision=1000)

Notice that we pass the [read.dist](read.dist) command our
names file using the *name* parameter. This ensures *all* our sequences
will be clustered into OTUs. The default precision used by mothur is
1e-2. Since we are interested in OTUs between 0 and 0.01 we will
increase the precision to 1e-3 by setting the *precision* parameter to
1000. The [cluster](cluster) command generates three files:

-   HA.unique.fn.list: a [list](list_file) file indicating
    the sequences that cluster together within an OTU
-   HA.unique.fn.sabund: a [species abundance](sabund_file)
    file containing information useful for producing species-abundance
    plots
-   HA.unique.fn.rabund: a [rank-abundance](rabund_file) file
    containing information useful for producing rank-abundance plots

## Analyzing global richness and sampling effort

In this section, we will use the [single sample
analyses](OTU-based_approaches#Single_sample_analyses)
commands provided in mothur to examine the richness of collected S-OIV
HA proteins and to determine if adequate sampling has been performed to
fully capture the global richness.

### Richness summary

To begin we will create a summary table indicating the estimated
richness of our dataset under different richness
[calculators](calculators) and OTU definitions. This can be
done by loading in our OTU data using the
[read.otu](read.otu) command and then using the the
[summary.single](summary.single) command to generate the
summary:

    mothur > read.otu(list=HA.unique.fn.list)
    mothur > summary.single(calc=nseqs-sobs-chao, label=unique-0.001-0.003-0.005-0.008)

This will generate a single file:

-   HA.unique.fn.summary: a [summary](Summary.single) file
    indicating the results of each of the specified
    [calculators](calculators) for each line in the OTU file

The summary file gives us the following table that indicates that our
dataset consists of 599 sequences that form 257 clusters consisting of
identical sequences, 117 clusters of sequences within a distance of
0.001, 49 clusters of sequences within a distance of 0.003, 15 clusters
of sequences within a distance of 0.005, and 7 clusters of sequences
within a distance of 0.008. The richness and 95% confident intervals
determined by the [Chao](Chao) calculator are also given.

  Reads   unique   0.001              0.003   0.005            0.008
  ------- -------- ------------------ ------- ---------------- -------
  OTU     Chao1    OTU                Chao1   OTU              Chao1
  599     257      1362 (933, 2064)   117     259 (190, 392)   49

These results clearly show that our sequences are highly similar and
indicate that downstream analysis should consider OTUs defined by
distances of 0.003 or less.

### Generating a heatmap

To investigate how many sequences fall within each OTU we can generate a
heatmap using the [heatmap.bin](heatmap.bin) command:

    mothur > heatmap.bin(scale=linear, label=unique-0.001-0.003)

By default, this command will produce a heatmap for each OTU distance
defined in our list file. We can use the *label* parameter to specify
that we are only interested in OTUs defined at a distance of 0.0
(unique), 0.001, and 0.003. The *scale* parameter is used to indicate if
the heatmap coloring should use log10 (default), log2, or linear
scaling. This command will generate three SVG files:

-   HA.unique.fn.unique.heatmap.bin.svg: a heatmap showing the number of
    sequences where OTU clusters contain identical sequences
-   HA.unique.fn.0.001.heatmap.bin.svg: a heatmap showing the number of
    sequences where OTU cluster contains sequences within 0.001
-   HA.unique.fn.0.003.heatmap.bin.svg: a heatmap showing the number of
    sequences where OTU cluster contains sequences within 0.003

The heatmap is given below. Black lines indicate OTUs containing a
single sequence whereas pure red lines indicate OTUs with 151 (unique),
207 (d=0.001), or 49 (d=0.003) sequences.

[center\|thumb\|250px\|Heatmaps indicating number of sequences in each
OTU. Heatmap goes from black to
red.](image:HeatmapsGlobal.png)

### Generating a rarefaction curve

Here we will generate a [rarefaction
curve](rarefaction.single) in order to determine if a
sufficient number of S-OIV HA sequences have been collected:

    mothur > rarefaction.single(calc=sobs-chao, label=unique-0.001-0.003, freq=10)

The *freq* parameter indicates that we want to check how the number of
identified OTUs changes as we continually increase our sampling effort
by 10 samples. This command will generate two files:

-   HA.unique.fn.rarefaction: a [rarefaction
    curve](rarefaction.single) file for the [observed
    sequences](sobs) calculator
-   HA.unique.fn.r\_chao: a [rarefaction
    curve](rarefaction.single) file for the
    [Chao](Chao) calculator

We can use [R](http://www.r-project.org) to plot the data contained in
these files. The following commands will generate the rarefaction curves
shown below:

    data<-read.table(file="HA.unique.fn.rarefaction", header=T)
    plot(x=data$$numsampled, y=data$$unique, xlab="Number of Sequences Sampled",ylab="OTUs", type="l", col="red", font.lab=3)
    lines(x=data$$numsampled, y=data$$X0.001, type="l", col="green", font.lab=3)
    lines(x=data$$numsampled, y=data$$X0.003, type="l", col="blue", font.lab=3)
    legend(x=1, y=257, c("unique", "0.001", "0.003"), c("red", "green", "blue"))

The rarefaction curve for clusters of unique sequences indicates that
the number of OTUs observed is increasing almost linearly with sampling
effort. This indicates that more sampling is required if we wish to
fully capture the global diversity of the S-OIV HA protein. However,
when OTUs are defined at a distance of 0.003 we observe that the
rarefaction curve is approaching a horizontal line indicating that
current sampling efforts are sufficient.

[center\|thumb\|300px\|Rarefaction curve for S-OIV HA
sequences.](image:RarefactionCurveGlobal.png)

## Analyzing sampling effort in New York state

A 197 of the 599 sequences in our dataset were collected in New
Yorkstate . Here we will examine the sampling effort within New York
state by taking advantage of mothur\'s notion of a *group*. A group file
specifies which sample a sequence belongs to. This [HA
groups](Media:HA_groups.zip) file indicates which samples
were collected in New York state or elsewhere. In order to create a
rarefaction curve for just the New York sequences we need to create an
OTU file for this group:

    mothur > read.otu(list=HA.unique.fn.list, group=HA.groups)

This will generate three files:

-   HA.unique.fn.New\_York.rabund: a
    [rank-abundance](rabund_file) file for our New York
    sequences
-   HA.unique.fn.Global.rabund: a
    [rank-abundance](rabund_file) file for the remaining
    *Global* sequences
-   HA.unique.fn.shared: a [shared file](shared_file) which
    can be used by mothur\'s [multiple sample
    analyses](OTU-based_approaches#multiple_sample_analyses)
    commands

We can now create a rarefaction curve for the New York sequences:

    mothur > read.otu(rabund=HA.unique.fn.New_York.rabund)
    mothur > rarefaction.single(calc=sobs-chao, label=unique-0.001-0.003, freq=10)

This will generate two files:

-   HA.unique.fn.New\_York.rarefaction: a [rarefaction
    curve](rarefaction.single) file for our New York
    sequences using the [observed sequences](sobs) calculator
-   HA.unique.fn.New\_York.r\_chao: a [rarefaction
    curve](rarefaction.single) file for our New York using
    the [Chao](Chao) calculator

Plotting of this data using [R](http://www.r-project.org) is described
[above](Analyzing_H1N1_swine-origin_Influenza_A_isolates#Generating_a_rarefaction_curve).
Similar to our results on the full dataset, we see that sampling effort
needs to be increased if we wish to use OTUs defined by clusters of
unique sequences, but appears to be adequate if downstream analyses use
OTUs defined at a distance of 0.003 or greater.

[center\|thumb\|300px\|Rarefaction curve for S-OIV HA sequences
collected in New York.](image:RarefactionCurveNewYork.png)

## Conclusions

Our results suggest that current sampling efforts are insufficient to
capture the complete global diversity of the S-OIV HA protein or the
diversity within New York state. As such, it is recommended that
downstream analyses use OTUs define at a distance of 0.003 or greater
where current sampling efforts appear sufficient.
