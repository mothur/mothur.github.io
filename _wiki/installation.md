---
title: 'Installation'
redirect_from: '/wiki/Installation'
---
## Quick and Easy Install

Most of our users choose to download the prebuilt executable. This
option does not require you to have a compiler or any other tools
installed on your machine. You simply download a zip file. Decompress it
and start using mothur. Sound good? You can download our latest
executable versions [here](https://github.com/mothur/mothur/releases).

## Building From Scratch

[makefile options](Makefile_options) to consider before you
get started.

### Dependencies

Mothur can be built and run WITHOUT any dependancies. But some
additional features may be useful for your specific applications. You
can include these extra features by installing the following
dependancies and compiling mothur with the flags set to yes. [Dependency
Install](https://github.com/mothur/mothur/blob/master/INSTALL.md)

#### Boost

Mothur uses the boost library to read compressed files in the
make.contigs command. If you would like to be able to use this option,
you must install Boost and set the boost flags in the makefile.

    USEBOOST ?= yes
    BOOST_LIBRARY_DIR ?= "\"/usr/local/lib\""
    BOOST_INCLUDE_DIR ?= "\"/usr/local/include\""

#### HDF5

Mothur uses the HDF5 library to read biom files in HDF5 format. If you
would like to use biom files in this format within mothur, you must
install the HDF5 library and set the HDF5 flags.

    USEHDF5 ?= yes
    HDF5_LIBRARY_DIR ?= "\"/usr/local/hdf5/lib\""
    HDF5_INCLUDE_DIR ?= "\"/usr/local/hdf5/include\""

### Mac OSX

In the Mac OSX and Linux-type environments, you need to have a C++
compiler installed. These are typically installed with most linux-type
operating systems and is on the Mac OSX **installation** CD/DVD. For Mac OSX
users, you need to install the Xcode developer\'s tools. After [
downloading mothur](Download_mothur), decompress it. If you
want to house mothur off of your home folder (because don\'t we all want
to live with our moms forever?), open a terminal window and enter:

    escriba:~ pschloss$$ unzip mothur.zip

This will generate a mothur folder. Now move into the mothur folder and
compile mothur:

    escriba:~ pschloss$$ cd mothur
    escriba:~ pschloss$$ make

Go ahead and try to run mothur:

    escriba:~ pschloss$$ ./mothur

Hopefully, mothur will open in the interactive mode. For now type quit()
at the mothur prompt. mothur is installed.

If you are analyzing large data sets (e.g. from pyrosequencing) in OS X
and you have more than 2 GB of RAM in your computer, you can add a flag
to the make file to use 64-bit pointers by opening the makefile and
changing the lines that read:

    64BIT_VERSION ?= no

to

    64BIT_VERSION ?= yes

This will add -arch x86\_64 to the compiling and linking flags.

Save the makefile and run make clean, then re-do the make command. The
flag to compile with 64-bit pointers seems dependent on the architecture
of your processor; replace x86\_64 with ppc64 to compile for 64-bit
PowerPC architecture.

If you would like to build a mpi-enabled version of mothur you must
change:

    USEMPI ?= no

to

    USEMPI ?= yes

### Linux/Unix

In Linux-type environments, you need to have a C++ compiler installed.
These are typically pre-installed with most linux-type operating
systems, and are always in a repository for a distribution (the package
is named build-essential in Debian and Ubuntu). After [ downloading
mothur](Download_mothur), decompress it. If you want to house
mothur off of your home folder (because don\'t we all want to live with
our moms forever?), open a terminal window and enter:

     mkdir mothur
     cd mothur
     unzip ../Mothur.source.zip
     make

There are numerous errors that say \"warning: no newline at end of
file\", but they do not cause a problem.

To run mothur:

     ./mothur

Hopefully, mothur will open in the interactive mode. For now type quit()
at the mothur prompt. mothur is installed.

You can also add mothur to system PATH, this will enable you to run
mothur from within any folder on your computer without having to move
the binary everytime. For Ubuntu users, you can do so by editing the

\.bashrc file, a hidden file in your Home folder. Open the file in edit
mode and enter the following at the end (replace
*path\_to\_mothur\_binary\_folder* with the real path):

     # User specific environment and startup programs
     PATH=~/`*`path_to_mothur_binary_folder`*`:$${PATH}

To run mothur from within any folder:

     mothur

If you are analyzing large data sets (e.g. from pyrosequencing) on a
64bit system and you have more than 2 GB of RAM in your computer, you
can add a flag to the make file to use 64-bit pointers by opening the
makefile and changing the line that reads:

    64BIT_VERSION ?= no

to

    64BIT_VERSION ?= yes

You will also need to uncomment a few lines in the makefile, for a more
detailed explanation of makefile options see, [Makefile
options](Makefile_options):

    ifeq  ($$(strip $$(64BIT_VERSION)),yes)
       #if you are using linux user uncomment the following lines
       CXX = g++44
       CXXFLAGS += -mtune=native -march=native -m64

       #if you are a mac user use the following line
       #TARGET_ARCH += -arch x86_64

       #if you using cygwin to build Windows the following line
       #CXX = x86_64-w64-mingw32-g++
       #CC = x86_64-w64-mingw32-g++
       #FORTAN_COMPILER = x86_64-w64-mingw32-gfortran
       #TARGET_ARCH += -m64 -static

       CXXFLAGS += -DBIT_VERSION 
       FORTRAN_FLAGS = -m64
    endif

Save the makefile and re-do the make command. The flag to compile with
64-bit pointers seems dependent on the architecture of your processor.

If you have complied problem with readline, try to install the ncurses
and readline development libraries first:

On Ubuntu:

     sudo apt-get install libreadline-dev libreadline5-dev

On RedHat / Centos (as root):

     yum install readline-devel ncurses-devel

If you are having trouble with the readline libraries, try this [How to
Resolve Readline Issues](How_to_Resolve_Readline_Issues). If
you are sure you have the readline library installed already, try to add
-lncurses after -lreadline in the makefile

     LNK_OPTIONS = \
         -lreadline\
         -lncurses\
         -L../readline-6.0

Alternatively, open the makefile and remove the lines that refer to the
readline library and recompile.

**Additional notes for compiling v1.9.0:** Make sure that you have
installed the openMPI package from your software repository on your
desktop. For Ubuntu users, this is available in the Synaptic Package
Manager under System\> Administration\>

Alternatively install the following package using apt-get in Ubuntu.
This will work in Karmic Koala (9.10) other versions of Ubuntu might use
different package names or have different package versions.

        sudo apt-get install openmpi-bin openmpi-common libopenmpi-dbg libopenmpi-dev libopenmpi1.3
## 

**CentOS tips** (32-bit and 64-bit is similar)

Edit by Hoytpr: mpi is not installed by default using CentOS 5.4. If you
are running CentOS 5.4 on a 32-bit machine, you can use the command:

        yum –y install openmpi openmpi-devel

You will see that only the openmpi-1.3.2-gcc-i386 and
openmpi-1.3.2-gcc-i386-devel will install.

Then type use the mpi-selector-menu to select the newly installed mpi as
the default

      [hoyt@biochem5]$$ mpi-selector-menu
`  Current System default: `<none>
      
       "u" and "s" modifiers can be added to numeric and "U"
       commands to specify "user" or "system-wide".
       
       1. openmpi-1.3.2-gcc-i386
       U. Unset default
       Q. Quit
       
       Selection (1[us], U[us], Q):

Answer \"1s\" to get the mpi and system-wide default, then Q; to Quit.
Logout, then log back in and type \<which mpic++\>

        [hoyt@biochem5 ~]$$ which mpic++
        /usr/lib/openmpi/1.3.2-gcc/bin/mpic++

Looks good, but you are not quite finished! Two steps: FIRST STEP is to
compile mothur using the <make> command from within the mothur
directory. You will get lots of errors, but ignore them for now. Once
the makefile is done, if you try to run mothur, you will get an ERROR
like this:

       [hoyt@biochem5 mothur]$$ ./mothur
       librdmacm: couldn't read ABI version.
       librdmacm: assuming: 4
       libibverbs: Fatal: couldn't read uverbs ABI version.
       CMA: unable to open /dev/infiniband/rdma_cm
       --------------------------------------------------------------------------
       WARNING: Failed to open "OpenIB-cma" [dat_internal_error:].
       This may be a real error or it may be an invalid entry in the uDAPL
       Registry which is contained in the dat.conf file. Contact your local
       System Administrator to confirm the availability of the interfaces in
       the dat.conf file.
       --------------------------------------------------------------------------

SECOND STEP: You must change the file etc/openmpi-mca-params.conf (it
might be in a different location on your machine). To make the change,
add the line:

      btl=self

to the end of the file. Now you can run mothur!

The problem is that it\'s looking for an infiniband card in your
machine, so this tells it that you\'re just using the same machine.
(Thanks to my great friend and computer guru Dana for this tip!)

### Windows

See the [downloads](Download_mothur) page to obtain the
Window\'s executable version of mothur. Mothur comes as a compressed
file known as a ZIP file. To decompress this file, double click on it
and follow the instructions. Consider decompressing mothur to a
directory such as C:\\mothur.

Alternatively, you can build mothur from source using a tool like
cygwin, [https://www.cygwin.com](https://www.cygwin.com):

#### Download and install cygwin

-   Run cygwin setup-x86\_64.
-   Choose the mingw64x86\_64 compliers for c++ and c - under the devel
    category.
-   Install make utility - under the devel category
-   Include any additional packages cygwin recommends installing.

#### Alter mothur makefile

    64BIT_VERSION ?= yes
    USEREADLINE ?= no
    USEBOOST ?= no
    RELEASE_DATE = "\"3/6/2017\""
    VERSION = "\"1.39.4\""

    # Optimize to level 3:
           CXXFLAGS += -O3 -std=c++0x


    ifeq  ($$(strip $$(64BIT_VERSION)),yes)
       #if you are a mac user use the following line
           #TARGET_ARCH += -arch x86_64

           #if you using cygwin to build Windows the following line
           CXX = x86_64-w64-mingw32-g++
           CC = x86_64-w64-mingw32-g++
           TARGET_ARCH += -m64 -static

           #if you are a linux user use the following line - specific processor builds in future??
           #CXXFLAGS += -mtune=generic

           CXXFLAGS += -DBIT_VERSION
    endif

#### Building with Cygwin

-   Open Cygwin64Terminal program
-   cd to directory with mothur\'s source
-   Run make clean, then make.
