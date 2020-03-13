---
title: 'Agricultural soil community analysis'
redirect_from: '/wiki/Agricultural_soil_community_analysis'
---
In this tutorial we will analyze bacterial 16S-based communities
originating from soil samples of three different farming systems. The
sequences were originally published by [Hartmann and Widmer
(2004)](https://www.ncbi.nlm.nih.gov/pubmed/17041161).


## Getting started

### Download and align sequences

Download the sequences from [ncbi genbank](https://www.ncbi.nlm.nih.gov)
by using the command DQ827724:DQ829627 \[accn\] or from [
DOK03.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/dok03.zip). We will first generate a
multiple sequence alignment of the 1904 16S sequences by using mothur.
You can download and unpack the [ greengenes or silva
database](Alignment_database) to the mothur folder. Open the
mothur terminal and align the sequences in DOK03.fasta against one of
the reference databases, for example against greengenes, and use a
filter to remove columns only represented by gaps:

    mothur > align.seqs(candidate=DOK03.fasta, template=core_set_aligned.imputed.fasta)
    mothur > filter.seqs(fasta=DOK03.kmer.needleman.nast.align)

We rename this file to DOK03.al.greengenes.fasta. Alternatively, you can
use a database-independent alignment algorithm such as
[mafft](https://align.bmr.kyushu-u.ac.jp/mafft/online/server). For this
purpose, upload DOK03.fasta to the server and use the default parameters
to run MAFFT. Copy the fasta formatted alignment into a text editor and
rename the file to DOK03.al.mafft.fasta.

### Create distance matrix

We will use the
[phylip](https://evolution.genetics.washington.edu/phylip.html) program
[dnadist](https://evolution.genetics.washington.edu/phylip/doc/dnadist.html)
to generate a distance matrix. Before we can run our file, we have to
convert the fasta to phylip formatted files. Use
[readseq](https://www.ebi.ac.uk/cgi-bin/readseq.cgi/) or equivalent tools
to convert the aligned fasta files by using the format phylip4. We name
the files DOK03.al.greengenes.phy and DOK03.al.mafft.phy. The DNAdist
algorithm can be run online (e.g.
[trishul.sci.gu.edu.au](https://trishul.sci.gu.edu.au/tools/dnadist.html),
[mobyle.pasteur.fr](https://mobyle.pasteur.fr/cgi-bin/portal.py?form=dnadist))
or downloaded and used according to the following instructions:


1\.  Download the [Phylip
    package](https://evolution.genetics.washington.edu/phylip/getme.html).

2\.  Copy the executable dnadist.exe into the directory with your data
    files and execute the program.

3\.  When prompted for the input file type the name of the phylip
    formatted alignment file (e.g. DOK03.al.greengenes.phy).

4\.  Create new outfile (e.g. DOK03.al.greengenes.dist).

5\.  Press D to select Jukes-Cantor as distance. Default can be used for
    all other parameters.

6\.  Copy the file into the mothur folder.

## OTU-based analyses

### Single-sample analysis

#### Alignment accuracy

Now we can start analyzing our dataset with mothur and determine the
number of operational taxonomic units (OTUs) in our communities. First,
we will evaluate the two alignment algorithms. Do both strategies lead
to a similar binning into OTUs? Load the distance matrix by using the
[read.dist](read.dist) command, cluster sequences into OTUs
using the [cluster](cluster) command, and perform rarefaction
analysis using the [rarefaction.single](rarefaction.single)
command:

    mothur > read.dist(phylip=DOK03.al.greengenes.dist, cutoff=0.05)
    mothur > cluster()
    mothur > rarefaction.single()

and/or

    mothur > read.dist(phylip=DOK03.al.mafft.dist, cutoff=0.05)
    mothur > cluster()
    mothur > rarefaction()

This will create four files for each alignment, e.g.
DOK03.al.greengenes.fn.list, DOK03.al.greengenes.fn.rabund,
DOK03.al.greengenes.fn.sabund, and DOK03.al.greengenes.fn.rarefaction.
Plot rarefaction curves of both alignments at OTU levels unique, 0.03
and 0.05 and you will see that both alignments perform very similarly in
generating OTUs. ![Rarefaction curves at OTU levels unique, 0.03 and

0\.05 for both alignments, i.e. greengenes (G) and mafft
(M).\|300px\|centre](DOK03_CompAlign.png "fig:Rarefaction curves at OTU levels unique, 0.03 and 0.05 for both alignments, i.e. greengenes (G) and mafft (M).|300px|centre")

#### Richness/diversity of samples

Now we are ready to analyze our communities in more detail. For this
purpose, we will go ahead with one alignment, e.g.
DOK03.al.greengenes.dist. Our dataset contains sequences from three
agriculturally managed soils, i.e. unfertilized (NOFERT), conventionally
managed (CONFYM), and bio-dynamically managed (BIODYN). To investigate
differences between the three treatments, we need to parse the defined
OTUs in file DOK03.al.greengenes.fn.list into the three groups by using
the definition file DOK.groups and the read.otu command:

    mothur > read.otu(list=DOK03.al.greengenes.fn.list, group=DOK.groups)

This command will generate the files DOK03.al.greengenes.fn.shared,
DOK03.al.greengenes.fn.NOFERT.list, DOK03.al.greengenes.fn.CONFYM.list,
and DOK03.al.greengenes.fn.BIODYN.list. Look at examples for a [
shared](Shared_file) or [ list](List_file) file.
We are of course interested in how well our sampling effort covers the
diversity of the bacterial communities as well as how diversity/richness
of the communities compare between the three different treatments. For
this purpose, we perform a [ rarefaction
analysis](rarefaction.single) on the parsed list files.

    mothur > read.otu(list=DOK03.al.greengenes.fn.NOFERT.list)
    mothur > rarefaction.single()

and

    mothur > read.otu(list=DOK03.al.greengenes.fn.CONFYM.list)
    mothur > rarefaction.single()

and

    mothur > read.otu(list=DOK03.al.greengenes.fn.BIODYN.list)
    mothur > rarefaction.single()

![Rarefaction curves for samples NOFERT, CONFYM and BIODYN at OTU level

0\.03. Lower and higher confidence intervals are indicated as dashed
lines.\|300px\|centre](DOK03_rarefact.single.png "fig:Rarefaction curves for samples NOFERT, CONFYM and BIODYN at OTU level 0.03. Lower and higher confidence intervals are indicated as dashed lines.|300px|centre")
The three datasets show no difference in the rarefaction curves,
indicating that they have very similar diversity. We will calculate and
compare some commonly used [ richness and diversity
estimators](Calculators) such as [ chao1](Chao), [
ACE](Ace), [ shannon](Shannon), and [
Simpson](Simpson):

    mothur > read.otu(list=DOK03.al.greengenes.fn.NOFERT.list)
    mothur > summary.single(calc=chao-ace-shannon-simpson)

and

    mothur > read.otu(list=DOK03.al.greengenes.fn.CONFYM.list)
    mothur > summary.single(calc=chao-ace-shannon-simpson)

and

    mothur > read.otu(list=DOK03.al.greengenes.fn.BIODYN.list)
    mothur > summary.single(calc=chao-ace-shannon-simpson)

![Richness (Chao1, ACE) and diversity (Shannon, 1-Simpson) estimators of
the datasets NOFERT, BIODYN, and CONFYM at an OTU definition level of

0\.03. Lower and higher confidence intervals are indicated as error
bars.\|300px\|centre](DOK03_estimators.png "fig:Richness (Chao1, ACE) and diversity (Shannon, 1-Simpson) estimators of the datasets NOFERT, BIODYN, and CONFYM at an OTU definition level of 0.03. Lower and higher confidence intervals are indicated as error bars.|300px|centre")
Generally, only small differences in richness and diversity were
observed among the three communities. The Simpson diversity index
indicated that the unfertilized sample NOFERT might have a lower
diversity when compared to the other two treatments.

### Multiple-sample analysis

Universal richness and diversity estimators revealed no differences
between the three communities. However, communities with similar
richness and/or diversity can have significantly different underlying
community structures. Multiple-sample analyses allow us to evaluate
differences in shared OTUs between the communities. Let us first look at
the number of OTUs that are shared between pairs or all three samples:

    mothur > read.otu(shared=DOK03.al.greengenes.fn.shared, label=unique-0.03-0.05)
    mothur > summary.shared()

This will create two files called DOK03.al.greengenes.fn.shared.summary
and DOK03.al.greengenes.fn.sharedmultiple.summary that give several
calculators of shared richness (e.g. [ Shared
Sobs](Sharedsobs), [ shared chao1](Sharedchao), [
Shared ACE](Sharedace)) and community similarity (e.g. [
Jaccard Similarity](Jabund), [ Sorenson
Similarity](Sorabund), [ Yue & Clayton
Similarity](Thetayc)). Richness and similarity indices
indicate that the two systems receiving fertilizer (BIODYN, CONFYM) are
more similar to each other than to the unfertilized system (NOFERT),
whereas CONFYM is more similar to NOFERT than BIODYN to NOFERT. ![Shared
richness (Sobs, Chao1, ACE) and similarity (abundance-based Jaccard and
Sorenson, Yue & Clayton) indices of datasets NOFERT, BIODYN, and CONFYM
at an OTU definition level of

0\.03.\|300px\|centre](DOK03_sharedOTU.png "fig:Shared richness (Sobs, Chao1, ACE) and similarity (abundance-based Jaccard and Sorenson, Yue & Clayton) indices of datasets NOFERT, BIODYN, and CONFYM at an OTU definition level of 0.03.|300px|centre")
Venn diagrams are particularly useful to display such data as long as
the number of comparisons is not higher than three.

    mothur > read.otu(shared=DOK03.al.greengenes.fn.shared, label=unique-0.03-0.05)
    mothur > venn(label=0.03)

![Venn diagram for shared richness (Sobs) among the datasets NOFERT,
BIODYN, and CONFYM at OTU definition of

0\.03.\|300px\|centre](DOK03_SobsVenn.png "Venn diagram for shared richness (Sobs) among the datasets NOFERT, BIODYN, and CONFYM at OTU definition of 0.03.|300px|centre")

## Hypothesis-based analyses

Despite high similarity in OTU diversity between samples NOFERT, BIODYN,
and CONFYM, we have found indication that the community structures of
the samples might be different. The [original
study](https://www.ncbi.nlm.nih.gov/pubmed/17041161) concluded that
community structures from treatments receiving manure, i.e. BIODYN and
CONFYM, are more similar to each other when compared to NOFERT. The
results gained from the sequence libraries were in agreement with
replicated community profiling data from a [preceding
study](https://www.ncbi.nlm.nih.gov/pubmed/16907752). I re-generated the
cluster analysis used in the original study with the data gained by
mothur in the shared file.

![Cluster analysis of NOFERT, BIODYN, and CONFYM at an OTU definition
level of

0\.03.\|300px\|centre](DOK03_sharedcluster.png "Cluster analysis of NOFERT, BIODYN, and CONFYM at an OTU definition level of 0.03.|300px|centre")

We evaluate if these results can be confirmed by using [hypothesis
testing approaches](hypothesis_testing_approaches) such as
the [libshuff](libshuff) command.

    mothur > read.dist(phylip=DOK03.al.greengenes.dist, group=DOK.groups)
    mothur > libshuff()

After correction for multiple comparisons (e.g. 0.05/6 = 0.0083), we can
conclude that community structures are probably significantly different
between all three samples, although the test was not convincing for the
comparison NOFERT-CONFYM.

    Comparison             dCXYScore   Significance
    BIODYN-CONFYM          0.00049472  0.0027
    CONFYM-BIODYN          0.00108234  <0.0001
    BIODYN-NOFERT          0.00186151  <0.0001
    NOFERT-BIODYN          0.00212569  <0.0001
    CONFYM-NOFERT          0.00102956  <0.0001
    NOFERT-CONFYM          0.00020876  0.0909

We can also test for significant differences using one of the tree-based
method implemented in mothur, i.e. [ Parsimony
analysis](parsimony), [ Unweighted
UniFrac](unifrac.unweighted), or [ Weighted
UniFrac](unifrac.weighted). First, we need to build a tree
based on our sequence alignment, for example by the
[phylip](https://evolution.genetics.washington.edu/phylip.html) program
[neighbor](https://evolution.genetics.washington.edu/phylip/doc/neighbor.html).
The neighbor algorithm can be run online
([mobyle.pasteur.fr](https://mobyle.pasteur.fr/cgi-bin/portal.py?form=neighbor))
or downloaded and used according to the following instructions:


1\.  Download the [Phylip
    package](https://evolution.genetics.washington.edu/phylip/getme.html).

2\.  Copy the executable neighbor.exe into the directory with your data
    files and execute the program.

3\.  When prompted for the input file type the name of the DNA distance
    matrix created above, i.e. DOK03.al.greengenes.dist).

4\.  Create new outfile (e.g. DOK03.al.greengenes.report).

5\.  Run neighbor.exe using default settings.

6\.  Create new treefile (e.g. DOK03.al.greengenes.tree).

7\.  Copy the file into the mothur folder.

Now we are ready to run the [parsimony](parsimony) test in
mothur:

    mothur > read.tree(tree=DOK03.al.greengenes.tree, group=DOK.groups)
    mothur > parsimony()

or use [unifrac.unweighted](unifrac.unweighted) and [
Weighted](unifrac.weighted) UniFrac method:

    mothur > read.tree(tree=DOK03.al.greengenes.tree, group=DOK.groups)
    mothur > unifrac.unweighted()
    mothur > unifrac.weighted()

This process might use a lot of time and memory to perform.
