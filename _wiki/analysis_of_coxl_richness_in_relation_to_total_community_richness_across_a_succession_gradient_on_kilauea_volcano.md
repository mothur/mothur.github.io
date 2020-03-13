---
title: 'Analysis of coxL richness in relation to total community richness across a succession gradient on Kilauea Volcano'
redirect_from: '/wiki/Analysis_of_coxL_richness_in_relation_to_total_community_richness_across_a_succession_gradient_on_Kilauea_Volcano'
---
Introduction:

Carbon monoxide (CO)-oxidizing bacteria are among the earliest
colonizers on young volcanic deposits and remain active members of the
bacterial community throughout biological succession. In this tutorial,
one can investigate how richness of CO-oxidizing communities change,
based on coxL libraries generated from three sites on Kilauea volcano.
The three sites, Bare, Edge and Canopy are located along a 10 m transect
and represent early, middle and late succession, and are comprised of
barren cinders, the edge of a tree canopy (a mixture of course cinders,
soil and some vegetation) and organic-rich soil in a tree canopy,
respectively. Also, 16S rRNA gene libraries have been generated for
these sites and are provided in this tutorial to allow one to
investigate how CO-oxidizer richness changes relative to total bacterial
communities across the transect.

The sequence files that are needed for this tutorial are located here:
([kilauea.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/kilauea.zip)). The coxL and 16S
sequences are located in the files CBE208coxL.pir and
CBE485-16Salign.txt, respectively. You should be able to generate all
other necessary files, such as the .groups and .ntree files from the
above named. However, distance matrices, groups, and ntree files have
also been provided in the event that you only want to try part of the
tutorial. Sequences designated with a "B", "E" or "C" were generated
from the Bare, Edge and Canopy sites, respectively.


Data Preparation
================

Data preparation for analyses in mothur consists of 4 primary steps:


1\.  Assemble DNA sequences into a fasta file (such as the ones provided
    in this tutorial). For protein-coding sequences, generate a fasta
    file of translated sequences.

2\.  align sequences

3\.  generate distance matrices and .ntree files. The latter is used for
    hypothesis-testing.

4\.  create a .groups file. This file allows mothur, to recognize the
    different groups or libraries of sequences in your distance matrix
    and allows you to generate OTU data for each group of sequences and
    perform hypothesis testing without needing to generate separate
    distance matrices for each desired comparison.

## Preparing fasta files

