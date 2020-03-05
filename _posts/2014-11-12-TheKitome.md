---
layout: post
title: "The Kitome: Dealing with the reagent microbiome"
author: "PD. Schloss"
date: "November 12, 2014"
comments: true
---

An [important paper](http://www.biomedcentral.com/1741-7007/12/87) came out this
week that everyone should be well aware. It went through the somewhat boring
task of sequencing negative controls. Right now you're yawning, right? You might
want to read the paper and go check that paper you just published to see if any
of the bugs you claimed were responsible for your disease *du jour* were
mentioned. We'll wait...

The paper I'd like to talk about is this gem from Alan Walker's research group
at the Wellcome Trust Sanger Institute:

> Salter, Cox, Turek, Calus, Cookson, Moffatt, Turner, Parkhill, Loman & Walker.
> Reagent and laboratory contamination can critically impact sequence-based
> microbiome analyses. BMC Biology. http://www.biomedcentral.com/1741-7007/12/87

To summarize, Salter and colleagues noticed some odd results in a [previous
study](http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0038271)
and started to worry that some of the differences they observed were due to
differences in the contaminants that were present in the DNA extraction kits
that they used. They then went and diluted a control DNA into negative
extraction controls where they did mock extractions using different kits. They
used these mixtures as the input to 16S rRNA gene and metagenomic sequencing.
As the amount of control DNA decreased, the abundance of kit DNAs became more
abundant.

There has been a surprising amount of press on this relatively simple paper that
you might want to go and check out as well...

* [*The Scientist*](http://www.the-scientist.com/?articles.view/articleNo/41421/title/DNA-Extraction-Kits-Contaminated/)
* [*National Geographic*](http://phenomena.nationalgeographic.com/2014/11/11/contaminomics-why-some-microbiome-studies-may-be-wrong/)
* [*Science News*](http://news.sciencemag.org/biology/2014/11/contamination-plagues-some-microbiome-studies)
* [*Nature*](http://www.nature.com/news/microbiome-science-threatened-by-contamination-1.16327)

I talked with Kerr Grens for her article in *The Scientist* and she boiled our
30 min conversation down to 3 nice quotes. I'll expand on those for everyone's
benefit.


***Sequence a freaking negative control, will you?!*** For awhile now, I have
been advocating that people sequence a positive or Mock Community control so
that they can assess their sequencing error rate. We've also advocated
sequencing a "generous donor" sample that is sequenced with every batch of
samples. This paper and various personal experiences have taught me that it is
critical that we need to sequence a negative or water extraction sample. This is
essential for low biomass samples and probably a good idea for high biomass
samples. **Note that you should sequence this control, even if you don't see a
band on the gel.** It actually take a lot of DNA to see a band on a gel. As the
paper points out, your contaminants may not be my contaminants and vice versa
and so it is crticial to figure out who your contaminants are and what their
relative abundances are to each other.


***Ignore Table 1, read Box 1.*** One fear I have is that people will get lazy
and not seqeunce a negative control, but will instead look at Table 1 from this
study and base their analysis and review on the assumption that these sequences
should be removed from every study. You'll notice that *Escherichia* is one of
the genera listed there. Should we remove it from every 16S rRNA gene sequence
dataset now? Hell no. *E. coli* has a habitat that we may want to study. In
addition, there is diversity among the *Escherichia* and so just because it is in
Table 1 and may even show up in your negative control, doesn't mean that it's the
same *Escherichia* that shows up in your samples. Box 1 actually lays out some
very nice suggestions for how to minize and deal with possible contaminants.
Follow those suggestions.


***I want to study organisms without 16S rRNA genes.*** I learned very early in
my career that every bacterium has a 16S rRNA gene. Even airborne contaminants.
I also learned that an autoclave does not kill DNA. I also learned that many of
the kit components are produced in a bacterium. It is very easy to see where a
false signal could come from. Also appreciate that many of the kits we use were
designed for alternative purposes. For crying out loud, we use the MoBio
Power*SOIL* DNA extraction kit to get DNA out of basically everything. Your
threshold for contamination in soil is a bit higher than it is for leaf or human
surfaces. This only underscores the need to sequence negative controls and to
ask the manufacturers to kindly make us reagents that are DNA-free.


***Even scarier sources of contamination.*** In addition to the reagents, there
are other sources of 16S rRNA genes that we don't usually consider. For
instance, the other samples. It would be a tedious study, but I wonder whether
there is much sample-to-sample contamination. I haven't fully thought through
the study, but if we took a single stool sample and put it in wells D6, D7, E6,
and E7 of a 96-well bead plate and filled the rest with UV irradiated H2O and
sequenced the entire plate, how much of the DNA from those four wells would show
up in the other 92 wells? Altenatively, you could do it with just the DNA. If we
do everything manually vs with robotics does the result change? Check that, I'm
to scared, I don't want to know the result.


***What to do with all of this negative control data?*** Alrighty now, you've
listened to me and everyone else and have agreed to spend a few quid (Hey, the
authors are British! Um, what's a quid?) and are now dutifully including a
negative extraction and/or PCR control on every sequencing run. What now? Great
question! Dunno. The first thing to keep in mind is that there are organisms in
some environments that could be a contaminant. For example, in *The Scientist*
article I mention a cystic fibrosis study I was part of. We found *Pseudomonas*
in the sputum of the patients and in the negative controls. Do we chuck all of
the *Pseudomonoas*? Well? Reviewer 3? We're waiting... Let's think of a second
about what a contaminant would look like if it found its way into your sample.
First, it would be the exact sequence (or within the margin of sequencing
error) that you find in your negative control. Being a "*Psuedomonas*" doesn't
cut it. Second, it should be present in a similar abundance relative to the
other contaminants in your sample. So, if sequences A and B show up in a 2:1
ratio in your sample and in your control, it's likely a contaminant. If it's a
20:1 ratio in your sample and 1:2 in your control, it's probably not a
contaminant. How we automate this and deal with randomness remains to be
determined as does whether we "correct" the relative abundance to remove the
contaminant signal from the sample.


***Do not just sequence samples as they come.*** The thing that tipped off the
investigators was that there appeared to be differences between the batches DNA
extractions in the original study. They realized that the two batches of
extractions used different lots of extraction kits. Thus, their treatment groups
were confounded with the DNA extraction kit lots. A similar problem was
encountered with the Human Microbiome Project. The largest signal in that study
was where the DNA extractions were done - St. Louis or Houston. While we'd all
love to believe that there's a regional effect on the microbiome, we can't say
that because the geographic region was perfectly confounded with who did the
sampling, extractions, amplifications, and sequencing. The solution? Wait until
you have all of your samples and then either randomize the samples or
thoughtfully block your samples so that treatment groups are evenly represented
across your extraction sets and sequencing runs. Also, do a generous donor
control.


I've gone on waaaay too long here, but it is important to emphasize that this
is an important problem. As I see it, we can thank Salter and her colleagues for
[re-identifying the problem](http://aem.asm.org/content/64/8/3110.full). Now, we
need to develop robust methods of identifying and culling contaminant
sequences from our samples. Until then, be sure to sequence a negative control!
