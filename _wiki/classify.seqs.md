---
title: 'classify.seqs'
tags: 'commands'
redirect_from: '/wiki/Classify.seqs.html'
---
The **classify.seqs** command allows the user to
use several different methods to assign their sequences to the taxonomy
outline of their choice. Current methods include using a k-nearest
neighbor consensus and Wang approach. Taxonomy outlines and reference
sequences can be obtained from the [taxonomy
outline](taxonomy_outline) page. The command requires that
you provide a fasta-formatted input and database sequence file and a
taxonomy file for the reference sequences. To complete this tutorial,
you are encouraged to obtain the [
AbRecovery](https://mothur.s3.us-east-2.amazonaws.com/wiki/abrecovery.zip) dataset.

## Output

mothur will output two files from the **classify.seqs** command: a
\*.taxonomy file which contains a taxonomy string for each sequence and
a \*.tax.summary file which contains a taxonomic outline indicating the
number of sequences that were found for your collection at each level.
For example, abrecovery.taxonomy may look like:

    AY457915   Bacteria(100);Firmicutes(99);Clostridiales(99);Johnsonella_et_rel.(99);Johnsonella_et_rel.(99);Johnsonella_et_rel.(91);Eubacterium_eligens_et_rel.(89);Lachnospira_pectinoschiza(80);
    AY457914   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(95);Eubacterium_eligens_et_rel.(92);Eubacterium_eligens(84);Eubacterium_eligens(81);
    AY457913   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Roseoburia_et_rel.(97);Roseoburia_et_rel.(97);Eubacterium_ramulus_et_rel.(90);uncultured(90);
    AY457912   Bacteria(100);Firmicutes(99);Clostridiales(99);Johnsonella_et_rel.(99);Johnsonella_et_rel.(99);
    AY457911   Bacteria(100);Firmicutes(99);Clostridiales(98);Ruminococcus_et_rel.(96);Anaerofilum-Faecalibacterium(92);Faecalibacterium(92);Faecalibacterium_prausnitzii(90);

or

    AY457915   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Johnsonella_et_rel.;Eubacterium_eligens_et_rel.;Lachnospira_pectinoschiza;
    AY457914   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Johnsonella_et_rel.;Eubacterium_eligens_et_rel.;Eubacterium_eligens;Eubacterium_eligens;
    AY457913   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Roseoburia_et_rel.;Roseoburia_et_rel.;Eubacterium_ramulus_et_rel.;uncultured;
    AY457912   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;
    AY457911   Bacteria;Firmicutes;Clostridiales;Ruminococcus_et_rel.;Anaerofilum-Faecalibacterium;Faecalibacterium;Faecalibacterium_prausnitzii;

This output indicates the sequence identifier in the first column as
well as it\'s taxonomy. In the former case, bootstrap values are
provided. In the latter case, they are either not calculated
(method=knn) or suppressed (method=wang, probs=F).

The second output file, abrecovery.tax.summary may look something like
the following:

    taxlevel    rankID  taxon   daughterlevels  total  
    0  0   Root    2   242 
    1  0.1 Bacteria    50  242 
    2  0.1.2   Actinobacteria  38  13  
    3  0.1.2.3 Actinomycetaceae-Bifidobacteriaceae 10  13  
    4  0.1.2.3.7   Bifidobacteriaceae  6   13  
    5  0.1.2.3.7.2 Bifidobacterium_choerinum_et_rel.   8   13  
    6  0.1.2.3.7.2.1   Bifidobacterium_angulatum_et_rel.   1   11  
    7  0.1.2.3.7.2.1.1 unclassified    1   11  
    8  0.1.2.3.7.2.1.1.1   unclassified    1   11  
    9  0.1.2.3.7.2.1.1.1.1 unclassified    1   11  
    10 0.1.2.3.7.2.1.1.1.1.1   unclassified    1   11
    11 0.1.2.3.7.2.1.1.1.1.1.1 unclassified    1   11  
    12 0.1.2.3.7.2.1.1.1.1.1.1.1   unclassified    1   11  
    6  0.1.2.3.7.2.5   Bifidobacterium_longum_et_rel.  1   2       
    ...

The first column indicates the taxonomic level in the outline.
Obviously, the Root is the highest one can go. In this case the deepest
any of the sequences go is to level 12. The second column indicates the
\"pedigree\" for each lineage. The third column is the name of the
lineage. Column four indicates the number of children lineages that the
current lineage has. Finally, the last column indicates the number of
sequences that were found in that lineage.

==method=wang== When finding the taxonomy of a given query sequence in
the fasta file, the wang method looks at the query sequence kmer by
kmer. The method looks at all taxonomies represented in the template,
and calculates the probability a sequence from a given taxonomy would
contain a specific kmer. Then calculates the probability a query
sequence would be in a given taxonomy based on the kmers it contains,
and assign the query sequence to the taxonomy with the highest
probability. This method also runs a bootstrapping algorithmn to find
the confidence limit of the assignment by randomly choosing with
replacement 1/8 of the kmers in the query and then finding the taxonomy.
This is the method that is implemented by the RDP and is described by
Wang et al. This is the default method in classify.seqs.

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax)

