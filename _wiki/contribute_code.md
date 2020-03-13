---
title: 'Contribute code'
redirect_from: '/wiki/Contribute_code'
---
Thanks for wanting to be a part of the mothur project! \...

## Creating a command that can be added to mothur

All commands in mothur have the same basic structure inherited from the
command class. Commands must have an execute and help function, and the
constructor may only accept a string. Here are some template files to
get you started [ command template ](https://mothur.s3.us-east-2.amazonaws.com/wiki/command.zip).

Each command is responsible for error checking the inputs it receives,
but there are several classes that can help with this, or you may create
your own. OptionParser and ValidParameters will help parse the input and
make sure input files can be opened.

To allow for the input/output redirect, mothur will add the parameters
outputdir and inputdir to your option string if needed. You may want to
take a look at readotucommand.cpp to get a feel for how we handled
these.

Once you have created your command class, you will need to add a few
lines to commandfactory.cpp to enable mothur to run it.


1\.  Include the c++ header file for your command.

2\.  In the CommandFactory::CommandFactory add your command to the list
    of valid commands with a line like:

        commands["yourawesomecommand"] = "yourAwesomeCommand";


3\.  In CommandFactory::getCommand add another else if line like:

        else if(commandName == "yourAwesomeCommand") { command = new YourCommand(optionString);  }

## Submitting your command

Please email your new files as well as any existing files you modified
to pschloss\@umich.edu so we can add them to the repository and include
them in our next release.

## Adding a wiki page for your command

Also, please add a wiki page to help others use your new command.
