---
title: 'get.groups'
tags: 'commands'
redirect_from: '/wiki/Get.groups.html'
---
The **get.groups** command selects sequences from a
specific group or set of groups from the following file types: fasta,
name, group, list, taxonomy. To complete this analysis, you need to
download the folder compressed in the [
Abrecovery.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/abrecovery.zip) and [
Abrecovery.accnosgroups.zip](https://mothur.s3.us-east-2.amazonaws.com/wiki/abrecovery.accnosgroups.zip).


## Default Settings

The group or count parameter is required, unless you have a current
group or count file, or are using a shared file. The command will
generate a \*.pick.\* file.

    mothur > get.groups(group=abrecovery.groups, groups=B-C)

or

    mothur > get.groups(count=abrecovery.count_table, groups=B-C)

or you may wish to list your groups in a file instead of manually typing
them. This can be done by using an accnos file.

    mothur > get.groups(group=abrecovery.groups, accnos=abrecovery.accnosgroups) 

or

    mothur > get.groups(count=abrecovery.count_table, accnos=abrecovery.accnosgroups) 

Both commands will output a new abrecovery.pick.groups containing the
158 sequences in groups B or C.

## Options

### fasta option

To use the fasta option, follow this example:

    mothur > get.groups(group=abrecovery.groups, groups=B-C, fasta=abrecovery.fasta)

This generates the file abrecovery.pick.fasta, which contains the
following lines:

    >AY457831
    CCCTTAGAGTTTGATCCTGGCTCAGGACGAACGCTGGCGGCGCGCCTAACACATGCAAGTCGAACGAGCGAGAGGAGGTTTAC...
    >AY457830
    GCCCTTAGAGTTTGATCCTGGCTCAGGACGAACGCTGGCGGCGCGCCTAACACATGCAAGTCGAACGGAGCTTAGAGAGCTTG...
    >AY457829
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGAAGCACTTTGATCGATT...
    >AY457828
    GCCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAACGGGATCCATCAAGCTTG...
    >AY457827
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTAGCTACAGGCTTAACACATGCAAGTCGAGGGGCAGCATGGTCTTAGCT...
    >AY457826
    GCCCTTAGAGTTTGATCCTGGCTCAGGACGAACGCTGGCGGCGCGCCTAACACATGCAAGTCGAACGAGCGAGAGAGAGCTTG...
    >AY457825
    CCCTTAGAGTTTGATCCTGGCTCAGGATGAACGCTAGCTACAGGCTTAACACATGCAAGTCGAGGGGCAGCATTTTAGTTTGC...
    ...

as well as a abrecovery.pick.groups with the same sequences.

### phylip

The phylip option is used to specify the name of the [ phylip
formatted](/wiki/phylip-formatted_distance_matrix) distance file
you would like to select distances from.

The final.tre1.weighted.ave.dist file contains:

    11
    F003D000   
    F003D002   0.219014    
    F003D004   0.405823    0.285439    
    F003D006   0.311126    0.227599    0.197012    
    F003D008   0.246074    0.221351    0.341801    0.220774    
    F003D142   0.381307    0.350587    0.175825    0.199702    0.331989    
    F003D144   0.380843    0.3943  0.350766    0.278915    0.37678 0.239005    
    F003D146   0.277258    0.300362    0.331904    0.242542    0.239576    0.246918    0.160718    
    F003D148   0.308621    0.299937    0.303805    0.254025    0.27361 0.246377    0.15778 0.120112    
    F003D150   0.315133    0.307792    0.206429    0.209389    0.27078 0.179998    0.260263    0.217917    0.195339    
    MOCK.GQY1XT001 0.64778 0.69245 0.769817    0.703035    0.61892 0.715547    0.662322    0.613735    0.648762    0.716918    

    mothur > get.dists(phylip=final.tre1.weighted.ave.dist, accnos=final.test.accnos)

creates a final.tre1.weighted.ave.pick.dist file:

    5
    F003D000   
    F003D002   0.219014    
    F003D004   0.405823    0.285439    
    F003D142   0.381307    0.350587    0.175825    
    F003D144   0.380843    0.3943  0.350766    0.239005    

### column

The column option is used to specify the name of the [ column
formatted](/wiki/column-formatted_distance_matrix) distance file
you would like to select distances from.

    U68590 U68589 0.67
    U68591 U68589 0.7559
    U68591 U68590 0.8011
    U68592 U68589 0.6585
    U68592 U68590 0.6528
    U68592 U68591 0.7849
    U68593 U68589 0.6953
    U68593 U68590 0.6383
    U68593 U68591 0.7741
    U68593 U68592 0.6041
    U68594 U68589 0.7109
    U68594 U68590 0.7233
    ...

If you only want sequences U68589, U68590 and U68592.

    mothur > get.dists(column=amazon.dist, accnos=amazon.test.accnos)

amazon.pick.dist contains:

    U68590 U68589  0.67
    U68592 U68589  0.6585
    U68592 U68590  0.6528

### name option

To use the name option, follow this example:

    mothur > get.groups(fasta=abrecovery.fasta, group=abrecovery.groups, groups=B-C, name=abrecovery.names)

This generates the file abrecovery.pick.names, which contains the
following lines:

    AY457721   AY457721
    AY457733   AY457733
    AY457723   AY457723
    AY457741   AY457741
    AY457686   AY457686
    AY457758   AY457758
    AY457693   AY457693
    AY457706   AY457706
    AY457674   AY457674
    ...

as well as a abrecovery.pick.groups with the same sequences.

### list option

To use the list option, follow this example:

    mothur > get.groups(group=abrecovery.groups, groups=B-C, list=abrecovery.fn.list)

This generates the file abrecovery.fn.pick.list, which contains the
following lines:

    unique 157 AY457741    AY457731    AY457682    AY457729    AY457734... 
    0.00   152 AY457741    AY457731    AY457682    AY457729    AY457734...
    0.01   105 AY457741    AY457731    AY457682    AY457729    AY457734... 
    0.02   66  AY457741    AY457731    AY457682    AY457729    AY457734...
    0.03   52  AY457741    AY457731    AY457682    AY457729    AY457734... 
    ...

as well as a abrecovery.pick.groups with the same sequences.

### taxonomy option

To use the taxonomy option, follow this example:

    mothur > get.groups(group=abrecovery.groups, groups=B-C, taxonomy=abrecovery.silva.full.taxonomy)

This generates the file abrecovery.silva.full.pick.taxonomy, which
contains the following lines:

    AY457831   Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);...
    AY457830   Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);...
    AY457829   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);...
    AY457828   Bacteria(100);Actinobacteria(100);Actinomycetaceae-Bifidobacteriaceae(100);Bifidobacteriaceae(100);...
    AY457827   Bacteria(100);Bacteroidetes-Chlorobi(100);Bacteroidetes(100);Bacteroides-Prevotella(100);Bacteroides(100);...
    AY457826   Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);...
    ...