or

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=wang)

    Reading template taxonomy...     DONE.
    Reading template probabilities...     DONE.
    It took 23 seconds get probabilities. 
    Classifying sequences from abrecovery.fasta ...
    Classifying sequence 100
    Classifying sequence 200

    It took 19 secs to classify 242 sequences.

### ksize

The only valid search option with the wang method is kmer and by default
mothur uses kmer size 8. If you would like to change the kmer size you
can use the ksize option:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, 
    taxonomy=silva.bacteria.silva.tax, ksize=6)

### iters

The iters option allows you to specify how many iterations to do when
calculating the bootstrap confidence score for your taxonomy. The
default is 100.

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, iters=1000)

### cutoff

By default, the cutoff value is set to 80. If you set cutoff=0,
classify.seqs will return a full taxonomy for every sequence, regardless
of the bootstrap value for that taxonomic assignment. For example,
running with cutoff=0 will yield the following output:

    AY457915   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Eubacterium_eligens_et_rel.(100);Lachnospira_pectinoschiza(100);unclassified;unclassified;unclassified;unclassified;unclassified;
    AY457914   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Eubacterium_eligens_et_rel.(100);Eubacterium_eligens(99);Eubacterium_eligens(99);unclassified;unclassified;unclassified;unclassified;
    AY457913   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Roseoburia_et_rel.(100);Roseoburia_et_rel.(100);Eubacterium_ramulus_et_rel.(100);uncultured(100);unclassified;unclassified;unclassified;unclassified;
    AY457912   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(92);Eubacterium_eligens_et_rel.(92);Lachnospira_pectinoschiza(54);unclassified;unclassified;unclassified;unclassified;unclassified;
    AY457911   Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);Faecalibacterium(100);Faecalibacterium_prausnitzii(100);unclassified;unclassified;unclassified;unclassified;unclassified;unclassified;
    AY457910   Bacteria(100);Firmicutes(100);Clostridiales(100);Ruminococcus_et_rel.(100);Anaerofilum-Faecalibacterium(100);Faecalibacterium(100);Faecalibacterium_prausnitzii(100);unclassified;unclassified;unclassified;unclassified;unclassified;unclassified;

