---
title: 'Forest soil community analysis'
---
In this tutorial we will analyze bacterial and eukaryal forest soil
microbial communities using some of the tools implemented in mothur. The
[long-term soil productivity (LTSP) experiment in British
Columbia](https://www.for.gov.bc.ca/hre/ltsp/) served to compare soil
microbial community structures in harvested and naturally disturbed
forest stands along replicated soil depth profiles. Two clone libraries,
one for each domain, containing full length ribosomal intergenic spacer
(RIS) regions linked to partial small subunit (SSU) rRNA genes were
generated and compared to RIS community profiles. This tutorial will
demonstrate how the two different genetic regions influence the
community structure analysis by mothur. We will compare the information
gained by the full-length SSU-RIS sequences to the information gained
solely by SSU or RIS sequences respectively, and show how hypervariable
regions affect our OTU-based analyses.


## Getting started

### Obtaining sequences

The sequences from the two libraries can be downloaded from GenBank or,
alternatively, directly retrieved from [
LTSP07.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/ltsp07.zip) as BACT\_SSURIS.fasta and
EUKA\_SSURIS.fasta. Here is a quick guidline to retrieve batch sequences
from GenBank:


1\.  Go to the [NCBI homepage](https://www.ncbi.nlm.nih.gov).

2\.  Select *NUCLEOTIDE* from the *SEARCH* drop-down menu.

3\.  Type "FJ550632:FJ552694 \[ACCN\]" or "FJ552695:FJ554464 \[ACCN\]" to
    retrieve the bacterial or eukaryal sequences and hit *GO*.

4\.  Select *FASTA* under the *DISPLAY* menu and *FILE* under the *SENT
    TO* menu. Save it to your preferred location.

Since we will work with phylip formatted files, which allow only 10
digit sequence identifiers, the identifiers need to be trimmed. For this
reason, the fasta files in [ LTSP07.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/ltsp07.zip)
contain sequences solely assigned with the GenBank accession numbers. We
start the analysis using the bacterial dataset.

### Generating alignments

The sequences contain non-coding regions, therefore we cannot use the
16S-based aligner implemented in mothur, but rather a target-independent
alignment tool. In general, you can use your favourite software,
however, I recommend using
[MAFFT](https://align.bmr.kyushu-u.ac.jp/mafft/online/server) for this
dataset since this tool performs reasonably well with respect to
accuracy and speed of aligning large sequence sets with hypervariable
regions. Upload your sequences (e.g. BACT\_SSURIS.fasta) to the server
and use the default parameters to run MAFFT. Change format to *FASTA*
and copy alignment into a text editor. We name the file
BACT\_SSURIS.almafft.fasta. MAFFT can also be downloaded and run
locally.

### Generating alignment subfiles

It will be interesting to see how the SSU part and RIS part of the
sequences compare when clustering the sequences into OTUs. Therefore, we
will create two additional sequence files from
BACT\_SSURIS.almafft.fasta, i.e. BACT\_SSU.almafft.fasta and
BACT\_RIS.almafft.fasta. Open BACT\_SSURIS.almafft.fasta in your
favourite sequence alignment editor (e.g.
[BioEdit](https://www.mbio.ncsu.edu/BioEdit/bioedit.html/)). Trim the
alignment at the following conserved position on the 3'-end of the 16S:


1\.  Bacteria: TGCGGCTGGATCACCTCCTT (Normand et al. 1996, Molecular
    Microbial Ecology Manual).

2\.  Eukarya: TCCGTAGGTGAACCTGCGG (White et al. 1990, PCR Protocols: a
    Guide to Methods and Applications).

Trim sequences in order that BACT\_SSU.almafft.fasta ends and
BACT\_RIS.almafft.fasta starts with this conserved positions. In case
you have trouble splitting the alignment, I provided the subfiles in [
LTSP07.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/ltsp07.zip).

### Generate phylip4-formatted file

Use [ReadSeq](https://www.ebi.ac.uk/cgi-bin/readseq.cgi/) or equivalent
tools to convert the three aligned fasta files into phylip format. Use
format phylip4 since phylip3.2 will not work with the newer phylip
version. We name these files BACT\_SSURIS.almafft.phy,
BACT\_SSU.almafft.phy, and BACT\_RIS.almafft.phy.

### Create distance matrix

Use the [Phylip](https://evolution.genetics.washington.edu/phylip.html)
program
[DNAdist](https://evolution.genetics.washington.edu/phylip/doc/dnadist.html)
to generate a distance matrix from the phylip formatted alignment. The
algorithm can be run online at several locations
([[https://trishul.sci.gu.edu.au/tools/dnadist.html](https://trishul.sci.gu.edu.au/tools/dnadist.html)](https://trishul.sci.gu.edu.au/tools/dnadist.html),
[[https://mobyle.pasteur.fr/cgi-bin/portal.py?form=dnadist](https://mobyle.pasteur.fr/cgi-bin/portal.py?form=dnadist)](https://mobyle.pasteur.fr/cgi-bin/portal.py?form=dnadist))
or can be downloaded and used according to the following instructions:


1\.  Download the [Phylip
    package](https://evolution.genetics.washington.edu/phylip/getme.html).

2\.  Copy the executable dnadist.exe into the directory with your data
    files and execute the program.

3\.  When prompted for the input file type the name of the phylip
    formatted alignment file (e.g. BACT\_SSURIS.almafft.phy).

4\.  Create new outfile (e.g. BACT\_SSURIS.almafft.dist).

5\.  Press D to select Jukes-Cantor as distance. Default can be used for
    all other parameters.

6\.  Copy the file into the mothur folder.

7\.  Repeat procedure with the other files.

## OTU-based analyses

### Load distance matrix

We use the distance matrix created from our alignment in order to
determine the number of operational taxonomic units (OTUs) in our
dataset by using mothur. Start mothur and load the distance matrix by
using the [read.dist](read.dist) command:

    mothur > read.dist(phylip=BACT_SSURIS.almafft.dist)

### Clustering sequences

Cluster the sequences using the furthest neighbour algorithm.
Alternatively, nearest and average neighbour can be used and compared.
Since the data set is rather large and we are not interested in grouping
very distant OTUs, we use a cut-off of 0.10:

    mothur > cluster(cutoff=0.10)

### Collector's and rarefaction curves

We want to know how our sampling effort compares to the diversity and
richness of the community. This can be done by calculating [ collector's
curves](collect.single) or [ rarefaction
curves](rarefaction.single).

    mothur > collect.single()
    mothur > rarefaction.single()

These commands will produce several files. The [ sobs](Sobs)
file returns the number of observed OTUs for any given OTU definition
whereas the [ rarefaction](Rarefaction) file returns the
average number of OTUs for any given OTU definition by randomly
re-sampling the dataset several times. In our case, both curves
basically answer the same question, namely how diverse our community is
and how well our sampling effort covers this diversity. Open the sobs
and/or rarefaction files for the SSURIS, SSU and RIS dataset and plot
the curves at OTU definition of 0.03 in Excel or any other suitable
program. The distance 0.03 is often used to group sequences at around
species level based on the SSU gene.

![Collector's curves for bacterial SSU-RIS, SSU, and RIS sequence
datasets.\|300px\|centre](LTSP07_Collect.jpg "fig:Collector’s curves for bacterial SSU-RIS, SSU, and RIS sequence datasets.|300px|centre")
![Rarefaction curves for bacterial SSU-RIS, SSU, and RIS sequence
datasets. Lower and higher confidence intervals are indicated as dashed
lines.\|300px\|centre](LTSP07_Rarefaction.jpg "fig:Rarefaction curves for bacterial SSU-RIS, SSU, and RIS sequence datasets. Lower and higher confidence intervals are indicated as dashed lines.|300px|centre")

Whereas the curves calculated from the SSU sequence start to get
somewhat parallel to the x-axis, the SSU-RIS and RIS-based curves are
still very steep. The sampling effort of 2063 sequences might be
adequate based on the SSU sequence dataset; however, the coverage is
still rather poor when using the hypervariable RIS region as a standard.
Of course, using full-length SSU sequences rather than partial SSU
sequences might change this picture. In conclusion, based on SSU gene
sampling and therefore potentially down to genus or species level, we
might have reached satisfying coverage, but coverage is poor for
distinction of community structures at a finer scale as achieved with
ribosomal intergenic spacers.

### Richness and diversity indices

Both commands, [collect.single](collect.single) or
[rarefaction.single](rarefaction.single) can be used to
calculate [ richness and diversity estimators](Calculators)
such as [ Chao1](Chao), [ ACE](Ace),
[shannon](shannon), or [simpson](simpson) to
mentioned only some popular estimators. For some analyses, only the
final estimators are of interest, which can be calculated with the
[summary.single](summary.single) command. It is interesting
to know at which OTU distance levels the information content regarding
richness/diversity is levelling off for the two different genetic
regions, i.e. SSU and RIS. Start over and run:

    mothur > read.dist(pyhlip=BACT_SSU.almafft.dist)
    mothur > cluster()
    mothur > summary.single()

and

    mothur > read.dist(pyhlip=BACT_RIS.almafft.dist)
    mothur > cluster()
    mothur > summary.single()

Choose your favourite richness and/or diversity estimator and plot the
estimators for all OTU definition levels determined by mothur. Richness
and diversity estimators show again that a more detailed community
structure is resolved by using hypervariable regions such as RIS. In our
example, SSU-based richness/diversity become 0 at distances of around

0\.4, RIS-based estimators at distances of around 1.4.

![Chao1 richness estimator of the bacterial SSU and RIS sequence
datasets for all OTU definitions determined by
mothur.\|300px\|centre](LTSP07_Chao.jpg "fig:Chao1 richness estimator of the bacterial SSU and RIS sequence datasets for all OTU definitions determined by mothur.|300px|centre")
![Shannon diversity index of the bacterial SSU and RIS sequence datasets
for all OTU defnitions determined by
mothur.\|300px\|centre](LTSP07_Shannon.jpg "fig:Shannon diversity index of the bacterial SSU and RIS sequence datasets for all OTU defnitions determined by mothur.|300px|centre")

### Alignment control

Based on our genetic region, we had to use a target-independent
alignment tool, but we know that different alignment algorithms can
influence the clustering results. In order to evaluate the quality of
our alignment, we can compare our SSU alignment created with MAFFT or
any other alignment software to the 16S-aligner implemented in mothur.
This does not give us confidence that the alignment of the hypervariable
region is accurate, but at least determines if both alignment algorithms
perform similarly at the SSU level. For this purpose, we will align the
SSU sequences against the [ greengenes
database](Alignment_database) using the following pipeline:


1\.  Open the file BACT\_SSU.almafft.fasta in the text editor and remove
    all gaps, e.g. by using the find/replace function.

2\.  Save the file as BACT\_SSU.fasta and copy it into the mothur folder

3\.  Download the [ greengenes reference
    alignment](https://mothur.s3.us-east-2.amazonaws.com/wiki/greengenes.alignment.zip) and unpack it
    to the mothur folder

4\.  Use the following command to align your SSU sequences to the
    reference database

    mothur > align.seqs(candidate=BACT_SSU.fasta, fasta=core_set_aligned.imputed.fasta)

The new alignment file BACT\_SSU.kmer.needleman.nast.align will be
generated. The reference alignment contains 7,692 columns by default.
Since we do not require all columns for our analysis, we will apply a
filter to remove the columns that have gaps in all sequences:

    mothur > filter.seqs(fasta=BACT_SSU.kmer.needleman.nast.align, trump=., vertical=T)

Now we run our pipeline again

    convert fasta to phylip (BACT_SSU.kmer.needleman.nast.align.filter.phy)
    generate distance matrix (BACT_SSU.kmer.needleman.nast.align.filter.dist)
    mothur > read.dist(phylip=BACT_SSU.kmer.needleman.nast.align.filter.dist)
    mothur > cluster(cutoff=0.10)
    mothur > rarefaction.single()

Compare the rarefaction curves of the files BACT\_SSU.almafft.dist and
BACT\_SSU.kmer.needleman.nast.align.filter.dist by plotting them into
the same diagram. The two curves are almost congruent, which means that
both alignment algorithms lead to a very similar OTU clustering.
![Rarefaction curves of differently aligned SSU sequences, i.e. aligned
using mafft or mothur, at OTU definition level of 0.03. Lower and higher
confidence intervals are indicated as dashed
lines.\|300px\|centre](LTSP07_Rarefact_SSUalign.jpg "fig:Rarefaction curves of differently aligned SSU sequences, i.e. aligned using mafft or mothur, at OTU definition level of 0.03. Lower and higher confidence intervals are indicated as dashed lines.|300px|centre")

### Eukaryal dataset

Perform the same kind of analysis for the eukaryal dataset. Results are
very similar to the bacterial dataset, namely that SSU sequences are
much more conserved and give a reasonable coverage of the diversity with
the current sampling effort, whereas the RIS sequences resolve on a
finer scale at which the diversity is hardly covered yet by the sampling
effort.

![Rarefaction curves of the eukaryal SSU-RIS, SSU, and RIS sequence
datasets at OTU definition level of 0.03. Lower and higher confidence
intervals are indicated as dashed
lines.\|300px\|centre](LTSP07_Rarefaction(EUKA).jpg "fig:Rarefaction curves of the eukaryal SSU-RIS, SSU, and RIS sequence datasets at OTU definition level of 0.03. Lower and higher confidence intervals are indicated as dashed lines.|300px|centre")
![Chao1 richness estimator of the eukaryal SSU and RIS sequence datasets
for all OTU definitions determined by
mothur.\|300px\|centre](LTSP07_Chao(EUKA).jpg "fig:Chao1 richness estimator of the eukaryal SSU and RIS sequence datasets for all OTU definitions determined by mothur.|300px|centre")

## Outlook and discussion

Apparently, different genetic regions will have different capabilities
to distinguish communities based on OTU-approaches. In general, the OTU
binning is only as accurate as the underlying alignment, which makes the
alignment accuracy the needle eye of the analysis. Hypervariable
regions, which are considered to have a high potential in distinguishing
very closely related phylotypes, are difficult to properly align and
might therefore bias OTU clustering, particularly when large datasets
are used that cannot be manually corrected. We are currently developing
an analysis pipeline that uses mothur and alignment algorithms to
generate more accurate OTU binning for hypervariable regions. I will
discuss this pipeline in this tutorial as soon as it becomes available.
