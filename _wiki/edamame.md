---
title: 'EDAMAME'
redirect_from: '/wiki/EDAMAME'
---
The goal of this tutorial is to demonstrate the standard operating
procedure (SOP) that the Schloss lab uses to process their 16S rRNA gene
sequences that are generated using Illumina\'s MiSeq platform using
paired end reads. This particular version of the SOP is made for use
with the [ mothur ami](Mothur_AMI) that we created. The
mothur AMI has a data structure that follows practices akin to those
that are meant to help improve the reproducibility of your research. The
home directory has an R, data, and code directory. Within the data
directory are the references, raw, and mothur directories. The AMI comes
preloaded with a variety of reference files. This SOP is designed to use
the SILVA reference alignment for aligning sequences and the RDP
training set for classification. Also included are the SILVA and
greengenes classificaton training sets. The mothur executable is in the
PATH so you should be able to launch mothur directly from the shell
prompt once you\'ve logged in.

NOTE: Although this is an SOP, it is something of a work in progress and
continues to be modified as we learn more. If you are using this
protocol in a paper, you must cite the Schloss et al. 2013 AEM paper and
cite the date you accessed this page:

Kozich JJ, Westcott SL, Baxter NT, Highlander SK, Schloss PD. (2013):
Development of a dual-index sequencing strategy and curation pipeline
for analyzing amplicon sequence data on the MiSeq Illumina sequencing
platform. Applied and Environmental Microbiology. 79(17):5112-20.

