---
title: 'heatmap.sim'
tags: 'commands'
redirect_from: '/wiki/Heatmap.sim.html'
---
The **heatmap.sim** command will generate a
heatmap indicating the pairwise similarity between multiple samples
using a variety of [calculators](/wiki/calculators) comparing
community membership and structure. As an example, we will use the
example from the [sogin data analysis](/wiki/sogin_data_analysis)
example.

## Default settings

### Sample Similarity

Before running the **heatmap.sim** command shared OTU data must be created
by mothur:

    mothur > make.shared(list=sogin.unique.good.filter.fn.list, group=sogin.good.groups)

Then running the following command will generate the heatmaps for the
[jest](/wiki/jest) and [thetayc](/wiki/thetayc) calculators
for each line in the [ list](/wiki/list_file) or [shared
file](/wiki/shared_file)

    mothur > heatmap.sim(shared=sogin.unique.good.filter.fn.shared)

#### calc

The calc parameter will allow you to use any of the similarity
[calculators](/wiki/calculators) provided within mothur to generate
heatmaps comparing the membership or structure of your samples. For
example, the following command will generate heatmaps for the [
classical Sorenson index](/wiki/sorclass), [ Yue & Clayton's
theta](/wiki/thetayc), and the [ Morisita-Horn
index](/wiki/morisitahorn):

    mothur > heatmap.sim(shared=sogin.unique.good.filter.fn.shared, calc=sorclass-thetayc-morisitahorn)

#### label

There may only be a couple of lines in your OTU data that you are
interested in generating a heatmap diagram for. There are two options.
You could: (i) manually delete the lines you aren't interested in from
you list or shared file; (ii) or use the label option. If you only want
to read in the data for the lines labeled unique, 0.03, 0.05 and 0.10
you would enter:

    mothur > heatmap.sim(shared=sogin.unique.good.filter.fn.shared, label=unique-0.03-0.05-0.10)

### Raw Distance Matrix

#### phylip

To read in a [phylip-formatted distance
matrix](/wiki/phylip-formatted_distance_matrix) you need to use the
phylip option:

    mothur > dist.shared(shared=sogin.unique.good.filter.fn.shared, label=0.10)
    mothur > heatmap.sim(phylip=sogin.unique.good.filter.fn.jclass.0.10.lt.dist)

#### column & name or count

To read in a [column-formatted distance
matrix](/wiki/column-formatted_distance_matrix) you must provide a [name file](/wiki/name_file) or
[count file](/wiki/count_file):

    mothur > heatmap.sim(column=..., name=...)

or

    mothur > heatmap.sim(column=..., count=...)

## Options

### groups

At this point, if you run the following command:

    mothur > get.group(shared=sogin.unique.good.filter.fn.shared)

You would have seen that there were 8 groups here: 112R, 115R, 137, 138,
53R, 55R, FS312, and FS396. Say you just wanted to generate a heatmap
for the seawater samples without the diffuse flow samples (i.e. FS312
and FS396). You could then use the groups option:

    mothur > heatmap.sim(shared=sogin.unique.good.filter.fn.shared, groups=112R-115R-137-138-53R-55R)

### fontsize

The fontsize parameter allows you to adjust the fontsize in the picture
mothur creates. The default is 24.

## Revisions

-   1.23.0 - Added fontsize parameter.
-   1.28.0 - Added count parameter
-   1.38.0 - Fixes gradient bar
-   1.40.0 - Speed and memory improvements for shared files.
    [\#357](https://github.com/mothur/mothur/issues/357) ,
    [\#347](https://github.com/mothur/mothur/issues/347)
-   1.40.0 - Bug Fix: Fixes out of bounds error.
    [\#363](https://github.com/mothur/mothur/issues/363)
