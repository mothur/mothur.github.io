---
title: 'Execution'
---
[Execution](Execution) of mothur is done from a command line.
Because this is not a commercial piece of software, but rather software
designed for microbial ecologists, by microbial ecologists, it is
missing a few bells and whistles. Namely, the program is driven from the
command line. This was a necessary design choice in order to serve
researchers who like to use linux, mac, and windows operating systems.

## Starting mothur

### Mac OSX

To run mothur on a Mac, you need to open the Terminal program. If it
isn\'t already on your dock, in the Finder press Command-Shift-A, which
will open a window with the list of programs on your machine. From there
open the Utilities folder. Drag the Terminal.app icon to your doc and
click on the icon to open the terminal window. Alternatively, you can
double click on the Terminal.app icon in the Utilities folder without
moving it to your dock. The terminal window automatically opens in your
home directory (/Users/yourname/ aka \~/). You should see something
like:

    escriba:~ pschloss$$ 

You next need to move to the folder containing your data. If you
decompress the [AmazonData.zip](Media:AmazonData.zip) file
into a folder in your home directory, you can move there by typing:

    escriba:~ pschloss$$ cd AmazonData

If you type:

    escriba:~ pschloss$$ ls

You will see the contents of the AmazonData folder.

Now you need to know the path of the mothur executable. Assuming you
installed mothur to a folder called mothur in your home directory, type:

    escriba:AmazonData pschloss$$  ../mothur/mothur

or

    escriba:AmazonData pschloss$$  ~/mothur/mothur

If you\'re a unix pro, you can add mothur to your path so that you only
need to type:

    escriba:AmazonData pschloss$$ mothur

This will put mothur into an interactive mode. Alternatively, to put it
into a batch mode where you provide a file of commands you need to type:

    escriba:AmazonData pschloss$$  ~/mothur/mothur batchfile

### Linux/Unix

[ Download file](Download_mothur), or for version 2.2b type
in a terminal:

` wget `[`http://schloss.micro.umass.edu/w/images/2/2b/Mothur.source.zip`](http://schloss.micro.umass.edu/w/images/2/2b/Mothur.source.zip)

Installation from the command line:

     mkdir mothur
     cd mothur
     unzip ../Mothur.source.zip
     make

running mothur, from the command line:

     cd mothur
     ./mothur

### Windows

Mothur is a command line program. You can run it in interactive mode by
double-clicking on the `mothur.exe` executable.

Alternatively, you can run it from the command line. To open a terminal
in windows select *Run* from the *Start* menu. Type `cmd` into the run
window and click *OK*. This will bring up a terminal window. From here,
it is convenient to move to the directory containing your data so it can
be access without specifying path names within mothur. If you decompress
the [AmazonData.zip](Media:AmazonData.zip) file into a folder
in your *My Documents* directory, you can move there by typing:

    cd "C:\Documents and Settings\`<your name>`\My Documents\AmazonData"

Now you need to know the path of the mothur executable. Assuming you
placed mothur in a folder called mothur on your C drive, you can start
mothur in interactive mode by typing:

    C:\mothur\mothur.exe

The following error will be reported when starting mothur, but can be
safely ignored:

    'clear' is not recognized as an internal or external command, operable program or batch file.

You can also run mothur in batch mode. In batch mode, commands from a
file will be processed. To run mothur in batch mode give it the name of
the file containing the commands you wish to have executed:

     C:\mothur\mothur.exe C:\mothur\commands.txt

If you wish to avoid the use of the command line, you can also run
mothur in batch mode by creating a batch file. For example, create a
file called mothur.bat in the directory containing mothur.exe. Edit this
batch file to contain the lines:

    mothur commands.txt
    pause

You can now double click on mothur.bat to execute mothur in batch mode
with the commands given in commands.txt. The pause line causes the
command line window that open to remain open until you press a key. This
will allow you to inspect your results.

## Available modes

Most users will prefer to run mothur from the default [interactive
mode](interactive_mode). If you are developing a pipeline
that includes mothur, a [command line
mode](command_line_mode) and [batch
mode](batch_mode) are available as well.