The approach we take is to use index reads to multiplex a large number
of samples (i.e. 384) on a single run. You can also see our latest
[wet-lab sop](https://github.com/SchlossLab/MiSeq_WetLab_SOP) for
generating these libraries. Others have generated similar data but
without the index reads and so the index (aka barcode) sequences are
found at the beginning of each read. This SOP will highlight the
differences in processing between these two approaches. This SOP is
largely the product of a series of manuscripts that we have published
and users are advised to consult these for more details and background
data. The workflow is being divided into several parts shown here in the
table of contents for the tutorial:


## Logistics

Starting out we need to first determine, what is our question? The
Schloss lab is interested in understanding the effect of normal
variation in the gut microbiome on host health. To that end we collected
fresh feces from mice on a daily basis for 365 days post weaning (we\'re
accepting applications). During the first 150 days post weaning (dpw),
nothing was done to our mice except allow them to eat, get fat, and be
merry. We were curious whether the rapid change in weight observed
during the first 10 dpw affected the stability microbiome compared to
the microbiome observed between days 140 and 150. We will address this
question in this tutorial using a combination of OTU, phylotype, and
phylogenetic methods. To make this tutorial easier to execute, we are
providing only part of the data - you are given the flow files for one
animal at 10 time points (5 early and 5 late). In addition, to
sequencing samples from mice fecal material, we resequenced a mock
community composed of genomic DNA from 21 bacterial strains. We will use
the 10 fecal samples to look at how to analyze microbial communities and
the mock community to measure the error rate and its effect on other
analyses.

In the reference above, we described a set of primers that will allow
you to sequence 1536 samples in parallel using only 80 primers (32+48)
and obtain sequence reads that are at least as good as those generated
by 454 sequencing using our [454 sop](454_SOP). Please
consult the supplementary methods of that manuscript for more
information and our wet-lab SOP. All of the data from that study are
available through our server. Sequences come off the MiSeq as pairs of
fastq files with each pair representing the two sets of reads per
sample. fastq files contain both the sequence data and the quality score
data. If you aren\'t getting these files off the sequencer, then you
likely have the software parameters set incorrectly. For this tutorial
you will need several sets of files that are already loaded in the AMI.

-   [ example data from schloss lab](https://mothur.s3.us-east-2.amazonaws.com/wiki/miseqsopdata.zip)
    that will be used with this tutorial. It was extracted from the
    [full
    dataset](https://www.mothur.org/MiSeqDevelopmentData/StabilityNoMetaG.tar)
-   [ SILVA-based bacterial reference
    alignment](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v128.tgz)
-   [ mothur-formatted version of the RDP training set
    (v.16)](https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset16_022016.pds.tgz)

You can easily substitute these choices (and should) for the reference
and taxonomy alignments using the updated [Silva reference
files](Silva_reference_files), [RDP reference
files](RDP_reference_files), and [Greengenes-formatted
databases](Greengenes-formatted_databases). We use the above
files because they\'re compact and do a pretty good job. The various
classification references perform differently with different sample
types so your mileage may vary.

## Getting started

Because of the large size of the original dataset (3.9 GB) we are giving
you 20 of the 362 pairs of fastq files. For example, you will see two
files: F3D0\_S188\_L001\_R1\_001.fastq and
F3D0\_S188\_L001\_R2\_001.fastq. These two files correspond to Female 3
on Day 0 (i.e. the day of weaning). The first and all those with R1
correspond to read 1 while the second and all those with R2 correspond
to the second or reverse read. These sequences are 250 bp and overlap in
the V4 region of the 16S rRNA gene; this region is about 253 bp long. So
looking at the files in the MiSeq\_SOP folder that you\'ve downloaded
you will see 22 fastq files representing 10 time points from Female 3
and 1 mock community. You will also see HMP\_MOCK.v35.fasta which
contains the sequences used in the mock community that we sequenced in
fasta format. Finally you will see a file called stability.files. The
first lines of this file look like:

    F3D0   F3D0_S188_L001_R1_001.fastq F3D0_S188_L001_R2_001.fastq
    F3D141 F3D141_S207_L001_R1_001.fastq   F3D141_S207_L001_R2_001.fastq
    F3D142 F3D142_S208_L001_R1_001.fastq   F3D142_S208_L001_R2_001.fastq
    F3D143 F3D143_S209_L001_R1_001.fastq   F3D143_S209_L001_R2_001.fastq
    F3D144 F3D144_S210_L001_R1_001.fastq   F3D144_S210_L001_R2_001.fastq
    ...

mothur can create this file for you using the
[make.file](make.file) command.

    mothur > make.file(inputdir=data/raw/, type=fastq, prefix=stability)

The first column is the name of the sample. The second column is the
name of the forward read for that sample and the third columns in the
name of the reverse read for that sample. Pretty easy, eh? Finally,
there\'s a batch file included that we\'ll discuss at the end of the
tutorial.

## Reducing sequencing and PCR errors

The first thing we want to do is combine our two sets of reads for each
sample and then to combine the data from all of the samples. This is
done using the [make.contigs](make.contigs) command, which
requires stability.files as input. This command will extract the
sequence and quality score data from your fastq files, create the
reverse complement of the reverse read and then join the reads into
contigs. We have a very simple algorithm to do this. First, we align the
pairs of sequences. Next, we look across the alignment and identify any
positions where the two reads disagree. If one sequence has a base and
the other has a gap, the quality score of the base must be over 25 to be
considered real. If both sequences have a base at that position, then we
require one of the bases to have a quality score 6 or more points better
than the other. If it is less than 6 points better, then we set the
consensus base to an N. Let\'s give it a shot (I\'m using 8 processors,
because my computer has 8 processors, use what you\'ve got)\...

    mothur > make.contigs(file=stability.files, processors=8, inputdir=data/raw, outputdir=data/mothur)

Note that we\'ve used the inputdir option to indicate where the
stability.files and fastq files are located.
[make.contigs](make.contigs) will then output the data to
data/mothur. As the command runs, the first thing you\'ll see is that it
processes the fastq files to generate the individual fasta and qual
files. Then it will go through each set of files and make the contigs.
This took about 84 seconds on my computer. Clearly, it will take longer
for a full dataset. In the end it will tell you the number of sequences
in each sample:

    Group count: 
    F3D0   7793
    F3D1   5869
    F3D141 5958
    F3D142 3183
    F3D143 3178
    F3D144 4827
    F3D145 7377
    F3D146 5021
    F3D147 17070
    F3D148 12405
    F3D149 13083
    F3D150 5509
    F3D2   19620
    F3D3   6758
    F3D5   4448
    F3D6   7989
    F3D7   5129
    F3D8   5294
    F3D9   7070
    Mock   4779
    Total of all groups is 152360

At the very end it will give you the following warning message:

    [warning]: your sequence names contained ':'.  I changed them to '_' to avoid problems in your downstream analysis.

Don\'t worry too much about this. The typical sequence name will look
like \"M00967:43:000000000-A3JHG:1:1101:18327:1699\". Aside being
freakishly long, these sequence names contain \":\", which will cause a
lot of headaches down the road if you are crazy enough to try and create
phylogenetic trees from these sequences. So to prevent this headache for
you, we convert all of the \":\" characters to \"\_\" characters. This
command will also produce several files that you will need down the
road: stability.trim.contigs.fasta and stability.contigs.groups. These
contain the sequence data and group identity for each sequence. The
stability.contigs.report file will tell you something about the contig
assembly for each read. Let\'s see what these sequences look like using
the [summary.seqs](summary.seqs) command:

    mothur > summary.seqs(fasta=data/mothur/stability.trim.contigs.fasta)
     
           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   248 248 0   3   1
    2.5%-tile: 1   252 252 0   3   3810
    25%-tile:  1   252 252 0   4   38091
    Median:    1   252 252 0   4   76181
    75%-tile:  1   253 253 0   5   114271
    97.5%-tile:    1   253 253 6   6   148552
    Maximum:   1   503 502 249 243 152360
    Mean:      1   252.811 252.811 0.697867    4.44854
    # of Seqs: 152360

This tells us that we have 152360 sequences that for the most part vary
between 248 and 253 bases. Interestingly, the longest read in the
dataset is 502 bp. Be suspicious of this. Recall that the reads are
supposed to be 251 bp each. This read clearly didn\'t assemble well (or
at all). Also, note that at least 2.5% of our sequences had some
ambiguous base calls. We\'ll take care of these issues in the next step
when we run [screen.seqs](screen.seqs).

    mothur > screen.seqs(fasta=stability.trim.contigs.fasta, group=stability.contigs.groups, maxambig=0, maxlength=275, maxhomop=8, inputdir=data/mothur)

This implementation of the command will remove any sequences with
ambiguous bases and anything longer than 275 bp. There\'s another way to
run this using the output from summary.seqs:

    mothur > screen.seqs(fasta=stability.trim.contigs.fasta, group=stability.contigs.groups, summary=stability.trim.contigs.summary, maxambig=0, maxlength=275, maxhomop=8, inputdir=data/mothur)

This may be faster because the summary.seqs output file already has the
number of ambiguous bases and sequence length calculated for your
sequences. Also, mothur is smart enough to remember that we used 8
processors in make.contigs and so it will use that throughout your
current session. To see what else mothur knows about you, run the
following:

    mothur > get.current()

    fasta=data/mothur/stability.trim.contigs.good.fasta
    group=data/mothur/stability.contigs.good.groups
    qfile=data/mothur/stability.trim.contigs.qual
    contigsreport=data/mothur/stability.contigs.report
    processors=8
    summary=data/mothur/stability.trim.contigs.summary
    file=data/raw/stability.files

    Current input directory saved by mothur: data/mothur/
    Current output directory saved by mothur: data/mothur/
    Current default directory saved by mothur: /home/ubuntu/mothur/mothur/
    Current working directory: /home/mothur/

What this means is that mothur remembers your latest fasta file and
group file as well as the number of processors you have. It is also
keeping track of your input and output directories. So you could run:

    mothur > summary.seqs(fasta=stability.trim.contigs.good.fasta, inputdir=data/mothur, outputdir=data/mothur)
    mothur > summary.seqs(fasta=data/mothur/stability.trim.contigs.good.fasta)
    mothur > summary.seqs(fasta=stability.trim.contigs.good.fasta)
    mothur > summary.seqs(fasta=current)
    mothur > summary.seqs()

and you would get the same output for each. For the purposes of this
tutorial we will write out the names of the files. At this point our
sequencing error rate has probably dropped more than an order of
magnitude and we have 128865 sequences. Let\'s press on\...

## Processing improved sequences

We anticipate that many of our sequences are duplicates of each other.
Because it\'s computationally wasteful to align the same thing a
bazillion times, we\'ll unique our sequences using the
[unique.seqs](unique.seqs) command:

    mothur > unique.seqs(fasta=stability.trim.contigs.good.fasta)

If two sequences have the same identical sequence, then they\'re
considered duplicates and will get merged. In the screen output there
are two columns - the first is the number of sequences characterized and
the second is the number of unique sequences remaining. So after running
unique.seqs we have gone from 128865 to 16421 sequences. This will make
our life much easier. Another thing to do to make our lives easier is to
simplify the names and group files. If you look at the most recent
versions of those files you\'ll see together they are 13.6 MB. This may
not seem like much, but with a full MiSeq run those long sequence names
can add up and make life tedious. So we\'ll run
[count.seqs](count.seqs) to generate a table where the rows
are the names of the unique sequences and the columns are the names of
the groups. The table is then filled with the number of times each
unique sequence shows up in each group.

    mothur > count.seqs(name=stability.trim.contigs.good.names, group=stability.contigs.good.groups)

This will generate a file called
stability.trim.contigs.good.count\_table. In subsequent commands we\'ll
use it by using the count option:

    mothur > summary.seqs(count=stability.trim.contigs.good.count_table)

    Using stability.trim.contigs.good.unique.fasta as input file for the fasta parameter.

    Using 8 processors.
      
           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   250 250 0   3   1
    2.5%-tile: 1   252 252 0   3   3222
    25%-tile:  1   252 252 0   4   32217
    Median:    1   252 252 0   4   64433
    75%-tile:  1   253 253 0   5   96649
    97.5%-tile:    1   253 253 0   6   125644
    Maximum:   1   270 270 0   8   128865
    Mean:  1   252.462 252.462 0   4.36662
    # of unique seqs:  16421
    total # of seqs:   128865

Cool, right? Now we need to align our sequences to the reference
alignment. Again we can make our lives a bit easier by making a database
customized to our region of interest using the
[pcr.seqs](pcr.seqs) command. To run this command you need to
have the reference database (silva.bacteria.fasta) and know where in
that alignment your sequences start and end. To remove the leading and
trailing dots we will set keepdots to false. You could also run this
command for different coordinates using your [primers of
interest](/blog/2016/Customization-for-your-region/):

    mothur > pcr.seqs(fasta=data/references/silva.seed_v128.align, start=11894, end=25319, keepdots=F)

Let\'s rename it to something more useful using the
[system](system) command:

    mothur > system(mv data/references/silva.seed_v128.pcr.align data/references/silva.v4.fasta)

Let\'s take a look at what we\'ve made:

    mothur > summary.seqs(fasta=data/references/silva.v4.fasta)

           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   11550   260 0   3   1
    2.5%-tile: 1   13425   292 0   4   281
    25%-tile:  1   13425   293 0   4   2804
    Median:    1   13425   293 0   5   5607
    75%-tile:  1   13425   294 0   6   8410
    97.5%-tile:    1   13425   461 1   6   10933
    Maximum:   3   13425   1122    5   9   11213
    Mean:  1.00098 13424.8 330.863 0.0667975   4.87086
    # of Seqs: 11213

Now we have a customized reference alignment to align our sequences to.
The nice thing about this reference is that instead of being 50,000
columns wide, it is now 13,425 columns wide which will save our hard
drive some space and should improve the overall alignment quality.
We\'ll do the alignment with [align.seqs](align.seqs):

    mothur > align.seqs(fasta=stability.trim.contigs.good.unique.fasta, reference=data/references/silva.v4.fasta)

This should be done in a manner of seconds and we can run
[summary.seqs](summary.seqs) again:

    mothur > summary.seqs(fasta=stability.trim.contigs.good.unique.align, count=stability.trim.contigs.good.count_table)

    Using 8 processors.
     
           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1250    10693   250 0   3   1
    2.5%-tile: 1968    11550   252 0   3   3222
    25%-tile:  1968    11550   252 0   4   32217
    Median:    1968    11550   252 0   4   64433
    75%-tile:  1968    11550   253 0   5   96649
    97.5%-tile:    1968    11550   253 0   6   125644
    Maximum:   1977    13400   270 0   8   128865
    Mean:  1967.99 11550   252.462 0   4.36662
    # of unique seqs:  16421
    total # of seqs:   128865

So what does this mean? You\'ll see that the bulk of the sequences start
at position 1968 and end at position 11550. Some sequences start at
position 1250 or 1968 and end at 10693 or 13400. These deviants from the
mode positions are likely due to an insertion or deletion at the
terminal ends of the alignments. Sometimes you\'ll see sequences that
start and end at the same position indicating a very poor alignment,
which is generally due to non-specific amplification. To make sure that
everything overlaps the same region we\'ll re-run screen.seqs to get
sequences that start at or before position 1968 and end at or after
position 11550. Note that we need the count table so that we can update
the table for the sequences we\'re removing and we\'re also using the
summary file so we don\'t have to figure out again all the start and
stop positions:

    mothur > screen.seqs(fasta=stability.trim.contigs.good.unique.align, count=stability.trim.contigs.good.count_table, summary=stability.trim.contigs.good.unique.summary, start=1968, end=11550)

    mothur > summary.seqs(fasta=current, count=current)

    Using stability.trim.contigs.good.good.count_table as input file for the count parameter.
    Using stability.trim.contigs.good.unique.good.align as input file for the fasta parameter.

    Using 8 processors.
     
           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1965    11550   250 0   3   1
    2.5%-tile: 1968    11550   252 0   3   3210
    25%-tile:  1968    11550   252 0   4   32092
    Median:    1968    11550   252 0   4   64183
    75%-tile:  1968    11550   253 0   5   96274
    97.5%-tile:    1968    11550   253 0   6   125156
    Maximum:   1968    13400   270 0   8   128365
    Mean:  1968    11550   252.464 0   4.36725
    # of unique seqs:  16210
    total # of seqs:   128365

Now we know our sequences overlap the same alignment coordinates, we
want to make sure they only overlap that region. So we\'ll filter the
sequences to remove the overhangs at both ends. Since we\'ve done
paired-end sequencing, this shouldn\'t be much of an issue, but
whatever. In addition, there are many columns in the alignment that only
contain gap characters (i.e. \"-\"). These can be pulled out without
losing any information. We\'ll do all this with
[filter.seqs](filter.seqs):

    mothur > filter.seqs(fasta=stability.trim.contigs.good.unique.good.align, vertical=T, trump=.)

At the end of running the command we get the following information:

    Length of filtered alignment: 370
    Number of columns removed: 13055
    Length of the original alignment: 13425
    Number of sequences used to construct filter: 16210

This means that our initial alignment was 13425 columns wide and that we
were able to remove 13055 terminal gap characters using trump=. and
vertical gap characters using vertical=T. The final alignment length is
370 columns. Because we\'ve perhaps created some redundancy across our
sequences by trimming the ends, we can re-run
[unique.seqs](unique.seqs):

    mothur > unique.seqs(fasta=stability.trim.contigs.good.unique.good.filter.fasta, count=stability.trim.contigs.good.good.count_table)

This identified 3 duplicate sequences that we\'ve now merged with
previous unique sequences. The next thing we want to do to further
de-noise our sequences is to pre-cluster the sequences using the
[pre.cluster](pre.cluster) command allowing for up to 2
differences between sequences. This command will split the sequences by
group and then sort them by abundance and go from most abundant to least
and identify sequences that are within 2 nt of each other. If they are
then they get merged. We generally favor allowing 1 difference for every
100 bp of sequence:

    mothur > pre.cluster(fasta=stability.trim.contigs.good.unique.good.filter.unique.fasta, count=stability.trim.contigs.good.unique.good.filter.count_table, diffs=2)

We now have 5710 unique sequences. At this point we have removed as much
sequencing error as we can and it is time to turn our attention to
removing chimeras. We\'ll do this using the VSEARCH algorithm that is
called within mothur using the
[chimera.vsearch](chimera.vsearch) command. Again, this
command will split the data by sample and check for chimeras. Our
preferred way of doing this is to use the abundant sequences as our
reference. In addition, if a sequence is flagged as chimeric in one
sample, the default (dereplicate=F) is to remove it from all samples.
Our experience suggests that this is a bit aggressive since we\'ve seen
rare sequences get flagged as chimeric when they\'re the most abundant
sequence in another sample. This is how we do it:

    mothur > chimera.vsearch(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.count_table, dereplicate=t)

Running chimera.vsearch with the count file will remove the chimeric
sequences from the count file. But you still need to remove those
sequences from the fasta file. We do this using
[remove.seqs](remove.seqs):

    mothur > remove.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, accnos=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.accnos)

Running summary.seqs we see what we\'re left with:

    mothur > summary.seqs(fasta=current, count=current)
     
           Start   End NBases  Ambigs  Polymer NumSeqs
    Minimum:   1   370 249 0   3   1
    2.5%-tile: 1   370 252 0   3   2948
    25%-tile:  1   370 252 0   4   29471
    Median:    1   370 252 0   4   58942
    75%-tile:  1   370 253 0   5   88413
    97.5%-tile:    1   370 253 0   6   114936
    Maximum:   1   370 255 0   8   117883
    Mean:  1   370 252.465 0   4.37597
    # of unique seqs:  2297
    total # of seqs:   117883

Note that we went from 128,365 to 117,883 sequences for a reduction of

8\.2%; this is a reasonable number of sequences to be flagged as
chimeric. As a final quality control step, we need to see if there are
any \"undesirables\" in our dataset. Sometimes when we pick a primer set
they will amplify other stuff that gets to this point in the pipeline
such as 18S rRNA gene fragments or 16S rRNA from Archaea, chloroplasts,
and mitochondria. There\'s also just the random stuff that we want to
get rid of. Now you may say, \"But wait I want that stuff\". Fine. But,
the primers we use, are only supposed to amplify members of the Bacteria
and if they\'re hitting Eukaryota or Archaea, then its a mistake. Also,
realize that chloroplasts and mitochondria have no functional role in a
microbial community. But I digress. Let\'s go ahead and classify those
sequences using the Bayesian classifier with the
[classify.seqs](classify.seqs) command:

    mothur > classify.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table, reference=data/references/trainset16_022016.pds.fasta, taxonomy=data/references/trainset16_022016.pds.tax, cutoff=80)

Now that everything is classified we want to remove our undesirables. We
do this with the [remove.lineage](remove.lineage) command:

    mothur > remove.lineage(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.taxonomy, taxon=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota)

Also of note is that \"unknown\" only pops up as a classification if the
classifier cannot classify your sequence to one of the domains. If you
run summary.seqs you\'ll see that we now have 2281 unique sequences and
a total of 118150 total sequences. This means about 350 of our sequences
were in these various groups. Now, to create an updated taxonomy summary
file that reflects these removals we use the
[summary.tax](summary.tax) command:

    mothur > summary.tax(taxonomy=current, count=current)

This creates a pick.tax.summary file with the undesirables removed. At
this point we have curated our data as far as possible and we\'re ready
to see what our error rate is.

## Assessing error rates

Measuring the error rate of your sequences is something you can only do
if you have co-sequenced a mock community. This is something we include
for every 95 samples we sequence. You should too because it will help
you gauge your error rates and allow you to see how well your curation
is going and whether something is wrong with your sequencing set up.
First we want to pull the sequences out that were from our \"Mock\"
sample using the [get.groups](get.groups) command:

    mothur > get.groups(count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.count_table, fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.fasta, groups=Mock)

    Selected 58 sequences from your fasta file.
    Selected 4046 sequences from your count file.

This tells us that we had 58 unique sequences and a total of 4046 total
sequences in our Mock sample. We can now use the
[seq.error](seq.error) command to measure the error rates:

    mothur > seq.error(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table, reference=data/references/HMP_MOCK.fasta, aligned=F)

    Overall error rate:    6.60944e-05
    Errors Sequences
    0  3998
    1  2
    2  1
    3  2
    4  1
    5  0
    6  0
    7  0
    8  0
    9  0
    10 0
    11 2
    12 0
    13 0
    14 0
    15 0
    16 0
    17 0
    18 0
    19 0
    20 0
    21 0
    22 0
    23 0
    24 0
    25 0
    26 0
    27 0
    28 0
    29 0
    30 0
    31 1

That rocks, eh? Our error rate is 0.0066%. We can now cluster the
sequences into OTUs to see how many spurious OTUs we have:

    mothur > dist.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.fasta, cutoff=0.03)
    mothur > cluster(column=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.dist, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table)
    mothur > make.shared(list=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.list, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table, label=0.03)
    mothur > rarefaction.single(shared=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.shared)

