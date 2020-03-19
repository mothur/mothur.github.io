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
    file](Batch_mode)
-   The [ collect.single](collect.single#The_calc_option), [
    collect.shared](collect.shared#The_calc_option), [
    rarefaction.single](rarefaction.single#The_calc_option),
    [ summary.single](summary.single#The_calc_option) and [
    shared.summary](summary.shared#The_calc_option) all use
    the calc parameter.
-   All estimator names are lowercase.
-   Only filename parameters persist between commands, all others return
    to default values.

## Major Feature Additions

-   [unique.seqs](unique.seqs)
-   [parsimony](parsimony)
-   [unifrac.weighted](unifrac.weighted)
-   [unifrac.unweighted](unifrac.unweighted)
-   The [ shared
    option](read.otu#Inputting_shared_data_for_multiple_samples)
    to the read.otu command

## Minor Feature Additions

-   Ability to set comparisons for the [
    collect.shared](collect.shared#The_groups_option), [
    rarefaction.shared](rarefaction.shared#The_groups_option),
    and [ summary.shared](summary.shared#The_groups_option)
    commands.
-   Ability to define the threshold for "abundant" species in ACE
    estimator as something other than 10 in the [
    collect.single](collect.single#The_abund_option), [
    summary.single](summary.single#The_abund_option), and [
    rarefaction.single](rarefaction.single#The_abund_option)
    commands.
-   Added the [get.line](get.line),
    [get.group](get.group), and
    [get.label](get.label) commands so basic information
    about data files can be accessed through mothur.
