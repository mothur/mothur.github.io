---
title: 'Makefile options'
redirect_from: '/wiki/Makefile_options'
---
If you are building mothur instead of downloading one of our
executables, there are several options for you to consider.


    OPTIMIZE ?= yes
    USEREADLINE ?= yes
    USEBOOST ?= no
    USEHDF5 ?= no
    USEGSL ?= no
    LOGFILE_NAME ?= no
    VERSION = ""1.44.0""

## Optimize

The optimize option will include the -O3 compile flag. The -O3 flag adds
compile time, but reduces execution time and code size.

    OPTIMIZE ?= yes

    ifeq  ($(strip $(OPTIMIZE)),yes)
        CXXFLAGS += -O3
    endif

## Setting a default location

You can set a default location for mothur to look for input files, if
they are not found. This will allow you to keep your reference files in
one location and save time typing lengthy filenames. This location can
be overridden using the set.dir command at run time.

To do this: change Enter\_your\_default\_path\_here to the location you
would like to use as a default. For example let's set my default to the
release folder on my desktop:

    MOTHUR_FILES = "/Users/sarahwestcott/desktop/release"

    ifeq  ($(strip $(MOTHUR_FILES)),""Enter_your_default_path_here"")
    else
       CXXFLAGS += -DMOTHUR_FILES=${MOTHUR_FILES}
    endif

To clear this at run time:

    mothur > set.dir(tempdefault=clear) 

or to set it to another location:

    mothur > set.dir(tempdefault=/Users/sarahwestcott/desktop/MiSeq_SOP)

## Set location for mothur's external tools

The mothur tools option can be used to set a default location for
mothur's external tools. For example, you might install vsearch,
uchime, prefetch and fasterq-dump in a central location like /usr/bin,
and indicate to mothur to look there:

    MOTHUR_TOOLS="/usr/bin"

    ifeq  ($(strip $(MOTHUR_TOOLS)),""Enter_your_mothur_tools_path_here"")
    else
        CXXFLAGS += -DMOTHUR_TOOLS=${MOTHUR_TOOLS}
    endif

You can set this location at run time using the set.dir command:

    mothur > set.dir(tools=/usr/bin)

## Set static logfile name

By default mothur will create a logfile for each run of mothur. The
default log file name is mothur.XXX.logfile, where XXX is the time and
date stamp. These logs can quickly add up. To set a static logfile name
that will be overwritten with each run of mothur try the following:

    LOGFILE_NAME ?=yes

    ifeq  ($(strip $(LOGFILE_NAME)),yes)
        LOGFILE_NAME=""mothur.logfile""
    endif

To silence the log feature compile with the name set to silent:

    ifeq  ($(strip $(LOGFILE_NAME)),yes)
        LOGFILE_NAME=""silent""
    endif

To set the log file name at run time:

    mothur > set.logfile(name=my.mothur.log)

## Readline Library

The readline library is not required to run mothur, but it will allow
you to scroll through the commands you have entered if you are running
mothur in interactive mode. If you do not want to use the readline
library, change the yes to no below. If you are going to use it, make
sure you have the readline library and ncurses library installed on your
machine.

     USEREADLINE ?= yes
     
     ifeq  ($(strip $(USEREADLINE)),yes)
         CXXFLAGS += -DUSE_READLINE
         LDFLAGS += \
           -lreadline\
           -lncurses
     endif

## Boost Libraries

The boost libraries allow the make.contigs command to read \*.gz files.
This is not required, but many users find it helpful. If you do not want
to use the boost libraries, simply change the yes to no below. If you
are going to use it, make sure you have the boost libraries installed on
your machine, and set the boost locations. For example, I installed the
boost libraries in /usr/local/lib with the include headers in
/usr/local/include:

    USEBOOST ?= yes
    BOOST_INCLUDE_DIR="/usr/local/include"
    BOOST_LIBRARY_DIR="/usr/local/lib"

    ifeq  ($(strip $(USEBOOST)),yes)

        LDFLAGS += -L ${BOOST_LIBRARY_DIR}

        LIBS += -lboost_iostreams -lz
        CXXFLAGS += -DUSE_BOOST -I ${BOOST_INCLUDE_DIR}
    endif

## HDF5 Libraries

The HDF5 libraries allow the biom.info command to read biom files in
HDF5 format. This is not required. If you do not want to use the hdf5
libraries, simply change the yes to no below. If you are going to use
it, make sure you have the hdf5 libraries installed on your machine, and
set the hdf5 locations. For example, I installed the hdf5 libraries in
/usr/local/lib with the include headers in /usr/local/include:

    USEHDF5 ?= yes
    HDF5_INCLUDE_DIR="/usr/local/include"
    HDF5_LIBRARY_DIR="/usr/local/lib"

    ifeq  ($(strip $(USEHDF5)),yes)

    LDFLAGS += -L ${HDF5_LIBRARY_DIR}
    LIBS += -lhdf5 -lhdf5_cpp
    CXXFLAGS += -DUSE_HDF5 -I ${HDF5_INCLUDE_DIR}

    endif

## GSL Libraries

The GSL libraries allow the estimator.single command. This is not
required. If you do not want to use the estimator.single command, simply
change the yes to no below. If you are going to use it, make sure you
have the GSL libraries installed on your machine, and set the GSL
locations. For example, I installed the GSL libraries in
/usr/local/gsl/lib with the include headers in /usr/local/gsl/include:

    USEGSL ?= yes
    GSL_LIBRARY_DIR ?= ""/usr/local/gsl/lib""
    GSL_INCLUDE_DIR ?= ""/usr/local/gsl/include""

    ifeq  ($(strip $(USEGSL)),yes)

    LDFLAGS += -L ${GSL_LIBRARY_DIR}
    LIBS += -lgsl -lgslcblas -lm
    CXXFLAGS += -DUSE_GSL -I ${GSL_INCLUDE_DIR}

    endif
