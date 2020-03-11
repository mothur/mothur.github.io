---
title: 'Findley ITS Database'
---
The [Segre Lab](https://www.genome.gov/10000354) at NHGRI has provided
the [ ITS database](Media:Findley_ITS_database.zip) used in
their [Findley et al. 2013 Nature
paper](https://www.ncbi.nlm.nih.gov/pubmed/23698366)

## README File

ITS1 classification dataset v1

There are two data files in this distribution. The MD5 checksums are:
MD5 (ITSdb.fasta) = e0e1e0c259da5268cbc8e95e5f9cf1bb MD5 (ITSdb.tax3) =
6a93fbc7332a3d61b985025929a355ee

ITSdb.fasta contains 23456 sequences of ITS1 sequences retrieved from
Genbank in 2012. ITSdb.tax3 contains 23456 taxonomic strings, one per
sequence. The strings are semicolon delimited:

Kingdom;Phylum;Class;Order;Family;Genus for example:
Fungi;Basidiomycota;Basidiomycota\_class\_incertae\_sedis;Malasseziales;Malasseziales\_family\_incertae\_sedis;Malassezia;

These classification data were developed for use with the classify.seqs
command in mothur (Schloss, P.D., et al., Introducing mothur:
Open-source, platform-independent, community-supported software for
describing and comparing microbial communities. Appl Environ Microbiol,
2009. 75(23):7537-41.).

For example:

classify.seqs(fasta=my.fasta,group=my.groups,template=ITSdb.fasta,
taxonomy=ITSdb.tax3, method=knn, search=blast, match=2, mismatch=-2,
gapopen=-2, gapextend=-1, numwanted=1)

Some of classification parameters (method=knn, search=blast,
numwanted=1) should not be changed. The ITS1 sequence data were
clustered at 95% identity using CD-HIT and may not work as expected for
other methods (e.g., wang) or values of \"numwanted\". See the Methods
and Supplemental Materials for Findley et al 2013 for details on how
these data were generated and used.
