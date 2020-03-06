---


title: 'Makefile options'
---
If you are building mothur instead of downloading one of our
executables, there are several options for you to consider.


## Setting a default location

You can set a default location for mothur to look for input files, if
they are not found. This will allow you to keep your reference files in
one location and save time typing lengthy filenames. This location can
be overridden using the set.dir command at run time.

To do this: change Enter\_your\_default\_path\_here to the location you
would like to use as a default.

    MOTHUR_FILES = "\"Enter_your_default_path_here\""
    ifeq  ($$(strip $$(MOTHUR_FILES)),"\"Enter_your_default_path_here\"")
    else
       CXXFLAGS += -DMOTHUR_FILES=$${MOTHUR_FILES}
    endif

## Building a 64bit version

In order to take advantage of your 64bit architecture, you want to build
a 64 version of mothur. You do this by changing the \"no\" to a \"yes\"
below. Note: if you are a linux user, comment out the TARGET\_ARCH line
and uncomment the CXXFLAGS line.

     64BIT_VERSION ?= yes
     
      ifeq  ($$(strip $$(64BIT_VERSION)),yes)
        #if you are using centos uncomment the following lines
       #CXX = g++44
       
       #if you are a mac user use the following line
       TARGET_ARCH += -arch x86_64
       
       #if you using cygwin to build Windows the following lines
       #CXX = x86_64-w64-mingw32-g++
       #CC = x86_64-w64-mingw32-g++
       #FORTAN_COMPILER = x86_64-w64-mingw32-gfortran
       #TARGET_ARCH += -m64 -static
     
       #if you are a linux user use the following line
       #CXXFLAGS += -mtune=native -march=native -m64
       
        CXXFLAGS += -DBIT_VERSION
        FORTRAN_FLAGS = -m64
      endif

## Readline Library

The readline library is not required to run mothur, but it will allow
you to scroll through the commands you have entered if you are running
mothur in interactive mode. If you do not want to use the readline
library, change the yes to no below. If you are going to use it, make
sure you have the readline library and ncurses library installed on your
machine.

     USEREADLINE ?= yes
     
     ifeq  ($$(strip $$(USEREADLINE)),yes)
         CXXFLAGS += -DUSE_READLINE
         LDFLAGS += \
           -lreadline\
           -lncurses
     endif
