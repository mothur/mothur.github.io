---
layout: post
title: "mothur and QIIME"
author: "PD Schloss"
date: "January 12, 2016"
blurb: mothur and QIIME have had an exceptional impact on the field of microbial ecology and helped lead the ongoing explosion of interest in studying the human microbiome. I've refrained from publicly making any comparisons between the two programs because I knew that anything I said would be appropriately viewed with suspicion. So, what do I think of QIIME?
comments: true
---

<div class="tldr">
Despite their differences in philosophy, <i>most</i> of the differences in mothur and QIIME are cosmetic. Both packages have been successful. Having both of them around is good for microbial ecology. Within both packages there are warts - inconveniences to the users and antiquated/bad ideas. Within both packages there are strengths. If you are going to criticize someone for their choice of software, do it for some specific point. If you are going to campaign for mothur or QIIME, do your best to accurately represent the strengths of your pet package.
</div>

When I teach workshops or field users' questions, I am often asked what I think of QIIME. I suspect that because I direct the development of mothur, people are expecting me to come out with guns blazing to blow up QIIME. In fact, people ask and then kind of step aside to avoid the onslaught. Meh. I pause and say it's a successful program, but that I obviously like mothur better. After this non-answer, people then tell me the analogies that they use to compare the two: Patagonia vs Columbia, Mac vs. PC, or Coke vs. Pepsi are common (it's never clear or consistent which brand is to be preferred or why). I suppose this is fair with the caveat that all analogies are limited. I think these analogies reflect the point that a lot of the differences are cosmetic. Both programs were released within months of each other in 2009 and 2010. I often get the impression from reviewers and other software developers that mothur is a distant second fiddle to QIIME. Yet, the Web of Science shows that mothur has 3,410 citations and QIIME has 2,779 (as of January 8, 2016). Although I cite these numbers in grant proposals to sway reviewers that mothur is the leading tool used by microbial ecologists to analyze 16S rRNA genes, citation counts really say little about quality and once you get over a few hundred citations you're hot stuff.

I have gotten this question with growing frequency over the past months (hence this blog post) and I know that the topic recently came up over at the [QIIME forum](https://groups.google.com/forum/m/#!topic/qiime-forum/vDuBwVF7rOg). Often times the person asking the question or making the dogmatic statement doesn't seem to have a full appreciation for the differences and similarities and whether the differences are really meaningful. I frequently work with researchers to craft rebuttals to reviewers who think that an otherwise benign paper is the battle ground for such a debate. Take this gem, for example...

> Finally, I like mothur for some of its unique features but QIIME is better for others and is backed up by a very strong group of bioinformatics tools and researchers, in my opinion you should consider using QIIME in future studies.

<div style="width:100%; text-align:center">
	<img src="https://media.giphy.com/media/Xtij9YYM3NLYk/giphy.gif" width="300px" align="middle" />
</div>

It's really hard to know where to begin with that kind of statement. I hope that this would even make the QIIME developers cringe. It would make me cringe if the software names were switched. Sadly, this isn't the only example of this that I have seen. Such comments beg the question, "Which mothur features were used in this paper that would have been better in QIIME?" There may be some, but what is the author to do with such a vague comment from the reviewer? How do these types of statements help anyone? But I digress... My point is that to this reviewer and many others the differences that they think are huge are largely cosmetic. For example, I received feedback a year ago that someone didn't like using the mothur wiki site because it had a very modest picture of my wife nursing our 4th child, John and that grossed them out. For. Reals. Many people are QIIME or mothur people because their PI or collaborators are, not for any deep seated philosophical justification.

So, what are the differences? Are they meaningful or just cosmetic? Is this all a matter of personal preference? In full disclosure, my experience with QIIME came from a [recent paper I wrote](https://peerj.com/articles/1487/) in which we compared various clustering algorithms including those implemented in QIIME. I've looked over their SOPs, talked with a number of QIIME users, and feel that I generally have a good sense of what their strategy is about. I'm not looking to get into a mothur vs. QIIME debate (note: the title of this post is mothur **and** QIIME), but if I misrepresent something or am being unfair, please let me know and I'll edit this post. In what follows allow me to lay out what I see as the similarities, differences, strengths, and weaknesses of each program. To reduce my bias, I'll leave it to you to determine whether any of it matters. I'm happy to extend the list if you think I'm missing something critical. My hope is that people getting started in the field and that the person that forwarded that reviewer comment to me (and others with similar reiviewers) will find the discussion useful.

<div id="toc" />
Here's a list of the topics I'll cover that are linked so you can jump down the list. I summarize everything at the very end with some  <a href="#Conclusions">concluding thoughts</a>...

<div style="width:50%;float:left">
<ul>
	<li><a href="#Development strategy">Development strategy</a></li>
	<li><a href="#Language">Language</a></li>
	<li><a href="#Installation">Installation</a></li>
	<li><a href="#Accessibility">Accessibility</a></li>
	<li><a href="#Openness">Openness</a></li>
	<li><a href="#User">User community</a></li>
	<li><a href="#Method">Method transparency</a></li>
</ul>
</div>
<div style="display:inline">
<ul>
	<li><a href="#Reproducibility">Reproducibility</a></li>
	<li><a href="#Data">Data Accessibility</a></li>
	<li><a href="#Data">Data visualization</a></li>
	<li><a href="#Clustering">Clustering / OTU picking</a></li>
	<li><a href="#Illumina">Illumina sequence processing</a></li>
	<li><a href="#Classification">Classification</a></li>
	<li><a href="#Databases">Databases</a></li>			
</ul>
</div>

<div id="Development strategy" />
### Development strategy

***mothur.*** When you run a function from within mothur, you are running mothur code. When you [run classify.seqs](http://www.mothur.org/wiki/classify.seqs), you are not running the code developed by the RDP. You are running our reimplementation of their code. We have done this with several functions to make them operating system (OS)-independent, make them open source, parallelize them, make them faster, generalize their application, and expand their features. Our first draft of any function is to translate the code from its original language to C++ and make sure we get the same output with the same input. In some cases (e.g. [chimera.uchime](http://www.mothur.org/chimera.uchime) and [metastats](http://www.mothur.org/metastats)) the original authors have made their C code open and we have directly integrated that code into mothur. In most cases, however, you are running code that we developed from scratch (e.g. [chimera.uchime](http://www.mothur.org/cluster)). This strategy has strengths (we think the code is better, more uniform, and easier to maintain), but also has weaknesses (it can be hard to incorporate new tools if they weren't written in C/C++). Regardless, we seem to do a good job of keeping current with the needs and wants of the community.


***QIIME.*** QIIME is essentially a big wrapper that helps users to transition data between independent packages. Certainly, a lot of the functionality within QIIME is written by the QIIME developers, but much of the heavy lifting (e.g. OTU clustering, classification) is from code written by others. In fact, you can actually run mothur from within QIIME. It's a very old version of mothur, but you can use mothur to cluster sequences in QIIME. As you might expect, the advantage of this approach is that if the developers can write a light wrapper for a new package in Python, then it is pretty painless to bring in other people's software. Of course, that software comes in warts and all and creates [dependency hell](https://en.wikipedia.org/wiki/Dependency_hell). When I've heard QIIME developers talk at conferences, one comment they make is that they allow people to use methods the way it was originally implemented. I get that. At the same time, if you told people that you had to use Gosset's original implementation of [Student's T-test](https://en.wikipedia.org/wiki/Student%27s_t-test#History) and it couldn't be ported to SAS, SPSS, R, Excel, etc. then you'd rightly be laughed at. I would be curious to know how much dead wood exists in QIIME - I could foresee functions that were developed by a contributor that then graduate or lose interest and there is no one left to maintain or update the code. The QIIME development team may have a mechanism to deal with this type of problem, but the fact that they are using mothur v1.25, which was released in May 2012, suggests that there is some slippage. A big part of what we do with mothur development is to modify functions to work with bigger and more diverse datasets and we continue to maintain everything within mothur.

<a href="#toc">Jump up to TOC</a>

<div id="Language" />
### Language
***mothur.*** We write mothur in C and C++. C and C++ are compiled languages, which means that once the code is compiled, you don't need another program to run it. Pretty much everything you likely have on your computer right now is a compiled program. There are a few reasons we do this. First, C/C++ runs much faster than other languages including R, Python, Perl, or Java. I suppose we could be writing it in Fortran, but I put my last punch card in my daughter's bicycle spokes. Most of the source code has been written by Sarah Westcott and myself. It is an open source package that others are free to contribute to or build upon for other applications. It is somewhat disappointing that we haven't had more contributions, but then again, how many microbiologists know C or C++? If we had written it in Python or made it an R package, we would have far more contributors. But of course, then we'd have performance issues. We might make an R wrapper ... wait for it ... mothuR, but it will just be wrapping our C++ code.

***QIIME.*** QIIME is written in Python, which is a very powerful, popular, and well-developed language. I look for reasons not to learn Python (I'm on team R), but deep down know that I should learn Python. My kids are learning Python. Through the efforts of [Software Carpentry](http://software-carpentry.org), [Codecademy](https://www.codecademy.com/), and other groups, many biologists are learning Python. You should definitely learn Python. For all of these reasons, I think QIIME has gotten a lot of code contributions from their user base. Python is also great for doing light lifting functions like wrapping functionality and converting file formats. It's not so great at heavy lifting. Part of this is because it is not a compiled language - the language itself is written in C. As an example of this consider our aligners, which both implement the NAST algorithm. The paper describing QIIME's Python-based aligner, [pynast](http://www.ncbi.nlm.nih.gov/pubmed/19914921), states that it can align a full-length sequence in 1.46 seconds. In contrast, our paper describing mothur's C++-based aligner, [align.seqs](http://www.ncbi.nlm.nih.gov/pubmed/20011594), could align 15 full-length sequences per second (21.9-times faster).

<a href="#toc">Jump up to TOC</a>


<div id="Installation" />
### Installation

***mothur.*** Because of our overall development strategy we have worked very hard to make mothur a standalone software package. When you download mothur, you have mothur. All of it. You don't have to chase down external dependencies or worry about software licenses. The only thing you have to go get are the databases that are required for aligning or classifying sequences. As described above, this is possible because all of the functionality is baked into the source code. You can get the executable binaries or the source code from our [project's GitHub releases page](https://github.com/mothur/mothur/releases/latest). You can even download the code that we are working on for the next release through that GitHub repository.

***QIIME.*** Installation is one of the things that seems to drive people nuts about QIIME and to their credit, I think their developers have worked hard to overcome these problems. These problems are largely because of their development strategy. If you have Python installed and are running it on your local computer, a simple `pip install qiime` should suffice to install QIIME. But then you have to get all of the guts (admittedly many of the dependencies can be installed using an [intaller](https://github.com/qiime/qiime-deploy). Some of the more important guts (e.g. USEARCH) require separate downloads and may be proprietary and require you to pay a fee. To overcome some of these problems, the developers have created virtual machines and other abstractions to make it easier to install. Alas, installing and running a virtual machine on one's computer is not trivial and results in a hit in processing speed. Although some of the individual packages within QIIME may be closed source and pricey, they make their source code available through [their GitHub repository](https://github.com/biocore/qiime) like we do.

<a href="#toc">Jump up to TOC</a>


<div id="Accessibility" />
### Accessibility

***mothur.*** When we survey our users and run workshops, we consistently find that more than half of them are using computers that run the Window's operating system. Guess which operating systems most bioinformatics software packages are designed for? Linux and Mac. It has been very important to us to make mothur as platform-independent as possible. One advantage of rewriting software is that we can make sure it compiles and works in Windows. For some reason the same commands run with the same data do run a bit slower on a Windows machine than a Mac or Linux. Because of this, we think that people will eventually want to move towards a Linux-based cloud solution, but we also want to meet people where they are with their existing hardware without excluding them because of their choice of operating system.

***QIIME.*** Considering many of the tools wrapped within QIIME were designed to run on Linux, QIIME runs easiest on a machine running Linux. The developers have made a Mac-based port and as mentioned above, they have created virtual machines to run on Windows. Difficulties installing and running virtual machines are not trivial for people just learning bioinformatics and they will experience hits in performance.

<a href="#toc">Jump up to TOC</a>


<div id="Openness" />
### Openness

***mothur.*** All of the functionality of mothur is available as source code under the [GPL v3 License](https://github.com/mothur/mothur/blob/master/LICENSE.md). If you want to know how mothur does something (and can read C/C++), its right there on our [GitHub repository](https://github.com/mothur/mothur). I suspect that 99% of our users have no interest in going through the source code, but it's there. mothur is [free as in freedom as well as beer](https://en.wikipedia.org/wiki/Gratis_versus_libre). You don't have to pay a dime to use any component of mothur if you are a academic, garage scientist, or work for big pharma. This also goes for our online materials and technical support.

***QIIME.*** For most purposes, QIIME is just as free as mothur and is available under the [GPL v2 License](https://github.com/biocore/qiime/blob/master/COPYING.txt). The one caveat is their use of USEARCH. Robert Edgar, the developer of USEARCH provides the 32-bit version for free to academics and non-profits after registering their use; however, if you're at a for-profit or need the 64-bit version, you're going to have to pay for it. This is not entirely trivial considering the primary clustering methods in QIIME are based on USEARCH. I've heard that QIIME is working towards replacing USEARCH with the free VSEARCH, but I believe this is still in the testing stages.

<a href="#toc">Jump up to TOC</a>


<div id="User" />
### User community

***mothur.*** As indicated by the number of citations, both software packages have large and loyal followings and some people actually use both on the same project. Both groups have discussion lists, user forums, online documentation, instructional materials, swag, and devotees. Engaging those devotees and potential users to advance the software and surrounding resources is a challenge for all open source software efforts. For example, take a look at the list of co-authors on the [mothur paper](http://www.ncbi.nlm.nih.gov/pubmed/19801464). There are 15 names, 3 of us (Westcott, Ryabin, Schloss) wrote code and most of the wiki (Ryabin was an undergrad). The remaining 12 co-authors took me up on an offer to get their name on the paper if they contributed a wiki page describing how they used mothur for their application. These are the posts on the [Analysis Examples wiki page](http://mothur.org/wiki/Analysis_examples). Unfortunately, none of them have been updated since they were posted and having created this mechanism to share, no one else has contributed their analysis. On a similar note, I will regularly get emails from people telling me that there's a typo on the wiki. Apparently they don't know that the point of a wiki is that anyone can edit it! Oh well. We also have a very active user forum where people mostly ask questions and very few people (mostly Sarah and I) answer them. Although I'd love for more people to be involved in this, I think the questions and answers do provide others a form of very useful documentation. Ultimately, the lack of engagement is probably more a product of culture that our users aren't used to. We're open to suggestions. Still it's pretty awesome what we've been able to do over the past several years with 1.0 FTE working on mothur.

***QIIME.*** [Greg Caporaso rightly points](https://groups.google.com/forum/m/#!topic/qiime-forum/vDuBwVF7rOg) out that QIIME has a great collaborative network of developers. I think a lot of this is because they develop in Python, which a lot of people know and that the strong computer science background of Knight, Caporaso, and the other developers has collaboration baked into it. I also think that because the Knight lab is heavily involved in a lot of big science projects they have an amazing list of collaborators that go on to use QIIME, publish in high-impact papers, and reinforce collaboration with the QIIME developers. What can I say? I'm jealous.


<a href="#toc">Jump up to TOC</a>


<div id="Method" />
### Method transparency

***mothur.*** There are currently [145 commands in mothur](http://mothur.org/wiki/Category:Commands). Many of these commands implement various methods to do the same thing while generating the same output formats. For example, the [cluster command](http://www.mothur.org/wiki/cluster) implements three ways of clustering sequences into OTUs. To run cluster, you first have to run a number of other steps. Each step is a different step in the pipeline. By making each step discrete like this, users have very fine control on the knobs of their pipeline and they know exactly what is going on. Of course, we give people the default parameter values and usually have papers to backup the defaults, but people are free to alter the commands at each step. This gives users great control, but at the same time can be somewhat overwhelming if they feel the need to do something different. For example, we have 8 chimera functions that each implement a different algorithm - I would only ever suggest using [chimera.uchime](http://www.mothur.org/wiki/chimera.uchime).

***QIIME.*** In contrast to the mothur approach, my experience and that of people I've talked with is that most QIIME users tend to treat functions as a "black box". If you want to use the open reference clustering algorithm that command will align, classify, and assign sequences to OTUs. Although it is possible to tweak parameters for each of those steps, it isn't always clear how. It's also not entirely clear how one might add steps for making sure sequences overlap the same region or to identify and remove chimeras.

<a href="#toc">Jump up to TOC</a>


<div id="Reproducibility" />
### Reproducibility

***mothur.*** An ongoing problem in science that has recently gotten a lot of important attention has been the ability to reproduce work of other scientists. One place where we can hopefully make progress on this is in the world of computational analysis. I should be able to take your data and reproduce a figure from your paper. Sadly this isn't always possible or as easy as we think it should be. As a reviewer I see this problem frequently where people will say they used mothur/QIIME to analyze their data. Um... there are an infinite number of permutations of functions and parameter values that one could use. Help? We have worked to help users make their results more reproducible by outputting log files and posting SOPs. Over the last two years we have also worked really hard to put [all of our data and code online](https://github.com/SchlossLab) for others to reproduce. There are currently two primary tools that people use - Jupyter (previously IPython Notebooks) and R Markdown documents. We have created a [mothur hook](https://github.com/SchlossLab/ipython-mothurmagic) for use with IPython notebooks and are developing hooks for use with R Markdown documents. I personally prefer R Markdown because I can embed results in my text to write a paper. In contrast, Jupyter is a notebook, which is useful for demonstrating how you did an analysis and the results, but isn't really able to produce a manuscript ready to submit. Needless to say this is an area of active development.

***QIIME.*** Likely because of its strong roots in Python, the QIIME developers are making great use of Jupyter to demonstrate how to use QIIME and disseminate their methods. My understanding is that QIIME v2.0 will make extensive use of this format.

<a href="#toc">Jump up to TOC</a>


<div id="Data" />
### Data Accessibility

***mothur.*** Related to the previous point, analyses cannot be reproducible if the data are not available. Previously, submitting 16S rRNA gene sequences to NCBI's Sequence Read Archive (SRA) has been a pain in the tuckus. This resulted in labs posting data to their personal websites or to 3rd party sites such as MG-RAST. I'm guilty of the former, although we're working to correct this. The problem with these approaches is that often people are not depositing their raw data (i.e. sff and fastq files), only their processed data and may not be depositing their metadata. Also, although the SRA is difficult to search and access, it is a breeze to use compared to MG-RAST. To overcome this problem, we worked with the curators at the SRA to develop the [make.sra command](http://www.mothur.org/wiki/make.sra), which helps to [simplify the process](http://www.mothur.org/wiki/Creating_a_new_submission). This feature has been live since March 2015 and has been widely used by microbial ecologists. These are low estimates, but as of the beginning of January there have been 86 submission from 61 studies containing 6367 runs representing 116 GBp submitted using make.sra. There really is no excuse at this point to use anything but the SRA for depositing raw sequence data. We are also in the process of developing an sra.info command that will convert data out of SRA format.

***QIIME.*** As an alternative to the SRA, the developers of QIIME also developed [QIITA](http://qiita.ucsd.edu). QIITA is an online database for storing and analyzing 16S rRNA gene sequence data. The goal appears to involve applying a common pipeline to datasets so that they can be compared. This makes use of the open and closed-reference clustering algorithms that are critiqued below. It also provides researchers with the ability to deposit raw data. I recently tried to access the Earth Microbiome Project (EMP) data that was used in one of their [open-reference clustering papers](http://www.ncbi.nlm.nih.gov/pubmed/25177538). I failed. There was no obvious way to download large number of files like one can with the SRA. When I asked some of the EMP researchers for help, it was clear QIITA is still under development and that it really isn't designed to do what I wanted. My understanding is that they are in the process of uploading the data to either the European Nucleotide Archive (ENA) or the SRA.

<a href="#toc">Jump up to TOC</a>


<div id="Data" />
### Data visualization

***mothur.*** We initially attempted to develop functions that would build heatmaps and venn diagrams as SVG files. Although these data visualization tools are useful, I don't feel like we did a great job of making the output from these functions as elegant as they could be. After experimenting a bit, we decided we would never be able to generate figures as nice as one could in R or Python using the extensive codebase that has been developed there. Instead, we focus on outputting data in formats that people can manipulate in other packages. To that end, all of our output files are text files and we can output a shared file as a BIOM-formatted file for integration with other microbial ecology tools that use that format.

***QIIME.*** I applaud the QIIME developers efforts to build data visualization tools for analyzing microbial ecology data. I'm not personally a big fan of their black background ordinations or 2D depictions of 3D ordinations. The demos I've seen do a nice job of showing how users can re-color points in ordinations by metadata. Of course, this is something you can also do in R, but you need to know R first.

<a href="#toc">Jump up to TOC</a>


<div id="Clustering" />
### Clustering / OTU picking

***mothur.*** We got started with creating DOTUR, which was the first open source tool for assigning sequences to OTUs. The plan for mothur was to make DOTUR able to process 454 data, but then we got to having so much fun... mothur currently implements hierarchical clustering algorithms in the [cluster command](http://www.mothur.org/wiki/cluster) including the average (the default), weighted, nearest, and furthest neighbor. We also have [cluster.split](http://www.mothur.org/wiki/cluster.split), which is a way of dividing your data by taxonomy and then clustering. The output of cluster.split is the same as cluster, but it is faster and can be parallelized. We have done *a lot* of benchmarking to show that the average neighbor clustering algorithm gives the best clusters. It may be slower than other methods, but the data suggest it is consistently the best approach. You can read those papers [here](http://www.ncbi.nlm.nih.gov/pubmed/26664811) and [here](http://www.ncbi.nlm.nih.gov/pubmed/21421784).

***QIIME.*** As mentioned above, you can run an old version of mothur from within QIIME. Looking at their papers and online documentation, it is clear they want people to use their greedy de novo or their open reference OTU assignment commands, which are both based on USEARCH. In our [2015 paper](http://www.ncbi.nlm.nih.gov/pubmed/26664811) that benchmarked a diverse collection of clustering algorithms, we showed that in some cases their distance-based greedy clustering algorithm could be as good as the average neighbor algorithm. However, we point out myriad problems with their open and closed reference clustering algorithms. It is very hard for me to encourage people to use these algorithms in QIIME. A common rejoinder is that some datasets are too large for the average neighbor algorithm. Our experience has been that this is [more a product of sequencing error](http://blog.mothur.org/2014/09/11/Why-such-a-large-distance-matrix%3F/) than anything else. As we point out in that paper, speed and memory usage are important, but cannot be used as the basis to say one method is better than another when there are clear differences in OTU quality. High quality clustering is a problem that will continue to plague us as datasets grow, even if they have a very low sequencing error rate.

<a href="#toc">Jump up to TOC</a>


<div id="Illumina" />
### Illumina sequence processing

***mothur.*** The [make.contigs command](http://mothur.org/wiki/make.contigs) is our method of assembling paired sequence reads into contigs. If your reads fully overlap then it is possible to use this command with the [rest of the pipeline](http://mothur.org/wiki/MiSeq_SOP) to get an error rate below 0.02%. This is easily an order of magnitude lower than what we have seen other groups describe. Actually, very few other groups (any?) are sequencing mock communities to report an error rate. You can find the [wetlab protocol](https://github.com/SchlossLab/MiSeq_WetLab_SOP) at our GitHub repository. This approach and the bioinformatics benchmarking was [published at AEM](http://www.ncbi.nlm.nih.gov/pubmed/23793624). Even with the advance in Illumina's MiSeq technology to paired 300 nt reads, we are sticking with the paired 250 nt reads to sequence the V4 region because [the new chemistry sucks](http://blog.mothur.org/2014/09/11/Why-such-a-large-distance-matrix%3F/).

***QIIME.*** Greg Caporaso was the first author on the [original method](http://www.ncbi.nlm.nih.gov/pubmed/20534432) describing how to sequence 16S rRNA genes on an Illumina machine. Unfortunately, much of their benchmarking consisted of showing it was possible and that they got similar results to 454 data. They didn't actually report error rates. In [subsequent work](http://www.ncbi.nlm.nih.gov/pubmed/22170427), they suggested that it is possible to make comparisons with single reads or using HiSeq data. From our work and experience, we know that these data are very noisy and problematic. If you want to distinguish very different communities, use HiSeq data, if you are looking at more similar communities, you need high quality data. With this as background, it really isn't clear what QIIME proposes for assembling reads into contigs or how it compares to what we're doing with make.contigs. Their primary tutorial uses their [Moving Pictures of the Human Microbiome](http://www.ncbi.nlm.nih.gov/pubmed/21624126) dataset and is disseminate as a [Jupyter notebook](http://nbviewer.ipython.org/github/biocore/qiime/blob/1.9.1/examples/ipynb/illumina_overview_tutorial.ipynb). Interestingly, that tutorial does not mention what to do with paired reads. Other parts of their website discuss assembly, but it isn't clear to the typical user how the output fits in with the rest of the pipeline. They indicate that a paper is forthcoming so hopefully they'll expand on this in the future and be able to compare their results to ours.

<a href="#toc">Jump up to TOC</a>


<div id="Classification" />
### Classification

***mothur.*** Taxonomic classification of sequences is handled within the [classify.seqs command](http://www.mothur.org/wiki/classify.seqs). The default method is to use the [naive Bayesian classifier](http://www.ncbi.nlm.nih.gov/pubmed/17586664) that was originally developed by the RDP team. We also enable researchers to use the k-Nearest Neighbor algorithm based on distance, blast, and kmer-based distances. The naive Bayesian classifier uses a pseudo-bootstrapping procedure to generate a confidence score. The RDP website uses 80%, by default cluster.seqs does not apply a threshold although our SOPs all tell people to use 80%. The next release of mothur (v1.37.0) will use 80% as the default threshold for classify.seqs.

***QIIME.*** The default classification method in QIIME is to use USEARCH to find the closest match in a reference database using the [assign_taxonomy.py script](http://qiime.org/scripts/assign_taxonomy.html). This appears to be a quasi nearest neighbors algorithm and if you use the defaults, then it requires 2 of the 3 top matches to have the same classification. I haven't seen this approach published or validated anywhere. This would appear to be problematic since many taxa in the references only have one representative - so you would never get a sequence to classify to that taxon. I would also worry about the problems [we saw with using USEARCH](http://www.ncbi.nlm.nih.gov/pubmed/26664811) for database searching and closed reference clustering - basically, classification will change with the order of the database sequences. QIIME also provides the naive Bayesian classifier as an option in this script. As the default threshold, they require a confidence score of 50%. Although the original paper suggests a threshold of 80%, the RDP site curiously suggests 50% for short sequences; however, this makes no sense since your confidence should not vary with sequence length. In our own unpublished analyses, quality of assignment is proportional to the confidence score.

<a href="#toc">Jump up to TOC</a>


<div id="Databases" />
### Databases

***mothur.*** For whatever reason, when I talk with people about the differences between mothur and QIIME, one of the things people think makes a *huge* difference between the packages is the databases we use. Supposedly, I like RDP and QIIME likes greengenes. Given that QIIME ships with greengenes, I suspect that the QIIME developers do like greengenes; however, we have no particular affinity for the RDP taxonomy. We use it in the SOP because it is smaller and easier to work with. I try to make it clear that you can use the RDP, SILVA, or greengenes for classification. We actually make the [three reference taxonomies publicly available](http://mothur.org/wiki/Taxonomy_outline). When it comes to alignment database, I do think the only way to go is to use a reference alignment based on the SILVA database. As I tell people, the alignment within the variable regions in the greengenes alignment looks like the person was somewhat drunk at the time while the SILVA alignment looks like it was done by Germans. Oh wait... :) This isn't a matter of personal conjecture, we actually quantified the difference in an [earlier paper](http://www.ncbi.nlm.nih.gov/pubmed/20011594) and then [looked again recently](http://blog.mothur.org/2015/08/04/No-greengenes-hasnt-improved/) and found the same thing. As the database curators update their databases, we also update the references. I don't know that they change much, but people get vexed when we don't keep up with the Joneses.

***QIIME.*** QIIME comes prepackaged with the greengenes database from 2013. This is a nice feature, because it limits the difficulties of keeping track of things. This also makes for bigger downloads. The QIIME commands appear to allow people to use their own database if they aren't interested in the greengenes database. There are two important points to make with regard to QIIME's use of databases. First, as I've mentioned elsewhere in this posting, [USEARCH is sensitive to the ordering](http://www.ncbi.nlm.nih.gov/pubmed/26664811) of the sequences in your reference. As we showed in that paper, for whatever reason, the default ordering of the greengenes database produces high error rates and could be substantially improved by randomizing the sequences before using USEARCH. Second, To build trees for used for phylogenetic approaches, they use sequences that are aligned to the greengenes alignment that I described above. This is somewhat disconcerting as the the poorly greengenes-aligned sequences [artificially increases the distances]((http://www.ncbi.nlm.nih.gov/pubmed/20011594)) between sequences. But, as [their documentation indicates](http://qiime.org/scripts/filter_alignment.html) "FILTERING ALIGNMENTS WHICH WERE BUILT WITH PYNAST AGAINST THE GREENGENES CORE SET ALIGNMENT SHOULD BE CONSIDERED AN ESSENTIAL STEP (caps in original)". This filtering is no doubt necessary to remove the poorly aligned variable regions. In the [same publication](http://www.ncbi.nlm.nih.gov/pubmed/20628621), we showed that applying filters like the traditional Lane mask significantly mutes the differences between sequences. Although I agree that such filtering is necessary for building phylogenies where you are trying to propose new lineages of taxa, it seems mistaken to filter when you are looking for differences between sequences. It really would be nice to see them remove so much emphasis on the greengenes database and make the SILVA references alignment the prepackaged default instead.

<a href="#toc">Jump up to TOC</a>


<div id="Conclusions" />
### Conclusions
I hope that you have found this comparison to be useful. As much as possible, I have tried to be balanced in my critiques of *both* mothur and QIIME. Hopefully, you will find that most of the differences between the two programs are pretty cosmetic. The more substantive difference are in aspects of the programs that are admittedly under active development. One of the things that absolutely drives me crazy is when people say they like program X because it gives them "good results". I am unclear what that means. Unless you have objective criteria or know the correct answer, you can't be certain that you have "good results". Be honest to admit that you use program X because you just like it better for cosmetic reasons or have some actual data to suggest that it is better. Of course, if X happens to be QIIME, please let me know - my group uses mothur and we want to make sure we're using the best software possible. I know you want the same thing. Finally, I really appreciate the input that I received from a number of people that I asked to review this review before I posted it. I worked very hard to remove any snark, cynicism, sarcasm, etc to provide as balanced a review as possible. These people have held me to this goal and I appreciate their feedback.
