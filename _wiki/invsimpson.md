---
title: 'Invsimpson'
tags: 'calculators'
redirect_from: '/wiki/Invsimpson'
---
The **invsimpson** calculator is the inverse of the
classical [simpson](Simpson) diversity estimator.

$$InvSimpson = \frac{1}{D_{Simpson}}$$

This parameter is preferred to other measures of alpha-diversity because it
is an indication of the richness in a community with uniform evenness
that would have the same level of diversity. So while measures such as
the [shannon](Shannon) index are somewhat abstract, the
inverse of the Simpson index has some biological interpretation. Other
advantages of the Simpson-based metrics are that they do not tend to be
as affected by sampling effort as the [shannon](Shannon)
index. This calculator can be used in the
[summary.single](summary.single),
[collect.single](collect.single), and
[rarefaction.single](rarefaction.single) commands.
