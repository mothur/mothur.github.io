---
title: 'Silva reference files'
redirect_from: '/wiki/Silva_reference_files'
---
If you use the SILVA reference files you should be aware of their
[dual-use license](https://www.arb-silva.de/silva-license-information) that covers Release 132 and earlier.

## Release 138.2

The SILVA alignment is 50,000 columns long so that it can be compatible
with 18S rRNA sequences as well as archaeal 16S rRNA sequences. In our
published opinion, this is the best reference alignment out there - far
superior to the greengenes or RDP alignments. It's unclear why this
version of the release is smaller than previous releases. We have
prepared a [README
document](/blog/2024/SILVA-v138_2-reference-files)
where you can read about the process that we used to generate these
references. This is also the first SILVA release that is available under
the CC-BY license opening the data up to commercial use

-   [ Full-length sequences and taxonomy references
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v138_2.tgz) (145520 bacteria, 3744
    archaea, and 15032 eukarya sequences). This reference could be
    customized for alignments, but could also be used for
    classification. The uncompressed version is \~7.7 GB and the
    compressed version is 270 MB.
-   [ recreated seed database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v138_2.tgz)
    (6727 bacteria, 133 archaea, and 1847 eukarya sequences). The actual
    reference alignment that SILVA uses with their SINA aligner is
    called the SEED alignment. We don't know what this actually is. We
    have tried to duplicate it by identifying the unique sequences in
    the SSURef database that have a 100% quality score to the SEED
    alignment (field 'align\_ident\_slv' in the arb database) and that
    go from the end of the traditional 8f/27f primer to the beginning of
    the traditional 1492r primer. We are providing a composite dataset
    for bacterial, archaeal, and eukaryotic sequences. The uncompressed
    version is 416 MB and the compressed version is 15 MB.
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181
    sequences)


## Release 138.1

The SILVA alignment is 50,000 columns long so that it can be compatible
with 18S rRNA sequences as well as archaeal 16S rRNA sequences. In our
published opinion, this is the best reference alignment out there - far
superior to the greengenes or RDP alignments. It's unclear why this
version of the release is smaller than previous releases. **We have noticed some weird results using this version of the SEED alignment relative to previous versions of the alignment. This is most likely because it is smaller than previous versions. The Schloss group is sticking with the v132 version of the SEED database for alignments.** We have
prepared a [README
document](/blog/2021/SILVA-v138_1-reference-files)
where you can read about the process that we used to generate these
references. This is also the first SILVA release that is available under
the CC-BY license opening the data up to commercial use

-   [ Full-length sequences and taxonomy references
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v138_1.tgz) (128884 bacteria, 2846
    archaea, and 14871 eukarya sequences). This reference could be
    customized for alignments, but could also be used for
    classification. The uncompressed version is \~6.8 GB and the
    compressed version is 241 MB.
-   [ recreated seed database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v138_1.tgz)
    (5736 bacteria, 81 archaea, and 1824 eukarya sequences). The actual
    reference alignment that SILVA uses with their SINA aligner is
    called the SEED alignment. We don't know what this actually is. We
    have tried to duplicate it by identifying the unique sequences in
    the SSURef database that have a 100% quality score to the SEED
    alignment (field 'align\_ident\_slv' in the arb database) and that
    go from the end of the traditional 8f/27f primer to the beginning of
    the traditional 1492r primer. We are providing a composite dataset
    for bacterial, archaeal, and eukaryotic sequences. The uncompressed
    version is 365 MB and the compressed version is 13 MB.
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181
    sequences)


## Release 138

The SILVA alignment is 50,000 columns long so that it can be compatible
with 18S rRNA sequences as well as archaeal 16S rRNA sequences. In our
published opinion, this is the best reference alignment out there - far
superior to the greengenes or RDP alignments. It's unclear why this
version of the release is smaller than previous releases. **We have noticed some weird results using this version of the SEED alignment relative to previous versions of the alignment. This is most likely because it is smaller than previous versions. The Schloss group is sticking with the v132 version of the SEED database for alignments.** We have
prepared a [README
document](/blog/2020/SILVA-v138-reference-files)
where you can read about the process that we used to generate these
references. This is also the first SILVA release that is available under
the CC-BY license opening the data up to commercial use

