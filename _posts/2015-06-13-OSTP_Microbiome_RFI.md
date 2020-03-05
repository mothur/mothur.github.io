---
layout: post
title: "My response to the OSTP's RFI on the microbiome"
author: "Patrick D. Schloss"
date: "June 13, 2015"
output:
  html_document:
    keep_md: yes
---

The Office of Science and Technology Policy (OSTP) recently released a [request for information (RFI)](https://www.federalregister.gov/articles/2015/05/20/2015-12191/microbiome-research) to "to solicit feedback from industry, academia, research laboratories, and other stakeholder groups on both the overarching questions that unite all microbiome research and the tools, technologies, and training that are needed to answer these questions." This is a draft of a letter that I will be submitting regarding the need for bioinformatic tool development, continued software maintenance, and training.

---

June 10, 2015

Elizabeth Stulberg<br>
Office of Science and Technology Policy<br>
Eisenhower Executive Office Building<br>
1650 Pennsylvania Ave., NW.<br>
Washington, DC 20504<br>
<br>

Dear Dr. Stulberg,

I am writing in response to your Request for Information regarding the broad needs of the wider microbiome research community. Over the past 10 years there has been a meteoric rise in sequencing throughput, which has enabled parallel interest in expanding our understanding of the role of the microbiome in understanding global cycling, environmental health, and human health. Prior to the advances in these technologies a typical study would generate 50 16S rRNA gene sequences from four or five samples and the sequencing data was largely curated manually. Now it is common for researchers to generate millions of 16S rRNA gene sequences distributed across dozens of samples. This change in throughput has resulted in a need for bioinformatics tools that can handle large datasets. In my opinion, one of the greatest challenges we face in the field of microbiome research is not unlike that of the Red Queen from Lewis Carroll’s book *Through the Looking-Glass*. As the throughput of sequencing technologies continues to grow, we must constantly adapt our bioinformatics tools and training to just keep up. With this general problem in mind, I will focus my comments on three specific areas: development of bioinformatics software, maintenance of that software, and training in the use of those tools. Many of my examples are drawn from host-microbiome research, but these are problems that transcend microbiome research in general.

Microbiologists are driven by a desire to understand the mechanisms that animate the microbial life around us. Technology certainly expands the ability to better understand these mechanisms, but the technology should always remain at the service of the biological question. Microbiologists want tools that “just work” and they want to be able to apply those tools across sequencing platforms and biological questions. For a tool developer, this does not necessarily represent huge leaps in innovation, rather it frequently results in incremental advances and the requires painstakingly benchmarking and validation of updated methods. In contrast, computer scientists are fascinated by developing new algorithms. Because their algorithms are considered more innovative, they receive the funding priority. Yet, this has given rise to a growth of tools that are generally no better or even worse than the low innovation methods. In addition, the user interfaces for these tools is generally poor and requires a biologist to have some level of programming experience to implement the tools. In the end, the innovative computer science vision wins out and the needs of the biologists to utilize portable, mature, and robust software tools are not met. There is a clear need to develop bioinformatic solutions that serve biologists specifically.

A related problem in developing bioinformatics software is that the arc of microbiome research lasts many years resulting in a need for software that is continually maintained and updated beyond the life of a typical development grant. For example, the mothur software package was initiated in 2007. Over the past eight years we have been able to secure two grants that directly supported the development of mothur from the NSF (2008-2010) and NIH (2011-2013). The NIH funding came directly from the Human Microbiome Project specifically to develop microbiome related bioinformatics tools. Since the dissolution of the Human Microbiome Project there have been no mechanisms to support the ongoing development of microbiome-related bioinformatics tools. As an example of the shortsightedness of the funding agencies, a perfect example is a program announcement from NIH’s Big Data To Knowledge (BD2K) program, “Extended Development, Hardening and Dissemination of Technologies in Biomedical Computing, Informatics and Big Data Science (PA-14-156)”. On the surface, this would appear to be a perfect mechanism to fund the continued development and maintenance of existing microbiome bioinformatics tools since it specifically deemphasizes innovation and emphasizes supporting tool maintenance and expanding a tool’s user base. Alas, proposals that involve general microbiome research are handled by NIAID and NIAID is not participating in this announcement. I am unaware of similar programs from NSF. There are great bioinformatics tools that have been developed in the last few years; unfortunately, there have been no direct mechanisms to support them beyond their initial creation.

Through the development of mothur, I have been able to interact with hundreds of microbiome researchers. A common theme across all groups that I have talked with is that they lack training in statistics and computer science. In my experiences in microbiology departments at the universities of Wisconsin, Massachusetts, and Michigan, their training programs have created an environment where bioinformatics courses are viewed as electives instead of a fundamental component of their training. Furthermore, none of those programs required a statistics course for graduation. On more than one occasion I have heard colleagues say, “If you need to use statistics, then you designed the experiment wrong”. The result of this training and thinking can be seen in a survey we performed of mothur users where we found that less than 40% of them had experience programming in a language such as Python, R, Perl, C/C++, or Java. By its nature, microbiome research is “big data”. Even research groups that take a reductionist approach to bacterial physiology are now using sequencing techniques that generate more data than they can handle. We must make statistics and computer programming required components of microbiology curricula to prepare students for a future that will only provide them with more data and a job market that increasingly requires these skills.

This is truly an exciting time to be a microbiome researcher. Technological advances have removed many of the limitations we faced in answering our favorite biological questions. Central to these advances in technology and curiosity is a quantitative framework to reach meaningful answers. This is why I am convinced that a major challenge facing microbiome research involves the continued development and maintenance of bioinformatics software and the training of scientists so that they can appropriately use that software and create customized analyses.

Sincerely,

Patrick D. Schloss, PhD<br>
Associate Professor<br>
Department of Microbiology & Immunology<br>
University of Michigan
