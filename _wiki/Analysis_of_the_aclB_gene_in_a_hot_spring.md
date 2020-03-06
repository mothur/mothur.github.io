---


title: 'Analysis of the aclB gene in a hot spring'
---
Although the majority of community analyses are done with 16S rRNA gene
sequences, it is possible to use mothur for any gene using nucleotide or
amino acid sequences. In this tutorial, we will use the mothur tools to
re-analyze ATP citrate lyase (*aclB*) gene sequences from Coffee Pots
Hot Spring originally published by [ Hall et.
al.](Media:Halletal_CoffeePotsSpring_AEM2008.pdf) and compare
the two approaches to analysis. In the original analysis, OTUs were
defined by PHRAP assembly, the identity of the sequences was determined
by phylogenetic analysis, and the *aclB* sequences from seven sites were
compared using the pairwise dissimilarity statistic (Fst) implemented in
[Arlequin](http://lgb.unige.ch/arlequin/). You can download all of the
files needed for this analysis ([aclB.zip](Media:aclB.zip))
or generate your own by following the instructions below.

NOTE: This tutorial was made with versions 1.1-1.4 of mothur and may be
out of date now. [ Justine Hall](User:kestrel), the original
author of this page, will not be updating it, but feel free to add or
modify commands yourself as mothur grows!

The sample names used in the paper and in this tutorial are different
(numbers in COF names are temperature in C):

-   COF\_39.3 = 257CP
-   COF\_51.4 = 258CP
-   COF\_51.9 = 259CP
-   COF\_57.7 = 260CP
-   COF\_61.7 = 261CP
-   COF\_65.7 = 3Y35
-   COF\_74.1 = 263CP


{% include toc.html %}

## Getting Started

I used [ARB](http://www.arb-home.de/) to align and edit my sequences and
to make distance matrices and trees. A good ARB tutorial is availalbe
[here](http://www.mm.helsinki.fi/users/GJURGENS/Arb/ARB_tutorial.htm)

### Translating Nucleotide Sequences

It is easy to translate nucleotide sequences to amino acid sequences in
ARB, but it must be done before aligning either set of sequences:

1.  Mark all of the sequences
2.  In the ARB\_NT window, Sequence → Perform Translation
3.  In the window that pops up, choose:
    -   Source Alignment = ali\_new
    -   Destination Alignment = ????? (ARB will make a new alignment
        database)
    -   How to select codon table and start position = use settings
        below (same for all species)
    -   Start Position = 1
    -   Codon Table = (1) Standard Code
    -   Check \"Translate all data\"
    -   Click Translate!
    -   In the window that pops up, choose \"Create\"

ARB won\'t translate the nucleotide sequences correctly if they are
aligned, so it is important to perform a translation first and then
align your nucleotide and amino acid sequences separately. To check your
translation, choose the \"ali\_new\_pro\" from the alignment box. Your
amino acid sequences should match the alignment published by [Campbell
et
al](http://aem.asm.org/cgi/content/abstract/69/9/5070?ijkey=549aeec65cf72e31e6eb07e6c6cbedffa2a154e0).

### Making an Alignment

Unfortunately there is not an automated way to generate an alignment for
the *aclB* sequences, so the sequences were hand-aligned. A good
alignment was obtained with about half of the sequences and then the
remaining sequences were aligned using the Fast Aligner in ARB:

1.  Mark and select all unaligned sequences and open the ARB\_EDIT
    window
2.  Go Edit → Integrated Aligners.
3.  In the window that pops up, choose:
    -   Aligner = Fast Aligner
    -   Align what? = Selected Species
    -   Reference = Species by name (input an aligned sequence name in
        box)
    -   Range = Whole sequence
    -   Hit Go!

Amino acid sequences can be aligned in the exact same way. It is always
a good idea to check the alignments by hand again after the automated
alignment.

### Making a Filter

A filter was made to mask out the "loose ends" of all the sequences in
order to compare only overlapping regions:

1.  In the ARB\_NT window, Go SAI → Create SAI Using\... → Filter by
    base frequency
2.  In the window that pops up, choose \"ali\_new\"
3.  Go Config → Column filter
4.  In the window that pops up, change the "start at column" to 864 and
    the "stop at column" to 1244
5.  Go Calculate → Column filter
6.  Go File → Export filter. Press \"Export\" to export the filter under
    the name \"aclB\_864\_1244\". Now press \"Close\". Press \"Quit\" in
    the window with the purple background

This filter masks out all of the positions outside of the input range,
which in this case, was only about 30 nucleotides. Any sequences that
did not have complete sequence data in this range were removed from
further analysis. This was repeated for the amino acid sequences (just
select your amino acid alignment when prompted), though the only regions
masked out were those present in other sequences used for making a tree.

### Making a Distance Matrix

Finally, a phylip-formatted distance matrix was made:

1.  In the ARB\_NT window, go Sequence → Compare sequences using
    Distance Matrix
2.  In the window that pops up, choose:
    -   Which species? = marked
    -   Alingment = ali\_new
    -   Filter = aclB\_864\_1244
3.  You may or may not want to select a \"Correction\", but for this
    example we will just look at the raw distance.
4.  Press the \"Calculate Full Matrix\" button
5.  Press the \"Save Matrix\" button
6.  In the window that opens change the file name from \"infile\" to
    \"aclB.dist\" and press \"Save\". If it gives you an error message
    that says, \"No valid tree given to sort matrix (using default
    database order)\" just ignore it.

You can make a distance matrix for the amino acid sequences by choosing
your amino acid alignment and filter instead.

### Making a Phylogenetic Tree

We will use a few representative sequences from the
*Epsilonproteobacteria* and *Aquificales* with the mouse gene as an
outgroup to make a tree, as was done in the original analysis. These
sequences were downloaded from [NCBI](http://www.ncbi.nlm.nih.gov/) in
fasta format, imported into ARB, and aligned using the same strategy
used above. A maximum likelihood tree was made:

1.  Mark all of the sequences to be used in the tree using the Search
    and Query window (\"Search\" button at the top of the ARB\_NT
    window). The NCBI sequences will be marked upon import. Our *aclB*
    genes can be marked by searching for them with the wildcard (\*).
    -   Enter \*p2\* in the search field with the \'name\' option
        selected.
    -   Hit Search. A list of sequence names will appear in the
        \'Hitlist\' box
    -   Go More Functions → Mark Listed Species, Don\'t Change Rest
    -   Repeat search for \*p3\*
2.  Go Tree → Build tree from sequence data → Maximum Likelihood methods
    → AxML + FastdnaML![Phylogenetic tree from the original
    paper](AclB_tree.jpg "fig:Phylogenetic tree from the original paper"){width="350"}
3.  In the window that pops up, choose:
    -   Species = Marked
    -   Alignment = ali\_atpcl
    -   Filter = aclB\_864\_1244
    -   Compression = vertical gaps
    -   Select Program to use = FastdnaML
    -   Use Quickadd = Yes
    -   Hit GO!
4.  Another window will pop up to indicate the calculation is running.

An amino acid-based maximum likelihood tree can be made by choosing
Phylip PROML instead of FastdnaML. I ran it with all of the default
options.

The nucleotide tree took \~ 12 hours to finish on my computer. When it
is done, it will be read in to the ARB tree menu with the prefix of
\"tree\_fml\_\". The tree should look similar to the one on the right
with a clade of *Epsilonproteobacteria* in the most basal position, an
*Aquificales* clade in a more derived position, and all of the *aclB* in
a large clade with the *Sulfurihydrogenibum* sequence.

OTU-based Approaches
====================

## How many OTUs are there?

The following commands will [load the distance
matrix](read.dist) and cluster the *aclB* sequences into OTUs
using the furthest neighbor algorithm (default). Repeat for the
aclB\_aa.dist file.

    mothur > read.dist(phylip=aclB.dist)
    mothur > cluster()

The [cluster](cluster) command generated three files:
aclB.sabund ([species abundance file](Sabund_file)),
aclB.rabund ([rank abundance file](Rabund_file)), and
aclB.list ([a list of sequences in each OTU](List_file)) for
the entire dataset. Here are the first two columns of the aclB.fn.list
and aclB\_aa.fn.list files, which show the distance level and number of
OTUs for the total dataset:

    Nucleotide Sequences                  Amino Acid Sequences
    unique     208                     unique      63
    0.00       148                     0.01            51
    0.01        44                     0.02            14
    0.02        25                     0.03            10
    0.03        15                     0.04             8
    0.04         8                     0.05             6
    0.05         5                     0.06             4
    0.06         3                     0.07             3
    0.07         1                     0.08             2
                                            0.11             1

In the original analysis, 11 unique OTUs were defined by PHRAP assembly
of the nucleotide sequences. Using mothur, we can see that this is
equivalent to nucleotide OTUs defined at a distance somewhere between
0.05 and 0.06 (approximately genus level). Other important observations
can be made from just this first step:

-   All of the nucleotide sequences are \> 93% similar and amino acid
    sequences \> 89% similar as only one OTU is formed at distances of
    0.07 and 0.11, respectively.
-   The number of input sequences is less than the number of unique
    sequences for both nucleotide and amino acid sequences, so many of
    the sequences must be identical (307 input vs. 208 unique for
    nucleotide sequences, 63 unique for amino acid sequences).
-   There are more nucleotide OTUs than amino acid OTUs at many distance
    level, which indicates some differences in the nucleotide sequences
    do not translate into differences in the protein sequences
    (synonymous changes).
-   There is agreement between this data and the range of percentage
    similarity for the amino acid sequences (88.3 -- 100%) reported in
    the original paper.

Next, we can identify the OTUs present in each sample by reading the
.list files into memory and indicating which sequences belong to each
sample with the .groups files.

    mothur > read.otu(list=aclB.fn.list, group=aclB.groups)

The individual .rabund files (e.g. aclB.fn.257CP.rabund) and .shared
file will be needed later to make rarefaction curves and heatmaps.

## Were all of the OTUs recovered from the hot spring?

Rarefaction curves are a good way to visualize the extent to which the
richness of the environment was represented in the sample. Mothur can
rarefy both individual samples and a total dataset with the
[rarefaction.single](rarefaction.single) command. Let's look
at both, starting with the individual samples:

    mothur > read.otu(rabund=aclB.fn.263CP.rabund)
    mothur > rarefaction.single(freq=10)

The [read.otu](read.otu) command reads each separate OTU file
into memory, so this must be repeated for all seven .rabund files for
both nucleotide and amino acid sequences. Adding the *freq* option to
the rarefaction command outputs more lines of data and allows us to make
a smoother curve, a good option when you are working with less than 100
sequences.

![Individual rarefaction curves for A) nucleotide and B) amino acid OTUs
a distance of
0.02.](AclBrarefaction.jpg "Individual rarefaction curves for A) nucleotide and B) amino acid OTUs a distance of 0.02."){width="600"}

From the graphical representation of the mothur file, we can see that
three samples have reached asymptotic saturation - 260CP for nucleotide
sequences and 261CP & 263CP for amino acid sequences - and are a
reasonable estimate of diversity found in the environment. The remaining
samples have varying degrees of saturation from nearing an asympotote
(260CP amino acid curve) to nearly linear (both 257CP curves). Since
these do not represent the diversity seen in nature, the remaining
analyses we perform with them should be interpreted with caution.

All of the sequences can be rarefied using the same commands with the
combined .list file (repeat for amino acid file):

    mothur > read.otu(list=aclB.fn.list)
    mothur > rarefaction.single(freq=10)

![Rarefaction curve for all of the sequences obtained from Coffee Pots
hot spring for a distance of
0.02.](AclBrarefaction2.jpg "Rarefaction curve for all of the sequences obtained from Coffee Pots hot spring for a distance of 0.02."){width="299"}

The amino acid curve is closer to reaching an asymptote than the
nucleotide curve, but there are likely more *aclB* nucleotide and amino
acid sequences in Coffee Pots hot spring that were not retrieved.

## How are the OTUs distributed in the hot spring?

In the original analysis, the authors noted, \"the distribution of
phylotypes among samples was widespread, except for phylotype G6, which
was found only in sample COF\_51.9 (259CP here)\", but no formal
description of OTU distributional patterns was made. With mothur, we can
graphically represent the OTU distribution with a heatmap and compare
samples with venn diagrams.

### Heatmaps

The following commands will produce a
[heatmap.bin](heatmap.bin) (.svg file) for every distance
(repeat with amino acid files):

    mothur > read.otu(list=aclB.fn.list, group=aclB.groups)
    mothur > heatmap.bin(scale=linear)

![Heatmaps for A) nucleotide sequences and B) amino acid sequences for a
distance of 0.02 (no scaling
transformation)](AclB.fn.0.02.heatmap.jpg "Heatmaps for A) nucleotide sequences and B) amino acid sequences for a distance of 0.02 (no scaling transformation)"){width="350"}

