---
title: 'relabund file'
tags: 'file_types'
redirect_from: '/wiki/Relabund_file'
---
A relabund file is similar to a shared file. The data in a relabund file
represent relative abundance of an OTU over the samples. It is easiest
to generate this file using the [get.relabund](get.relabund)
command. The structure of a relabund file is analogous to an shared
file. The first column contains the label for the comparison - this will
be the value for the first column of each line from the original list
file (e.g. final.an.list). The second column contains the group name
that designates where the data is coming from for that row. Next is the
number of OTUs that were found between each of the groups and is the
number of columns that follow. Finally, the remaining columns indicate
the relative abundance of each OTU from that group.

    mothur > get.relabund(shared=final.an.shared)

[category:filetypes](Category:FileTypes)
