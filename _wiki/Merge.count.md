---
title: 'Merge.count'
tags: 'commands'
---
The **merge.count** command will combine multiple
count table files and output the result to a new file.

To run the **merge.count** command you need to provide the input files
separated by hyphens as well as the name file that the contents of those
files should be written to. The merging occurs in the order that you
provide the input files. The following example demonstrates how to use
the command:

    mothur > merge.count(count=fileA-fileB-fileC, output=fileABC)

NOTE: You cannot **merge.count** files with group information with files
that do not include group information. Data would be lost.

## Revisions

-   1.38.1 - First Introduced
-   1.42.0 - Merge.count command ignores duplicate names.
    [\#259](https://github.com/mothur/mothur/issues/259)