We can make a couple observations from this representation:

-   All of the samples, even those with very few sequences, share a set
    of both nucleotide and amino acid OTUs and they are some of the most
    abundant OTUs in each sample. This might represent a core population
    of ATP citrate lyase enzymes that are the best-adapted with other,
    possibly deleterious, forms represented at a lower abundance
    throughout the spring.
-   Each sample has fewer amino acid OTUs than nucleotide OTUs, again
    underscoring the fact that some of the sequence diversity represents
    synonymous changes.

### Venn Diagrams

It is also possible to make comparisons of community composition for 2-3
samples using a [Venn diagram](venn). For this tutorial, we
will compare the samples that reached a plateau in the rarefaction
curves (260CP, 261CP, 263CP). I had to make a new distance matrix and
.groups file with only the samples I wanted to analyze for the venn
command to work:

    mothur > read.dist(phylip=aclB_venn.dist)
    mothur > cluster()
    mothur > read.otu(list=aclB_venn.fn.list, group=aclB_venn.groups)
    mothur > venn()

![Venn Diagram for A) nucleotide and B) amino acid sequences for a
distance of 0.02 (not to
scale)](AclB_venn.fn.0.02.venn.sharedsobs.jpg "Venn Diagram for A) nucleotide and B) amino acid sequences for a distance of 0.02 (not to scale)"){width="350"}

