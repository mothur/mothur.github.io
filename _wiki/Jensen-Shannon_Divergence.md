---
title: 'Jensen-Shannon Divergence'
---
Let x be the relative abundances of one sample and y be the relative
abundances of the other and m be the average relative abundances of the
2 samples.

    JSD(x,y)= 1/2 KLD(x,m)+ 1/2 KLD(y,m)

where KLD is the Kullback-Leibler divergence between x and y defined by:

    KLD(x,y)=∑ xi log xi / yi
