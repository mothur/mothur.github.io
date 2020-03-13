---
title: 'set.logfile'
tags: 'commands'
redirect_from: '/wiki/Set.logfile'
---
You may want to give your logfile a specific name or append a series of
logfiles. The **set.logfile** command allows you to do this.

## Default Options

    mothur > set.logfile(name=myCollectLogfile)
    mothur > collect.single(list=abrecovery.fn.list, label=0.03)

When you open myCollectLogfile you will see:

    Mac version

    Using ReadLine

    mothur v.1.10.0
    Last updated: 5/14/2010

    by
    Patrick D. Schloss

    Department of Microbiology & Immunology
    University of Michigan
    pschloss@umich.edu
[`https://www.mothur.org`](https://www.mothur.org)

    When using, please cite:
    Schloss, P.D., et al., Introducing mothur: Open-source, platform-independent, community-supported software for describing and comparing microbial communities. Appl Environ Microbiol, 2009. 75(23):7537-41.

    Distributed under the GNU General Public License

    Type 'help()' for information on the commands that are available

    Type 'quit()' to exit program
    Script Mode


    mothur > set.logfile(name=myCollectLogfile)

    mothur > collect.single(list=abrecovery.fn.list, label=0.03)
    0.03

    Output File Names: 
    abrecovery.fn.sobs
    abrecovery.fn.chao
    abrecovery.fn.ace
    abrecovery.fn.jack
    abrecovery.fn.shannon
    abrecovery.fn.np_shannon
    abrecovery.fn.simpson


    mothur > quit()

## append

Now if you want to append other executions of mothur to the
myCollectLogfile you can do so with the following commands:

    mothur > set.logfile(name=myCollectLogfile, append=T)
    mothur > collect.single(list=abrecovery.fn.list, label=0.10)

Now myCollectLogfile will look like:

    Mac version

    Using ReadLine

    mothur v.1.10.0
    Last updated: 5/14/2010

    by
    Patrick D. Schloss

    Department of Microbiology & Immunology
    University of Michigan
    pschloss@umich.edu
[`https://www.mothur.org`](https://www.mothur.org)

    When using, please cite:
    Schloss, P.D., et al., Introducing mothur: Open-source, platform-independent, community-supported software for describing and comparing microbial communities. Appl Environ Microbiol, 2009. 75(23):7537-41.

    Distributed under the GNU General Public License

    Type 'help()' for information on the commands that are available

    Type 'quit()' to exit program
    Script Mode


    mothur > set.logfile(name=myCollectLogfile)
     
    mothur > collect.single(list=abrecovery.fn.list, label=0.03)
    0.03

    Output File Names: 
    abrecovery.fn.sobs
    abrecovery.fn.chao
    abrecovery.fn.ace
    abrecovery.fn.jack
    abrecovery.fn.shannon
    abrecovery.fn.np_shannon
    abrecovery.fn.simpson


    mothur > quit()


    *********************************************************************************

    Mac version

    Using ReadLine

    mothur v.1.10.0
    Last updated: 5/14/2010

    by
    Patrick D. Schloss

    Department of Microbiology & Immunology
    University of Michigan
    pschloss@umich.edu
[`https://www.mothur.org`](https://www.mothur.org)

    When using, please cite:
    Schloss, P.D., et al., Introducing mothur: Open-source, platform-independent, community-supported software for describing and comparing microbial communities. Appl Environ Microbiol, 2009. 75(23):7537-41.

    Distributed under the GNU General Public License

    Type 'help()' for information on the commands that are available

    Type 'quit()' to exit program
    Script Mode


    mothur > set.logfile(name=myCollectLogfile, append=T)
     
    mothur > collect.single(list=abrecovery.fn.list, label=0.10)
    0.10

    Output File Names: 
    abrecovery.fn.sobs
    abrecovery.fn.chao
    abrecovery.fn.ace
    abrecovery.fn.jack
    abrecovery.fn.shannon
    abrecovery.fn.np_shannon
    abrecovery.fn.simpson


    mothur > quit()

## To shut off logging

You can shut off mothur\'s logging features by running the following:

    mothur > set.logfile(name=silent)

## Revisions

-   1.40.0 Updates to mothur\'s log file management.
    [\#377](https://github.com/mothur/mothur/issues/377)


