---


title: 'Batch mode'
---
In [batch mode](batch_mode) you can supply a file with a list
of commands that you want mothur to run. This would be useful if you
have a set of analyses that you know you are going to run and don\'t
want to have to wait for them to run. For example the batch file could
look like:

    cluster(column=final.dist, count=final.count_table, cutoff=0.03)
    collect.single()
    rarefaction.single() 

To run mothur in batch mode enter the name of the batch file after the
program name. For example:

    escriba:AmazonData pschloss$$ ../mothur/mothur batchfile

If you want to enter any comments in the batch file, simply make sure
that the first character on the line is a pound (i.e. \#) character:

    #This is a batch file for running the equivalent of dotur
    cluster(column=final.dist, count=final.count_table, cutoff=0.03)
    collect.single()
    rarefaction.single()

Of related interest is the [command line
mode](command_line_mode).
