---


title: 'Make.sra'
---
The make.sra command creates the necessary files for a NCBI submission.
The xml file and individual sff or fastq files parsed from the original
sff or fastq file. See [Creating a new
submission](Creating_a_new_submission) to see how to use
make.sra in your workflow.

{% include toc.html %}

## Default settings

The sra command can be run in 3 ways: with a sff file, fastq file or
file option. The project and mimarksfile are also required. When you run
the sra command with an sff file the oligos parameter is required.

    mothur > get.mimarkspackage(oligos=GHL4YHV01.oligos)
    mothur > make.sra(sff=GHL4YHV01.sff, oligos=GHL4YHV01.oligos, project=test.project, mimark=MIMarksData.txt)

or you can run the command with your fastq file. The oligos parameter is
also required for this option.

    mothur > get.mimarkspackage(oligos=test.oligos)
    mothur > make.sra(fastq=test.fastq, oligos=test.oligos, project=test.project, mimark=MIMarksData.txt)

or you can run the sra command with the file option.

    mothur > get.mimarkspackage(file=test.file)
    mothur > make.sra(file=test.file, project=test.project, mimark=MIMarksData.txt)

## Options

### file

The file parameter is used to provide a file containing a list of
individual fastq or sff files or paired fastq files with a group
assignment. File lines can be 2 or 3 columns. The 2 column files are sff
file then oligos or fastqfile then oligos or ffastq and rfastq. You may
have multiple lines in the file. The 3 column files are for paired read
libraries. The format is groupName, forwardFastqFile reverseFastqFile.
If you are running the command with a 2 column file and ffastq and
rfastq you must provide an oligos file or mothur will assume your rfastq
file is an oligos file.

Here\'s an example of the 2 column form with sff files:

    G3BMWHG01.sff   G3BMWHG01.oligos
    GHL4YHV01.sff     GHL4YHV01.oligos
    GHMDAJD01.sff    GHMDAJD01.oligos
    GO5715J01.sff     GO5715J01.oligos
    GQY1XT001.sff    GQY1XT001.oligos
    GZGO5KL01.sff    GZGO5KL01.oligos

Here\'s an example of the 2 column form with a fastq file:

    test.ccs.fastq   barcodes.oligos

Here\'s an example of the 2 column form with a paired fastq files. Note:
This option must be run with an oligos file or mothur will assume the
reverse.fastq file is an oligos file:

    forward1.fastq   reverse1.fastq
    forward2.fastq   reverse2.fastq
    ...

Here is an example of the 3 column form with fastq files:

    F8D0   F8D0_S345_L001_R1_001.fastq F8D0_S345_L001_R2_001.fastq
    F8D125 F8D125_S358_L001_R1_001.fastq   F8D125_S358_L001_R2_001.fastq
    F8D141 F8D141_S359_L001_R1_001.fastq   F8D141_S359_L001_R2_001.fastq
    F8D142 F8D142_S360_L001_R1_001.fastq   F8D142_S360_L001_R2_001.fastq
    F8D143 F8D143_S361_L001_R1_001.fastq   F8D143_S361_L001_R2_001.fastq
    F8D144 F8D144_S362_L001_R1_001.fastq   F8D144_S362_L001_R2_001.fastq
    F8D145 F8D145_S363_L001_R1_001.fastq   F8D145_S363_L001_R2_001.fastq
    F8D146 F8D146_S364_L001_R1_001.fastq   F8D146_S364_L001_R2_001.fastq
    F8D147 F8D147_S365_L001_R1_001.fastq   F8D147_S365_L001_R2_001.fastq
    F8D148 F8D148_S366_L001_R1_001.fastq   F8D148_S366_L001_R2_001.fastq
    F8D149 F8D149_S367_L001_R1_001.fastq   F8D149_S367_L001_R2_001.fastq
    F8D150 F8D150_S368_L001_R1_001.fastq   F8D150_S368_L001_R2_001.fastq
    ...

or for single fastq files assigned to a group

    F8D0   F8D0.fastq  NONE
    F8D125 F8D125.fastq    NONE
    F8D141 F8D141.fastq    NONE
    ...

Here\'s an example of a 4 column file using index files:

    My.forward.fastq My.reverse.fastq NONE My.rindex.fastq 
    ...

NONE is an option is no forward or reverse index file.

### project

The project parameter allow you to provide your The
[Project\_File](Project_File) . It is required.

### mimark

The mimark parameter is required. You can generate a mimark template for
your groups using the
[get.mimarkspackage](get.mimarkspackage) command. **Please
note, NCBI has controlled language to ensure uniform submissions.
Unknown or inapplicable fields MUST be assigned \'missing\' value.**

    mothur > get.mimarkspackage(oligos=GHL4YHV01.oligos)
    mothur > make.sra(sff=sff=GHL4YHV01.sff, oligos=GHL4YHV01.oligos, project=test.project, mimark=MIMarksData.txt)

### oligos

