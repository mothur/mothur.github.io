---


title: 'Seq.error'
---
The [seq.error](seq.error) command reads a fasta file and
searches for errors in sequence compared to a reference file. Using this
command to assess error rate requires that your dataset includes one or
more mock community samples of known composition. Error rate is defined
as Sum of mismatches to reference / Sum of bases in query


{% include toc.html %}

## Default settings

seq.error(fasta=, count=, reference=, aligned=F)

## Options

### qfile

### report

### aligned

The aligned parameter allows you to specify whether your query and
reference sequences are aligned. default=TRUE.

### name

The name parameter allows you to provide a name file associated with
your fasta file, so you can include the redundant sequences in your
error analysis. If you include a name file, do not also include a count
file.

### count

The count parameter allows you to provide a count file associated with
your fasta file, so you can include the redundant sequences in your
error analysis. If you include a count file, do not also include a name
file.

### ignorechimeras

seq.error runs a chimera check on the query file, based on the input
reference. You have the option of ignoring probable chimeras in
calculating error rate. default=TRUE.

### threshold

The threshold parameter allows you to ignore distances greater than some
limit of interest.

## Output files

Output files are:

.error.summary

.error.seq

.error.chimera

.error.seq.forward

.error.seq.reverse

.error.count

.error.matrix

.error.ref

## Revisions

-   1.22.0 First introduced.
-   1.30.0 Added count parameter
-   1.30.0 Bug fix: aligned=f was not degapping the sequences.
-   1.38.0 Removes save option.
-   1.40.0 Removes processors option.
-   1.40.0 Bug Fix: Fixes seg fault.
    [\#280](https://github.com/mothur/mothur/issues/280)
-   1.40.5 Solves seq.error crash
    [\#463](https://github.com/mothur/mothur/issues/463)

[Category:Commands](Category:Commands)