-   [ Full-length sequences and taxonomy references
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v138.tgz) (129063 bacteria, 2846
    archaea, and 14887 eukarya sequences). This reference could be
    customized for alignments, but could also be used for
    classification. The uncompressed version is \~6.9 GB and the
    compressed version is 241 MB.
-   [ recreated seed database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v138.tgz)
    (5741 bacteria, 81 archaea, and 1834 eukarya sequences). The actual
    reference alignment that SILVA uses with their SINA aligner is
    called the SEED alignment. We don't know what this actually is. We
    have tried to duplicate it by identifying the unique sequences in
    the SSURef database that have a 100% quality score to the SEED
    alignment (field 'align\_ident\_slv' in the arb database) and that
    go from the end of the traditional 8f/27f primer to the beginning of
    the traditional 1492r primer. We are providing a composite dataset
    for bacterial, archaeal, and eukaryotic sequences. The uncompressed
    version is 366 MB and the compressed version is 13 MB.
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181
    sequences)

## Release 132

The SILVA alignment is 50,000 columns long so that it can be compatible
with 18S rRNA sequences as well as archaeal 16S rRNA sequences. In our
published opinion, this is the best reference alignment out there - far
superior to the greengenes alignment. In a shift from our previous
version of the SILVA references, we are providing the SEED database, the
full-length sequences available from the NR SILVA database, and a SILVA
aligned version of the gold database that is used for reference-based
chimera detection. We have prepared a [README
document](/blog/2018/SILVA-v132-reference-files)
where you can read about the process that we used to generate these
references.

-   [ Full-length sequences and taxonomy references
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v132.tgz) (188247 bacteria, 4626
    archaea, and 20246 eukarya sequences). This reference could be
    customized for alignments, but could also be used for
    classification. The uncompressed version is \~9.9 GB and the
    compressed version is 348 MB.
-   [ recreated seed database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v132.tgz)
    (8517 bacteria, 147 archaea, and 2516 eukarya sequences). The actual
    reference alignment that SILVA uses with their SINA aligner is
    called the SEED alignment. We don't know what this actually is. We
    have tried to duplicate it by identifying the unique sequences in
    the SSURef database (v123) that have a 100% quality score to the
    SEED alignment (field 'align\_ident\_slv' in the arb database) and
    that go from the end of the traditional 8f/27f primer to the
    beginning of the traditional 1492r primer. We are providing a
    composite dataset for bacterial, archaeal, and eukaryotic sequences.
    The uncompressed version is 534 MB and the compressed version is 19
    MB.
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181
    sequences)

## Release 128

The SILVA alignment is 50,000 columns long so that it can be compatible
with 18S rRNA sequences as well as archaeal 16S rRNA sequences. In our
published opinion, this is the best reference alignment out there - far
superior to the greengenes alignment. In a shift from our previous
version of the SILVA references, we are providing the SEED database, the
full-length sequences available from the NR SILVA database, and a SILVA
aligned version of the gold database that is used for reference-based
chimera detection. We have prepared a [README
document](/blog/2017/SILVA-v128-reference-files)
where you can read about the process that we used to generate these
references.

-   [ Full length sequences and taxonomy references
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v128.tgz) (168111 bacteria, 4337
    archaea, and 18213 eukarya sequences). This reference could be
    customized for alignments, but could also be used for
    classification. The uncompressed version is \~8.9 GB and the
    compressed version is 311 MB.
-   [ recreated seed database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v128.tgz)
    (8512 bacteria, 147 archaea, and 2554 eukarya sequences). The actual
    reference alignment that SILVA uses with their SINA aligner is
    called the SEED alignment. We don't know what this actually is. We
    have tried to duplicate it by identifying the unique sequences in
    the SSURef database (v123) that have a 100% quality score to the
    SEED alignment (field 'align\_ident\_slv' in the arb database) and
    that go from the end of the traditional 8f/27f primer to the
    beginning of the traditional 1492r primer. We are providing a
    composite dataset for bacterial, archaeal, and eukaryotic sequences.
    The uncompressed version is 536 MB and the compressed version is 19
    MB.
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181
    sequences)

## Release 123

