---
title: 'Greengenes-formatted databases'
redirect_from: '/wiki/Greengenes-formatted_databases'
---
The greengenes-based alignment is 7,682 columns wide. Because of the
poor alignment quality in the variable regions we strongly discourage
people from using it for their \"real\" analysis. One side effect of
this is that [chimera.slayer](chimera.slayer) detects fewer
real chimeras when using greengenes-aligned sequences compared to
SILVA-aligned sequences.

## Current stuff

-   [greengenes reference
    taxonomy](https://www.mothur.org/w/images/6/68/Gg_13_8_99.taxonomy.tgz) -
    This is from the August 2013 release of gg\_13\_8\_99 and contains
    202,421 bacterial and archaeal sequences. The source data for this
    file was downloaded from the greengenes.microbio.me ftp server and
    should be used with [classify.seqs](classify.seqs).
    Approximately 10% of the sequences in this dataset have spices-level
    names. Depending on your sample and 16S rRNA gene region of
    interest, you might find that this reference taxonomy does better
    than the RDP taxonomy.A README file is included that describes
    precisely how the files were created. You can also find this README
    on the [mothur blog
    site](/blog/2014/greengenes-v13_8_99-reference-files)
-   [greengenes reference
    alignment](https://www.mothur.org/w/images/1/19/Gg_13_8_99.refalign.tgz) -
    This is from the August 2013 release of gg\_13\_8\_99 and contains
    202,421 bacterial and archaeal sequences. The source data for this
    file was downloaded from the greengenes.microbio.me ftp server and
    should be used (if necessary, but why!?) to align sequences with
    [align.seqs](align.seqs). The greengenes-based alignment
    is 7,682 columns wide. Because of the poor alignment quality in the
    variable regions we strongly discourage people from using it for
    their \"real\" analysis. A README file is included that describes
    precisely how the files were created.
-   [greengenes gold
    alignment](https://www.mothur.org/w/images/2/21/Greengenes.gold.alignment.zip) -
    5,181 bacterial and archaeal sequences in it and the sequences do
    not necessarily cover the entire 16S rRNA gene.  This file was
    downloaded from the [Broad Institutes sourceforge
    website](https://microbiomeutil.sourceforge.net) and should be used
    with [chimera.slayer](chimera.slayer) or with
    [chimera.uchime](chimera.uchime). One side effect of the
    crappy greengenes alignment is that
    [chimera.slayer](chimera.slayer) detects fewer real
    chimeras when using greengenes-aligned sequences compared to
    SILVA-aligned sequences.

## Old stuff

-   [greengenes reference
    taxonomy](https://www.mothur.org/w/images/9/9d/Gg_13_5_99.taxonomy.tgz) -
    This is from the May 2013 release of gg\_13\_5\_99 and contains
    202,421 bacterial and archaeal sequences. The source data for this
    file was downloaded from the [second genome/greengenes
    website](https://greengenes.secondgenome.com) and should be used with
    [classify.seqs](classify.seqs).
-   [greengenes reference
    alignment](https://www.mothur.org/w/images/c/cd/Gg_13_5_99.refalign.tgz) -
    This is from the May 2013 release of gg\_13\_5\_99 and contains
    202,421 bacterial and archaeal sequences. The source data for this
    file was downloaded from the [second genome/greengenes
    website](https://greengenes.secondgenome.com) and should be used (if
    necessary, but why!?) to align sequences with
    [align.seqs](align.seqs). A readme is included to
    describe how this file was generated.
-   [greengenes reference
    alignment](https://www.mothur.org/w/images/7/72/Greengenes.alignment.zip) -
    4,938 bacterial and archaeal sequences in it and the sequences are
    \"imputed\" to cover the entire 16S rRNA gene. This file was
    downloaded from the [greengenes
    website](https://greengenes.lbl.gov/Download/Sequence_Data/Fasta_data_files/core_set_aligned.fasta.imputed)
    and should be used (if necessary) to align sequences with
    [align.seqs](align.seqs).
-   [greengenes reference
    taxonomy](https://www.mothur.org/w/images/1/16/Greengenes.tax.tgz) -
    84,414 bacterial and archaeal sequences and their taxonomy. Pretty
    close to what was described in the [Werner ISMEJ
    paper](https://www.ncbi.nlm.nih.gov/pubmed/21716311).
