---
title: 'merge.files'
tags: 'commands'
redirect_from: '/wiki/Merge.files.html'
---
The **merge.files** command will concatenate
multiple files and output the result to a new file. This command is
useful for merging multiple fasta-formatted sequence files, 454 quality
files, group files, name files, or anything else except count_tables (see [merge.count](/wiki/merge.count/)).

To run the **merge.files** command you need to provide the input files
separated by hyphens as well as the name file that the contents of those
files should be written to. The merging occurs in the order that you
provide the input files. The following example demonstrates how to use
the command:

    mothur > merge.files(input=fileA-fileB-fileC, output=fileABC)

Alternatively, the **merge.files** command can be used to combine the
information in a fasta, taxonomy, name or count files into a new fasta
file.

    mothur > merge.files(fasta=final.fasta, count=final.count_table, taxonomy=final.taxonomy)

The resulting fasta file would look like:

    >GQY1XT001CFHYQ 467 Bacteria(100);Firmicutes(100);Clostridia(100);Clostridiales(100);Clostridiales_unclassified(100);Clostridiales_unclassified(100);Clostridiales_unclassified(100);
    T-C--T-G--GA-A-A-C-T-G-T--GT-A-A-C--T-G-G-A-G-T-G-C-AG-GA-G-A-G-G-C-A--GG-C-GG-A-ATT-C-C-T-A-GT-GT-A-G-CGGT-G-AAA--TG-C-GT-AG--AT-A-TT-A-G-G-AG-G-A-AC-...
    >GQY1XT001C44N8 3677 Bacteria(100);"Bacteroidetes"(100);"Bacteroidia"(98);"Bacteroidales"(98);"Porphyromonadaceae"(97);"Porphyromonadaceae"_unclassified(97);"Porphyromonadaceae"_unclassified(97);
    C-G--T-T--GA-A-A-C-T-G-G--CG-T-T-C--T-T-G-A-G-T-G-G-GC-GA-G-A-A-G-T-A--TG-C-GG-A-ATG-C-G-T-G-GT-GT-A-G-CGGT-G-AAA--TG-C-AT-AG--AT-A-TC-A-C-G-CA-G-A-AC-T-...
    ...

To merge SFF files you can simply use this command using 454's
executable:

    sfffile -o combined.sff infile1.sff infile2.sff

## Revisions

-   1.40.3 - Bug Fix: Not finding input files.
    [\#438](https://github.com/mothur/mothur/issues/438)
-   1.41.0 - Adds fasta, taxonomy, name and count options to
    merge.files. [\#506](https://github.com/mothur/mothur/issues/506)