You will notice that sequence AY457912 has a bootstrap value of 54% for
the assignment to the *Lachnospira pectinoschiza*. This isn\'t much of a
vote of confidence for this assignment. mothur\'s default is set to a
value of 80%, which mirrors the original implementation in the Wang
paper and the general approach to using 80% confidene in bootstrap
values for phylogenetics.:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, cutoff=80)

    AY457915   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Eubacterium_eligens_et_rel.(100);Lachnospira_pectinoschiza(100);unclassified;unclassified;unclassified;unclassified;unclassified;
    AY457914   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Eubacterium_eligens_et_rel.(100);Eubacterium_eligens(99);Eubacterium_eligens(99);unclassified;unclassified;unclassified;unclassified;
    AY457913   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Roseoburia_et_rel.(100);Roseoburia_et_rel.(100);Eubacterium_ramulus_et_rel.(100);uncultured(100);unclassified;unclassified;unclassified;unclassified;
    AY457912   Bacteria(100);Firmicutes(100);Clostridiales(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(100);Johnsonella_et_rel.(92);Eubacterium_eligens_et_rel.(92);unclassified;unclassified;unclassified;unclassified;unclassified;unclassified;

You should notice two things. First, there are no bootstrap values below
80 for any of the taxonomy assignments. Second, the bootstrap values may
change slightly. This is acceptable as the bootstrapping is a randomized
process. The default number of iterations is 100.

### probs

Sometimes you may find the output of bootstrap values with your taxonomy
to be tedious. To get around this you can use the probs option to have
the probabilities excluded from the output:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, cutoff=80, probs=F)

    AY457915    Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Johnsonella_et_rel.;Eubacterium_eligens_et_rel.;Lachnospira_pectinoschiza;unclassified;unclassified;unclassified;unclassified;unclassified;
    AY457914   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Johnsonella_et_rel.;Eubacterium_eligens_et_rel.;Eubacterium_eligens;Eubacterium_eligens;unclassified;unclassified;unclassified;unclassified;
    AY457913   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Roseoburia_et_rel.;Roseoburia_et_rel.;Eubacterium_ramulus_et_rel.;uncultured;unclassified;unclassified;unclassified;unclassified;
    AY457912   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Johnsonella_et_rel.;Eubacterium_eligens_et_rel.;unclassified;unclassified;unclassified;unclassified;unclassified;unclassified;

==method=knn== The k-Nearest Neighbor algorithm involves identifying the
k-most similar sequences in a database that are similar to your
sequence. By default, mothur will find the 10 most similar sequences in
the database. Once mothur has identified the k-most similar sequences,
she will use the taxonomy information for each sequence to determine the
consensus taxonomy. mothur gives you the ability to determine the method
that is used to find the closest matches, the value of k This
classification method can be implemented by the following.

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn)

    Reading in the silva.slv.taxonomy taxonomy...  DONE.
    Generating search database...    DONE.
    It took 6 seconds generate search database. 
    Classifying sequence 100
    Classifying sequence 200

    It took 2 secs to classify 242 sequences.

This will output the following in the abrecovery.taxonomy file:

    AY457915   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;
    AY457914   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;
    AY457913   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Roseoburia_et_rel.;Roseoburia_et_rel.;
    ...

Note: With the knn method using a distance search, mothur will create a

\.match.dist file containing the sequence name, the name of the best
match in the template and the distance.

### numwanted

If you instead only want the value of k to be 3, the following command
would be used:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn, numwanted=3)

    Reading in the silva.slv.taxonomy taxonomy...  DONE.
    Generating search database...    DONE.
    It took 5 seconds generate search database. 
    Classifying sequence 100
    Classifying sequence 200

    It took 2 secs to classify 242 sequences.

This would produce the following output in the abrecovery.taxonomy file:

    AY457915   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;
    AY457914   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;
    AY457913   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Roseoburia_et_rel.;Roseoburia_et_rel.;
    ...

If you are using the [phylotype](phylotype) command as a down
stream analysis, you probably only want to consider 1 nearest neighbor:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn, numwanted=1)

This would produce the following in the abrecovery.taxonomy file:

    AY457915   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Johnsonella_et_rel.;Eubacterium_eligens_et_rel.;Lachnospira_pectinoschiza;
    AY457914   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Johnsonella_et_rel.;Eubacterium_eligens_et_rel.;Eubacterium_eligens;Eubacterium_eligens;
    AY457913   Bacteria;Firmicutes;Clostridiales;Johnsonella_et_rel.;Johnsonella_et_rel.;Roseoburia_et_rel.;Roseoburia_et_rel.;Eubacterium_ramulus_et_rel.;uncultured;

