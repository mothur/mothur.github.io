---
title: 'RDP reference files'
---
## Version 16

The [publicly released version
16](https://rdp.cme.msu.edu/misc/rel10info.jsp) of its training set in
February 2016 (we dropped the ball on version 15). We have modified the
files that they make available on SourceForge to be compatible with
mothur. To maintain a consistent 6 taxonomic levels we have removed the
various sub-classes, orders and families:

-   [ 16S rRNA reference
    (RDP)](Media:trainset16_022016.rdp.tgz): A collection of
    12,681 bacterial and 531 archaeal 16S rRNA gene sequences with an
    improved taxonomy compared to version 14.
-   [ 16S rRNA reference
    (PDS)](Media:trainset16_022016.pds.tgz): The RDP
    reference with 119 mitochondrial 16S rRNA gene sequences added as
    members of the Rickettsiales and four 18S rRNA gene sequences added
    as members of the Eukarya.

You should be aware of several things when using the RDP training set.
First, the taxonomies only go to the genus level; therefore, you will
only be able to classify your sequences to the genus level. You can
modify the training set to include species-level names and may be
successful in classifying to the species level. Second, many of these
sequences are very poor in quality. Low quality reads have a large
number of ambiguous base calls or are very short. Here is the output
from running summary.seqs on trainset16\_022016.rdp.fasta:

           Start   End NBases  Ambigs  Polymer NumSeqs
     Minimum:  1   320 320 0   4   1
     2.5%-tile:    1   1267    1267    0   5   331
     25%-tile: 1   1424    1424    0   5   3304
     Median:   1   1465    1465    0   5   6607
     75%-tile: 1   1494    1494    0   6   9910
     97.5%-tile:   1   1549    1549    10  7   12882
     Maximum:  1   2210    2210    130 68  13212
     Mean:     1   1445.52 1445.52 1.0632  5.56282

## Version 14

The [publicly released version
14](https://rdp.cme.msu.edu/misc/rel10info.jsp) of its training set in
May 2015 (no idea what happened to releases 11 through 13). We have
modified the files that they make available on SourceForge to be
compatible with mothur. To maintain a consistent 6 taxonomic levels we
have removed the various sub-classes, orders and families:

-   [ 16S rRNA reference (RDP)
    ](Media:trainset14_032015.rdp.tgz): A collection of
    10,244 bacterial and 435 archaeal 16S rRNA gene sequences with an
    improved taxonomy compared to version 10.
-   [ 16S rRNA reference
    (PDS)](Media:trainset14_032015.pds.tgz): The RDP
    reference with 119 mitochondrial 16S rRNA gene sequences added as
    members of the Rickettsiales and four 18S rRNA gene sequences added
    as members of the Eukarya.

You should be aware of several things when using the RDP training set.
First, the taxonomies only go to the genus level; therefore, you will
only be able to classify your sequences to the genus level. You can
modify the training set to include species-level names and may be
successful in classifying to the species level. Second, many of these
sequences are very poor in quality. Low quality reads have a large
number of ambiguous base calls or are very short. Here is the output
from running summary.seqs on trainset14\_052015.rdp.fasta:

                 Start End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   320 320 0   4   1
    2.5%-tile: 1   1047    1047    0   5   267
    25%-tile:  1   1426    1426    0   5   2670
    Median:    1   1468    1468    0   5   5340
    75%-tile:  1   1495    1495    1   6   8010
    97.5%-tile:    1   1550    1550    12  7   10413
    Maximum:   1   2210    2210    91  68  10679
    Mean:      1   1443.09 1443.09 1.25714 5.58404

## Version 10

The [publicly released version
10](https://rdp.cme.msu.edu/misc/rel10info.jsp) of its training set in
September 2014. We have modified the files that they make available on
[SourceForge](https://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/)
to be compatible with mothur. To maintain a consistent 6 taxonomic
levels we have removed the various sub-classes, orders and families:

-   [16S rRNA reference
    (RDP)](https://mothur.org/w/images/b/b5/Trainset10_082014.rdp.tgz): A
    collection of 10,240 bacterial and 410 archaeal 16S rRNA gene
    sequences with an improved taxonomy compared to version 9.
-   [16S rRNA reference
    (PDS)](https://mothur.org/w/images/2/24/Trainset10_082014.pds.tgz):
    The RDP reference with 119 mitochondrial 16S rRNA gene sequences
    added as members of the Rickettsiales and four 18S rRNA gene
    sequences added as members of the Eukarya.

You should be aware of several things when using the RDP training set.
First, the taxonomies only go to the genus level; therefore, you will
only be able to classify your sequences to the genus level. You can
modify the training set to include species-level names and may be
successful in classifying to the species level. Second, many of these
sequences are very poor in quality. Low quality reads have a large
number of ambiguous base calls or are very short. Here is the output
from running summary.seqs on trainset10\_082014.rdp.fasta:

                 Start End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   320 320 0   4   1
    25%-tile:  1   1426    1426    0   5   2663
    Median:        1   1468    1468    0   5   5326
    75%-tile:  1   1495    1495    1   6   7988
    97.5%-tile:    1   1550    1550    12  7   10384
    Maximum:   1   2210    2210    91  68  10650
    Mean:      1   1443.04 1443.04 1.25822 5.5846  

## Version 9

The [RDP publicly released version
9](https://rdp.cme.msu.edu/misc/rel10info.jsp#taxonomy) of its training
set in March 2012. We have modified the files that they make available
on
[SourceForge](https://sourceforge.net/projects/rdp-classifier/files/RDP_Classifier_TrainingData/)
to be compatible with mothur. To maintain a consistent 6 taxonomic
levels we have removed the various sub-classes, orders and families:

-   [ 16S rRNA reference
    (RDP)](Media:trainset9_032012.rdp.zip): A collection of
    9,665 bacterial and 384 archaeal 16S rRNA gene sequences with an
    improved taxonomy compared to version 7 (there was no v.8 as far as
    we are aware).
-   [ 16S rRNA reference
    (PDS)](Media:trainset9_032012.pds.zip): The RDP reference
    with 119 mitochondrial 16S rRNA gene sequences added as members of
    the Rickettsiales and four 18S rRNA gene sequences added as members
    of the Eukarya.

You should be aware of several things when using the RDP training set.
First, the taxonomies only go to the genus level; therefore, you will
only be able to classify your sequences to the genus level. You can
modify the training set to include species-level names and may be
successful in classifying to the species level. Second, many of these
sequences are very poor in quality. Low quality reads have a large
number of ambiguous base calls or are very short.

## Version 7

The RDP released version 7 of its training set in November 2011. In
separate files they provide the reference data for 16S (Bacteria and
Archaea) and 18S (fungi) rRNA gene sequences and taxonomy. We have
modified these files to be compatible with mothur. To maintain a
consistent 6 taxonomic levels we have removed the various sub-classes,
orders and families:

-   [ 16S rRNA reference
    (RDP)](Media:trainset7_112011.rdp.zip): A collection of
    9,662 bacterial and 384 archaeal 16S rRNA gene sequences with an
    improved taxonomy compared to version 6.
-   [ 16S rRNA reference
    (PDS)](Media:trainset7_112011.pds.zip): The RDP reference
    with three sequences reversed and 119 mitochondrial 16S rRNA gene
    sequences added as members of the Rickettsiales
-   [ 28S rRNA reference (RDP)](Media:FungiLSU_train_v7.zip):
    A collection of 8506 reference 28S rRNA gene sequences from the
    Fungi that were curated by the Kuske lab

You should be aware of several things when using the RDP training set.
First, the taxonomies only go to the genus level; therefore, you will
only be able to classify your sequences to the genus level. You can
modify the training set to include species-level names and may be
successful in classifying to the species level. Second, many of these
sequences are very poor in quality. Low quality reads have a large
number of ambiguous base calls or are very short. In the PDS version of
the training set we have reversed three sequences that were in the wrong
direction.

## Version 6

The [ RDP training set](Media:RDPTrainingSet.zip) (version 6,
released 03/02/2010) consists of 8,422 sequences (8,127 bacterial and
295 archaeal) and is based on Bergey\'s taxonomic outline. This training
set is our modification of the files that they posted to
[SourceForge](https://sourceforge.net/projects/rdp-classifier/). Their
archive provides a bunch of other files that mothur will calculate the
first time you use the training set. Our archive consists of two files -
a fasta-formatted sequence file and a mothur-compatible taxonomy file.
The only subtle manipulation we made was to remove the sub-taxonomic
levels (e.g. sub-order) and to plug in incertae\_sedis levels when a
step in the taxonomy was missing. Thus taxonomic level 6 corresponds to
the level of genus and level 1 corresponds to the level of kingdom.