The SILVA alignment is 50,000 columns long so that it can be compatible
with 18S rRNA sequences as well as archaeal 16S rRNA sequences. In our
published opinion, this is the best reference alignment out there - far
superior to the greengenes alignment. In a shift from our previous
version of the SILVA references, we are now providing the SEED database,
the full-length sequences available from the NR SILVA database, and a
SILVA aligned version of the gold database that is used for
reference-based chimera detection. We have prepared a [README
document](/blog/2015/SILVA-v123-reference-files)
where you can read about the process that we used to generate these
references.

-   [ Full length sequences and taxonomy references
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v123.tgz) (152308 bacteria, 3901
    archaea, and 16209 eukarya sequences). This reference could be
    customized for alignments, but could also be used for
    classification. The uncompressed version is \~7.2 GB and the
    compressed version is 249 MB.
-   [ recreated seed database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v123.tgz)
    (12083 bacteria, 294 archaea, and 2537 eukarya sequences). The
    actual reference alignment that SILVA uses with their SINA aligner
    is called the SEED alignment. We don't know what this actually is.
    We have tried to duplicate it by identifying the unique sequences in
    the SSURef database (v123) that have a 100% quality score to the
    SEED alignment (field 'align\_ident\_slv' in the arb database) and
    that go from the end of the traditional 8f/27f primer to the
    beginning of the traditional 1492r primer. We are providing a
    composite dataset for bacterial, archaeal, and eukaryotic sequences.
    The uncompressed version is \~700 MB and the compressed version is
    25 MB.
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181
    sequences)

## Release 119

The SILVA alignment is 50,000 columns long so that it can be compatible
with 18S rRNA sequences as well as archaeal 16S rRNA sequences. In our
published opinion, this is the best reference alignment out there - far
superior to the greengenes alignment. In a shift from our previous
version of the SILVA references, we are now providing the SEED database,
the full-length sequences available from the NR SILVA database, and a
SILVA aligned version of the gold database that is used for
reference-based chimera detection. We have prepared a [README
document](/blog/2014/SILVA-v119-reference-files)
where you can read about the process that we used to generate these
references.

-   [Full length sequences and taxonomy
    references](https://mothur.org/w/images/2/27/Silva.nr_v119.tgz)
    (137879 bacteria, 3155 archaea, and 12273 eukarya sequences). This
    reference could be customized for alignments, but could also be used
    for classification. The uncompressed version is \~7.2 GB and the
    compressed version is 249 MB.
-   [Recreated SEED
    database](https://mothur.org/w/images/5/56/Silva.seed_v119.tgz)
    (12244 bacteria, 207 archaea, and 2558 eukarya sequences). The
    actual reference alignment that SILVA uses with their SINA aligner
    is called the SEED alignment. We don't know what this actually is.
    We have tried to duplicate it by identifying the unique sequences in
    the SSURef database (v119) that have a 100% quality score to the
    SEED alignment (field 'align\_ident\_slv' in the arb database) and
    that go from the end of the traditional 8f/27f primer to the
    beginning of the traditional 1492r primer. We are providing a
    composite dataset for bacterial, archaeal, and eukaryotic sequences.
    The uncompressed version is \~700 MB and the compressed version is
    25 MB.
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181
    sequences)

## Release 102

The SILVA alignment is 50,000 columns long so that it can be compatible
with 18S rRNA sequences as well as archaeal 16S rRNA sequences. The
actual reference alignment that SILVA uses with their SINA aligner is
called the SEED alignment. We don't know what this actually is. We have
tried to duplicate it by identifying the unique sequences in the SSURef
database (v102) that have a 100% quality score to the SEED alignment and
that go from the end of the traditional 8f/27f primer to the beginning
of the traditional 1492r primer. We are providing separate datasets for
bacterial, archaeal, and eukaryotic sequences. Within each reference set
are the aligned sequence file (e.g. silva.bacteria.fasta), an unaligned
sequence file (e.g. nogap.bacteria.fasta), and taxonomy outlines (e.g.
silva.bacteria.silva.tax):

-   [ bacterial references](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.bacteria.zip) (14,956 sequences)
-   [ archaeal references](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.archaea.zip) (2,297 sequences)
-   [ eukaryotic references](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.eukarya.zip) (1,238 sequences)
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181 sequences)
