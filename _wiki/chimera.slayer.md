---
title: 'chimera.slayer'
tags: 'commands'
redirect_from: '/wiki/Chimera.slayer.html'
---
The **chimera.slayer** command reads a fasta file and reference file and
outputs potentially chimeric sequences. The developers of the original
algorithm suggest using a special template reference set (i.e. gold). We
provide a silva-based alignment of this dataset with our [silva
reference files](silva_reference_files). You will need to
have a copy of the megablast and formatdb executables in a folder called
blast/bin, where the blast folder is next to the mothur executable. The
version of megablast/formatdb that you need can be found in
<ftp://ftp.ncbi.nlm.nih.gov/blast/executables/release/2.2.25/> or they
are included with the executable versions of mothur. This command was modeled after the chimeraSlayer written by the Broad
Institute. Additional documentation can be found at the [Broad
Institute's website](http://microbiomeutil.sourceforge.net/).




## Default Settings

The fasta and reference parameters are required, unless you are using
reference=self. You may enter multiple fasta files by separating them by
dashes. Example: fasta=ex.align-abrecovery.align.

    mothur > chimera.slayer(fasta=stool.trim.unique.good.filter.unique.precluster.fasta, reference=silva.gold.filter.fasta)

The output to the screen looks like:

    Checking sequences from /Users/SarahsWork/Desktop/release/stool.trim.unique.good.filter.unique.precluster.fasta ...
    Reading sequences from /Users/SarahsWork/Desktop/release/silva.gold.filter.fasta...Done.

    Only reporting sequence supported by 90% of bootstrapped results.
    M23Fcsw_269061 yes
    M24Fcsw_22155  yes
    M24Fcsw_21866  yes
    ...

Output in
stool.trim.unique.good.filter.unique.precluster.slayer.chimeras:

    Name   LeftParent  RightParent DivQLAQRB   PerIDQLAQRB BootStrapA  DivQLBQRA   PerIDQLBQRA BootStrapB  Flag    LeftWindow  RightWindow
    F21Fcsw_12128  no
    F11Fcsw_6529   no
    F11Fcsw_112161 S000530395  7000004128191037    0.946746    89.8876 0   1.04142 98.8764 81  no  0-185   187-369 
    F11Fcsw_56988  no
    F11Fcsw_63768  no
    F21Fcsw_11639  no
    M11Fcsw_34015  no
    ...

Note: DivQLAQRB = divergence from query sequence to leftside of parent A
and rightside parent B PerIDQLAQRB = similarity of query to leftside of
parent A and rightside parent B DivQLBQRA = divergence from query
sequence to rightside of parent A and leftside parent B PerIDQLBQRA =
similarity of query to rightside of parent A and leftside parent B

You may also set reference=self, in this case the more abundant
sequences will be used as potential parents.

    mothur > chimera.slayer(fasta=stool.trim.unique.good.filter.unique.precluster.fasta, name=stool.trim.unique.good.filter.unique.precluster.names, reference=self)

or with a [ count file](Count_File):

    mothur > chimera.slayer(fasta=stool.trim.unique.good.filter.unique.precluster.fasta, count=stool.trim.unique.good.filter.unique.precluster.count_table, reference=self)

## Options

### search

The search parameter allows you to specify search method for finding the
closest parent. Choices are blast and kmer. Default=blast. If you use
the blast option you may want to set the blast location parameter as
well (see below). The blastlocation parameter allows you to specify the
location of your blast executable. By default mothur will look in

\./blast/bin relative to mothur's executable.

### blastlocation

The blastlocation parameter allows you to specify the location of your
blast executable. By default mothur will look in ./blast/bin relative to
mothur's executable.

### ksize

The ksize parameter allows you to input kmersize, default is 7, used if
search is kmer.

### realign

The realign parameter allows you to realign the query to the potential
parents. Choices are true or false, default true.

### group

If you are using reference=self and provide a groupfile, mothur will use
the more abundant sequences from the same sample to check the query
sequence.

    mothur > chimera.slayer(fasta=stool.trim.unique.good.filter.unique.precluster.fasta, name=stool.trim.unique.good.filter.unique.precluster.names, group=stool.good.groups, reference=self)

or if your [ count file](Count_File) contains group
information:

    mothur > chimera.slayer(fasta=stool.trim.unique.good.filter.unique.precluster.fasta, count=stool.trim.unique.good.filter.unique.precluster.count_file, reference=self)

### window

The window parameter allows you to specify the window size for searching
for chimeras, default=50.

    mothur > chimera.slayer(fasta=ex.align, template=silva.gold align, window=400)

### increment

The increment parameter allows you to specify how far you move each
window while finding chimeric sequences, default=5.

    mothur > chimera.slayer(fasta=ex.align, template=silva.gold align, increment=25)

### match & mismatch & numwanted & parents

The match parameter allows you to reward matched bases while selecting
potential parents, default is 5. The mismatch parameter allows you to
penalize mismatched bases while selecting potential parents, default is
-4. The numwanted parameter allows you to specify how many potential
parents you would each query sequence compared with, default=15. The
parents parameter allows you to select the number of potential parents
to investigate from the numwanted best matches after rating them,
default is 3.

### minsim & mincov

The minsim parameter allows you to specify a minimum similarity between
the query and the parent fragments, default=90, meaning 90%. The mincov
parameter allows you to specify minimum coverage of closest matches
found in template and the query. Default is 70, meaning 70%.

### iters & minbs & minsnp

The iters parameter allows you to specify the number of bootstrap iters
to do, default=1000. The minbs parameter allows you to specify minimum
bootstrap support for calling a sequence chimeric. Default is 90,
meaning 90%. The minsnp parameter allows you to specify percent of SNPs
to sample on each side of breakpoint for computing bootstrap support,
default=10, meaning 10%.

### divergence

The divergence parameter allows you to set a cutoff for chimera
determination, default is 1.007.

### trim

The trim parameter allows you to output a new fasta file containing your
sequences with the chimeric ones trimmed to include only their longest
piece, default=F.

### split

The split parameter was an idea we had to help detect tri- and
quadmeras; this increases the number of false positives. When split=T,
if a sequence comes back as non-chimeric, mothur will test the two sides
to see if they are chimeric. By default, split=F.

### dereplicate

The dereplicate parameter can be used when checking for chimeras by
group. If the dereplicate parameter is false, then if one group finds
the sequence to be chimeric, then all groups find it to be chimeric,
default=f. If you set dereplicate=t, and then run remove.seqs with
dups=f you can remove only the redundant chimeric sequences.

Let's look at an example:

    >seq1
    attgacat....
    >seq4
    ttgacaga....

    seq1 seq1,seq2,seq3
    seq4 seq4,seq5,seq6

    seq1 group1
    seq2 group2
    seq3 group3
    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=f and dups=t, (default settings in mothur), and seq2 is
found to be chimeric by group2. The results would be:

    >seq4
    ttgacaga....

    seq4 seq4,seq5,seq6

    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=t and dups=t, and seq2 is found to be chimeric by group2.
The results would be:

    >seq4
    ttgacaga....

    seq4 seq4,seq5,seq6

    seq4 group1
    seq5 group2
    seq6 group3

If dereplicate=t and dups=f, and seq2 is found to be chimeric by group2.
The results would be:

    >seq1
    attgacat....
    >seq4
    ttgacaga....

    seq1 seq1,seq3
    seq4 seq4,seq5,seq6

    seq1 group1
    seq3 group3
    seq4 group1
    seq5 group2
    seq6 group3

## Revisions

-   1.22.0 - Added the group option for use with reference=self.
-   1.23.0 - Paralellized by group for all OS's.
-   1.28.0 - added count parameter.
-   1.29.0 - added the dereplicate parameter.
-   1.30.0 - with count file and dereplicate=t will create a
    \*.pick.count\_table file.
-   1.30.0 - Bug Fix: dereplicate=t, remove.seqs(dups=f) was not
    removing all redundant chimeras.
-   1.32.1 Bug Fix: count table and dereplicate=t caused total=0 error
    message. - [https://forum.mothur.org/viewtopic.php?f=4&t=2620](https://forum.mothur.org/viewtopic.php?f=4&t=2620)
-   1.33.0 - improved work balance load between processors when
    processing by group.
-   1.38.0 - Removes save option.
-   1.40.0 - Removes processors option
