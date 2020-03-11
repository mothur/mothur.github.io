---
title: 'Silva reference files'
---
If you use the SILVA reference files you should be aware of their
[dual-use license](https://www.arb-silva.de/silva-license-information).

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

-   [ Full length sequences and taxonomy references
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v132.tgz) (188247 bacteria, 4626 archea,
    and 20246 eukarya sequences). This reference could be customized for
    alignments, but could also be used for classification. The
    uncompressed version is \~9.9 GB and the compressed version is 348
    MB.
-   [ Recreated SEED database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v132.tgz)
    (8517 bacteria, 147 archaea, and 2516 eukarya sequences). The actual
    reference alignment that SILVA uses with their SINA aligner is
    called the SEED alignment. We don\'t know what this actually is. We
    have tried to duplicate it by identifying the unique sequences in
    the SSURef database (v123) that have a 100% quality score to the
    SEED alignment (field \'align\_ident\_slv\' in the arb database) and
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
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v128.tgz) (168111 bacteria, 4337 archea,
    and 18213 eukarya sequences). This reference could be customized for
    alignments, but could also be used for classification. The
    uncompressed version is \~8.9 GB and the compressed version is 311
    MB.
-   [ Recreated SEED database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v128.tgz)
    (8512 bacteria, 147 archaea, and 2554 eukarya sequences). The actual
    reference alignment that SILVA uses with their SINA aligner is
    called the SEED alignment. We don\'t know what this actually is. We
    have tried to duplicate it by identifying the unique sequences in
    the SSURef database (v123) that have a 100% quality score to the
    SEED alignment (field \'align\_ident\_slv\' in the arb database) and
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
    ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.nr_v123.tgz) (152308 bacteria, 3901 archea,
    and 16209 eukarya sequences). This reference could be customized for
    alignments, but could also be used for classification. The
    uncompressed version is \~7.2 GB and the compressed version is 249
    MB.
-   [ Recreated SEED database ](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v123.tgz)
    (12083 bacteria, 294 archaea, and 2537 eukarya sequences). The
    actual reference alignment that SILVA uses with their SINA aligner
    is called the SEED alignment. We don\'t know what this actually is.
    We have tried to duplicate it by identifying the unique sequences in
    the SSURef database (v123) that have a 100% quality score to the
    SEED alignment (field \'align\_ident\_slv\' in the arb database) and
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
    references](https://www.mothur.org/w/images/2/27/Silva.nr_v119.tgz)
    (137879 bacteria, 3155 archaea, and 12273 eukarya sequences). This
    reference could be customized for alignments, but could also be used
    for classification. The uncompressed version is \~7.2 GB and the
    compressed version is 249 MB.
-   [Recreated SEED
    database](https://www.mothur.org/w/images/5/56/Silva.seed_v119.tgz)
    (12244 bacteria, 207 archaea, and 2558 eukarya sequences). The
    actual reference alignment that SILVA uses with their SINA aligner
    is called the SEED alignment. We don\'t know what this actually is.
    We have tried to duplicate it by identifying the unique sequences in
    the SSURef database (v119) that have a 100% quality score to the
    SEED alignment (field \'align\_ident\_slv\' in the arb database) and
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
called the SEED alignment. We don\'t know what this actually is. We have
tried to duplicate it by identifying the unique sequences in the SSURef
database (v102) that have a 100% quality score to the SEED alignment and
that go from the end of the traditional 8f/27f primer to the beginning
of the traditional 1492r primer. We are providing separate datasets for
bacterial, archaeal, and eukaryotic sequences. Within each reference set
are the aligned sequence file (e.g. silva.bacteria.fasta), an unaligned
sequence file (e.g. nogap.bacteria.fasta), and taxonomy outlines (e.g.
silva.bacteria.silva.tax):

-   [ Bacterial references](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.bacteria.zip) (14,956
    sequences)
-   [ Archaeal references](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.archaea.zip) (2,297
    sequences)
-   [ Eukaryotic references](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.eukarya.zip) (1,238
    sequences)
-   [ Silva-based alignment of template file for
    chimera.slayer](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.gold.bacteria.zip) (5,181
    sequences)
