---
title: 'Biom.info'
redirect_from: '/wiki/Biom.info.html'
---
The **biom.info** command reads a biom file creates a
[shared\_file](/wiki/Shared_file). If your biom file contains
metadata mothur will also create taxonomy or constaxonomy along with
tax.summary files.

## Default Options

The biom parameter is required. You can run the command as follows:

    mothur > biom.info(biom=abrecovery.an.0.03.biom)

## Options

### label

The label parameter allows you to enter a distance label to be used in
the shared file created from your biom file. Default=userLabel.

    mothur > biom.info(biom=abrecovery.an.0.03.biom, label=0.03)

### relabund

The relabund parameter allows you to indicate you want the tax.summary
file values to be relative abundances rather than raw abundances.
Default=F.

### basis

The basis parameter allows you indicate what you want the summary file
to represent, options are otu and sequence. Default is otu. For example
consider the following basis=sequence could give Clostridiales 3 105,
where 105 is the total number of sequences whose otu classified to
Clostridiales. Now for basis=otu could give Clostridiales 3 7, where 7
is the number of otus that classified to Clostridiales.

### format

The format parameter allows you indicate type of biom file you have.
Options hdf5 or classic. By default, mothur will autodetect the format for you.

    mothur > biom.info(biom=hdf5.biom, label=0.03, format=hdf5)

### output

The output parameter allows you to specify format of your \*tax.summary
file. Options are simple and detail. The detail format outputs the
totals at each level, where as the simple format outputs the highest
level. The default is detail.

The detail format looks like:

    taxlevel   rankID  taxon   daughterlevels  total   A   B   C
    0  0   Root    1   28  14  20  9
    1  0.1 "k__Bacteria"   5   28  14  20  9
    2  0.1.1   "p__Actinobacteria" 1   3   0   3   0
    3  0.1.1.1 "c__Actinobacteria" 1   3   0   3   0
    4  0.1.1.1.1   "o__Bifidobacteriales"  1   3   0   3   0
    5  0.1.1.1.1.1 "f__Bifidobacteriaceae" 1   3   0   3   0
    6  0.1.1.1.1.1.1   "g__Bifidobacterium"    3   3   0   3   0
    7  0.1.1.1.1.1.1.1 "s__"   0   1   0   1   0
    7  0.1.1.1.1.1.1.2 "s__adolescentis"   0   1   0   1   0
    7  0.1.1.1.1.1.1.3 "s__longum" 0   1   0   1   0
    2  0.1.2   "p__Bacteroidetes"  1   6   5   3   3
    3  0.1.2.1 "c__Bacteroidia"    1   6   5   3   3
    4  0.1.2.1.1   "o__Bacteroidales"  2   6   5   3   3
    5  0.1.2.1.1.1 "f__Bacteroidaceae" 1   4   4   3   1
    6  0.1.2.1.1.1.1   "g__Bacteroides"    4   4   4   3   1
    7  0.1.2.1.1.1.1.1 "s__"   0   1   1   1   0
    ...

The simple format looks like:

    taxon  total   A   B   C
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__";   1   0   1   0
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__adolescentis";   1   0   1   0
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";"f__Bifidobacteriaceae";"g__Bifidobacterium";"s__longum"; 1   0   1   0
    ...

### printlevel

The printlevel parameter allows you to specify taxlevel of your
\*tax.summary file to print to. Options are 1 to the maz level in the
file. The default is -1, meaning max level. If you select a level
greater than the level your sequences classify to, mothur will print to
the level your max level.

    mothur > biom.info(biom=abrecovery.an.0.03.biom, label=0.03, printlevel=4)

Detail format:

    taxlevel   rankID  taxon   daughterlevels  total   A   B   C 
    0  0   Root    1   28  14  20  9
    1  0.1 "k__Bacteria"   5   28  14  20  9
    2  0.1.1   "p__Actinobacteria" 1   3   0   3   0
    3  0.1.1.1 "c__Actinobacteria" 1   3   0   3   0
    4  0.1.1.1.1   "o__Bifidobacteriales"  1   3   0   3   0
    2  0.1.2   "p__Bacteroidetes"  1   6   5   3   3
    3  0.1.2.1 "c__Bacteroidia"    1   6   5   3   3
    4  0.1.2.1.1   "o__Bacteroidales"  2   6   5   3   3
    2  0.1.3   "p__Firmicutes" 2   13  8   10  2
    3  0.1.3.1 "c__Bacilli"    1   1   1   0   0
    4  0.1.3.1.1   "o__Turicibacterales"   1   1   1   0   0
    ...

Simple Format:

    taxon  total   A   B   C
    "k__Bacteria";"p__Actinobacteria";"c__Actinobacteria";"o__Bifidobacteriales";  3   0   3   0
    "k__Bacteria";"p__Bacteroidetes";"c__Bacteroidia";"o__Bacteroidales";  6   5   3   3
    "k__Bacteria";"p__Firmicutes";"c__Bacilli";"o__Turicibacterales";  1   1   0   0
    ...

## Help

### Common Questions

Can't find your question? Please feel free to ask questions on our
forum, [https://forum.mothur.org](https://forum.mothur.org).

### Common Issues


1\.  **Cannot convert error. What do I do?** This issue is caused by a
    matrix\_element\_type mismatch. The biom file contains a field
    called 'matrix\_element\_type'. This field tells mothur what form
    your observation data is in: int or float. mothur expects 'int'
    (an interger value) because the shared file contains interger value
    abundance counts. If your file contains float values mothur will
    round down to the nearest integer value. But if your
    matrix\_element\_type=int and yet the file contains integer counts
    in float form, (ie. 31.0 instead of 31) you will get this error. You
    can resolve this issue by setting matrix\_element\_type=float in the
    biom file.

2\.  **mothur can't read my biom file. What does this mean?** This
    likely caused by failure to set format=hdf5. mothur allows for 2
    formats: classic
    (https://biom-format.org/documentation/format\_versions/biom-1.0.html)
    and hdf5
    (https://biom-format.org/documentation/format\_versions/biom-2.0.html).
    By default mothur assumes your files are in classic form. If your
    file is in hdf5 format, then set format=hdf5. NOTE: you can only
    process hdf5 files if you are using our pre-built version or have
    built your version of mothur with USEHDF5=yes.

### How To

Not sure how to do what you want? Please feel free to ask questions on
our forum, [https://forum.mothur.org](https://forum.mothur.org).

## Revisions

-   1.37.0 - First Introduced
    [\#82](https://github.com/mothur/mothur/issues/82)
-   1.41.0 - Add sample info to tax.summary in **biom.info** command.
    [\#531](https://github.com/mothur/mothur/issues/531)
-   1.41.0 - Updates **biom.info** to read hdf5 biom files.
    [\#178](https://github.com/mothur/mothur/issues/178)
