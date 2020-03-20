---
title: 'system'
tags: 'commands'
redirect_from: '/wiki/System'
---
The **system** command allows the user to run programs
outside of mothur without leaving the mothur environment. This command
is useful for changing directories and renaming files. The syntax for
this command is different from the other commands - the actual command
that needs to be run should be placed within the parentheses. If you are
unfamiliar with shell programs you might familiarize yourself with the
different [ mac/linux](https://en.wikipedia.org/wiki/List_of_Unix_commands) and [
windows](https://en.wikipedia.org/wiki/List_of_DOS_commands) shell programs that are
available.

## Examples

To copy a file in the Mac/Linux environment:

    mothur > system(cp esophagus.unique.bad.accnos esophagus.bad.accnos)

To copy a file in the Windows environment:

    mothur > system(copy esophagus.unique.bad.accnos esophagus.bad.accnos)

To mock someone in the Mac environment:

    mothur > system(say -v Vicki joe smells)