This string of commands will produce a file for you called
stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti\_mcc.groups.rarefaction.
Open it. You\'ll see that for 4049 sequences, we\'d have 36 OTUs from
the Mock community. This number of course includes some stealthy
chimeras that escaped our detection methods. If we used 3000 sequences,
we would have about 32 OTUs. In a perfect world with no chimeras and no
sequencing errors, we\'d have 20 OTUs. This is not a perfect world. But
this is pretty darn good!

## Preparing for analysis

We\'re almost to the point where you can have some fun with your data
(I\'m already having fun, aren\'t you?). We\'d like to do two things-
assign sequences to OTUs and phylotypes. First, we want to remove the
Mock sample from our dataset using the
[remove.groups](remove.groups) command:

    mothur > remove.groups(count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.count_table, fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.fasta, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.taxonomy, groups=Mock)

### OTUs

Now we have a couple of options for clustering sequences into OTUs. For
a small dataset like this, we can do the traditional approach using
[dist.seqs](dist.seqs) and [cluster](cluster):

    mothur > dist.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.fasta, cutoff=0.03)
    mothur > cluster(column=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.dist, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table)

Clustering
stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.dist

    iter   time    label   num_otus    cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr accuracy    mcc f1score
    0  0   0.03    2243    0.03    0   2492482 0   21921   0   1   0   0.991282    0.991282    0   0   
    1  0   0.03    528 0.03    18333   2490660 1822    3588    0.836321    0.999269    0.909601    0.998561    0.0903994   0.997848    0.871121    0.871423    
    2  0   0.03    496 0.03    19114   2490560 1922    2807    0.871949    0.999229    0.908633    0.998874    0.0913672   0.998119    0.889157    0.889913    
    3  0   0.03    490 0.03    19144   2490560 1922    2777    0.873318    0.999229    0.908763    0.998886    0.0912371   0.998131    0.889925    0.890688    
    4  0   0.03    488 0.03    19152   2490554 1928    2769    0.873683    0.999226    0.908539    0.998889    0.0914611   0.998132    0.890001    0.89077 

