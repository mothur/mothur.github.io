---
title: 'mothur v.1.1.0'
redirect_from: '/wiki/Mothur_v.1.1.0.html'
---
We are happy to release **mothur v.1.1.0** today, March 9, 2009. In the
past 3 weeks we have had 136 people register as users of mothur - thank
you for your continued support! Instead of waiting you wait for gigantic
buggy versions of mothur (ahem, Bill Gates), our approach will be to
make more frequent smaller releases. For the time being, our goal is to
focus on adding major features. In the first release it was to include
the functionality of dotur and sons. This time around it is the
functionality of treeclimber and the UniFrac stable of tools. The next
release should include an implementation of slibshuff. Along the way we
hope to add minor features that improve the usability of the code.

Over the past several weeks several of you have suggested various
features and we appreciate that feedback. Perhaps more surprising has
been the interest in having me come to your campuses to give workshops.
I am currently looking forward to workshops at Louisiana State
University, University of British Columbia, Penn State University, and
University of Hawaii. If we have 10-15 people at each workshop, then we
will have trained at least 50 people, which is phenomenal. I am also
thinking about hosting a workshop at the University of Massachusetts. If
you are interested in coming to that workshop, please let me know what
dates might be most appealing to you.

Finally, here are a list of the modifications and features that are
included in the March 2009 release of mothur v.1.1.0\...

## Cosmetic Changes

-   Better type checking on option parameters
-   Don't need a space between comma and options
-   Don't need to put a quit() command at the end of a [ batch
    file](/wiki/Batch_mode)
-   The [ collect.single](/wiki/collect.single#calc), [
    collect.shared](/wiki/collect.shared#calc), [
    rarefaction.single](/wiki/rarefaction.single#calc),
    [ summary.single](/wiki/summary.single#calc) and [
    shared.summary](/wiki/summary.shared#calc) all use
    the calc parameter.
-   All estimator names are lowercase.
-   Only filename parameters persist between commands, all others return
    to default values.

## Major Feature Additions

-   [unique.seqs](/wiki/unique.seqs)
-   [parsimony](/wiki/parsimony)
-   [unifrac.weighted](/wiki/unifrac.weighted)
-   [unifrac.unweighted](/wiki/unifrac.unweighted)
-   The shared option to the read.otu command

## Minor Feature Additions

-   Ability to set comparisons for the [
    collect.shared](/wiki/collect.shared#groups), [
    rarefaction.shared](/wiki/rarefaction.shared#groups),
    and [ summary.shared](/wiki/summary.shared#groups)
    commands.
-   Ability to define the threshold for "abundant" species in ACE
    estimator as something other than 10 in the [
    collect.single](/wiki/collect.single#abund), [
    summary.single](/wiki/summary.single#abund), and [
    rarefaction.single](/wiki/rarefaction.single#abund)
    commands.
-   Added the get.line, [get.group](/wiki/get.group), and
    [get.label](/wiki/get.label) commands so basic information
    about data files can be accessed through mothur.
