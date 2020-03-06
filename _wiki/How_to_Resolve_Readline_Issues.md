---


title: 'How to Resolve Readline Issues'
---
If you are building mothur from source and want to use the readline
features you will need to install the readline libraries. For Linux,
users here\'s a short tutorial:

## Install Readline

The biggest problem people have is libreadline-dev is not available.
Depending on your version the readline version may have a different
name, so use yum search to find it:

    yum search readline

![](YumSearchReadline.png "YumSearchReadline.png")

To compile properly mothur needs the devel files.

    yum install readline-devel.x86_64
    yum install readline-static.x86_64

## Install Ncurses

Depending on your version the ncurses version may have a different name,
so use yum search to find it:

    yum search ncurses

![](YumSearchNcurses.png "YumSearchNcurses.png")

To compile properly mothur needs the devel files.

    yum install ncurses-devel.x86_64
    yum install ncurses-static.x86_64
