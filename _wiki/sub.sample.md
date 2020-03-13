---
title: 'sub.sample'
tags: 'commands'
redirect_from: '/wiki/Sub.sample.html'
---
The **sub.sample** command can be used as a way to
normalize your data, or create a smaller set from your original set. It
takes as an input the following file types: fasta, name, group, list,
taxonomy, count, shared, rabund and sabund to generate a new file that
contains a sampling of your original file.


## fasta option

To use the fasta option, follow this example:

    mothur > sub.sample(fasta=esophagus.unique.fasta)

This generates the file esophagus.subsample.fasta.

## name option

If you have a names file associated with the fasta file you may use the
name option:

    mothur > sub.sample(fasta=esophagus.unique.fasta, name=esophagus.names)

This generates the file esophagus.subsample.names.

## list option

To use the list option, follow this example:

    mothur > sub.sample(list=esophagus.fn.list)

This generates the file esophagus.fn.subsample.list.

## group option

The group option may be used with a fasta file or list file to generate
a new group file to match your sampled list or fasta file.

    mothur > sub.sample(list=esophagus.fn.list, group=esophagus.groups)

or

    mothur > sub.sample(fasta=esophagus.fasta, group=esophagus.groups)

or

    mothur > sub.sample(fasta=esophagus.unique.fasta, name=esophagus.names, group=esophagus.groups)

## groups

The groups option may only be used if you have entered a groupfile for
the list or fasta option, or if you are using a shared file. The groups
parameter allows you to specify which of the groups in your groupfile
you would like included. The group names are separated by dashes.

To use the groups option, follow this example:

    mothur > sub.sample(shared=esophagus.unique.fn.shared, groups=B-C)

This generates the file esophagus.unique.fn.subsample.shared, containing
only a sampling from the groups B and C.

## taxonomy option

The taxonomy parameter allows you to provide a taxonomy file associated
with your fasta or list parameter.

    mothur > sub.sample(fasta=esophagus.unique.fasta, name=esophagus.names, taxonomy=esophagus.rdp.taxonomy)

## count option

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

    mothur > sub.sample(fasta=esophagus.unique.fasta, count=esophagus.count_table)

or if you clustered using a count file be sure to include it:

    mothur > sub.sample(list=esophagus.fn.unique_list, count=esophagus.count_table)

## shared option

To use the shared option, follow this example:

    mothur > sub.sample(shared=esophagus.unique.fn.shared)

This generates the file esophagus.unique.fn.subsample.shared.

## rabund option

To use the rabund option, follow this example:

    mothur > sub.sample(rabund=esophagus.unique.fn.rabund)

This generates the file esophagus.unique.fn.subsample.rabund.

## sabund option

To use the sabund option, follow this example:

    mothur > sub.sample(sabund=esophagus.unique.fn.sabund)

This generates the file esophagus.unique.fn.subsample.sabund.

## tree

To use the tree option, follow this example:

    mothur > sub.sample(tree=final.tre)

## constaxonomy

To use the constaxonomy option, follow this example:

    mothur > sub.sample(constaxonomy=final.constaxonomy, shared=final.opti_mcc.shared)

## label

The label option can be used with all file types except fasta, and
allows you to select what distance levels you would like, and are also
separated by dashes.

To use the label option, follow this example:

    mothur > sub.sample(shared=esophagus.unique.fn.shared, label=unique=0.03)

This generates the file esophagus.unique.fn.subsample.shared, containing
a sampling at distances unique and 0.03.

## size

The size parameter allows you to select the size of your sampling. By
default for a shared file, size is set to the size of your smallest
sample. For all other files types, size is defaulted to 10% of the
number of sequences in your original file. For list and fasta files size
may not exceed your number of sequences as this would cause duplicate
sequence names, but for the shared, rabund and sabund, size may exceed
the original number of sequences represented.

To use the size option, follow this example:

    mothur > sub.sample(shared=esophagus.unique.fn.shared, size=200)

## persample

The persample parameter allows you indicate you want to select subsample
of the same size from each of your groups, default=false. It is only
used with the list and fasta files if a groupfile is given.
persample=false will select a random set of sequences of the size you
select, but the number of sequences from each group may differ.

## withreplacement

The withreplacement parameter allows you to indicate you want to
subsample your data allowing for the same read to be included multiple
times. Default=f.

## Revisions

-   1.22.0 Improved speed of **sub.sample** command on list and fasta files.
-   1.22.0 Now outputs a unique fasta file and names file.
-   1.28.0 Added count option.
-   1.30.0 Added taxonomy option.
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.40.0 - Fixes segfault error for commands that use subsampling.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.42.0 - Adds tree parameter to **sub.sample** command.
-   1.42.0 - Adds withreplacement parameter to **sub.sample** command.
    [\#262](https://github.com/mothur/mothur/issues/262)
-   1.42.0 - Adds constaxonomy file to subsample
    command.[\#582](https://github.com/mothur/mothur/issues/582)
-   1.42.0 - Fixes **sub.sample** with multiple labels bug.
    [\#559](https://github.com/mothur/mothur/issues/559)