The alternative is to use our [cluster.split](cluster.split)
command. In this approach, we use the taxonomic information to split the
sequences into bins and then cluster within each bin. In our testing,
the MCC values when splitting the datasets at the class and genus levels
were within 98.0 and 93.0%, respectively, of the MCC values obtained
from the entire test dataset. These decreases in MCC value resulted in
the formation of as many as 4.7 and 22.5% more OTUs, respectively, than
were observed from the entire dataset. The use of the cluster splitting
heuristic was probably not worth the loss in clustering quality.
However, as datasets become larger, it may be necessary to use the
heuristic to clustering the data into OTUs. The advantage of the
[cluster.split](cluster.split) approach is that it should be
faster, use less memory, and can be run on multiple processors. In an
ideal world we would prefer the traditional route because \"Trad is
rad\", but we also think that kind of humor is funny\.... In this
command we use taxlevel=4, which corresponds to the level of Order.

    mothur > cluster.split(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.taxonomy, splitmethod=classify, taxlevel=4, cutoff=0.03)

Next we want to know how many sequences are in each OTU from each group
and we can do this using the [make.shared](make.shared)
command. Here we tell mothur that we\'re really only interested in the

0\.03 cutoff level:

    mothur > make.shared(list=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.list, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table, label=0.03)

We probably also want to know the taxonomy for each of our OTUs. We can
get the consensus taxonomy for each OTU using the
[classify.otu](classify.otu) command:

    mothur > classify.otu(list=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.list, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.taxonomy, label=0.03)

