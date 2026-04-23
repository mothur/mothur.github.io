---
title: 'list file'
tags: 'file_types'
redirect_from: '/wiki/List_file'
---
The file ending in "list" contains data indicating the sequences that
cluster together within an OTU. Like the rabund and sabund files, the
first column represents the distance that sequences were assigned to
OTUs. If you are making your own rabund file you can make the label
anything without spaces. The number in the second column is the number
of OTUs that have been formed. Subsequent columns contain the names of
sequences within each OTU separated by a comma. At this time these are
not sorted according to any rule.

Looking at the final.opti_mcc.list file from the [MiSeq_SOP](/wiki/MiSeq_SOP)

    label	numOtus	Otu001	Otu002	Otu003	Otu004	Otu005	Otu006	Otu007	Otu008	Otu009	Otu010	Otu011	...
    0.03	531	M00967_43_000000000-A3JHG_1_1101_20262_22075,M00967_43_000000000-A3JHG_1_1113_28928_16770,
    M00967_43_000000000-A3JHG_1_1108_22866_20909,M00967_43_000000000-A3JHG_1_1112_18411_17052,M00967_43_000000000-A3JHG_1_1112_5981_8948,M00967_43_000000000-A3JHG_1_2108_7751_22068,M00967_43_000000000-A3JHG_1_2106_8030_23327,
    M00967_43_000000000-A3JHG_1_2114_4499_18914,M00967_43_000000000-A3JHG_1_1113_15967_2074,M00967_43_000000000-A3JHG_1_1109_24493_23253,M00967_43_000000000-A3JHG_1_2113_29656_14155,M00967_43_000000000-A3JHG_1_1111_20933_6700,
    M00967_43_000000000-A3JHG_1_2101_13320_3436,M00967_43_000000000-A3JHG_1_1107_13116_15821,M00967_43_000000000-A3JHG_1_1114_13556_18457,M00967_43_000000000-A3JHG_1_1109_7996_16802,M00967_43_000000000-A3JHG_1_2114_12634_10967,
    M00967_43_000000000-A3JHG_1_2106_18324_28644,...