As you should be able to see, these taxonomy lines are considerably
longer and probably should not be as trustworthy as those when you are
considering more neighbors.

===search=kmer and ksize=== By default, the k-nearest neighbor approach
searches for nearest neighbors by kmer searching as is done in the
[align.seqs](align.seqs) command. The default size of kmers
is 8, which seems to be a fairly decent choice regardless of which part
of the 16S rRNA gene you are interested in. As we pointed out in the
development of the [align.seqs](align.seqs) command, kmer
searching is superior in accuracy and speed compared to blast or suffix
tree searching methods.

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn)

or

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn, search=kmer)

If you would like to change the kmer size you use the ksize option:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn, search=kmer, ksize=6)

===search=blast, match, mismatch, gapopen, and gapextend=== Assuming
that you have put the blast binaries into your PATH variable, it is
possible to use blastn to find nearest neighbors. It can be implemented
as:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn, search=blast)

You can also change the various blast-related options for match,
mismatch, gapopen, and gapextend values:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn, search=blast, gapopen=-5, gapextend=-1)

===search=suffix=== An alternative method for finding the k-nearest
neighbors is to use a suffix tree to perform the search. Again, this is
the same method that is available within the
[align.seqs](align.seqs) command. It can be implemented as:

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn, search=suffix)

===search=distance=== An alternative method for finding the k-nearest
neighbors is to find the distance from the query sequence to each
sequence in the template.

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, method=knn, search=distance)

## processors

The processors parameter allows you to run the command with multiple
processors. Default processors=Autodetect number of available processors
and use all available.

    mothur > classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta, taxonomy=silva.bacteria.silva.tax, processors=2)
     
    Reading template taxonomy...     DONE.
    Reading template probabilities...     DONE.
    It took 22 seconds get probabilities. 
    Classifying sequences from abrecovery.fasta ...
    Classifying sequence 100
    Classifying sequence 100

    It took 11 secs to classify 242 sequences.

Note that with one processor it took about 19 sec to do the actual
classification.

## name

The name parameter allows you add a names file with your fasta file, if
you enter multiple fasta files, you must enter matching names files for
them.

## count

The [ count](Count_File) file is similar to the name file in
that it is used to represent the number of duplicate sequences for a
given representative sequence. It can also contain group information.

## group

The group parameter allows you add a group file to be used to generate
group totals in the .summary file. For example, if you ran the command
classify.seqs(fasta=abrecovery.fasta, template=nogap.bacteria.fasta,
taxonomy=silva.bacteria.silva.tax, group=abrecovery.groups) the summary
file would look like:

    taxlevel    rankID  taxon   daughterlevels  total  A   B   C   
    0  0   Root    2   242 84  84  74  
    1  0.1 Bacteria    50  242 84  84  74  
    2  0.1.2   Actinobacteria  38  13  0   13  0   
    3  0.1.2.3 Actinomycetaceae-Bifidobacteriaceae 10  13  0   13  0   
    4  0.1.2.3.7   Bifidobacteriaceae  6   13  0   13  0   
    5  0.1.2.3.7.2 Bifidobacterium_choerinum_et_rel.   8   13  0   13  0   
    6  0.1.2.3.7.2.1   Bifidobacterium_angulatum_et_rel.   1   11  0   11  0   
    7  0.1.2.3.7.2.1.1 unclassified    1   11  0   11  0   
    8  0.1.2.3.7.2.1.1.1   unclassified    1   11  0   11  0   
    9  0.1.2.3.7.2.1.1.1.1 unclassified    1   11  0   11  0   
    10 0.1.2.3.7.2.1.1.1.1.1   unclassified    1   11  0   11  0   
    11 0.1.2.3.7.2.1.1.1.1.1.1 unclassified    1   11  0   11  0   
    12 0.1.2.3.7.2.1.1.1.1.1.1.1   unclassified    1   11  0   11  0   
    6  0.1.2.3.7.2.5   Bifidobacterium_longum_et_rel.  1   2   0   2   0   
    7  0.1.2.3.7.2.5.1 unclassified    1   2   0   2   0   
    8  0.1.2.3.7.2.5.1.1   unclassified    1   2   0   2   0   
    9  0.1.2.3.7.2.5.1.1.1 unclassified    1   2   0   2   0
    ...