The oligos option takes a file that can contain the sequences of the
forward and reverse primers and barcodes and their sample identifier.
Each line of the oligos file can start with the key words \"forward\",
\"reverse\", and \"barcode\" or it can start with a \"\#\" to tell
mothur to ignore that line of the oligos file. Here\'s a link to more
information about mothur\'s\[ \[Oligos\_File\]\]

    mothur > make.sra(sff=GHL4YHV01.sff, GHL4YHV01.oligos)

### bdiffs & pdiffs & ldiffs & sdiffs & tdiffs

These parameters are used to allow differences in the barcode, primers,
linkers and spacers. pdiffs is maximum number of differences to the
primer sequence, default=0. bdiffs is maximum number of differences to
the barcode sequence, default=0. ldiffs is maximum number of differences
to the linker sequence, default=0. sdiffs is maximum number of
differences to the spacer sequence, default=0. tdiffs is maximum total
number of differences to the barcode, primer, linker and spacer (default
to pdiffs + bdiffs + ldiffs + sdiffs).

    mothur > make.sra(sff=GHL4YHV01.sff, GHL4YHV01.oligos, pdiffs=2, bdiffs=1)

### platform

The platform parameter is used to specify platform you are using choices
are: \_LS454,ILLUMINA,ION\_TORRENT,PACBIO\_SMRT. Default=\_LS454. This
is a controlled vocabulary section in the XML file that will be
generated.

### orientation

The orientation parameter is used to specify sequence orientation.
Choices are: forward and reverse. Default=forward. This is a controlled
vocabulary section in the XML file that will be generated.

### libstrategy

The libstrategy parameter is used to specify library strategy.
Default=AMPLICON. Choices are
AMPLICON,WGA,WGS,WGX,RNA-Seq,miRNA-Seq,WCS,CLONE,POOLCLONE,CLONEEND,FINISHING,ChIP-Seq,MNase-Seq,DNase-Hypersensitivity,Bisulfite-Seq,Tn-Seq,EST,FL-cDNA,CTS,MRE-Seq,MeDIP-Seq,MBD-Seq,OTHER.
This is a controlled vocabulary section in the XML file that will be
generated.

### datatype

The datatype parameter is used to specify datatype. Default=METAGENOME.
Choices are
METAGENOME,GENOME\_SEQUENCING,METAGENOMIC\_ASSEMBLY,ASSEMBLY,TRANSCRIPTOME,PROTEOMIC,MAP,CLONE\_ENDS,TARGETED\_LOCI,RANDOM\_SURVEY,EXOME,VARIATION,EPIGENOMICS,PHENOTYPE,GENOTYPE,OTHER.
This is a controlled vocabulary section in the XML file that will be
generated.

### libsource

The libsource parameter is used to specify library source.
Default=METAGENOMIC. Choices are
METAGENOMIC,GENOMIC,TRANSCRIPTOMIC,METATRANSCRIPTOMIC,SYNTHETIC,VIRAL\_RNA,OTHER.
This is a controlled vocabulary section in the XML file that will be
generated.

### libselection

The libselection parameter is used to specify library selection.
Default=PCR. Choices are
PCR,RANDOM,RANDOM\_PCR,RT-PCR,HMPR,MF,CF-S,CF-H,CF-T,CF-M,MDA,MSLL,cDNA,ChIP,MNase,DNAse,Hybrid\_Selection,Reduced\_Representation,Restriction\_Digest,5-methylcytidine\_antibody,MBD2\_protein\_methyl-CpG\_binding\_domain,CAGE,RACE,size\_fractionation,Padlock\_probes\_capture\_method,other,unspecified.
This is a controlled vocabulary section in the XML file that will be
generated.

### instrument

The instrument parameter is used to specify instrument. Choices are
454\_GS-454\_GS\_20-454\_GS\_FLX-454\_GS\_FLX\_Titanium-454\_GS\_Junior-Illumina\_Genome\_Analyzer-Illumina\_Genome\_Analyzer\_II-Illumina\_Genome\_Analyzer\_IIx-Illumina\_HiSeq\_2000-Illumina\_HiSeq\_1000-Illumina\_MiSeq-PacBio\_RS-Ion\_Torrent\_PGM-unspecified.
Default=454\_GS. This is a controlled vocabulary section in the XML file
that will be generated.

### includescrap

The includescrap parameter is used to indicate whether or not to include
the scrapped sequences in your submission. The default is true.

### trim

The trim parameter allows you to indicate if you would like a sequences
and quality scores trimmed to the clipQualLeft and clipQualRight values
when using sff files. Default=True.

## Revisions

-   1.34.0 First Introduced
-   1.36.0 Allow for assigning multiple sets of files to the same group
    in 3 column format.
-   1.37.0 Bug Fix: Fastq.info error about no inputs selected when
    running make.sra with single fastq file and oligos file.
-   1.37.0 Adds includescrap parameter
    <http://www.mothur.org/forum/viewtopic.php?f=3&t=3750&p=11122#p11122>
-   1.39.0 Adds trim parameter for use with sff files
-   1.40.0 Adds additional format checks.
    [\#410](https://github.com/mothur/mothur/issues/410)

[Category:Commands](Category:Commands)