as well as a abrecovery.pick.groups with the same sequences.

### shared option

To use the shared option, follow this example:

    mothur > get.groups(shared=abrecovery.fn.shared, groups=B-C)

This generates the file abrecovery.fn.0.03.pick.shared, which contains
the following lines:

    label  Group   numOtus Otu1    Otu2    Otu4    Otu5    Otu6    Otu7    Otu8    Otu12   Otu14   Otu15   Otu16   ... 
    0.03   B   52  0   0   0   0   0   1   1   8   1   7   1   ... 
    0.03   C   52  1   1   1   1   1   0   0   0   7   0   1   ...

You can see that some OTU's were entirely eliminated because they only
contained sequences from group A.

### design

To use the design option, follow this example:

    mothur > get.groups(shared=abrecovery.design, groups=B-C)

### sets

The sets parameter allows you to specify which of the sets in your
designfile you would like to select. You can separate set names with
dashes.

## Revisions

-   1.23.0 file mismatch bug -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1396&p=3560#p3560](https://forum.mothur.org/viewtopic.php?f=4&t=1396&p=3560#p3560)
-   1.24.0 added design option
-   1.28.0 added count option
-   1.37.0 Adds phylip and column options
    [\#79](https://github.com/mothur/mothur/issues/79)
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.44.0 - Adds sets parameter.
    [\#277](https://github.com/mothur/mothur/issues/277)