so you can see that all the sequences classified to taxon Actinobacteria
are from sample B.

## relabund

The relabund parameter allows you to indicate you want the summary file
values to be relative abundances rather than raw abundances. Default=F.

    taxlevel    rankID  taxon   daughterlevels  total  A   B   C   
    0  0   Root    1   1.000000    1.000000    1.000000    1.000000    
    1  0.1 Bacteria    5   1.000000    1.000000    1.000000    1.000000    
    2  0.1.2   Actinobacteria  1   0.053719    0.000000    0.154762    0.000000    
    3  0.1.2.1 Actinobacteria  1   0.053719    0.000000    0.154762    0.000000    
    4  0.1.2.1.2   Actinobacteridae    1   0.053719    0.000000    0.154762    0.000000    
    5  0.1.2.1.2.2 Bifidobacteriales   1   0.053719    0.000000    0.154762    0.000000    
    6  0.1.2.1.2.2.1   Bifidobacteriaceae  1   0.053719    0.000000    0.154762    0.000000    
    7  0.1.2.1.2.2.1.3 Bifidobacterium 1   0.053719    0.000000    0.154762    0.000000    
    8  0.1.2.1.2.2.1.3.1   unclassified    1   0.053719    0.000000    0.154762    0.000000    
    9  0.1.2.1.2.2.1.3.1.1 unclassified    0   0.053719    0.000000    0.154762    0.000000    
    2  0.1.6   Bacteroidetes   1   0.334711    0.452381    0.166667    0.391892    
    3  0.1.6.1 Bacteroidia 1   0.334711    0.452381    0.166667    0.391892    
    4  0.1.6.1.1   Bacteroidales   2   0.334711    0.452381    0.166667    0.391892    
    5  0.1.6.1.1.2 Bacteroidaceae  1   0.227273    0.440476    0.166667    0.054054    
    6  0.1.6.1.1.2.1   Bacteroides 1   0.227273    0.440476    0.166667    0.054054    
    7  0.1.6.1.1.2.1.1 unclassified    1   0.227273    0.440476    0.166667    0.054054    
    8  0.1.6.1.1.2.1.1.1   unclassified    1   0.227273    0.440476    0.166667    0.054054    
    9  0.1.6.1.1.2.1.1.1.1 unclassified    0   0.227273    0.440476    0.166667    0.054054

## output

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

## printlevel

The printlevel parameter allows you to specify taxlevel of your
\*tax.summary file to print to. Options are 1 to the maz level in the
file. The default is -1, meaning max level. If you select a level
greater than the level your sequences classify to, mothur will print to
the level your max level.

    mothur > classify.seqs(...., printlevel=4)

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

