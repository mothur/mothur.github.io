---
title: 'Finding%2FExtracting sequences and manipulating sequence names for analysis'
---
This tutorial is intended to save some headaches while preparing
sequences for analysis and generating name/group files quickly. This
tutorial might help you out with your own sequences, but it is directed
towards pulling sequences from a public database. There is probably an
even quicker way to do this, but this method has served me well and can
handle a large amount of sequences with many different groups. We will
look at sequences from [Community genomics among stratified microbial
assemblages in the ocean\'s
interior](https://www.ncbi.nlm.nih.gov/pubmed/16439655) published in
Science 2006. I will walk you through extracting the sequences from
genbank, manipulating the sequence names for convenience, and generating
a group file based on where in the water column the sequences came from.

## Getting Started

I want to immediately expose you to my biases: Mac, Microsoft Excel, and
the NCBI GenBank Database\....most of this will work on a PC, other
spreadsheet programs, and any other sequence database that supports
export in \"fasta\" format.

Finding additional sequences you would like to add to your analysis can
generally happen two ways: advanced search queries in sequences
databases such as genbank, or you find an interesting research article
with accession numbers that link the submitted sequences.

## Obtaining/Extracting Sequences

Since I am interested in the 16s rRNA gene from bacteria in ocean
environments\....a good place to start your query would be to go to the
[NCBI](https://www.ncbi.nlm.nih.gov/) nucleotide database and type:

**`16s`` ``AND`` ``ocean`` ``NOT`` ``Genome`**

Note: AND/OR/NOT are Boolean operators and must be capitalized to take
effect. I specified \"NOT Genome\" because I only want the 16s genes
(but 16s genes are included in genome sequences) You are going to get a
lot of hits, so you can get much more specific with your searches. When
you find an interesting sequence, if a publication is provided you can
search it for all of the accession numbers. If not, try searching the
specific isolation source of the sequence.

I already know the accession numbers I need, so I can pull them up by
typing:

**`DQ300508:DQ300926[ACCN]`**

Note: **\"\[ACCN\]\"** specifies you are searching for the accession
numbers in the range **\":\"** of numbers provided.

I am only interested in the bacterial sequences found in the range of
these accession numbers, so I can click the \"bacteria\" tab, and then
click the thumbtack next to it, or type:

**`DQ300508:DQ300926[ACCN]`` ``AND`` ``"bacteria"[Filter]`**

Now we can export the sequences to our computer. Choose Display
\"FASTA\" and Send To \"File\"

![](https://mothur.s3.us-east-2.amazonaws.com/wiki/ncbipic.png)

The default file name will be \"sequences.fasta\". It might be useful to
name it something more informative.

## Manipulating Sequence Names

Now we have all of the bacterial sequences from this study, but the
FASTA format gives more information than is convenient for this
analysis.

My preference is to have the name of the sequence be the accession
number, followed by a name given to the sequence by someone who
submitted it.

Here is what comes in the FASTA file for the description of the first
sequence:

**`>gi|83284661|gb|DQ300926.1|`` ``Uncultured`` ``bacterium`` ``clone`` ``HF4000_E12_P1`` ``16S`` ``ribosomal`` ``RNA`` ``gene,`` ``partial`` ``sequence`**

Here is what we will change it to:

**`>DQ300926_HF4000_E12_P1`**

Easy enough for one, but we have 351 more to go\.....

Import the fasta file into a spreadsheet program, using **spaces** and
**\|** (not the letter I but the symbol \|) as delimiters. This is going
to separate the words and names associated with the sequences for easy
changes.

The numbers and letters should be separated as such:

![`Examplspdsht.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/examplspdsht.png)

With some deleting, and some \"find and replace\" magic, you get your
modified sequence names.

I\'m sure you can figure out how to delete, and the \"find and replace\"
is pretty self explanatory:

![`findrplc3.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/findrplc3.png)

![`findrplc2.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/findrplc2.png)

When you are finished, and your sequence names look how you want them,
save the file as a \".txt\" file but change the \".txt\" to \".fasta\".
**Do not close out of the spreadsheet program just yet**.

You will have to open the file using a text editing program and use find
and replace to remove any tab spaces (this can be different with various
text editing programs, try to copy/paste the tab space, and replace it
with nothing)

If you are interested in submitting the file to an alignment program
other than *Mothur* It may also require you to get rid of spaces between
the sequences:

![`findblue.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/findblue.png)

(highlight and copy the blue area into the find search, and replace with
\"\>\")

## Generating the name/group file for your sequence

The research group that submitted these sequences conveniently named the
sequences, in part, based on the depth witch they were isolated from.

Example:

    DQ300926_HF`**`4000`**`_E12_P1

The **4000** in the name refers to 4000 meter depth from which the water
sample came from. You can and should confirm this in the paper and the
GenBank summary page under \"isolation source\".

Now go back to the spreadsheet with your modified sequence names and
copy these two columns into a blank sheet:

![`2columns.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/2columns.png)

Highlight both of the columns and sort the data based on the second
column. This may not put them in exact order, but it will group all the
sequences with similar depths together like such:

![`sorted.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/sorted.png)

Now in a third column, just to the right of the names, type the depth of
the corresponding name and drag (or copy) that depth for all the
appropriate sequences. Repeat until every name has the appropriate depth
next to it and it looks something like this:

![`nowwnames.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/nowwnames.png)

Label them as you wish, just **NO SPACES!** You might be able to tell by
my bold font that it has caused me troubles in the past\...\...

Save the sheet as a \".txt\" file but this time change it to \".group\".

Open the file one more time and find an replace to remove the tab
between the accession number and the name:

![`undrscrtab.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/undrscrtab.png)

So it looks like this:

![`finalgrp.png`](https://mothur.s3.us-east-2.amazonaws.com/wiki/finalgrp.png)

Now you have a .group file with 352 sequence names in 7 different
groups. You can append this file with more sequence names and groupings
as they come along.

## General Community Similarity Based On OTU Presence

We can now take these grouped sequences and perform OTU analysis to see
the similarity between different isolation depths.
