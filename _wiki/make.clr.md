---
title: 'make.clr'
tags: 'commands'
redirect_from: '/wiki/Make.clr.html'
---
The **make.clr** command converts a [ shared](/wiki/Shared_file) file
to a [ centered log ratio](/wiki/Clr_file) file. The make.clr
command parameters are shared, groups, zero and label. The shared file
is required.

## Default Settings

The shared file is required.

    mothur > make.clr(shared=final.opti_mcc.shared)

The clr file will look like:

    label	Group	numOtus	Otu001	Otu002	Otu003	Otu004	Otu005	Otu006  ...
    0.03	F3D0	531	5.41759	4.92983	5.18186	5.20439	5.65345	5.08071 ...
    0.03	F3D1	531	5.14707	5.02644	4.53046	3.45783	3.5875	4.05412 ... 
    0.03	F3D141	531	5.34869	5.20222	5.09554	5.56513	5.43955	5.0199 ...
    0.03	F3D142	531	5.0383	5.09387	4.49989	4.56748	5.07438	4.8049 ...
    0.03	F3D143	531	4.78115	4.56456	4.69318	4.87166	5.26746	4.74906 ...
    0.03	F3D144	531	5.33322	4.98106	5.04841	5.24279	5.63662	5.12934 ...
    0.03	F3D145	531	5.71435	5.47431	5.50955	5.64309	5.87528	5.53097...
    0.03	F3D146	531	4.93426	4.65515	4.75268	5.24294	5.31859	4.8851	 ...
    0.03	F3D147	531	6.27643	6.10363	5.80262	6.05272	6.4835	6.05177	 ...
    0.03	F3D148	531	5.78974	5.67112	5.42408	5.89096	6.28392	5.755883 ...
    0.03	F3D149	531	5.75472	5.66097	5.58554	5.86629	5.88696	5.58708 ...
    0.03	F3D150	531	4.90698	4.66102	5.16412	5.40341	4.96539	4.9475 ...
    0.03	F3D2	531	7.02949	6.27018	5.96945	5.11146	4.00172	5.01637	 ...
    0.03	F3D3	531	6.18414	5.75926	5.45427	4.69675	2.63837	4.82629 ...
    0.03	F3D5	531	5.0131	4.84572	4.84995	4.38584	2.42641	4.30915 ...
    0.03	F3D6	531	6.07615	5.68224	5.50091	5.21585	1.83537	5.14816 ...
    0.03	F3D7	531	5.85551	5.60691	5.4535	5.18464	1.80025	4.9615 ...
    0.03	F3D8	531	4.77529	5.0438	4.99759	4.16704	0.405839 4.47201 ...
    0.03	F3D9	531	5.29494	5.14422	5.28108	4.46432	1.00905	4.76247 ...

## Options

### groups

The groups parameter allows you to specify which of the groups in your
sharedfile you would like included. The group names are separated by
dashes.

    mothur > make.clr(shared=final.opti_mcc.shared, groups=F3D7-F3D8-F3D9)

### label

The label parameter allows you to select what distance levels you would
like, and are also separated by dashes.

    mothur > make.clr(shared=final.opti_mcc.shared, label=0.03)

### zero

The zero parameter allows you to set an value for zero OTUs. Default is 1.

    mothur > make.clr(shared=final.opti_mcc.shared, zero=0.01)

## Revisions

-   1.48.2 Updates to clr value calculation.
-   1.44.0 - First Introduced.
    [\#695](https://github.com/mothur/mothur/issues/695)


