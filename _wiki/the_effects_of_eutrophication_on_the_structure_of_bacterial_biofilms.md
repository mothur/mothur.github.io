---
title: 'The effects of eutrophication on the structure of bacterial biofilms'
redirect_from: '/wiki/The_effects_of_eutrophication_on_the_structure_of_bacterial_biofilms'
---
## Introduction:

Biofilms are the dominate form of microbial life in aquatic ecosystems
and are responsible for performing a wide variety of ecosystem services
including nutrient and organic matter processing and retention.
Understanding how eutrophication impacts these communities is essential
for ecosystem managers as many aquatic ecosystems are being enriched by
anthropogenic activities. This study investigated the effects of
eutrophication on biofilm community structure and diversity.

Heterotrophic microbial biofilms were grown in the dark in fifteen
experimental stream channel mesocosms. The channels were lined with
removable unglazed ceramic tiles, supplied with river water to ensure
colonization by natural bacterial populations, and continuously enriched
with a stochiometrically balanced solution of dissolved organic carbon
(DOC), nitrate and phosphate to create a productivity gradient. The
enrichment levels were based on the background concentration of DOC in
the stream water and included no enrichment in control channels, two
(2X), four (4X), eight (8X) and ten times (10X) the background DOC
concentration (1.5 mg l-1 DOC). Three replicate channels were used for
each level of enrichment. After three weeks of growth, the time
necessary to produce a mature biofilm, samples were collected to assess
the impacts of the enrichment on biofilm community structure and
diversity through the extraction, amplification, sequencing, and
analysis of the bacterial 16S rRNA gene. The files used to conduct this
analysis can be downloaded here
[https://mothur.s3.us-east-2.amazonaws.com/wiki/biofilmeu.zip](media:biofilmeu.zip).

## Preparing the Data for Mothur:

### Initial Data Preparation: Preprocessing and Alignment

Raw sequences were imported into CodonCode where the sequences were
reviewed for quality and low quality sequences were removed from the
database. 2096 high quality partial (forward reads) 16S rRNA gene
sequences were exported as a .fasta file

Next the sequences were aligned using the Align tool on the
[https://greengenes.lbl.gov](https://greengenes.lbl.gov) website. The .fasta file created in
CodonCode was imported and the following settings were applied:

Settings:


1\.  Significant match requirements:
    -   Change minimum length to 300
    -   Minimum percent identity to 70

2\.  Files you desire:
    -   Select first two (1. tab delimitated file summarizing alignment
        fate etc., and 2. sequence file of successfully aligned
        sequences)

3\.  Formatting options:
    -   Select 'do not remove alignment gap characters'
    -   Select 'fasta' not 'fasta with description' as preferred format

4\.  Delivery:
    -   Enter your email address

5\.  Select 'Process File'

These commands generated a .tgz file, that when decompressed, created a
folder with a fasta file of all the aligned sequences and an excel file
specifying which sequences would not align.

### Creating a Filter and a Distance Matrix:

The aligned fasta file was imported into ARB using the following import
options:


1\.  Import - fasta\_wgap.ift

2\.  Type - DNA

3\.  Use found names

Next, a filter was created in ARB to ensure all of the sequences were
the same length (\~550 bp) using the following steps:


1\.  Under SAI → Create SAI using... → Filter by base frequency

2\.  Under Config → Column filter \_\_\_ to \_\_\_ (used 445, 3773)

3\.  Calculate

4\.  Export filter → name

Finally, a distance matrix was created using the following steps:


1\.  Under Sequence → Compare using distance matrix → Apply filter →
    Calculate full matrix

2\.  Save matrix as \*.dist file

### Creating a Phylogenetic Tree:

A phylogenetic tree was created by adding the 2096 partial sequences to
a tree containing \~ 9000 full length 16S rRNA gene sequences compiled
by Philip Hugenholtz. This tree can be downloaded as an ARB file from
the Ribosomal Database Project → Resources → Philip Hugenholtz\'s 16S
rRNA ARB Database, at [https://rdp.cme.msu.edu/misc/resources.jsp](https://rdp.cme.msu.edu/misc/resources.jsp).

The aligned sequences were added to the Hugenholtz data base by
importing a filtered fasta file of all of the sequences using the
following steps:


1\.  Import sequences: File → Import sequences and fields (ARB) → Mark
    imported sequences

2\.  Add Sequences to tree: Tree → Add species to existing tree → ARB
    parsimony (quick add marked) → Filter (lane mask) → Weights (none) →
    Go (Hint: the Hugenholtz tree contains a sample named ISOT4(31...
    The parentheses in this name will cause problems in the .ntree file
    so it should be removed.)

The tree was then exported by:


1\.  Tree → Tree admin

2\.  Export → select 'Newick tree format', 'save branch lengths', and
    deselect 'keep group names' (these names will give mothur problems).

## OTU -- Based Approaches:

### Reading Distance Matrices:

The distance matrix from all of the biofilm samples
(Mt\_AllSamp\_12JUN09\_F.dist) created in ARB was read into mothur using
the following command:

    mothur > read.dist(phylip= BiofilmEu_AllSamp.dist)

### Clustering Sequences to Determine the Number of OTUs:

Running the read.dist command stored the distance matrix in memory,
which was then used to cluster the sequences into OTUs by running the
following command:

    mothur > cluster()

The default (furthest neighbor, fn) clustering of the 2096 biofilm
sequences produced three files: Mt\_allsamp\_12jun09\_F.fn.rabund (rank
abundance file), Mt\_allsamp\_12jun09\_F.fn.sabund (species abundance
file), and Mt\_allsamp\_12jun09\_F.fn.list (a list file containing the
sequences in each OTU). The following data are the first two columns
from the .list file created for all of the biofilm data, indicating
that: 1) a total of 479 OTUs were identified at the species level (\>
97% identity) while 65 phyla level (\> 80% identity) OTUs were found, 2)
253 sequences were identical (2096 sequences were clustered and 1843
unique sequences were found), and 3) all of the sequences had \> 59%
identify.

    DistanceCutoff    AllSamp Cont    2X     4X     8X    10X
    unique           1843   397    398    401    370    337
    0            1401   355    302    339    289    264
    0.01              812   303    174    195    162    155
    0.03              479   235    110    116    101     90
    0.05              318   183     78     86     66     63
    0.2                65    50     25     21     12     13
    0.41                1     1      1      1      1      1

===Reading OTU <Data:===> Next, the OTU .list data for the 2096 samples
created using the cluster() command was read back into mothur using the
following command:

    mothur > read.otu(list= BiofilmEu_AllSamp.fn.list, group= BiofilmEu_AllSamp.groups)

The group option reads a .groups file in mothur that was created using
BBEdit software. This tab delimited file contains two columns, one with
each of the 2096 sequence names followed by a column designating which
experimental treatment this sample was collected from (control, 2X, 4X,
8X or 10X enrichment), allowing mothur to parse the sequences by
treatment. Running this command generates a .fn.shared file and 5
separate list files, one for each treatment.

### Single Sample Analyses -- Rarefaction Curves:

Rarefaction curves were generated for each enrichment treatment to
determine the richness of samples from the various treatments and
whether we had sequenced an adequate number of clones to estimate the
richness of the samples from each treatment. The .list files generated
in the previous analysis step were individually read into mothur and
were then used to generate these rarefaction curves using the following
command.

    mothur > read.otu(list= BiofilmEu_AllSamp.fn.Cont.list)
    mothur > rarefaction.single(freq=20)

The addition of the (freq=20) option directed mothur to print results
for every 20 samples instead of the default 100 samples, allowing the
creation of the smoother rarefaction curve figures seen below.

![Rarefaction curves for the Control, 2X, 4X, 8X and 10X eutrophication
enrichments.](AllRarefaction.jpg "Rarefaction curves for the Control, 2X, 4X, 8X and 10X eutrophication enrichments.")

The rarefaction curves shown above indicate that: 1) the most diverse
samples are from the control group where no nutrient or carbon
enrichment was applied, 2) samples from the enrichments have similar
levels of diversity, 3) the enrichment curves have begun to level off,
indicating near complete sampling of diversity, and 4) the control curve
is still increasing significantly implying more sampling is necessary to
completely sample the species level diversity in these samples.

