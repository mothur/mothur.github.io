---
title: 'get.mimarkspackage'
tags: 'commands'
redirect_from: '/wiki/Get.mimarkspackage'
---
The **get.mimarkspackage** command creates a MIMarks package template for
your samples for the environment you select. See Creating a new
submission to see how to use make.sra in your workflow.

## Default Options

You must provide a file, oligos or group file. Mothur uses the file,
oligos and group file to extract your sample names.

    mothur > get.mimarkspackage(file=test.file)

or

    mothur > get.mimarkspackage(oligos=GQY1XT001.oligos)

or

    mothur > get.mimarkspackage(group=final.groups)

This command will create a template that looks like:

    #This is a tab-delimited file. Additional Documentation can be found at `[`mimarks_data_packages`](MIMarks_Data_Packages)`.
    #Please fill all the required fields indicated with '*'
    #Unknown or inapplicable fields can be assigned 'missing' value.
    #You may add extra custom fields to this template. Make sure all the fields are separated by tabs.
    #You may remove any fields not required (marked with '*'). Make sure all the fields are separated by tabs.
    #You can edit this template using Microsoft Excel or any other editor. But while saving the file please make sure to save them as 'TAB-DELIMITED' TEXT FILE.
    #MIMARKS.survey.host-associated.4.0
    #{sample name} {description of sample} {sample title}  {description of library_construction_protocol}  {`[`https://www.ncbi.nlm.nih.gov/taxonomy/browser/wwwtax.cgi?mode=undef&id=408169&lvl=3&keep=1&srchmode=1&unlock`](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Undef&id=408169&lvl=3&keep=1&srchmode=1&unlock)`}   {Date of sampling, in "DD-Mmm-YYYY", "Mmm-YYYY" or "YYYY" format (eg., 30-Oct-1990, Oct-1990 or 1990) or ISO 8601 standard "YYYY-mm-dd", "YYYY-mm" or "YYYY-mm-ddThh:mm:ss" (eg., 1990-10-30, 1990-10 or 1990-10-30T14:41:36)}  {descriptor of the broad ecological context of a sample. Examples include: desert, taiga, deciduous woodland, or coral reef. EnvO (v 2013-06-14) terms can be found via the link: www.environmentontology.org/Browse-EnvO}  {descriptor of the local environment. Examples include: harbor, cliff, or lake. EnvO (v 2013-06-14) terms can be found via the link: www.environmentontology.org/Browse-EnvO}   {material that was displaced by the sample, or material in which a sample was embedded, prior to the sampling event. Examples include: air, soil, or water. EnvO (v 2013-06-14) terms can be found via the link: www.environmentontology.org/Browse-EnvO}   {Geographical origin of the sample; use the appropriate name from this list `[`https://www.insdc.org/documents/country-qualifier-vocabulary`](https://www.insdc.org/documents/country-qualifier-vocabulary)`. Use a colon to separate the country or ocean from more detailed information about the location, eg "Canada: Vancouver" or "Germany: halfway down Zugspitze, Alps"} {The natural (as opposed to laboratory) host to the organism from which the sample was obtained. Use the full taxonomic name, eg, "Homo sapiens".}  {The geographical coordinates of the location where the sample was collected. Specify as degrees latitude and longitude in format "d[d.dddd] N|S d[dd.dddd] W|E", eg, 38.98 N 77.11 W}
`#{text}    {text}  {text}  {text}  {controlled vacabulary} Template:Timestamp  Template:Term   Template:Term   Template:Term   ``{ {term}:{term}:{text}}`{=mediawiki}`  Template:None   ``{ {float} {float}}`{=mediawiki}
    *sample_name   *description    *sample_title   *seq_methods    *organism   *collection_date    *env_biome  *env_feature    *env_material   *geo_loc_name   *host   *lat_lon
    F003D000_AATGGTAC.CCGTCAATTCMTTTRAGT   
    F003D002_AACCTGGC.CCGTCAATTCMTTTRAGT   
    F003D004_TTCGTGGC.CCGTCAATTCMTTTRAGT   
    F003D006_TTCTTGAC.CCGTCAATTCMTTTRAGT   
    F003D008_TTCGCGAC.CCGTCAATTCMTTTRAGT   
    F003D142_TCCAGAAC.CCGTCAATTCMTTTRAGT   
    F003D144_AAGGCCTC.CCGTCAATTCMTTTRAGT   
    F003D146_TGACCGTC.CCGTCAATTCMTTTRAGT   
    F003D148_AGGTTGTC.CCGTCAATTCMTTTRAGT   
    F003D150_TGGTGAAC.CCGTCAATTCMTTTRAGT   
    MOCK.GQY1XT001_AACCGTGTC.CCGTCAATTCMTTTRAGT    

## Options

### file

The file parameter is used to provide a file containing a list of
individual fastq or sff files or paired fastq files with a group
assignment. File lines can be 2 or 3 columns. The 2 column files are sff
file then oligos or fastqfile then oligos. You may have multiple lines
in the file. The 3 column files are for paired read libraries. The
format is groupName, forwardFastqFile reverseFastqFile. This is the same
file you will later use with the sra command. Mothur will read the
oligos files and extract the group names, or read the list of group
names from the file.

Here\'s an example of the 2 column form with sff files:

    G3BMWHG01.sff   G3BMWHG01.oligos
    GHL4YHV01.sff     GHL4YHV01.oligos
    GHMDAJD01.sff    GHMDAJD01.oligos
    GO5715J01.sff     GO5715J01.oligos
    GQY1XT001.sff    GQY1XT001.oligos
    GZGO5KL01.sff    GZGO5KL01.oligos

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

### oligos

The oligos parameter is used to provide mothur with your oligos file.
Here\'s a link to more information about mothur\'s
[oligos\_file](Oligos_File).

    mothur > get.mimarkspackage(oligos=GQY1XT001.oligos)

### group

The group parameter is used to provide mothur with your group file.
Here\'s a link to more information about mothur\'s
[group\_file](Group_file).

    mothur > get.mimarkspackage(group=final.groups)

### package

The package parameter is used to select the mimarks package you would
like to use. The choices are: air, host\_associated, human\_associated,
human\_gut, human\_oral, human\_skin, human\_vaginal, microbial,
miscellaneous, plant\_associated, sediment, soil, wastewater or water.
Default=miscellaneous. Here is a link to more information on the various
packages: [mimarks\_data\_packages](MIMarks_Data_Packages).

    mothur > get.mimarkspackage(oligos=GQY1XT001.oligos, package=water)

### requiredonly

The requiredonly parameter is used to indicate you only want the
required mimarks fields printed. Default=F.

    mothur > get.mimarkspackage(oligos=GQY1XT001.oligos, requiredonly=t)

## Revisions

-   1.34.0 First Introduced.
-   1.38.1 Fixes group name issue with oligos file option so that it
    work with make.sra command.


