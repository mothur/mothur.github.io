---
title: 'Interactive mode'
---
When you start mothur, you will see a screen that looks like this:

    mothur v1.0
    Last updated: 1/29/2009

    by
    Patrick D. Schloss

    Department of Microbiology
    The University of Massachusetts
    pschloss@micro.umass.edu
[`https://schloss.micro.umass.edu/mothur`](https://schloss.micro.umass.edu/mothur)


    Distributed under the GNU General Public License

    Type 'help()' for information on the commands that are available

    Type 'quit()' to exit program

    mothur >

All of your commands will be entered from the mothur prompt. You can get
a list of commands by typing help() at the prompt and you can get more
specific help for each command by typing command\_name(help) at the
prompt. For example:

    mothur > align.seqs(help)

Would give you the help file information for the read.dist() command.

If you want to quit mothur you simply enter:

    mothur > quit()

or

    mothur > quit

With the exception of quit, all commands require you to provide an open
and close parentheses. If you supply any options there cannot be a space
between the option, the \'=\', and the option setting. To separate
options, use a comma. For example:

    mothur > cluster(method=furthest, cutoff=0.10)

Alternatively, If you know what commands you will be running, you can
use either the [command line mode](command_line_mode) or
[batch mode](batch_mode).
