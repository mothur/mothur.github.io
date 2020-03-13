---
title: 'make.biom'
tags: 'commands'
redirect_from: '/wiki/Make.biom.html'
---
The **make.biom** command is design to allow you to
convert your [shared file](shared_file) to a biom file.
[https://biom-format.org/documentation/biom_format.html](https://biom-format.org/documentation/biom_format.html) (Note: mothur
currently supports format version 1.0) To run this tutorial please
download, [ example files](https://mothur.s3.us-east-2.amazonaws.com/wiki/make_biom_files.zip)

## Default Settings

The shared parameter is required to run the **make.biom** command.

    mothur > make.biom(shared=final.tx.1.subsample.1.pick.shared)

## Options

### constaxonomy

The constaxonomy file is the taxonomy file outputted by
[classify.otu](classify.otu)(list=yourListfile,
taxonomy=yourTaxonomyFile). Be SURE that the you are the constaxonomy
file distance matches the shared file distance. ie, for
\*.0.03.cons.taxonomy set label=0.03.

    mothur > make.biom(shared=final.tx.1.subsample.1.pick.shared, constaxonomy=final.tx.1.cons.taxonomy)

### metadata

You can add sample data support (e.g., experimental factor, sample
collection date, etc) using the metadata parameter.

For example if your metadata file looked like:

    group  dpw description
    F003D000   0   "F003D000 description"
    F003D002   2   "F003D002 description"
    F003D004   4   "F003D004 description"
    F003D006   6       "F003D006 description"
    F003D008   8       "F003D008 description"
    F003D142   142     "F003D142 description"
    F003D144   144     "F003D144 description"
    F003D146   146     "F003D146 description"
    F003D148   148     "F003D148 description"
    F003D150   150     "F003D150 description"
    MOCK.GQY1XT001 12  "MOCK.GQY1XT001 description"

Your biom file columns would look like:

    "columns":[
               {"id":"F003D000", "metadata":{"dpw":"0", "description":"F003D000 description"}},
               {"id":"F003D002", "metadata":{"dpw":"2", "description":"F003D002 description"}},
               {"id":"F003D004", "metadata":{"dpw":"4", "description":"F003D004 description"}},
               {"id":"F003D006", "metadata":{"dpw":"6", "description":"F003D006 description"}},
               {"id":"F003D008", "metadata":{"dpw":"8", "description":"F003D008 description"}},
               {"id":"F003D142", "metadata":{"dpw":"142", "description":"F003D142 description"}},
               {"id":"F003D144", "metadata":{"dpw":"144", "description":"F003D144 description"}},
               {"id":"F003D146", "metadata":{"dpw":"146", "description":"F003D146 description"}},
               {"id":"F003D148", "metadata":{"dpw":"148", "description":"F003D148 description"}},
               {"id":"F003D150", "metadata":{"dpw":"150", "description":"F003D150 description"}},
               {"id":"MOCK.GQY1XT001", "metadata":{"dpw":"12", "description":"MOCK.GQY1XT001 description"}}

### matrixtype

The matrixtype parameter allows you to select what type you would like
to make. Choices are sparse and dense, default is sparse.

    mothur > make.biom(shared=final.tx.1.subsample.1.pick.shared, matrixtype=dense)

### groups

The groups parameter allows you to specify which of the groups in your
groupfile you would like included. The group names are separated by
dashes.

    mothur > make.biom(shared=final.tx.1.subsample.1.pick.shared, groups=F003D000-F003D002-F003D008)

### label

The label parameter allows you to select what distance levels you would
like, and are also separated by dashes.

### picrust

The picrust program requires green genes OTU IDs. The picrust parameter
allows you to provide the OTU ID mapping table associated with your
reference taxonomy. When using the picrust option you must provide a
reference taxonomy and a \*.cons.taxonomy file. You can download the
version 13.5 OTU ID maps here: [GreenGenes Mapping
Tables](https://www.mothur.org/w/images/b/be/GG_13_5_otuMapTable.zip).

    mothur > make.biom(shared=abrecovery.an.shared, label=0.03, reftaxonomy=gg_13_5_99.gg.tax, constaxonomy=abrecovery.an.0.03.cons.taxonomy, picrust=97.gg.otu_map)

Mothur will create a biom file and a new shared file. The new shared
file is created because picrust does not allow for duplicate OTU IDs, so
any OTUs that are classified to the same taxonomy are merged.

### reftaxonomy

The referencetax parameter is used with the picrust parameter. Picrust
requires the greengenes OTU IDs to be in the biom file, and the
referencetax parameter allows you to provide your reference taxonomy
file you used when classifying your sequences.

## Revisions

-   1.25.0 - First Introduced
-   1.28.0 - Added metadata option -
    [https://forum.mothur.org/viewtopic.php?f=5&t=1786](https://forum.mothur.org/viewtopic.php?f=5&t=1786)
-   1.32.0 - Bug Fix: segfault with multiple labels in shared file. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=2585&p=7072#p7072](https://forum.mothur.org/viewtopic.php?f=4&t=2585&p=7072#p7072)
-   1.33.0 - Added the picrust and reftaxonomy parameters.
-   1.36.0 - Bug Fix: - repeat labels when combining mothur OTU labels
    with non mothur OTU labels, this can results in a duplicate
    \"simple\" label. This causes an incorrect taxonomy to be assigned
    to the OTU.
-   1.36.0 - remove paths from filenames to make compliant with qiime
    parser. -
    [https://forum.mothur.org/viewtopic.php?f=3&t=3781&p=11241#p11241](https://forum.mothur.org/viewtopic.php?f=3&t=3781&p=11241#p11241)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)