Here we can see, like in the heatmap, there is quite a bit of overlap
between samples in both nucleotide and amino acid sequences - 260CP and
263CP don\'t have any unique OTUs and 261CP has only 3 unique nucleotide
OTUs and 2 unique amino acid OTUs.

Hypothesis-Testing Approaches
=============================

Originally, community differences were analyzed using the pairwise
dissimilarity index (Fst) in [Arlequin](http://lgb.unige.ch/arlequin/).
The Fst index calculates the distribution of genetic variation between
two samples and can take any value between 0 and 1. A 0 indicates the
genetic variation between samples is equal to the genetic variation
within samples (in other words, no difference between samples) and 1
indicates all genetic variation is between samples (in other words,
completely different communities). As the table below shows, most
pairwise comparisons had low, but significant, Fst values (0.18 - 0.23)
and the comparisons made with COF\_61.7 (261CP) and COF65.7 (3Y35) had
high, significant Fst values (0.34 - 0.60).

![Results from the pairwise comparison done in the original paper using
Arlequin](Fst_table.jpg "Results from the pairwise comparison done in the original paper using Arlequin"){width="500"}

In mothur, we can make global and pairwise comparisons based on distance
([libshuff](libshuff)) and phylogeny-associated information
([parsimony](parsimony) method,
[unweighted](unifrac.unweighted), and [weighted unifrac
metric](unifrac.weighted)) .

## Libshuff

The following commands will execute the integral form (default) of
libshuff (repeat with amino acid files):

    mothur > read.dist(phylip=aclB.dist, group=aclB.groups)
    mothur > libshuff()

This will ouput two files - .libshuff.coverage and .libshuff.summary.
The .summary file is also output to the screen and contains the test
statistic and significance of each comparison (truncated here):

          Nucelotide Sequences                                  Amino Acid Sequences
    Comparison          dCXYScore   Significance         Comparison          dCXYScore  Significance
    257CP-258CP         0.00168611  0.7948               257CP-258CP         0.00436709  0.2405
    258CP-257CP         0.04406525  0.0932               258CP-257CP         0.0315775   0.0871
    257CP-3Y35          0.00404702  0.0125               257CP-3Y35          0.0001517   0.6729
    258CP-259CP         0.01708675  0.3331               258CP-259CP         0.01670475  0.6678
    259CP-258CP         0.028777    1                    259CP-258CP         0.009709    1
    258CP-260CP         0.046763    0.0177               258CP-260CP         0.03398125  0.003
    ....................                                 ....................
    3Y35-261CP          0.00232016  0.0613               3Y35-261CP          0.00082524  <0.0001
    263CP-3Y35          0.00089925  0.9464               263CP-3Y35          0.009615    0.4072
    3Y35-263CP          0.01349869  0.0345               3Y35-263CP          0.00082524  0.6263 

Since we need to apply the Bonferroni correction for multiple
comparisons, we will consider a comparison significant if has a
significance score \<0.0012 (experiment-wide false detection rate of
0.05 divided by 42 comparisons). None of these comparisons have
significant corrected p-values.

## Parsimony Test

The [parsimony](parsimony) method (P-test) tests whether two
communities have the same structure based on the number of changes
require dto explain the distribution of sequences from each sample in a
single phylogenetic tree. The [ *iters*](parsimony) option
increases the number of randomizations performed and increases the
accuracy of the p-value (though the parsimony score is the same
regardless of the number of iterations). As always, repeat for the amino
acid tree:

    mothur > read.tree(tree=aclB.tree, group=aclB.groups)
    mothur > parsimony(iters=10000)

This will output a parsimony score and p-value to the screen (also in
the .psummary file):

    Nucleotide Sequences:
           Tree#   Groups                                       ParsScore  ParsSig
           1   257CP-258CP-259CP-260CP-261CP-263CP-3Y35    180 0.0229
    Amino Acid Sequences:
           Tree#   Groups                                        ParsScore ParsSig
           1   257CP-258CP-259CP-260CP-261CP-263CP-3Y35    181 0.0381 

This global test indicates that at least one group in both of the trees
has a significantly different structure from the other groups (at a
significance threshold of 0.05). Since both of these tests are
significant, we can proceed to perform pairwise comparisons on both
trees using the same command with the *groups* option:

    mothur > parsimony(groups=all, iters=10000)

This outputs another .psummary file (Note: I had to rename the.psummary
files that were previously generated or else this command just overwrote
it):

            Nucleotide Tree                                     Amino Acid Tree
    Tree#  Groups      ParsScore   ParsSig             Tree# Groups      ParsScore ParsSig
    1  257CP-258CP 7   0.0569              1     257CP-258CP     8  0.3518
    1  257CP-259CP 8   0.5204              1     257CP-259CP     7  0.1543
    1  257CP-260CP 8   0.2718              1     257CP-260CP     8  0.2765
    1  257CP-261CP 8   0.295               1     257CP-261CP     8  0.3038
    1  257CP-263CP 8   0.3785              1     257CP-263CP     9  1
    1  257CP-3Y35  8   0.8587              1     257CP-3Y35      6  0.2048
    1  258CP-259CP 26  0.3992              1     258CP-259CP    24      0.113
    1  258CP-260CP 33  0.0006              1     258CP-260CP    39  0.0963
    1  258CP-261CP 32  0.0016              1     258CP-261CP    35  0.0212
    1  258CP-263CP 29  0.006               1     258CP-263CP    31  0.0416
    1  258CP-3Y35  12  0.2708              1     258CP-3Y35     12  0.2678
    1  259CP-260CP 31  0.9609              1     259CP-260CP    28  0.4962
    1  259CP-261CP 25  0.1259              1     259CP-261CP    28  0.6155
    1  259CP-263CP 22  0.0474              1     259CP-263CP    26  0.536
    1  259CP-3Y35  13  0.862               1     259CP-3Y35     12  0.5504
    1  260CP-261CP 46  0.3758              1     260CP-261CP    44  0.1814
    1  260CP-263CP 43  0.9174              1     260CP-263CP    43  0.9189
    1  260CP-3Y35  12  0.1885              1     260CP-3Y35     12  0.1751
    1  261CP-263CP 41  0.872               1     261CP-263CP    37  0.3666
    1  261CP-3Y35  13  0.6019              1     261CP-3Y35     12  0.2131
    1  263CP-3Y35  13  0.7075              1     263CP-3Y35     12  0.3219

After applying the Bonferroni correction (experiment-wide false
detection rate of 0.05 divided by 21 comparisons = corrected p-value of
0.0024), there are two significant pairwise comparisons for the
nucleotide tree (258CP-260CP and 258CP-261CP) and none for the amino
acid tree.

## UniFrac

### Unweighted UniFrac

The [UniFrac metric](unifrac.unweighted) uses the amount of
unique branch length that can be ascribed to each community as a
distance measure and can be used to test whether communities differ
significantly with the following command, again with a higher number of
iterations:

    mothur > read.tree(tree=aclB.tree, group=aclB.groups)
    mothur > unifrac.unweighted(iters=10000)

The screen and file output is similar to the output for the P-test:

    Nucleotide Tree:
           Tree#   Groups                                          UWScore         UWSig
           1   257CP-258CP-259CP-260CP-261CP-263CP-3Y35    0.415773    0.0357 
    Amino Acid Tree:
           Tree#   Groups                                          UWScore         UWSig
           1   257CP-258CP-259CP-260CP-261CP-263CP-3Y35    0.588883    0.2769

The nucleotide-based test indicates at least one group is significantly
different from the others and we can proceed to the pairwise
comparisons. The amino acid-based test is not significant, which is not
surprising as all of the previous analyses have indicated the
communities are more similar on the amino acid level.

              Nucleotide Tree 
    Tree#  Groups          UWScore         UWSig
    1  257CP-258CP 0.437247    0.1908
    1  257CP-259CP 0.327507    0.8654
    1  257CP-260CP 0.387963    0.5879
    1  257CP-261CP 0.378014    0.7214
    1  257CP-263CP 0.350265    0.7518
    1  257CP-3Y35  0.231719    0.8162
    1  258CP-259CP 0.420404    0.1234
    1  258CP-260CP 0.4629        <0.00010
    1  258CP-261CP 0.48742       <0.00010
    1  258CP-263CP 0.401742    0.0122
    1  258CP-3Y35  0.427424    0.1764
    1  259CP-260CP 0.349473    0.6402
    1  259CP-261CP 0.36835         0.4952
    1  259CP-263CP 0.344038    0.5617
    1  259CP-3Y35  0.366215    0.7326
    1  260CP-261CP 0.336167      <0.00010
    1  260CP-263CP 0.277011    0.626
    1  260CP-3Y35  0.385586    0.5563
    1  261CP-263CP 0.325746    0.3023
    1  261CP-3Y35  0.386146    0.6026
    1  263CP-3Y35  0.312903    0.8308

After Bonferroni correction, 258CP-260CP, 258CP-261CP, and 260CP-261CP
are significant.

### Weighted UniFrac

The [weighted Unifrac](unifrac.weighted) metric is similar to
the unweighted, except it takes the abundance of sequences into account
and weights the branch length accordingly. Execute the unifrac.weighted
command (repeat for amino acid tree):

    mothur > read.tree(tree=aclB.tree, group=aclB.groups)
    mothur > unifrac.weighted(iters=10000)

The following output is in the .wsummary file:

          Nucelotide Tree                                        Amino Acid Tree
    Tree#  Groups          WScore    WSig                Tree# Groups   WScore   WSig
    1  257CP-258CP 0.04499   0.6041              1     257CP-258CP  0.015071 0.5916
    1  257CP-259CP 0.05143   0.3898              1     257CP-259CP  0.018941 0.836
    1  257CP-260CP 0.037551  0.7                 1     257CP-260CP  0.012156 0.5276
    1  257CP-261CP 0.038261  0.6685              1     257CP-261CP  0.015509 0.3164
    1  257CP-263CP 0.043487  0.5142              1     257CP-263CP  0.014489 0.0641
    1  257CP-3Y35  0.046472  0.7063              1     257CP-3Y35   0.014502 0.8643
    1  258CP-259CP 0.031981  0.5714              1     258CP-259CP  0.019491 0.0678
    1  258CP-260CP 0.037285  0.0389              1     258CP-260CP  0.01181  0.1001
    1  258CP-261CP 0.045175  0.0044              1     258CP-261CP  0.014043 0.0325
    1  258CP-263CP 0.045247  0.009               1     258CP-263CP  0.010643 0.1555
    1  258CP-3Y35  0.038226  0.7181              1     258CP-3Y35   0.01609  0.3679
    1  259CP-260CP 0.03075   0.3621              1     259CP-260CP  0.014382 0.31
    1  259CP-261CP 0.040222  0.0469              1     259CP-261CP  0.017795 0.1413
    1  259CP-263CP 0.044766  0.0265              1     259CP-263CP  0.015537 0.117
    1  259CP-3Y35  0.037576  0.8265              1     259CP-3Y35   0.020867 0.7336
    1  260CP-261CP 0.020545  0.6925              1     260CP-261CP  0.009803 0.3616
    1  260CP-263CP 0.027441  0.256               1     260CP-263CP  0.007813 0.3975
    1  260CP-3Y35  0.042687  0.2694              1     260CP-3Y35   0.012929 0.3343
    1  261CP-263CP 0.02105   0.8093              1     261CP-263CP  0.008512 0.7995
    1  261CP-3Y35  0.049985  0.0668              1     261CP-3Y35   0.014564 0.2868
    1  263CP-3Y35  0.050252  0.0897              1     263CP-3Y35   0.015081 0.0258

None of these comparisons have significant Bonferroni corrected
p-values.

More protein coding gene examples
=================================

[Genetic Diversity and Abundance of Flavobacterial Proteorhodopsin in
China
Seas](http://www.ncbi.nlm.nih.gov/sites/entrez?db=pubmed&cmd=search&term=Genetic%20Diversity%20and%20Abundance%20of%20Flavobacterial%20Proteorhodopsin%20in%20China%20Seas)