### Single Sample Analyses -- Community Richness:

The following commands were used to generate summary files containing
various richness predictors including the Chao1 estimates reported
below.

    mothur > read.otu(list=BiofilmEu_AllSamp.fn.cont.list)
    mothur > summary.single()

The first command reads the previously created .list file into mothur,
while the second command generates the richness summary files. These
commands were run a total of five times, once for each treatment. The
results of the richness predictors seen below indicate that the species
level (\> 97% identity) richness of 582 OTUs for the control channels
was \~2-3 times that of the treatment channels which all had Chao1
richness estimates of \~ 200 OTUs.

           Cont                    2x                    4x                     8x                     10x
    Label  Chao    Chao_Range     Chao   Chao_Range     Chao    Chao_Range     Chao    Chao_Range     Chao    Chao_Range
    0.03     582       457-778       211    161-301        176    146-235         203    150-314         192    138-307
    0.05     426       326-598       111     93-153        125    103-177         113     84-191         108     81-174

### Multiple Sample Analyses/Comparison -- Community Richness:

The following commands were used to estimate the overlap of OTUs between
the bacterial communities from the various treatment channels:

    mothur > read.otu(shared=BiofilmEu_AllSamp.fn.shared)
    mothur > summary.shared()

The first command reads the previously created 'shared' file (created
from the 'mothur \> read.otu(list= Mt\_allsamp\_12jun09\_F.fn.list,
group= Environ\_ByTreatment.groups)' command) into mothur, while the
second command generates a summary file exploring the OTU richness
shared between samples.

    Comparison     Shared OTUs
    Cont - 2X         27
    Cont - 4X         24
    Cont - 8X          8
    Cont - 10X         5
    2X - 4X           34
    2X - 8X           16
    2X - 10X           9
    4X - 8X           44
    4X - 10X          33
    8X - 10X          43

