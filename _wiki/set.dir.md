---
title: 'set.dir'
tags: 'commands'
redirect_from: '/wiki/Set.dir.html'
---
**set.dir** allows you to redirect the output files
created by mothur, or set the directory where mothur will look for input
files. You can also set a default location for mothur to look if it
can't find your files in the input location. This allows you to keep
your reference files in one location.


## input

    mothur > set.dir(input=../inputFiles)
    Changing input directory to /Users/Work/Desktop/inputFiles/
    
You can set multiple locations for mothur to look for input files by separating the locations with ';'.
    
    mothur > set.dir(input=/Users/swestcott/Desktop/release;/Users/swestcott/Desktop/mothurbugs)
    Mothur's directories:
    inputdir=
	    /Users/swestcott/Desktop/release/
	    /Users/swestcott/Desktop/mothurbugs/


## output

If output directory does not exist mothur will create it for you.

    mothur > set.dir(output=../outputFiles)
    Changing output directory to /Users/Work/Desktop/outputFiles/

## tools

Mothur's commands use several external tools. Default
location=mothur's executable location. The vsearch, uchime, 
prefetch and fasterq\_dump executables can be placed in a central
location like /usr/bin/. You can tell mothur where to find them by
setting MOTHUR\_TOOLS=/usr/bin/ in the makefile. Alternatively, you can
run this command within mothur:

    mothur > set.dir(tools=/usr/bin/)

You can set multiple locations for mothur to look for external programs by separating the locations with ';'.
    
    mothur > set.dir(tools='/usr/bin;/Users/swestcott/Desktop/mothur/tools')
    Mothur's directories:
    mothurtools=
	    /usr/bin/
	    /Users/swestcott/Desktop/mothur/tools/

## mothurfiles

By default mothurfiles=mothur's executable location.

    mothur > set.dir(mothurfiles=../referenceFiles)
    Changing default directory to /Users/Work/Desktop/referenceFiles/
    
You can set multiple locations for mothur to look for files by separating the locations with ';'.

    mothur > set.dir(mothurfiles='/Users/swestcott/Desktop/release;/Users/swestcott/Desktop/mothurbugs')
    Mothur's directories:
    mothurfiles=
	    /Users/swestcott/Desktop/release/
	    /Users/swestcott/Desktop/mothurbugs/

## mothurhome 
The mothurhome keyword can be used as a shortcut for paths. 
Let's assume mothur's executable is located in a folder on my desktop called mothur.
The full path to my mothur executable is /Users/swestcott/Desktop/mothur/mothur.

	mothur > set.dir(tools='mothurhome/tools;/usr/bin/')
	Mothur's directories:
	mothurtools=
		/Users/swestcott/Desktop/mothur/tools/
		/usr/bin/

## debug

The debug flag is used to indicate you want extra output to the screen
and logfile. It will help you spot file format issues that cause mothur
crashes.

    mothur > set.dir(debug=t)

## inputdir && outputdir

mothur allows you to change the input and output directories globally in
any command. For example:

    mothur > summary.seqs(fasta=amazon.fasta, inputdir=../inputFiles)

## modifynames

The modifynames flag is used to indicate how you want mothur to treat
sequence names containing ':' characters. Default=t, meaning if your
sequence names contain ':' change them to '\_' to avoid issues while
making trees. modifynames=F will leave sequence names as they are.

## Order of searching

When mothur is trying to find a file without a full path here are the
order of searches.

    1. Input directory
    2. Output directory
    3. Default path
    4. mothur's executable location
    5. mothur tools location

## Revisions

-   1.26.0 - added debug parameter
-   1.31.0 - added modifynames parameter. -
    [https://forum.mothur.org/viewtopic.php?f=10&t=2324&p=6360#p6360](https://forum.mothur.org/viewtopic.php?f=10&t=2324&p=6360#p6360)
-   1.36.0 - if output directory does not exist mothur will create it
    for you.
-   1.36.0 - By default tempdefault is set to mothur's executable
    location.
-   1.39.0 - Adds blastdir parameter.
-   1.44.0 - Adds tools parameter.
    [\#682](https://github.com/mothur/mothur/issues/682)
-   1.45.0 - Removes requirement for inputdir to be writable [\#747](https://github.com/mothur/mothur/issues/747)
-   1.47.0 - Removes BLAST from mothur. [\#801](https://github.com/mothur/mothur/issues/801)
-   1.47.0 - Allows for multiple saved locations for input, tools and mothurfiles parameters. [\#799](https://github.com/mothur/mothur/issues/799)
-   1.47.0 - Changes tempdefault parameter name to mothurfiles for clarity. [\#799](https://github.com/mothur/mothur/issues/799)
-   1.47.0 - Adds mothurhome key word. [\#800](https://github.com/mothur/mothur/issues/800)


