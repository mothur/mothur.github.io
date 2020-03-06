---


title: 'Command line mode'
---
In the [command line mode](command_line_mode) you can run
mothur directly from the terminal. This may be advantageous for people
generating shell script pipelines. Following the name of the executable
(i.e. mothur) you would type out the commands within quote marks and the
first character being a pound sign (i.e. \'\#\'). The commands should be
separated by semicolons. For example, if you want to run the traditional
analysis performed by dotur using the
[AmazonData.zip](Media:AmazonData.zip) data set, then your
command line should look like this:

    escriba:AmazonData pschloss$$ mothur "#read.dist(phylip=98_sq_phylip_amazon.dist, cutoff=0.1); cluster(); collect.single(); rarefaction.single()"

A related option is to run mothur in [batch
mode](batch_mode).
