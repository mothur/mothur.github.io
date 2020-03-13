---
title: 'MRCA phylogenetic beta-diversity measure'
redirect_from: '/wiki/MRCA_phylogenetic_beta-diversity_measure'
---
The unweighted most recent common ancestor (MRCA) measure calculates the
dissimilarity between a pair of communities by considering the amount of
shared and unique branch length within their MRCA subtree (i.e., the
smallest subtree spanning all sequences from the two communities). It is
an unweighted or qualitative measure as only the presence or absence of
a sequence is considered. This calculator can be used with the
[phylo.betadiversity](phylo.betadiversity) command. The
dissimilarity between communities *i* and *j* is given by:

$$D_{MRCA} = \frac{b+c}{a+b+c}$$

where,

$$a$$ = the amount of branch length shared by the two communities within
the MRCA subtree.

$$b$$ = the amount of branch length unique to community *i*.

$$c$$ = the amount of branch length unique to community *j*.

### Mathematical properties

-   $$D_{MRCA}$$ is a metric.
-   $$D_{MRCA} \ge D_{CL}$$

### Points-of-interest

### Further information

Parks, DH and Beiko, RG. (2011). **Quantifying phylogenetic β-diversity
over rooted and unrooted trees**. (in preparation)
