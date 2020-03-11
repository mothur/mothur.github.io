---
title: 'Characterizing community composition along a transect of hypersaline sediments'
---

## Background

[300px\|thumb\|centerright\|Shoreline of La Sal Del Rey, a naturally
occurring hypersaline lake located in southern Texas,
U.S.A](Image:LSDR.JPG)

We used 16S 454 sequencing to characterize a series of bacterial
communities from the sediments of a hypersaline lake ecosystem. Samples
were collected at 8 points (A through H) along a transect that
represented gradients of salt and water content, as well as substantial
variation in cation concentrations, and carbon and nitrogen content.
Points A and B were located at the most \"upland\" and/or
\"terrestrial\" end of the transect, while points F, G, and H were the
located at the most \"aquatic\" and water-logged end of the transect.

The goals of this study were to: 1) describe the communities associated
with this fairly extreme environment, and 2) determine what differences,
if any, could be detected among them.

In total, 39,590 sequences were generated for our 8 sites (average
\~5000 sequences per library), with an average read length of 455 bp.
Much of this analysis was conducted as the first version of Mothur was
being released. We did a lot of the analysis "the hard" way (i.e. via
supercomputer), and then we found alternatives to the hard way using
Mothur. The example workflow described below talks about both:

*Note: This analysis was done working back and forth between a Linux
server and a Windows-based workstation. File manipulations done in
[BioEdit](https://www.mbio.ncsu.edu/BioEdit/bioedit.html) and web
interaction with the [Ribosomal Database Project\'s Pyrosequencing
Pipeline](https://pyro.cme.msu.edu/) were done via the Windows
workstation. Everything else was done via Linux.*

## Initial data manipulation

Sequence tags had already been removed from our dataset before we
received it, eliminating the need for us to do this ourselves. Sequence
data from each of the 8 sites along our transect were first analyzed
individually, and then they were combined into a single FASTA file for
community-wide analyses.

Individual community files were run through the [Deconvolute or
Unique.seqs](Unique.seqs) function to create sets of unique
sequences:

    mothur> unique.seqs(fasta=Site_A_454.fasta)
    mothur> unique.seqs(fasta=Site_B_454.fasta)
    mothur> unique.seqs(fasta=Site_C_454.fasta)
    mothur> unique.seqs(fasta=Site_D_454.fasta)
    etc...

For each of these communities, new files were generated called
\"Site\_A\_454.unique.fast\" and \"Site\_A\_454.names\". I changed the
name of the FASTA file to Site\_A\_454\_unique.fasta so that other
programs (like [BioEdit](https://www.mbio.ncsu.edu/BioEdit/bioedit.html))
would recognize the file. Note the replacement of .unique.fasta with
\_unique.fasta . This makes a big difference when you are moving back
and forth between Linux and Windows systems.

RDP doesn\'t seem to like file names with multiple periods either. In
addition, \"blank sequences\" (i.e. additional lines containing no data)
may appear in your sequence files if sequences were removed during the
deconvolution process. If you are going to use RDP for your alignments,
make sure that you remove them. Otherwise, you will receive an error
message from RDP stating that the your sequence IDs are empty.

Once the sequence files for each of the communities had been
deconvoluted, they were combined into a single community-wide sequence
file using the File/Import/Import sequence alignment file function in
[BioEdit](https://www.mbio.ncsu.edu/BioEdit/bioedit.html). Prior to
combining the individual sequence files, samples were given a
site-specific identifier in addition to their sequence-specific ID (e.g.
siteID\_sampleID) in order to be able to identify them quickly, as well
as to simplify the creation of a GROUPS file later on. The \"paste
over\" function in
[BioEdit](https://www.mbio.ncsu.edu/BioEdit/bioedit.html) allows you to
manipulate sequence IDs in a program like Excel and then paste them back
to their appropriate sequences with minimal difficulty.

## Generating alignments & distance matrices

Sequences from both the individual sampling sites (A through H) and the
combined communities file were aligned using [RDP's
Aligner](https://pyro.cme.msu.edu/spring/align.spr;jsessionid=2891C47658EC069E646F29941B28418E)
function. The alignment was downloaded from RDP and then opened with
[BioEdit](https://www.mbio.ncsu.edu/BioEdit/bioedit.html). The consensus
sequence was removed (\# GC SS cons), as were the RDP reference sequence
(\#GC\_RF) and any sequences that did not align with the 16S region. The
alignment was then minimized and saved in FASTA format (for Mothur) and
PHYLIP format (for DNAdist).

Alternatively, Mothur's [Align.seqs](Align.seqs) feature,
followed by the [Filter.seqs](Filter.seqs) feature, can be
used. See the [Pyrosequences from deep anoxic
cenotes](Pyrosequences_from_deep_anoxic_cenotes) example for
details on how to do this.

Distance matrices were then calculated. Our initial pass at this
involved using [PHYLIP's DNAdist
program](https://evolution.genetics.washington.edu/phylip.html). This
works fairly well for sequence files containing 8,000 sequences or less
on your average Windows-based workstation, but for the 39,000+ sequences
that we had in our community-wide sequence file, using our university's
supercomputer system became necessary. It was a long and slow process
(26 hours) that had to be submitted through a batch request, but it
worked.

An alternative to DNAdist is to use Mothur's
[Dist.seqs](Dist.seqs) function. For generating OTUs and
OTU-related statistics, the column-formatted distance matrices work just
fine. This is what you\'ll get if you run the program in default mode,
and this is what I did to generate OTUs. Since I also planned to run the
parsimony test on all of my communities downstream (and use Clearcut to
construct my phylogenetic trees), I used the Phylip-formatted distance
matrix feature for my whole-community distance matrix.

    For OTUs:
    mothur> dist.seqs(fasta=Site_A_unique.fasta)

    For treebuilding:
    mothur> dist.seqs(fasta=All_LSDR_454_unique.fasta, phylip=T, processors=2)

Building the whole-community distance matrix took \~3 hrs to complete
using 2 processors on a machine that had 16 gigs of RAM. Not too shabby
at all!

## Generating groups files

You'll probably have time to kill while you are waiting for your
distance matrix to be calculated. This is a good time to generate your
GROUPS file. The way we typically do this is to open our combined
distance matrix in
[BioEdit](https://www.mbio.ncsu.edu/BioEdit/bioedit.html), select all of
the sequence titles and copy them, then paste them into an Excel
worksheet.

Paste your sequence names into one column, and then enter your group
identifiers (i.e. treatments, communities, etc) into the next column.
The Ctrl+D function makes this go pretty quickly. Save your file as a
tab-delimited text file, and use "myfile.groups" as the name of your
file when you save it. Using the quotation marks produces the .groups
file ending. Ignore the warnings you receive about incompatibility....it
all works out fine once you've convinced Excel that this is really what
you want to do with your file.

## Generating OTUs and OTU-related statistics

After constructing our column-formatted distance matrices for each of
sites (A through H), we then used the [read.dist](read.dist)
function to generate clusters (i.e. OTUs). The command looks like this:

    mothur> read.dist(column=Site_A_unique.dist, name=SiteA.names)
    mothur> cluster()

The first command: 1) identifies your distance matrix as being column
formatted; 2) and allows Mothur to read it. \*\*Note, you really do want
to use \"name=\" and not \"names=\" to identify your .names file. The
second command is given immediately after Mothur finishes reading your
matrix and requires no other input than \"cluster ()\". Mothur knows to
cluster the data that it\'s just read through.

After the cluster command has finished running, you will find that three
new files have been generated. These are fn.list, fn.sabund, and
fn.rabund. Enter:

    mothur> read.otu(list=Site_A_unique.fn.list)
    mothur> summary.single()

This set of commands will generate a .fn.summary file that contains your
OTUs, as well as a number of richness and diversity estimators. More
information on how to use the summary.single command can be found [
here](summary.single), and Pat\'s [Sogin data
analysis](Sogin_data_analysis) example also goes through
generating OTUs.

## Tree building

Once you have your distance matrix in hand, the next step in this
process is to create a phylogenetic tree. We use
[Clearcut](https://bioinformatics.hungry.com), a program written by Luke
Sheneman et al. Clearcut employs a relaxed neighbor-joining algorithm
and is able to build a tree using either a distance matrix or an
alignment. Although this is a more efficient option than PHYLIP\'s
Neighbor, it\'s still pretty computationally intense. We ran it through
our university\'s supercomputer facility. It is implemented via the
command(s):

    $$> ./clearcut  --distance --in=All_LSDR_454_unique.dist --out=All_LSDR_454_unique.tree 

or you can use\...

    $$> ./clearcut  --alignment --in=All_LSDR_454_unique.fasta --out=All_LSDR_454_unique.tree

After [Clearcut](https://bioinformatics.hungry.com) generates your tree,
you\'ll need to open up the file in a text editor and remove the spaces
between the tree\'s text and the file\'s final semi-colon (;). Mothur\'s
[Parsimony](Parsimony) feature doesn\'t like these spaces it
and will return an error message if you leave them in place.

## Parsimony analysis

The tree generated in [Clearcut](https://bioinformatics.hungry.com) was
used as input for Mothur's implementation of the
[Parsimony](Parsimony) test. The parsimony test can be
thought of as being similar to analysis of variance (ANOVA), in that
your "global" test should yield a statistically significant difference
before you start examining any of your pairwise contrasts. The following
set of commands implements the global test first, then it asks Mothur to
process all of the pairwise comparisons in your dataset.

    mothur>read.tree(tree=All_LSDR_454_unique.tree, group=LSDR_454_unique.groups)
    mothur> parsimony()

or you can use\...

    mothur>read.tree(tree=All_LSDR_454_unique.tree, group=LSDR_454_unique.groups)
    mothur> parsimony(groups=all)

Before this function was available in Mothur, we used
[Treeclimber](https://schloss.micro.umass.edu/software/treeclimber.html)
to run the parsimony test:

    $$> ./treeclimber -t All-LSDR_454_unique.tree -n All_LSDR_454_unique.names 

This command will run your global test. In order to conduct pairwise
comparisons, you\'ll have to go through and edit your .names file.
Details for doing this can be found in the [Treeclimber
manual](https://schloss.micro.umass.edu/software/treeclimber/TreeClimberManual.pdf).

## Results

Operational taxonomic units detected across the study transect at
various genetic distances:

  Sample ID   Reads   0.03    0.05                0.10
  ----------- ------- ------- ------------------- ----------------------
  OTU         ACE     Chao1   OTU                 ACE
  Site A      1404    744     1402 (1254, 1593)   1440 (1301, 1613)
  Site B      5946    3478    8158 (7646, 8734)   12551 (12218, 12897)
  Site C      5445    2631    5183 (4863, 5549)   7959 (7737, 8190)
  Site D      4995    2627    6122 (5683, 6625)   10131 (9834, 10440)
  Site E      5191    2389    4868 (4536, 5252)   7279 (7078, 7488)
  Site F      6742    2592    4556 (4296, 4856)   6113 (5962, 6270)
  Site G      5007    2290    4407 (4119, 4741)   6559 (6378, 6749)
  Site H      4840    2523    5285 (4931, 5691)   8149 (7917, 8391)
                                                  

Parsimony analysis results:

  Number of trees   Communities compared            Parsimony score   Significance
  ----------------- ------------------------------- ----------------- --------------
  1                 All communities (global test)   11858             p \< 0.001
  1                 A vs. B                         2729              p \< 0.001
  1                 A vs. C                         3525              p \< 0.001
  1                 A vs. D                         3139              p \< 0.001
  1                 A vs. E                         2941              p \< 0.001
  1                 A vs. F                         4179              p \< 0.001
  1                 A vs. G                         4049              p \< 0.001
  1                 A vs. H                         3676              p \< 0.001
  1                 B vs. C                         4830              p \< 0.001
  1                 B vs. D                         4620              p \< 0.001
  1                 B vs. E                         4619              p \< 0.001
  1                 B vs. F                         5894              p \< 0.001
  1                 B vs. G                         5871              p \< 0.001
  1                 B vs. H                         3200              p = 0.001
  1                 C vs. D                         5291              p \< 0.001
  1                 C vs. E                         4805              p \< 0.001
  1                 C vs. F                         6134              p \< 0.001
  1                 C vs. G                         6434              p \< 0.001
  1                 C vs. H                         6037              p \< 0.001
  1                 D vs. E                         4615              p \< 0.001
  1                 D vs. F                         5795              p \< 0.001
  1                 D vs. G                         6103              p \< 0.001
  1                 D vs. H                         5671              p \< 0.001
  1                 E vs. F                         5779              p \< 0.001
  1                 E vs. G                         5884              p \< 0.001
  1                 E vs. H                         5472              p \< 0.001
  1                 F vs. G                         6388              p \< 0.001
  1                 F vs. H                         6389              p \< 0.001
  1                 G vs. H                         4997              p \< 0.001
                                                                      

In addition to the global test, 28 pairwise comparisons were made. Using
the Bonferroni correction for multiple comparisons $$a/n$$, a significance
cutoff of p \< 0.05, becomes p \< 0.0017. All of the comparisons made
resulted in significance values of 0.001 or less, suggesting that the
community phylogenies present at each point along the study transect are
significantly different from one another.

## Conclusions

Pyrosequencing data sets are providing big challenges to the fast,
efficient analysis of community data sets. Mothur, and the functions
implemented within it, are a huge step forward in this challenge.
Relative to our first attempts to analyze this data set, Mothur improved
both the speed and flexibility of analysis, allowing us to move most
tasks away from our supercomputer system and onto a relatively modest
Linux workstation. Yay, Mothur!

While additional tests could certainly be carried out on this data, the
purpose of this example was to: 1) show how one might quickly obtain
summary statistics (i.e. OTUs and related OTU-information) on a rather
large (\~40,000 sequence) data set, and 2) illustrate an approach to
conducting parsimony analysis with such a data set.