In each case, as the enrichment level increased the shared OTUs between
samples decreased, indicating increasing enrichment levels created
divergent bacterial communities.

### Multiple Sample Analyses/Comparison -- Visualizing Community Differences:

![Venn Diagrams of shared Chao1 (left) and OTUs (right) for the Control
(purple), 4X (green) and 10X (pink) treatments at a distance of

0\.03](Venn_sharedchao_sobs_16jun09.jpg "Venn Diagrams of shared Chao1 (left) and OTUs (right) for the Control (purple), 4X (green) and 10X (pink) treatments at a distance of 0.03")

#### Venn Diagram

A Venn Diagram was constructed to show overlap between the control, 4X,
and 10X treatments using the following commands:

    mothur > read.otu(shared=BiofilmEu_Venn.fn.shared)
    mothur > summary.shared()
    mothur > venn(label=0.03, calc=sharedsobs-sharedchao)  

This mt\_venndiag...file was created from a distance matrix that only
included data from the three treatments listed above. The first command
reads the shared file into mothur while the second command generates the
Venn Diagrams seen seen to the right for shared Chao1 and OTUs richness
at the 97% identity level.

#### Heatmap

![Heatmap of the OTUs from each eutrophication treatment at a distance
of 0.03. Heatmap columns from left to right are 10x, 2X, 4X, 8X and
Control](Mt_allsamp_12jun09_f.fn.0.03._log10.heatmap.jpg "Heatmap of the OTUs from each eutrophication treatment at a distance of 0.03. Heatmap columns from left to right are 10x, 2X, 4X, 8X and Control")

Additionally, two heatmaps were generated for further visualization of
the OTU data from the various communities using the following commands:

    mothur > read.otu(list=BiofilmEu_AllSamp.fn.list, group=BiofilmEu_AllSamp.groups )
    mothur > heatmap()
    mothur > heatmap(scale=linear) 

The first command reads the list file for all of the sequence data into
mothur, the second command generates heatmaps with log10 scaling, while
the last command generates heatmaps with the scaling option turned off.
See the figure below for the log10 version at a distance of 0.03.

-   The heatmap clearly shows the control treatment bacterial community
    was the most dissimilar