Opening
stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti\_mcc.0.03.cons.taxonomy
you\'ll see something that looks like\...

    OTU    Size    Taxonomy
    Otu001 12287   Bacteria(100);Bacteroidetes(100);Bacteroidia(100);Bacteroidales(100);Porphyromonadaceae(100);Porphyromonadaceae_unclassified(100);
    Otu002 8886    Bacteria(100);Bacteroidetes(100);Bacteroidia(100);Bacteroidales(100);Porphyromonadaceae(100);Porphyromonadaceae_unclassified(100);
    Otu003 7791    Bacteria(100);Bacteroidetes(100);Bacteroidia(100);Bacteroidales(100);Porphyromonadaceae(100);Porphyromonadaceae_unclassified(100);
    Otu004 7477    Bacteria(100);Bacteroidetes(100);Bacteroidia(100);Bacteroidales(100);Porphyromonadaceae(100);Porphyromonadaceae_unclassified(100);
    Otu005 7450    Bacteria(100);Bacteroidetes(100);Bacteroidia(100);Bacteroidales(100);Porphyromonadaceae(100);Porphyromonadaceae_unclassified(100);
    Otu006 6619    Bacteria(100);Bacteroidetes(100);Bacteroidia(100);Bacteroidales(100);Porphyromonadaceae(100);Porphyromonadaceae_unclassified(100);
    Otu007 6305    Bacteria(100);Bacteroidetes(100);Bacteroidia(100);Bacteroidales(100);Bacteroidaceae(100);Bacteroides(100);
    Otu008 5340    Bacteria(100);Bacteroidetes(100);Bacteroidia(100);Bacteroidales(100);Rikenellaceae(100);Alistipes(100);
    ...

This is telling you that Otu008 was observed 5340 times in your samples
and that all of the sequences (100%) were classified as being members of
the Alistipes.

### Phylotypes

For some analyses you may desire to bin your sequences in to phylotypes
according to their taxonomic classification. We can do this using the
[phylotype](phylotype) command:

    mothur > phylotype(taxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.taxonomy)

The cutoff numbering is a bit different for phylotype compared to
cluster/cluster.split. Here you see 1 through 6 listed; these correspond
to Genus through Kingdom levels, respectively. So if you want the
genus-level shared file we\'ll do the following:

    mothur > make.shared(list=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.tx.list, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table, label=1)

We also want to know who these OTUs are and can run
[classify.otu](classify.otu) on our phylotypes:

    mothur > classify.otu(list=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.tx.list, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.taxonomy, label=1)

### Phylogenetic

If you are interested in using methods that depend on a phylogenetic
tree such as calculating phylogenetic diversity or the unifrac commands,
you\'ll need to generate a tree. This process gets mess as your number
of sequences increases. But here\'s how we\'d do it using
[dist.seqs](dist.seqs) and
[clearcut](clearcut)\...

    mothur > dist.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.fasta, output=lt, processors=8)
    mothur > clearcut(phylip=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.phylip.dist)

## Analysis

Moving on, let\'s do something more interesting and actually analyze our
data. We\'ll focus on the OTU-based dataset. The analysis using the
phylotype-based analysis is essentially the same. Also, remember that
our initial question had to do with the stability and change in
community structure in these samples when comparing early and late
samples. Keep in mind that the group names have either a F or M (sex of
animal) followed by a number (number of animal) followed by a D and a
three digit number (number of days post weaning). To keep things simple,
let\'s rename our count, tree, shared and consensus taxonomy files.

    mothur > rename.file(count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.pick.count_table, tree=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.phylip.tre, shared=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.shared, constaxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.0.03.cons.taxonomy)

    Current files saved by mothur:
    accnos=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.accnos
    column=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.dist
    fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.fasta
    group=stability.contigs.good.groups
    list=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.tx.list
    name=stability.trim.contigs.good.names
    phylip=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.phylip.dist
    qfile=stability.trim.contigs.qual
    rabund=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.tx.rabund
    sabund=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.tx.sabund
    shared=stablility.opti_mcc.shared
    taxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.taxonomy
    constaxonomy=stability.cons.taxonomy
    tree=stability.tre
    count=stability.count_table
    processors=4
    summary=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.summary

We now want to do is see how many sequences we have in each sample.
We\'ll do this with the [count.groups](count.groups) command:

    mothur > count.groups(shared=stability.opti_mcc.shared)

We see that our smallest sample had 2391 sequences in it. That is a
reasonable number. Despite what some say, subsampling and rarefying your
data is an important thing to do. We\'ll generate a subsampled file for
our analyses with the [sub.sample](sub.sample) command:

    mothur > sub.sample(shared=stability.opti_mcc.shared, size=2391)

## OTU-based analysis

#### Alpha diversity

Let\'s start our analysis by analyzing the alpha diversity of the
samples. First we will generate rarefaction curves describing the number
of OTUs observed as a function of sampling effort. We\'ll do this with
the [rarefaction.single](rarefaction.single) command:

    mothur > rarefaction.single(shared=stability.opti_mcc.shared, calc=sobs, freq=100)

This will generate files ending in \*.rarefaction, which again can be
plotted in your favorite graphing software package. Alas, rarefaction is
not a measure of richness, but a measure of diversity. If you consider
two communities with the same richness, but different evenness then
after sampling a large number of individuals their rarefaction curves
will asymptote to the same value. Since they have different evennesses
the shapes of the curves will differ. Therefore, selecting a number of
individuals to cutoff the rarefaction curve isn\'t allowing a researcher
to compare samples based on richness, but their diversity. Finally,
let\'s get a table containing the [ number of
sequences](Nseqs), the sample
[coverage](coverage), the number of [ observed
OTUs](Sobs), and the [ Inverse Simpson diversity
estimate](invsimpson) using the
[summary.single](summary.single) command. To standardize
everything, let\'s randomly select 2391 sequences from each sample 1000
times and calculate the average (note: that if we set subsample=T, then
it would use the size of the smallest library):

    mothur > summary.single(shared=stability.opti_mcc.shared, calc=nseqs-coverage-sobs-invsimpson, subsample=2391)