After assembling a fasta file of DNA sequences, protein-coding sequences
can be conveniently translated using the batch translator on the
[searchlauncher website](https://searchlauncher.bcm.tmc.edu/).

Alternatively, if you use Sequencher to assemble your sequences you can
translate in the program and export them in a Fasta format.

## Sequence Alignment

For protein coding sequences such as coxL, I have been aligning them
using Clustal X, which can be downloaded [here](https://www.clustal.org/)

Other alignment programs such as MUSCLE or Arb can be used. Justine Hall
has provided a great example of using Arb to align protein-coding genes
[here](Analysis_of_the_aclB_gene_in_a_hot_spring:_a_non-16S_rRNA_gene_example).

To align the 16S rRNA sequences I used the [Greengenes web
server](https://greengenes.lbl.gov/). [arb](https://www.arb-home.de/) and
[silva](https://www.arb-silva.de/shop/) can also be used.

## Generating distance matrices and tree files

### coxL

For coxL, if you align them using ClustalX you can output a .pir file. I
took the .pir file and opened it using Word and did a find and replace
of "P1;" with nothing and also a find and replace of "\*" with nothing.
The file CBE208coxLmodifiedpir.txt can be used to make the distance
matrix by doing the following:


1\.  open Arb and upload "CBE208coxLmodifiedpir.txt".

2\.  Click "Auto Detect" and make sure that the file is identified as a
    fasta\_wgap.ift

3\.  Press "Go".

4\.  Click "use found names"

5\.  Ignore error message saying that you do not have a tree and click
    "OK"

6\.  Click "Always Skip (all)" on the next screen (if it pops up...from
    my experience, sometimes it doesn't)

There are several options for making distance matrices and using various
filters, but for the purposes of this tutorial we will keep it simple.
However, by following the steps below you will be able to see what
options and types of corrections are available in Arb:


1\.  in the menu bar, click "tree" and select "build tree from sequence
    data".

2\.  Select "distance matrix methods"

3\.  select "phylip distance matrix"

4\.  In the next window that pops up, make sure that "treat data as" is
    set to "AA" is selected and leave the default options selected.

5\.  select "Go"

6\.  In the terminal window that pops up, the phylip program will ask you
    to input "Y" or "n" to proceed using the default options. Type "Y"
    and press return.

7\.  Allow the program to run and when finished save the distance matrix
    to the location of your choice.

8\.  To generate the tree file (.ntree extension) select "tree" from the
    menu bar and select "build tree from sequence data".

9\.  Select "distance matrix methods"

10\. select "phylip distance matrix (simple GUI based interface)"

11\. in the tree option choose neighbor-joining and again make sure that
    the "treat data as" is set to "AA"

12\. click "GO"

13\. After phylip is done running, click on the button in the main Arb
    window that says "tree\_main". Select the tree that was just created
    from the coxL sequences (should contain 208 sequences) and click
    "modify\".

14\. In the next window that pops up, click on "export"

15\. In the next window, save the tree to the desired location. It should
    have a .ntree extension.

### 16S rRNA genes

For the purposes of this tutorial, I generated the 16SrRNA gene distance
matrix and tree file in Arb using instructions provided in the [ mothur
workshop](Lab_2) using file "CBE485-16Salign.txt".

## Creating a group file (.groups extension)

The group file will be created from the same fasta file used to generate
the distance matrices and tree files. To make the coxL groups file,
follow the instructions below:


1\.  In the terminal window type:

grep "\>" CBE208coxLmodifiedpir.txt \>CBE208coxL.groups now, press
return


1\.  type:

more CBE208coxL.groups

Hold down return until the file is done processing to make sure all the
sequences in the file are in the right format. You should see a list of
sequences in this format in the terminal window:

\>B55

\>C43

\>B23

\>E45


\........and so on.


1\.  open your groups file (should be in the same place as
    CBE208coxLmodifiedpir.txt) in a tab delimited format using Excel.

2\.  Find and replace "\>" with nothing.

3\.  The first column in your Excel file should have the names of each of
    the 208 coxL sequences. In the second column of the file, you need
    to insert the unique identifier for each of the groups. For example,
    each sequence from the Bare site should have a "B" in the second
    column, all the sequences from the Edge site should have an "E" and
    all the sequences from the Canopy site should have a "C":

B21 B

B45 B

B55 B

E56 E

E44 E

E32 E

C15 C

C45 C

C90 C


1\.  Save and close your groups file

2\.  In the terminal window type:

more CBE208coxL.groups Hold down return until the file is done
processing to see that each sequence is labeled with the proper group
designation.

The same procedure can be done for the 16S rRNA gene sequences using the
file "CBE485-16Salign.txt".

How Should We Define an OTU for the coxL Gene?
==============================================

Before jumping into OTU-based analyses of the coxL gene, it is helpful
to come up with an OTU definition or at least think about one. How to
define an OTU for 16S rRNA genes is still a subject of much debate, but
is even more so for functional genes. For functional genes that undergo
a lot of horizontal gene transfer,such as RubisCO, this is especially
difficult to do. However, the 16S rRNA phylogeny and coxL phylogeny of
known CO-oxidizing isolates are largely parallel. This allows for a
direct comparison of 16S rRNA gene similarity and coxL gene similarity.
For known CO-oxidizing bacteria, a distance matrix based on the 16S rRNA
gene sequences and the coxL sequences were generated using phylip. The
16S rRNA gene similarities for pairwise comparisons were plotted vs. the
corresponding coxL pairwise similarities. The graph below shoes that the
imperfect 16S rRNA gene OTU definition of 0.03 (approx. species level)
corresponds roughly to a coxL OTU definition of 0.10---the definition
that was ultimately used to analyze this data set.

![16S rRNA gene similarities vs. coxL gene similarities for CO-oxidizing
isolates. An OTU cutoff of 0.03 for 16S rRNA roughly corresponds to a
coxL OTU definition of

0\.10.](coxLOTUdefinition.jpg "16S rRNA gene similarities vs. coxL gene similarities for CO-oxidizing isolates. An OTU cutoff of 0.03 for 16S rRNA roughly corresponds to a coxL OTU definition of 0.10.")

OTUs: How Many? How Well were they Recovered? How Many are Unique? How Many are Shared?
=======================================================================================

## Richness Assessment: How Many OTUs are in the coxL libraries?

The first step is to read your coxL distance matrix into mothur using
the [read.dist command](Read.dist) and have mothur cluster
the OTUs. To do this, type the commands as you see them below and you
should see the accompanying output:

mothur \> read.dist(phylip=CBE208coxL.dist, cutoff=0.10)

mothur \> cluster()

You should now have the output file CBE208coxL.fn.list. To read the OTUs
in this file and output the fn.list files for each group of sequences,
type the following command:

mothur \> read.otu(list=CBE208coxL.fn.list, group=CBE208coxL.groups,
label=0.10)

If you desire OTU data for more distances than 0.10, you can add
additional distances after "label". For instance, you could type:

mothur \> read.otu(list=CBE208coxL.fn.list, group=CBE208coxL.groups,
label=0.03-0.05-0.10)

Since we are interested in coxL OTUs at the 0.10 cutoff we will use only
that label for the rest of the time.

Now, to read the OTUs and generate the rarefaction curves for each group
of sequences, use the following commands:

mothur \> read.otu(list=CBE208coxL.fn.B.list)

mothur \> rarefaction.single(freq=1, label=0.10) 0.10 1

mothur \> read.otu(list=CBE208coxL.fn.E.list)

mothur \> rarefaction.single(freq=1, label=0.10) 0.10 1

mothur \> read.otu(list=CBE208coxL.fn.C.list)

mothur \> rarefaction.single(freq=1, label=0.10) 0.10 1

Note that the "0.10 1" that you see after the commands indicates that
the OTU data at the 0.10 cutoff are in line one of the output file. If
we had input a command with more labels, we would see more distances
with the corresponding line numbers. This is useful if later on you only
need to look at certain lines of data. For more information on this
please refer to [label and line options](Read.otu).

Also note that using "freq=1" means that the output for the rarefaction
curves will display data for every sequence collected. The default freq
in mothur is to list the number of OTUs and the confidence intervals for
every 100 sequences. Depending on the size data set you are working with
you may want to adjust the frequency. This is also discussed [freq
options](Rarefaction.single).

If you open up the files CBE208coxL.fn.B.rarefaction,
CBE208coxL.fn.E.rarefaction and CBE208coxL.fn.C.rarefaction you will see
that when all the sequences in the libraries are sampled they contain 8,
13 and 20 OTUs, respectively. When you open up the
CBE208coxL.fn.B.rarefaction file, for instance, you should see the
following output:

Numsampled 0.10 lci hci

1 1.0000 1.0000 1.0000

2 1.8800 1.2427 2.5172

3 2.6320 1.5786 3.6854

4 3.3261 1.9821 4.6701

5 3.9310 2.3352 5.5268

6 4.5010 2.6740 6.3279

7 5.0040 2.9287 7.0793

8 5.4400 3.1461 7.7339

9 5.8830 3.4264 8.3395

10 6.3181 3.6982 8.9379

11 6.7110 4.0125 9.4094

12 7.1219 4.3410 9.9029

13 7.5030 4.6573 10.3488

14 7.8801 4.9638 10.7964

15 8.2340 5.3285 11.1395

16 8.5849 5.6851 11.4848

17 8.9230 5.9652 11.8809

18 9.2320 6.1852 12.2789

19 9.5200 6.4597 12.5803

20 9.8310 6.7239 12.9381

21 10.1415 6.9886 13.2944

22 10.4484 7.3051 13.5917

23 10.7182 7.5769 13.8595

24 11.0170 7.8594 14.1746

25 11.2892 8.0753 14.5031

26 11.5745 8.3188 14.8302

27 11.8182 8.5816 15.0548

28 12.0699 8.8461 15.2937

29 12.3507 9.1239 15.5775

30 12.6099 9.4202 15.7996

31 12.8571 9.6725 16.0417

32 13.1066 9.8935 16.3197

33 13.3318 10.1194 16.5442

34 13.5665 10.3732 16.7598

35 13.7743 10.5726 16.9760

36 13.9988 10.8477 17.1499

37 14.2351 11.1013 17.3689

38 14.4518 11.3826 17.5210

39 14.6463 11.5863 17.7063

40 14.8486 11.7757 17.9215

41 15.0375 11.9992 18.0758

42 15.2263 12.2325 18.2201

43 15.4298 12.4668 18.3928

44 15.6253 12.6292 18.6214

45 15.7931 12.8752 18.7110

46 16.0025 13.0992 18.9058

47 16.2021 13.3165 19.0877

48 16.3657 13.5076 19.2238

49 16.5477 13.7264 19.3690

50 16.7101 13.9097 19.5105

51 16.8784 14.1606 19.5962

52 17.0429 14.3622 19.7236

53 17.2044 14.5967 19.8121

54 17.3801 14.8266 19.9336

55 17.5540 15.0573 20.0507

56 17.7374 15.3183 20.1565

57 17.8954 15.5798 20.2110

58 18.0409 15.7630 20.3188

59 18.1917 15.9778 20.4056

60 18.3406 16.1779 20.5033

61 18.4801 16.3868 20.5734

62 18.6211 16.6432 20.5990

63 18.7907 16.9240 20.6574

64 18.9305 17.1483 20.7127

65 19.0542 17.3575 20.7509

66 19.1976 17.6296 20.7656

67 19.3311 17.8939 20.7683

68 19.4762 18.1616 20.7908

69 19.6091 18.4658 20.7524

70 19.7378 18.8018 20.6738

71 19.8585 19.1822 20.5348

72 20.0000 20.0000 20.0000

Note that lci and hci indicate the confidence interval.

## Richness Assessment: How many OTUs are in the 16S rRNA gene libraries?

We can repeat the above analysis for the 16S rRNA libraries using the
distance matrix (CBE485-16Salign.dist) and the group file
(CBE485-16Salign.groups). However, this time, we are interested in OTUs
at the 0.03 cutoff because this corresponds to the OTU cutoff of 0.10
for coxL as described above.

After doing this analysis your output files should indicate that there
are 70, 93 and 103 OTUs in the Bare, Edge and Canopy libraries,
respectively.

## Rarefaction Analysis: How well were OTUs recovered from each site?

If you plot the coxL and 16S rRNA gene rarefaction data in the

\.rarefaction output files, you can see how well the environment was
sampled. I have used my favorite graphing program
[kalaidagraph](https://www.synergy.com) to generate the rarefaction
curves:

![Rarefaction curve for the 16S rRNA gene libraries using an OTU
definition of

0\.03](16Srarefaction.jpg "fig:Rarefaction curve for the 16S rRNA gene libraries using an OTU definition of 0.03")
![Rarefaction curve for the coxL gene libraries using an OTU definition
of

0\.10](coxLrarefaction.jpg "fig:Rarefaction curve for the coxL gene libraries using an OTU definition of 0.10")

## Trends in Richness

For coxL we have done a good job sampling the Bare site (at least at the

0\.10 cutoff level), and a little less so for the Edge and Canopy. None
of the 16S rRNA gene libraries come close to reaching saturation and we
would not expect them to given their small size and the vast bacterial
richness of terrestrial environments. However, because we did sample
similar numbers of clones from each of the libraries, it is interesting
to compare the coxL OTU: 16S rRNA OTU ratios for the sites. The steady
increase in ratios indicates that CO-oxidizer richness may be increasing
at a faster rate during succession than total bacterial richness and
indicates that CO-oxidizers likely remain competitive during succession.
These observations also correlate well with activity data for these
sites, which I won't bore you with in this tutorial.

![coxL OTU:16S rRNA OTU ratio for the Bare, Edge and Canopy
sites.](coxL16SrRNAOTUratio.jpg "coxL OTU:16S rRNA OTU ratio for the Bare, Edge and Canopy sites.")

## Comparing Richness: How many OTUs were shared among libraries? How many were unique?

A nice visual way to compare libraries is by generating a Venn diagram,
which makes it easy to see how many OTUs are unique or shared among
libraries. These diagrams are extremely easy to generate in mothur by
typing the following commands:

mothur \> read.otu(shared=CBE208coxL.fn.shared, label=0.10)

mothur \> summary.shared()

mothur \> venn(label=0.10, calc=sharedsobs)

mothur \> read.otu(shared=CBE485-16Salign.fn.shared, label=0.03)

mothur \> summary.shared()

mothur \> venn(label=0.03, calc=sharedsobs)

The output files have an .svg extension and can be viewed in Adobe
illustrator. Alternatively, if you do not have Adobe Illustrator, there
is a very fast and convenient online file converter which can [convert
SVG files into
JPEGs](https://www.fileformat.info/convert/image/svg2raster.htm)

![coxl venn diagram](https://mothur.s3.us-east-2.amazonaws.com/wiki/coxlvenn.jpg)
![16S rRNA gene Venn
diagram](16SVenn.jpg "fig:16S rRNA gene Venn diagram")

You can see from the coxL and 16S rRNA gene Venn diagrams that each of
the communities possess large numbers of unique OTUs and speaks to the
influence that vegetation and associated environmental changes have on
community richness and composition. The distinctness of the libraries
using OTU-based approaches is also supported by several
hypothesis-testing approaches, which are described below.

## How are the sequences distributed across the OTUs?

To answer this question, we need to generate rank-abundance curves. You
can do this for the coxL libraries:

For instance, for the Canopy site coxL library:

mothur \> read.otu(list=CBE208coxL.fn.C.list, label=0.10)

mothur \> get.rabund() 0.10 12

This will generate data that look like this:


0\.10 20 19 18 5 4 4 3 2 2 2 2 2

1 1 1 1 1 1 1 1 1 1

The first number is the OTU cutoff used (0.10). The next number is the
number of total OTUs (20). Subsequent numbers indicate how many
sequences are in each OTU, listed in order from the most abundant OTU
(containing 19 sequences) to the least abundant OTU (containing 1
sequence).

If you generate and plot this data for all of the sites, you can see
that the Bare site is heavily dominated by a couple of OTUs, but the
community becomes more even in the Edge and Canopy sites.

![rank abundance curve for Bare site
coxL](BarecoxL-rabund.jpg "fig:rank abundance curve for Bare site coxL")
![rank abundance curve for Edge site
coxL](EdgecoxL-rabund.jpg "fig:rank abundance curve for Edge site coxL")
![rank abundance curve for Canopy site
coxL](CanopycoxL-rabund.jpg "fig:rank abundance curve for Canopy site coxL")

## "Who" is representative of the OTUs?

To quickly get an idea of "who" or what phylogenetic group might be
representative of each OTU in you data set, you can have mothur produce
a fasta file containing sequences that are representative of each OTU
using the command get.oturep (link here). For the coxL libraries, use
the following commands:

mothur\> read.dist(phylip=CBE208coxL.dist, cutoff=0.10)

mothur\> get.oturep(fasta=CBE208coxLmodifiedpir.txt,
list=CBE208coxL.fn.list)

When analyzed collectively, the coxL libraries have 32 OTUs and the
output file should have a sequence representative of each of those OTUs.
The start of the ouput file should look something like this:

\>B45\|B\|1
GGFGKKVPIYPGYVCAVVASITTGKPVKWIEDRTENLSSTGFGRDYHIKAEIAADKDGTVKALRVYTLADHGAFDAAAQPTKFPAGLFHICTGSYDFKNAFVEVDAVHTNKAPGGIAYRCSFRVTEASFLIERAMDTLAHNLGKDPADLRMQNFIKPDAFPYRSALDWTYDSGNYEAALQLAMRNVDYEGLRREQAEKRARG\-\-\-\-\--ELMGIGISSFTEIVGAGPGKHFDIAGIQMFDSCEIRVHPTGKAIARIGVQTQGQGHETTFAQIIAAELGMSPDDIDVEHGDTDTAPYGLGTYASRSTPVAGAATALAARKVRDKAKKIAAYLLEVGEDDLEWEPG\-\-\-\-\--RFFVKGSPGKGKTIQELAFAAYTN\--CPPYLEPGLEAVNYYDPPNLTYPFGSYICVVDIDRGTGQVHIRRFMAVDDCGTIINPMIIE

\>B51\|B\|2
\...\...\...\...\...\...\...\...\...\...\...\...\...\...\...\...\...\...\...\...\...RVHTLADHGAFDAAAQPTKFPAGLFHICTGSYDFKNAFVDVDAVHTNKAPGGIAYRCSFRVTEASYLIERMMDTLAHDLGKDPAQLRLQNFIQPEAFPYRSALNWTYDSGNYEGALQLAMKNVDYEGLRREQAEKRARG\-\-\-\-\--ELMGIGISSFTEIVGAGPGKHFDIAGIEMFDSCEVRVHPTGKILARIGVQTQGQGHETTFAQIIAAELGMSPDDVDVEHGDTDTAPYGLGTYASRSTPVAGAATALAARKVRDKAKKIAAYLLEVGEEDLEWEPG\-\-\-\-\--RFFVKGSPGKGKTIQELAFAAYTN\--CPPYLEPGLEAVNYYDPPNLTYPFGSYICVVDIDRGTGEVHIRRFMAV\...\...\...\....

\>B13\|B\|3
\...\...\...\...\...\.....LKTGKPVKWIEDRSEDIGSTGFARDYHIHAELAADKDGTVNALRVHTLADHGAFDGAAQPTKFPAGLFHICTGSYDFKHAFVDVDAVHTNKAPGGIAYRCSFRVTEASYLIERMMDTLAHDLDKDPAELRLQNFIQPEAFPYRSALDWTFDSGNYEGSLRLAMKNVDYEGLRREQLEKRARG\-\-\-\-\--ELMGIGISTFTEIVGAGPGKHFDIAGIQMFDSCEIRVHPTGKALARIGAQTQGQGHETTFAQIIGAELGMSPDDIDVEHGDTDTAPYGLGTYASRSTPVAGAATALAARKVRDKAKKIAAYLLEVGEEDLEWEPG\-\-\-\-\--RFFVKGAPSKGKTIQELAFAAYTN\--CPPYLEPGLEAVNYYDPPNLTYPFGAYICVVDIDRGTGEVHIRRFMAVDDCGTVINPMIIE

\>B30\|B-C\|4
GGFGNKVGAYPGYICAAVASIVTGQPVKWVEDRMENLSTTAFARDYHMTTEIAATKEGRVTGLRVHILADHGAFDACADPSKWPAGFSNIVTGSYDFPVAHLSVDGVYTNKAPGGVAYRCSFRVTEVAYAIERAMDIMAQKLGMDPVDFRIKNFIRREQFPYQSALGWEYDSGDYHAAMEKALAATDYRRLREEQKARQEAFRRGETRELMGIGVSFFTEIVGAGPSKNCDILGIAMFDSAEIRIHPTGRAIARMGSKSQGQGHETTWAQIIATEIGIPADDIVIEEGNTDTAPYGLGTYGSRSTPVAGAAIAMAARKNKAKAQMIAAYMLEVHEDDLEFDVD\-\-\-\-\--RFRVKGNPEAHKTMGQIAWAAYNR\--VPPGMEPGLEAVSYYDPPNMTYPFGAYVCVMDIDVDTGTHKVRRFYALDDCGTRINPMIIE

\>E55\|C-E\|5
GGFGKKVGAYPGYICSAVASIVTGLPVKWVEDRIENLSTTSFARDYHMTTEIAATKEGRITALRVHILADHGAFDACADPSKWPAGFANIVTGSYDFPVAHLEVDGVYTNKAPGGVAYRCSFRVTEAAYAIERAMDIMAQKLGLDPVDFRIRNFIKREQFPYQSALGWEYDSGDYHTAMQKAVEATNYRALRDEQKAKQEAFKRGETRELMGIGVSFFTEIVGAGPSKNCDILGIAMFDSCEIRIHPTGKGIARMGTKSQGQGHETTWAQIIATEIGIPADDILVEEGNTDTAPYGLGTYGSRSTPVAGAAIAMAARKVKAKAQMIAAYMLEVHEDDLEWDVD\-\-\-\-\--RFRVKGNPESFKTMSQIAWAAYNK---IPPGMEPGLEAVSYYDPPNMTYPFGAYICVMDIDVDTGVHKVRRFYALDDCGTRINPMIIE...(cont)

This feature is handy if you are trying to quickly identify "who" is
representative of each OTUs and how various phyla are distributed across
your rank abundance curves. You can use this file to generate a
phylogenetic tree or upload it for a BLAST analysis.

Hypothesis-Testing Approaches
=============================

A variety of hypothesis testing approaches can be executed in mothur.
The results of many of the tests provide statistical support for the
uniqueness of the libraries that we observed above using OTU-based
approaches. The necessary commands and the results are below for the
coxL and 16S rRNA gene library analyses:

## coxL gene library analysis

### Parsimony

mothur \> read.tree(tree=CBE208coxL.ntree, group=CBE208coxL.groups)

mothur \> parsimony()

Tree\# Groups ParsScore ParsSig

1 B-C-E 28 \<0.001

mothur \> parsimony(groups=all)

Tree\# Groups ParsScore ParsSig

1 B-C 6 \<0.001

1 B-E 5 \<0.001

1 C-E 22 \<0.001

### Libshuff

mothur \> read.dist(phylip=CBE208coxL.dist, group=CBE208coxL.groups)

mothur \> libshuff()

Comparison dCXYScore Significance

B-C 0.26719325 \<0.0001

C-B 0.17538196 \<0.0001

B-E 0.56580147 0.0122

E-B 0.54210001 0.0122

C-E 0.56221837 0.0597

E-C 0.17980000 0.0479

These significance values indicate that Bare and Canopy communities are
significantly different because they are less than 0.008333333
(Bonferoni correction for multiple comparisons).

### Unifrac

#### unweighted

mothur \> read.tree(tree=CBE208coxL.ntree, group=CBE208coxL.groups)

mothur \> unifrac.unweighted()

Tree\# Groups UWScore UWSig

1 B-C-E 0.675553 \<0.0010

mothur \> unifrac.unweighted(groups=all)

Tree\# Groups UWScore UWSig

1 B-C 0.799225 \<0.0010

1 B-E 0.804905 \<0.0010

1 C-E 0.640192 \<0.0010

Significance values are less than critical value of 0.016667, indicating
that the communities are different.

#### weighted

mothur \> read.tree(tree=CBE208coxL.ntree, group=CBE208coxL.groups)

mothur \> unifrac.weighted()

Tree\# Groups WScore WSig

1 B-C 0.631924 \<0.0010

1 B-E 0.771710 \<0.0010

1 C-E 0.337741 \<0.0010

mothur \> unifrac.weighted(groups=all)

Tree\# Groups WScore WSig

1 B-C 0.631924 \<0.0010

1 B-E 0.771710 \<0.0010

1 C-E 0.337741 \<0.0010

Significance values are less than critical value of 0.016667, indicating
that the communities are different.

## 16S rRNA gene library analyses

### Parsimony

mothur \> read.tree(tree=CBE485-16Salign.ntree,
group=CBE485-16Salign.groups)

mothur \> parsimony()

Tree\# Groups ParsScore ParsSig

1 C-E-B 107.000000 \<0.0010

mothur \> parsimony(groups=all)

Tree\# Groups ParsScore ParsSig

1 C-E 81.000000 \<0.0010

1 C-B 24.000000 \<0.0010

1 E-B 25.000000 \<0.0010

### Libshuff

mothur \> read.dist(phylip=CBE485-16Salign.dist,
group=CBE485-16Salign.groups)

mothur \> libshuff()

Comparison dCXYScore Significance

B-C 0.03995477 \<0.0001

C-B 0.03258998 \<0.0001

B-E 0.04604553 \<0.0001

E-B 0.01888762 \<0.0001

C-E 0.00209321 \<0.0001

E-C 0.00171868 \<0.0001

### Unifrac

#### unweighted

mothur \> read.tree(tree=CBE485-16Salign.ntree,
group=CBE485-16Salign.groups)

mothur \> unifrac.unweighted()

Tree\# Groups UWScore UWSig

1 C-E-B 0.771911 \<0.0010

mothur \> unifrac.unweighted(groups=all)

Tree\# Groups UWScore UWSig

1 C-E 0.747396 \<0.0010

1 C-B 0.910512 \<0.0010

1 E-B 0.907287 \<0.0010

Significance values are less than critical value of 0.016667, indicating
that the communities are different.

#### weighted

mothur \> unifrac.weighted()

Tree\# Groups WScore WSig

1 C-E 0.373624 \<0.0010

1 C-B 0.539933 \<0.0010

1 E-B 0.603293 \<0.0010

mothur \> unifrac.weighted(groups=all)

Tree\# Groups WScore WSig

1 C-E 0.373624 \<0.0010

1 C-B 0.539933 \<0.0010

1 E-B 0.603293 \<0.0010

Significance values are less than critical value of 0.016667, indicating
that the communities are different.

Acknowledgement
===============

I wish to thank Gary M. King at Louisiana State University and an
NSF-Microbial Observatory Grant, which made possible the generation of
the data used in this tutorial.