-   Additionally, the 2X community appears to be distinct when compared
    to the 4X, 8X and 10X communities

## Hypothesis Testing Approaches:

A variety of analyses are available in mothur to test whether different
communities have the same structure. I applied the parsimony and UniFrac
methods to the biofilm data to determine whether eutrophication led to
distinct bacterial communities.

### Parsimony Analysis:

The parsimony test which has been implemented previously in both the
UniFrac and TreeClimber programs assesses whether two or more
communities have the same structure by determining differences in the
phylogenetic arrangement of sequences from the communities. The
following commands were executed to read the phylogenetic tree created
above into mothur and to conduct a global significance test to determine
whether any of the eutrophication treatment communities had a different
structure from the rest of the treatments.

    mothur > read.tree(tree=BiofilmEu_AllSamp.ntree)
    mothur > parsimony()

The abbreviated global results below indicate that at least one of the
eutrophication treatment groups is significantly different from the
others.

    Groups                ParsSig
    Cont-2X-4X-8X-10X     <0.0010

These results were further explored using the (group=all) command which
provides the following p-values for all of the pairwise comparisons:

    Groups   ParsScore     ParsSig
    Cont-2X      82        <0.0010
    Cont-4X      62        <0.0010
    Cont-8X      35        <0.0010
    Cont-10X     25        <0.0010
    2X-4X       142        <0.0010
    2X-8X        51        <0.0010
    2X-10X       37        <0.0010
    4X-8X       153        <0.0010
    4X-10X      117        <0.0010
    8X-10X      228        <0.0010

Each of these comparisons has a p-value of less than 0.001, however,
these values must be corrected for multiple comparisons by comparing
them to 0.05/10 = 0.005 (10 is the total number of comparisons between 5
groups). In this case each of the p-values is lower than 0.005
indicating each of the groups are significantly different from one
another.

### Unweighted UniFrac Analysis:

The unweighted UniFrac metric can also be used to assess whether
microbial communities are significantly different. The simplified logic
behind UniFrac is as follows: all samples from all communities of
interest are used to create a phylogenetic tree, the fraction of the
branch length that leads to sequences from a single community is used to
determine similarities/differences between communities, and a random
permutation test is used to assess the probability that the distance
between communities is a product of chance. The following commands are
similar to those performed with the parsimony analysis. They read the
phylogenetic tree created above into mothur and conduct a global
significance test to determine whether any of the eutrophication
treatment communities had a different structure from the rest of the
treatments.

    mothur >  read.tree(tree= BiofilmEu_AllSamp.ntree)
    mothur > unifrac.unweighted()

This produces the global result seen below, indicating that at least one
of the eutrophication communities is significantly different from the
others.

    Groups                  UWScore      UWSig
    Cont-2X-4X-8X-10X       0.818215     <0.0010

These results can be further explored using the following code:

    mothur > unifrac.unweighted(group=all)

    Groups     UWScore      UWSig
    Cont-2X    0.875703    <0.0010
    Cont-4X    0.894106    <0.0010
    Cont-8X    0.938222    <0.0010
    Cont-10X   0.944787    <0.0010
    2X-4X      0.836707    <0.0010
    2X-8X      0.911103    <0.0010
    2X-10X     0.917776    <0.0010
    4X-8X      0.832491    <0.0010
    4X-10X     0.851481    <0.0010
    8X-10X     0.769891    <0.0010

As with the parsimony analysis these results need to be corrected for
multiple comparisons by comparing them to 0.05/10 = 0.005 (10 is the
total number of comparisons between 5 groups). In this case each of the
p-values is lower than 0.005 indicating each of the groups are
significantly different from one another.

## Conclusions:

Analysis of 16S rRNA gene data collected from bacterial biofilm
communities that were grown under varying levels of eutrophication
indicates eutrophication significantly impacted community diversity and
composition. OTU diversity in the control treatment was approximately
twice that found in the enrichment treatments. Additionally, each of the
control, 2X, 4X, 8X, and 10X treatments had a distinct bacterial
community as seen visually using Venn diagrams and heatmaps, and
statistically using parsimony and UniFrac analysis.