These data will be outputted to a table in a file called
stability.an.groups.ave-std.summary. Interestingly, the sample coverages
were all above 97%, indicating that we did a pretty good job of sampling
the communities. Plotting the richness or diversity of the samples would
show that there was little difference between the different animals or
between the early and late time points. You could follow this up with a
repeated-measures ANOVA and find that there was no significant
difference based on sex or early vs. late.

#### Beta diversity measurements

Now we\'d like to compare the membership and structure of the various
samples using an OTU-based approach. Let\'s start by generating a
heatmap of the relative abundance of each OTU across the 24 samples
using the [heatmap.bin](heatmap.bin) command and log2 scaling
the relative abundance values. Because there are so many OTUs, let\'s
just look at the top 50 OTUs:

    mothur > heatmap.bin(shared=stability.opti_mcc.0.03.subsample.shared, scale=log2, numotu=50) 

This will generate an SVG-formatted file that can be visualized in
Safari or manipulated in graphics software such as Adobe Illustrator.
Needless to say these heatmaps can be a bit of Rorshock. A legend can be
found at the bottom left corner of the heat map. If you really want a
heat map, you\'d be better off using an R package. Now let\'s calculate
the similarity of the membership and structure found in the various
samples. We\'ll do this with the [dist.shared](dist.shared)
command that will allow us to rarefy our data to a common number of
sequences.

    mothur > dist.shared(shared=stability.opti_mcc.shared, calc=thetayc-jclass, subsample=2391)

We can visualize those distances as similarities in a heatmap with the [
Jaccard](Jclass) and [thetayc](thetayc)
coefficients. We will do this with the
[heatmap.sim](heatmap.sim) command:

    mothur > heatmap.sim(phylip=stability.opti_mcc.thetayc.0.03.lt.ave.dist)
    mothur > heatmap.sim(phylip=stability.opti_mcc.jclass.0.03.lt.ave.dist)

The output will be in two SVG-formatted files called
stability.opti\_mcc.thetayc.0.03.lt.ave.heatmap.sim.svg and
stability.opti\_mcc.jclass.0.03.lt.ave.heatmap.sim.svg. In all of these
heatmaps the red colors indicate communities that are more similar than
those with black colors. When generating Venn diagrams we are limited by
the number of samples that we can analyze simultaneously. Let\'s take a
look at the Venn diagrams for the first 4 time points of female 3 using
the [venn](venn) command:

    mothur > venn(shared=stability.opti_mcc.0.03.subsample.shared, groups=F3D0-F3D1-F3D2-F3D3)

This generates an two 4-way Venn diagrams. This shows that there were a
total of 209 OTUs observed between the 4 time points. Only 70 of those
OTUs were shared by all four time points. We could look deeper at the
shared file to see whether those OTUs were numerically rare or just had
a low incidence. Next, let\'s generate a dendrogram to describe the
similarity of the samples to each other. We will generate a dendrogram
using the [jclass](jclass) and [thetayc](thetayc)
calculators within the [tree.shared](tree.shared) command:

    mothur > tree.shared(phylip=stability.opti_mcc.thetayc.0.03.lt.ave.dist)

This command generates a newick-formatted tree file -
stability.opti\_mcc.thetayc.0.03.lt.ave.tre - that can be visualized in
software like TreeView or FigTree. Inspection of the tree shows that the
early and late communities cluster with themselves to the exclusion of
the others. We can test to deterine whether the clustering within the
tree is statistically significant or not using by choosing from the
[parsimony](parsimony),
[unifrac.unweighted](unifrac.unweighted), or
[unifrac.weighted](unifrac.weighted) commands. To run these
we will first need to create a design file that indicates which
treatment each sample belongs to. There is a file called
mouse.time.design and is located in the data/raw directory. It looks
like this:

    group  time
    F3D0   Early
    F3D1   Early
    F3D141 Late
    F3D142 Late
    F3D143 Late
    F3D144 Late
    F3D145 Late
    F3D146 Late
    F3D147 Late
    F3D148 Late
    F3D149 Late
    F3D150 Late
    F3D2   Early
    F3D3   Early
    F3D5   Early
    F3D6   Early
    F3D7   Early
    F3D8   Early
    F3D9   Early

Using the parsimony command let\'s look at the pairwise comparisons.
Specifically, let\'s focus on the early vs. late comparisons for each
mouse:

    mothur > parsimony(tree=stability.opti_mcc.thetayc.0.03.lt.ave.tre, group=data/raw/mouse.time.design,  groups=all)

    Tree#  Groups  ParsScore   ParsSig
    1  Early-Late  1   <0.001

There was clearly a significant difference between the clustering of the
early and late time points. Recall that this method ignores the branch
length.