Can\'t find your question? Please feel free to ask questions on our
forum, [https://forum.mothur.org](https://forum.mothur.org).


1\.  **Does the reference need to be aligned?** No, mothur does not
    require an aligned reference to assign a taxonomy. This is because
    it uses k-mers to find the probabilities of the taxonomic
    assignment.

2\.  **What reference should I use to classify?** We provide mothur
    formatted references on the wiki.
    [rdp_reference_files](RDP_reference_files)
    [silva_reference_files](Silva_reference_files)
    [greengenes-formatted_databases](Greengenes-formatted_databases)
    Alternatively, mothur allows you to create your own references as
    long as they are in fasta and taxonomy file format. You can find
    mothur\'s files formats here,
    [file_types](File_Types).

### Common Issues


1\.  **Why are my sequences \'unclassifed\'?** When it comes to
    classification there are two things main things that effect the
    number of unclassified results: the quality of the reads and the
    reference files. The bayesian classifier calculates the
    probabilities of reference sequences kmers being in a given genus
    and then uses those probabilities to classify the sequences. The
    quality of the query sequences affects the ability of the classifier
    to find enough kmers to find a good classification. A poor quality
    sequence is like turning up the noise in a crowded restaurant and
    trying to hear your date\'s father\'s name. Was that John, Tom or
    Ron? Uh oh\... A good reference is also needed for similar reasons.

### How To


1\.  **How do you recommend classifying to the species level?**
    Unfortunately I do not. You will never get species level
    classification if you are using the RDP or Silva references. They
    only go to the genus level. Even the greengenes database only has
    10% or so of sequences with species level names (greengenes hasn't
    been updated in quite a few years). I and many others would contend
    that using 16S and especially a fragment to get a species name is
    asking too much - you need a culture and genome sequencing to do
    that. If someone wanted to give it a shot, they would need to add
    the species level names to the taxonomy strings. Also, they would
    need to add many more sequences that represent each species. Outside
    of a few groups of bacteria where the researchers have carefully
    selected the region (e.g. Lactobacillus or Staphylococcus), I really
    think this would be a lot of work for little/no benefit.

## Revisions

-   1.22.0 Added processors option for Windows users.
-   1.23.0 - mothur couldn\'t handle parentheses in the taxonomy file. -
    [https://forum.mothur.org/viewtopic.php?f=4&t=1370](https://forum.mothur.org/viewtopic.php?f=4&t=1370)
-   1.23.0 - fixed memory leak with Windows paralellization.
-   1.24.0 - mothur will now check if a sequence is reversed before
    classifying.
-   1.25.0 - segfault if no files are given. Should return error message
    instead. - [https://forum.mothur.org/viewtopic.php?f=4&t=1525](https://forum.mothur.org/viewtopic.php?f=4&t=1525)
-   1.28.0 Added count parameter
-   1.28.0 Changed name of \"bayesian\" method to \"wang\"
-   1.28.0 mothur will ignore sequences present in the taxonomy file,
    but not in the reference file.
-   1.28.0 Bug Fix: - if taxonomy file contained file path information
    \"cannot resolve path for\" error was thrown.
-   1.29.0 Bug Fix: - if input directory was given with a group file,
    path was incorrect.
-   1.32.0 Removed extra name checks to speed up reading of taxonomy
    file. -
    [https://forum.mothur.org/viewtopic.php?f=4&p=6608&sid=42525a60989d015feb8c10b2b5342691](https://forum.mothur.org/viewtopic.php?f=4&p=6608&sid=42525a60989d015feb8c10b2b5342691)
-   1.33.0 Added relabund parameter
-   1.37.0 Changes cutoff parameter default to 80. This change in the
    bootstrap threshold reflects the default values in the 454 and MiSeq
    SOPs. [\#192](https://github.com/mothur/mothur/issues/192)
-   1.37.0 Adds output and printlevel parameters
    [\#204](https://github.com/mothur/mothur/issues/204)
    [\#158](https://github.com/mothur/mothur/issues/158)
-   1.37.0 Adds parent taxons to unclassified taxons for outputs
    [\#29](https://github.com/mothur/mothur/issues/29)
-   1.38.0 Removes save option
-   1.39.0 Taxonomy files can now contain spaces in the taxon names.
-   1.39.0 Fixes bug with number of \"taxon\"\_unclassifeds appended to
    taxonomy
-   1.40.0 Allow for () characters in taxonomy definitions.
    [\#350](https://github.com/mothur/mothur/issues/350)
-   1.40.0 Rewrite of threaded code. Default processors=Autodetect
    number of available processors and use all available.
-   1.40.0 Fixes blast path issue.
    [\#403](https://github.com/mothur/mothur/issues/403)
-   1.40.0 Bug Fix: Fixes seeded random issue.
    [\#416](https://github.com/mothur/mothur/issues/416)


