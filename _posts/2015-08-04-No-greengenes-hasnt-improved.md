---
layout: post
title: "No, greengenes' reference alignment hasn't improved"
author: "PD Schloss"
date: "August 4, 2015"
comments: true
---

An under appreciated, but important component to assigning sequences to OTUs is generating a sequence alignment. As with many things in the world of microbiome analysis, there is a spectrum of options. In case you've missed it, I've published three papers in the last few years on this topic. These papers all point to the importance of aligning your data and are the justification for how we run [align.seqs](http://www.mothur.org/wiki/align.seqs) in the [MiSeq SOP](http://www.mothur.org/wiki/MiSeq_SOP) and the [454 SOP](http://www.mothur.org/wiki/454_SOP). Over the weekend some questions came up about aligning 16S rRNA gene sequences that I thought worth expanding up on here.

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Any recommendations for the &quot;best&quot; aligner for 16S? Should take secondary structure into account. cc <a href="https://twitter.com/phylogenomics">@phylogenomics</a></p>&mdash; David Coil (@davidacoil) <a href="https://twitter.com/davidacoil/status/627174500291989504">July 31, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Before we dig in here, it is probably worth being aware of what I've already written on the subject and which Jonathan Eisen (@phylogenomics) and I referred David:

* [A high-throughput DNA sequence aligner for microbial ecology studies](http://www.ncbi.nlm.nih.gov/pubmed/20011594)
* [The effects of alignment quality, distance calculation method, sequence filtering, and region on the analysis of 16S rRNA gene-based studies](http://www.ncbi.nlm.nih.gov/pubmed/20628621)
* [Secondary structure improves OTU assignments of 16S rRNA gene sequences](http://www.ncbi.nlm.nih.gov/pubmed/23018771)

If you're wondering, "WTF, why align at all?". I would kindly encourage you to go read [this](http://www.ncbi.nlm.nih.gov/pubmed/21421784) and then come back for more. FWIW, that story hasn't changed either.

Wang and colleagues wrote a paper a few years ago, titled ["Secondary structure information does not improve OTU assignment for partial 16s rRNA sequences"](http://www.ncbi.nlm.nih.gov/pubmed/22170430) where they tried to justify the use of performing all possible pairwise alignments between sequences. This feeds into their ESPRIT programs for assigning sequences to OTUs (fwiw, I've also shown that ESPRIT is [not that great](http://www.ncbi.nlm.nih.gov/pubmed/21421784)). My "Secondary structure..." paper was written in response theirs and can be summarized by the last sentence of the first paragraph, "I will justify my position by re-emphasizing my previous work, which the Wang commentary ignored, and illustrate several incorrect conclusions that they reached in supporting their thesis." How's that for publishing snark?

So why does using a whole dataset alignment and including the secondary structure matter?

* **A whole dataset alignment strives to insure that you have conserved positional homology across all of the sequences.** Pairwise alignments only try to optimize the similarity between the pair of sequences being considered. The result of pairwise alignments is that the sequences will look more similar to each other than they really are [[ref](http://www.ncbi.nlm.nih.gov/pubmed/20628621)].
* **If sequences are not aligned to a reference it is not possible to ascertain whether your analysis is being done over sequences that overlap the same region.** The 16S rRNA gene does not evolve uniformly over its length. So, if you compare a 200 nt fragment to a 500 nt fragment, you could get very different sequence distances if you only compared the overlapping 200 region. It is not possible to do this trimming *consistently* unless you have a whole dataset alignment.
* **Pairwise alignments are horribly slow and multiple sequence alignments are worse.** If you have 1,000 sequences (i.e. N), calculating all of the pairwise alignments would require 500,000 time units (i.e. 1/2 N^2). If you choose to use a multiple sequence alignment like MUSCLE or CLUSTALW, then you would need about 1,000,000,000,000 (i.e. ~N^4) time units [[ref](http://www.biomedcentral.com/1471-2105/5/113)]. Alternatively, if you do a reference-based alignment, like we do in align.seqs, you only need 1,000 time units (i.e. N) and can still generate a whole dataset alignment.
* **Secondary structure provides biological information to improve the conservation of positional homology across the whole dataset alignment**. I frequently describe the [secondary structure of the 16S rRNA gene](http://rna.ucsc.edu/rnacenter/images/figs/ecoli_16s.jpg) as the [American Suburban Neighborhood from Hell](http://photos1.blogger.com/blogger/3706/1703/320/culdesac.jpg). The various stems and loops have conserved properties that suggest they should be aligned together. The loops tend to have conserved motifs and the bases along the stems form hydrogen bonds with the bases on the other side of the stem. So, it makes sense to align all of these things with each other across sequences.
* **Choice of alignment affects the distance between sequences and the number of OTUs that are formed**. Relative to a reference-based alignment, pairwise alignments reduce the distances between sequences and the number of OTUs while multiple sequence alignments tend to increase the distances and number of OTUs.

OK, so we want a whole dataset alignment that preserves the secondary structure of the 16S rRNA gene. But how do we do this? Several profile-based aligners have been created that fall into two classes. The first is the NAST-type of alignment where you get a reference alignment and then align your sequences to the references (let's call these reference-based aligners). The assumption is that the secondary structure was consulted when generating the reference. Examples of this approach include [NAST](http://www.ncbi.nlm.nih.gov/pubmed/16845035), [NAST-ier](http://www.ncbi.nlm.nih.gov/pubmed/21212162), and [SINA](http://www.ncbi.nlm.nih.gov/pubmed/22556368). [mothur's align.seqs](http://www.ncbi.nlm.nih.gov/pubmed/20011594) preceded [QIIME's pyNAST](http://www.ncbi.nlm.nih.gov/pubmed/19914921) and both are variants of the NAST-based approach. At the time they were published, align.seqs blew pyNAST out of the water for speed. The quality of three general approaches does not vary much, which is why we haven't gone out of our way to implement NAST-ier or SINA. The second is a model-based approach. Here the secondary structure is baked into the model and the model is then applied to unaligned sequences. This is the approach used by [Infernal](http://www.ncbi.nlm.nih.gov/pubmed/19307242), which is adopted by the [RDP](http://rdp.cme.msu.edu) and the [ssualign](http://www.ncbi.nlm.nih.gov/pubmed/22134646) dataset within [greengenes](http://greengenes.lbl.gov/). So that's a brief review of the primary profile-based aligners that are widely used to process 16S rRNA genes.

As I pointed out before ([here](http://www.ncbi.nlm.nih.gov/pubmed/20011594) and [here](http://www.ncbi.nlm.nih.gov/pubmed/20628621)), which of the two general approaches you chose (reference or model) and which reference you choose matters. Let's start with the model-based approach. If you've ever aligned sequences using RDP's serve and then looked at the sequences, you'll note that some of the bases are in a lower case font. In an earlier analysis that we published in describing align.seqs, we found that, on average, the RDP's implementation of Infernal left 7.6% of the bases in a full-length sequence unaligned. So, that sucks especially since we're mainly interested in the variable regions, which are the regions that don't get aligned. Moving on to the reference-based aligner, the critical component is the reference alignment itself. We previously found that the greengenes alignment was not very good in the variable regions. An example of that is shown here (taken from [Figure 2](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0008230)):

<img src="http://journals.plos.org/plosone/article/figure/image?size=large&id=info:doi/10.1371/journal.pone.0008230.g002" style="width:650px;">

The first alignment is from the RDP. You'll note the unaligned text as lower cased font. The second and third alignments from greengenes and SILVA depict those bases that formed traditional Watson-Crick base-pairs in the secondary structure (yellow), weak base-pairs (gray), bases that will not form base-pairs (black), and bases that are predicted to be in loop structures (no highlight). Although any sequence will have its share of black bases, the goal is to minimize the black and maximize the yellow. We found that when we aligned each of ~200,000 sequences using the greengenes and SILVA reference alignments, the greengenes alignments had 18.0 more non-paring bases (sd = 16.0) than in the SILVA alignment.

I was highlighting these results on Twitter over the weekend and was asked whether these data still hold since there have been some changes with the greengenes alignments.

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/PatSchloss">@PatSchloss</a> <a href="https://twitter.com/davidacoil">@davidacoil</a> <a href="https://twitter.com/phylogenomics">@phylogenomics</a> way out of date given date of pub</p>&mdash; Daniel McDonald (@mcdonadt) <a href="https://twitter.com/mcdonadt/status/627622933989588992">August 1, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I had already aligned the greengenes v.13_5 reference set to the SILVA reference alignment for another project I'm working on it was pretty straightforward to rerun [align.check](http://www.mothur.org/wiki/align.check) on the greengenes aligned sequences and the align.seqs aligned version using the SILVA reference set. The code I used to run this is at the end of this post. First, I looked at the ssualign portion of the greengenes reference collection. In contrast to the RDP, which just piles up the bases at the 5' end of the gap opening, in ssualign, the bases are actually just removed from the dataset. I found that the median percentage of bases removed from the variable regions within each sequence was 11.0%. When I compared the secondary structure for the greengenes and SILVA-based reference alignments, I again saw what I observed in the older version of the database. The greengenes-based alignments had 22 more bases that failed to form Watson-Crick base pairs than the SILVA-based alignment (i.e. black bases) and 14 fewer perfect Watson-Crick base pairs than the SILVA-based alignment (i.e. yellow bases). Put simply, the results from the prior publication hold.

Let me say that I would love it if the greengenes reference alignment were better. First, the SILVA-based reference alignment comes with a [pretty onerous licensing program](https://www.arb-silva.de/silva-license-information) that precludes the use of it by commercial ventures. Put simply, it isn't "open". Considering the greengenes reference is based on an old version of the SILVA reference, it isn't clear to me how greengenes is in the clear and someone at Sequence My Microbiome isn't, but whatever. Second, the SILVA reference alignment is 50,000 columns long compared to the 7,682 columns in the greengenes reference alignment. This means that if you use the full SILVA reference alignment, your output files will be 6 times larger than the equivalent alignment using the greengenes reference alignment. That can be a considerable amount of disk space taken up by unnecessary -'s and .'s.

I have great respect for everyone involved in putting out these references. If you've spent any amount of time manually curating sequences in ARB, you know it is a very tedious process. My hat is off to the ARB team for making such a great alignment. In defense of greengenes, I think it's initial [use case](https://en.wikipedia.org/wiki/Use_case) was for building phylogenetic trees where a positional mask was used to cut out the highly variable regions. That is where most of the problems occur. As the field has evolved to use more of the data to assign sequences to OTUs, we have realized that [using a mask really deflates the difference between sequences](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000844). The beauty of packages like mothur is that we can mix and match software with different databases. Our attention has been paid to 16S rRNA gene sequences, but you could easily generate your own reference alignment for other rRNA genes or for protein coding genes and use align.seqs to quickly generate an alignment. You could also choose to use the SILVA-based reference alignment in align.seqs and the SILVA, RDP, or greengenes reference taxonomies to classify your sequences. If you would like to get the up to date references for use with mothur here are the links:

* [SILVA](http://mothur.org/wiki/Silva_reference_files) (good for alignment and classification)
* [greengenes](http://mothur.org/wiki/Greengenes-formatted_databases) (good for alignment and classification)
* [RDP](http://mothur.org/wiki/RDP_reference_files) (good for classification)

--------

Source code to generate results.

First, in bash:

	wget ftp://anonymous@greengenes.microbio.me/greengenes_release/gg_13_5/gg_13_5.fasta.gz
	wget ftp://anonymous@greengenes.microbio.me/greengenes_release/gg_13_5/gg_13_5_pynast.fasta.gz
	wget ftp://anonymous@greengenes.microbio.me/greengenes_release/gg_13_5/gg_13_5_ssualign.fasta.gz
	gunzip gg_13_5*.fasta.gz


	#need to trim the alignments to the positions within the 27f/8f and 1492r primers to be consistent with the SILVA reference alignment
	mothur "#pcr.seqs(fasta=gg_13_5_pynast.fasta, start=138, end=6791, keepdots=T, processors=4)"
	mothur "#pcr.seqs(fasta=gg_13_5_ssualign.fasta, start=138, end=6791, keepdots=T, processors=4)"


	wget -N http://www.mothur.org/w/images/2/27/Silva.nr_v119.tgz
	tar xvzf Silva.nr_v119.tgz
	mothur "#get.lineage(fasta=silva.nr_v119.align, taxonomy=silva.nr_v119.tax, taxon=Bacteria-Archaea)";
	mv silva.nr_v119.pick.align silva.bact_archaea.align

	mothur "#align.seqs(fasta=gg_13_5.fasta, reference=silva.bact_archaea.align, processors=2)"

	wget http://www.mothur.org/w/images/6/6d/Silva_ss_map.zip
	unzip Silva_ss_map.zip
	mv silva.ss.map silva_ss_map
	mv silva_ss_map/silva.ss.map ./
	rm -rf silva_ss_map

	wget http://www.mothur.org/w/images/4/4b/Gg_ss_map.zip
	unzip Gg_ss_map.zip

	mothur "#align.check(fasta=gg_13_5_pynast.pcr.fasta, map=gg.ss.map)"
	mothur "#align.check(fasta=gg_13_5_ssualign.pcr.fasta, map=gg.ss.map)"
	mothur "#align.check(fasta=gg_13_5.align, map=silva.ss.map)"


Second, in R:

	ssualign <- read.table(file="gg_13_5_ssualign.pcr.align.check", header=T, row.names=1)
	silva <- read.table(file="gg_13_5.align.check", header=T, row.names=1)
	pynast <- read.table(file="gg_13_5_pynast.pcr.align.check", header=T, row.names=1)

	overlap <- intersect(rownames(silva), rownames(pynast))
	ssualign <- ssualign[overlap,]
	silva <- silva[overlap,]
	pynast <- pynast[overlap,]

	median(pynast$pound-silva$pound) # non watson-crick base pairs
	median(pynast$tilde-silva$tilde) # perfect watson-crick base pairs
	median(ssualign$total/silva$total) # fraction of bases removed from ssualign