The two distance matrices that we generated earlier (i.e.
stability.opti\_mcc.jclass.0.03.lt.ave.dist and
stability.opti\_mcc.thetayc.0.03.lt.ave.dist) can then be visualized
using the \[\[pcoa\] or [nmds](nmds) plots. Principal
Coordinates (PCoA) uses an eigenvector-based approach to represent
multidimensional data in as few dimesnsions as possible. Our data is
highly dimensional (\~9 dimensions).

    mothur > pcoa(phylip=stability.opti_mcc.thetayc.0.03.lt.ave.dist)

The output of these commands are three files ending in \*dist, \*pcoa,
and \*pcoa.loadings. The stability.an.thetayc.0.03.lt.ave.pcoa.loadings
file will tell you what fraction of the total variance in the data are
represented by each of the axes. In this case the first and second axis
represent about 45 and 14% of the variation (59% of the total) for the
thetaYC distances. The output to the screen indicates that the R-squared
between the original distance matrix and the distance between the points
in 2D PCoA space was 0.89, but that if you add a third dimension the
R-squared value increases to 0.98. All in all, not bad. Alternatively,
non-metric multidimensional scaling (NMDS) tries to preserve the
distance between samples using a user defined number of dimensions. We
can run our data through NMDS with 2 dimensions with the following
commands

    mothur > nmds(phylip=stability.opti_mcc.thetayc.0.03.lt.ave.dist)

Opening the stability.opti\_mcc.thetayc.0.03.lt.ave.nmds.stress file we
can inspect the stress and R\^2 values, which describe the quality of
the ordination. Each line in this file represents a different iteration
and the configuration obtained in the iteration with the lowest stress
is reported in the stability.opti\_mcc.thetayc.0.03.lt.ave.nmds.axes
file. In this file we find that the lowest stress value was 0.11 with an
R-squared value of 0.95; that stress level is actually pretty good. You
can test what hapens with three dimensions by the following:

    mothur > nmds(phylip=stability.opti_mcc.thetayc.0.03.lt.ave.dist, mindim=3, maxdim=3)

The stress value drops to 0.05 and the R2 value goes up to 0.99. Not
bad. In general, you would like a stress value below 0.20 and a value
below 0.10 is even better. Thus, we can conclude that, NMDS is better
than PCoA. We can plot the three dimensions of the NMDS data by plotting
the contents of
stability.opti\_mcc.subsample.pick.thetayc.0.03.lt.nmds.axes. Again, it
is clear that the early and late samples cluster separately from each
other. Ultimately, ordination is a data visualization tool. We might ask
if the spatial separation that we see between the early and late plots
in the NMDS plot is statistically significant. To do this we have two
statistical tools at our disposal. The first analysis of molecular
variance ([amova](amova)), tests whether the centers of the
clouds representing a group are more separated than the variation among
samples of the same treatment. This is done using the distance matrices
we created earlier and does not actually use ordination.

    mothur > amova(phylip=stability.opti_mcc.thetayc.0.03.lt.ave.dist, design=data/raw/mouse.time.design)
     
    SS 0.62695 0.54903 1.17598
    df 1   17  18
    MS 0.62695 0.0322959

    Fs:    19.4127
    p-value: <0.001*

Here we see from the AMOVA that the \"cloud\" early and late time points
has a significantly different centroid for this mouse. Thus, the
observed separation in early and late samples is statistically
significant. We can also see whether the variation in the early samples
is significantly different from the variation in the late samples using
the [homova](homova) command:

    mothur > homova(phylip=stability.opti_mcc.thetayc.0.03.lt.ave.dist, design=data/raw/mouse.time.design)

    HOMOVA BValue  P-value SSwithin/(Ni-1)_values
    Early-Late 7.82556 <0.001*  0.0603274   0.00737893

We see that there is a significant difference in the variation with the
early samples having a larger amount of variation (0.060) than the late
samples (0.007). This was what we found in the original study - the
early samples were less stable than the late samples.

Next, we might ask which OTUs are responsible for shifting the samples
along the two axes. We can determine this by measuring the correlation
of the relative abundance of each OTU with the two axes in the NMDS
dataset. We do this with the [corr.axes](corr.axes) command:

    mothur > corr.axes(axes=stability.opti_mcc.thetayc.0.03.lt.ave.pcoa.axes, shared=stability.opti_mcc.0.03.subsample.shared, method=spearman, numaxes=3)

This command generates the
stability.opti\_mcc.0.03subsample.0.03.pick.spearman.corr.axes file. The
data for the first five OTUs look like this\...

    OTU    axis1   p-value axis2   p-value axis3   p-value length
    Otu001 0.140536    0.551013    -0.433026   0.064036    -0.824770   0.000014    0.942076
    Otu002 0.268539    0.254572    -0.715226   0.000577    -0.504607   0.027571    0.915582
    Otu003 0.121159    0.607228    -0.526778   0.020488    0.058824    0.802922    0.543723
    Otu004 -0.829825   0.000011    -0.022807   0.922915    0.108772    0.644454    0.837234
    Otu005 -0.878841   0.000001    0.190518    0.418051    -0.186128   0.431009    0.918315
    ...

This helps to illustrate the power of OTUs over phylotypes since each of
these OTUs is behaving differently. These data can be plotted in what\'s
known as a biplot where lines radiating from the origin (axis1=0,
axis2=0, axis3=0) to the correlation values with each axis are mapped on
top of the PCoA or NMDS plots. Later, using the metastats command, we
will see another method for describing which populations are responsible
for differences seen between specific treatments. An alternative
approach to building a biplot would be to provide data indicating
metadata about each sample. For example, we may know the weight, height,
blood pressure, etc. of the subjects in these samples. For discussion
purposes the file mouse.dpw.metadata is provided and looks something
like this:

    group  dpw
    F3D0   0
    F3D1   1
    F3D141 141
    F3D142 142
    ...

We can then run [corr.axes](corr.axes) again with the
metadata option:

    mothur > corr.axes(axes=stability.opti_mcc.thetayc.0.03.lt.ave.pcoa.axes, metadata=data/raw/mouse.dpw.metadata, method=spearman, numaxes=3)

Opening the file mouse.dpw.spearman.corr.axes, we see:

    Feature    axis1   p-value axis2   p-value axis3   p-value length
    dpw    -0.656140   0.002282    -0.089474   0.704239    0.349123    0.138553    0.748607

Indicating that as the dpw increases the communities shift to in the
negative direction along axis 1 and in the positive direction along axis

3\.

Another tool we can use is
[get.communitytype](get.communitytype) to see whether our
data can be partitioned in to separate community types

    mothur > get.communitytype(shared=stability.opti_mcc.0.03.subsample.shared)

    K  NLE     logDet  BIC     AIC     Laplace
    1  10976.54    588.34  11575.74    11383.54    10896.71
    2  11165.43    380.42  12365.29    11980.43    10606.70
    3  12029.46    76.71   13829.99    13252.46    10943.96
    4  12882.83    -331.69 15284.02    14513.83    11218.20
    5  13881.95    -849.50 16883.80    15920.95    11583.49

We see that the minimum Laplace value is for a K value of 2 (10606.70).
This indicates that our samples belonged to two community types. Opening
stability.opti\_mcc.0.03.subsample.0.03.dmm.mix.design we see that all
of the late samples and the Day 0 sample belonged to Partition\_1 and
the other early samples belonged to Partition\_2. We can look at the
stability.opti\_mcc.0.03.subsample.0.03.dmm.mix.summary file to see
which OTUs were most responsible for separating the communities:

    OTU    P0.mean P1.mean P1.lci  P1.uci  P2.mean P2.lci  P2.uci  Difference  CumFraction
    Otu005 3.40    10.57   9.31    12.00   0.45    0.27    0.74    10.12   0.14
    Otu004 6.16    8.68    7.61    9.91    3.61    2.89    4.50    5.08    0.22
    Otu006 5.74    7.22    6.29    8.28    3.97    3.21    4.90    3.25    0.26
    Otu008 3.92    2.81    2.33    3.39    5.87    4.87    7.07    3.06    0.31
    Otu001 9.33    8.22    7.19    9.40    10.75   9.17    12.61   2.53    0.34
    ...

Again we can cross reference these OTU labels with the consensus
classifications in the stability.opti\_mcc.cons.taxonomy file to get the
names of these organisms.

#### Population-level analysis

In addition to the use of [corr.axes](corr.axes) and
[get.communitytype](get.communitytype) we have several tools
to differentiate between different groupings of samples. The first
we\'ll demonstrate is [metastats](metastats), which is a
non-parametric T-tetst that determines whether there are any OTUs that
are differentially represented between the samples from men and women in
this study. Run the following in mothur:

    mothur > metastats(shared=stability.opti_mcc.0.03.subsample.shared, design=data/raw/mouse.time.design)

Looking in the first 5 OTUs from
stability.opti\_mcc.0.03.subsample.0.03.Late-Early.metastats file we see
the following\...

    OTU    mean(group1)    variance(group1)    stderr(group1)  mean(group2)    variance(group2)    stderr(group2)  p-value
    Otu001 0.085194    0.000321    0.005662    0.110693    0.002405    0.016347    0.153846
    Otu002 0.075408    0.000283    0.005321    0.083508    0.000522    0.007616    0.381618
    Otu003 0.068423    0.000140    0.003735    0.068776    0.000234    0.005099    0.949051
    Otu004 0.090088    0.000155    0.003935    0.042335    0.000477    0.007276    0.000999
    Otu005 0.108532    0.000511    0.007148    0.016032    0.001056    0.010833    0.000999
    ...

These data tell us that OTUs 4 and 5 were significantly different
between the early and late samples (but note that you should correct
these p-values for multiple comparisons and probably increase the number
of iters used in the test).

Another non-parametric tool we can use as an alternative to metastats is
[lefse](lefse):

    mothur > lefse(shared=stability.opti_mcc.0.03.subsample.shared, design=data/raw/mouse.time.design)

Number of significantly discriminative features: 82 ( 87 ) before
internal wilcoxon. Number of discriminative features with abs LDA score
\> 2 : 82.

Looking at the top of the lefse summary file we see:

    OTU    LogMaxMean  Class   LDA pValue
    Otu001 5.05864 -
    Otu002 4.89999 -
    Otu003 4.85592 -
    Otu004 4.95064 Late    4.33784 0.000327414
    Otu005 5.03954 Late    4.64916 0.000933908
    Otu006 4.87385 Late    4.17388 0.000235566
    ...

OTUs 4 and 5 are again significantly different between the two groups
and are significantly elevated in the late samples

## Phylotype-based analysis

Phylotype-based analysis is the same as OTU-based analysis, but at a
different taxonomic scale. We will leave you on your own to replicate
the OTU-based analyses described above with the phylotype data.

## Phylogeny-based analysis

OTU and phylotype-based analyses are taxonomic approaches that depend on
a binning procedure. In contrast, phylogeny-based approaches attempt
similar types of analyses using a phylogenetic tree as input instead of
a shared file. Because of this difference these methods compare the
genetic diversity of different communities.

#### Alpha diversity

When using phylogenetic methods, alpha diversity is calculated as the
total of the unique branch length in the tree. This is done using the
[phylo.diversity](phylo.diversity) command. Because of
differences in sampling depth we will rarefy the output:

    mothur > phylo.diversity(tree=stability.tre, count=stability.count_table, rarefy=T)

This will generate a file ending in rarefaction.

#### Beta diversity

The unifrac-based metrics are used to assess the similarity between two
communities membership
([unifrac.unweighted](unifrac.unweighted)) and structure
([unifrac.weighted](unifrac.weighted)). We will use these
metrics and generate PCoA plots to compare our samples. There are two
beta-diversity metrics that one can use - [
unweighted](Unifrac.unweighted) and [
weighted](Unifrac.weighted). We will also have mothur
subsample the trees 1000 times and report the average:

    mothur > unifrac.unweighted(tree=stability.tre, count=stability.count_table, distance=lt, processors=2, random=F, subsample=2391)
    mothur > unifrac.weighted(tree=stability.tre, count=stability.count_table, distance=lt, processors=2, random=F, subsample=2391)

These commands will distance matrices (stability.1.weighted.ave.dist)
that can be analyzed using all of the beta diversity approaches
described above for the OTU-based analyses.

## Putting it all together

It is perfectly acceptable to enter the commands for your analysis from
within mothur. We call this the [interactive
mode](interactive_mode). If you are doing a lot these types
of analysis or you want to use this SOP on your own data without
thinking too much there are a couple of other options available.

### Batch mode

In the data/code folder there is a file called stability.batch. If you
look at it you\'ll see all of the commands you ran, but instead of
listing out the file names it uses the current option throughout. You
can copy and paste from this file and get the same output as we got
above. The beauty of the batch mode is that you can run mothur from your
command line without much typing. For example you would run the
following:

    $$ mothur code/stability.batch

Don\'t enter the \"\$$\" that represents the prompt. Sit back and wait
and let it rip. This is what we call the [batch
mode](batch_mode). When we do this it takes a couple of
minutes to run. The other wonderful thing about this approach is that
you can use this very file changing the name of the file you list in
make.contigs. You\'ll also notice that you can enter comments into your
batch files using the \"\#\" character.

### Command line mode

The third way we have of running mothur is by entering mothur commands
directly using the [command line mode](command_line_mode).
This is done like so:

    $$ mothur "#make.contigs(file=data/raw/stability.files, processors=8)"

This command will fire mothur up, run make.contigs, and then quit. This
is useful for people that want to script commands and go back and forth
between different programs. The key ingredients here are the quotes
around the commands and the \"\#\" character that tells mothur this is
not a batch file. If you really went nuts you could combine commands
using \";\" characters like so:

    $$ mothur "#make.contigs(file=data/raw/stability.files, processors=8); screen.seqs(fasta=current, maxambig=0, maxlength=275, inputdir=data/mothur, outputdir=data/mothur); unique.seqs(); count.seqs(name=current, group=current); align.seqs(fasta=current, reference=silva.v4.fasta); screen.seqs(fasta=current, count=current, start=1968, end=11550, maxhomop=8); filter.seqs(fasta=current, vertical=T, trump=.); pre.cluster(fasta=current, count=current, diffs=2); unique.seqs(fasta=current, count=current); pre.cluster(fasta=current, count=current, diffs=2); chimera.vsearch(fasta=current, count=current, dereplicate=t); remove.seqs(fasta=current, accnos=current); classify.seqs(fasta=current, count=current, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax, cutoff=80); remove.lineage(fasta=current, count=current, taxonomy=current, taxon=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota); remove.groups(count=current, fasta=current, taxonomy=current, groups=Mock); dist.seqs(fasta=current, cutoff=0.03); cluster(column=current, count=current, cutoff=0.03); make.shared(list=current, count=current, label=0.03); classify.otu(list=current, count=current, taxonomy=current, label=0.03); phylotype(taxonomy=current); make.shared(list=current, count=current, label=1); classify.otu(list=current, count=current, taxonomy=current, label=1);"

Finally, another great resource when running mothur is the logfile. If
you go to your folder where you are running mothur, you should find one
or more file that looks like mothur.1364488920.logfile. Open that up and
you\'ll see all of the commands you entered and the output that was put
to the screen. If anything ever goes wrong and you need to email us,
please include this file!
