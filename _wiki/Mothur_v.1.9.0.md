---


title: 'Mothur v.1.9.0'
---
We are happy to announce the release of [mothur
v.1.9.0](mothur_v.1.9.0)! Although there are no new commands,
per say, there are a number of new options available, which will
hopefully make mothur more flexible. For example, when we teach
workshops people are often overwhelmed by the number of files generated
by mothur and are never quite sure what the output is from a command.
Now each command indicates the files that are being created. Another
example is the output of an accnos file from the chimera checking
commands that you can use with [remove.seqs](remove.seqs) to
purify your sequence collection of chimeras. Perhaps the biggest update
in this release is the incorporation of MPI. You can still use multiple
processors without using MPI, but for those power users that have a
cluster and would like to run mothur jobs across machines or nodes, it
is now possible. We are curious to hear people\'s experiences with the
MPI version of mothur. These are just a few of the many new features
that we have added to this release.

There is increased traffic on the user forum and its great to see more
people are willing to try and help others. The forum has also been a
great resource for users to suggest new features and ask questions. Many
of the features in this release have come from users. Thanks for the
great suggestions and bug reports - this feed back helps to make mothur
the great program it is! We have a number of features that we are
working on for v.1.10.0 and hopefully we won\'t have such a long time
lag before the next release.

## Options

-   added output parameter to [otu.hierarchy](otu.hierarchy)
    command, options are name and number. name is default. you can
    output either the names of the sequences in the OTUs or the OTU
    numbers.
-   added dups parameter to [remove.seqs](remove.seqs)
    command.
-   add a name option to unifrac commands
-   added output parameter so you can create a square phylip formatted
    matrices from dist.seqs and dist.shared
-   added [parse.list](parse.list) command.
-   output list of files that are created at the end of each command
-   fixed problem with logfiles that occurred when multiple executions
    of mothur were running at the same time.
-   filter.seqs can filter multiple files by separating files names with
    dashes. ex. fasta=abrecovery.fasta-core\_set\_aligned.imputed.fasta
-   removed phylip parameter from dist.seqs and replaced with output
-   added sim parameter to read.dist
-   parallelized filter.seqs
-   added MPI code to dist.seqs, filter.seqs, classify.seqs, align.seqs,
    and chimera commands.
-   broke chimera.seqs up into chimera.bellerophon, chimera.ccode,
    chimera.check, chimera.slayer, chimera.pintail.
-   add accnos file output to the chimera.\*\*\* commands
-   added more error checking to chimera.\*\*\* commands to check query
    to template seqs length
-   rework the way the chimera.\*\*\* commands process seqs so only one
    is read at a time
-   \^C ends command instead of ending mothur.
-   \^D now ends mothur with readline

## Bug fixes

-   Problem with \"../\" ==\> align.seqs(candidate=wobus.unique.fasta,
    template=../DataAnalysis/silva.refalign.fasta, processors=2);
    Segmentation fault
-   fixed bug in merge.files that inserted the eof character in between
    the merged files
-   fixed bug that could cause a badalloc to occur while reading a
    sabund file
-   added checking for duplicate sequence names in list files which
    leads to .missing.group file to be blank.
-   get.seqs and remove.seqs using a list file left an extra comma if
    you eliminated the final member in the OTU.
-   fixed bug that caused a bad alloc to occur in chimera.seqs while
    using bellerophon.
-   fixed bug in how ends of sequences were treated in distance
    calculations.
-   fixed bug that caused a bad\_alloc if a sequence could not be
    classified to a given confidence.
