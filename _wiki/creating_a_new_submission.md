---
title: 'Creating a new submission'
redirect_from: '/wiki/Creating_a_new_submission'
---
You have finished your analysis and now you want to share your data.
mothur can help!

1\. The first command you want to run is
[get.mimarkspackage](/wiki/get.mimarkspackage). The
get.mimarkspackage command helps you fill provide all the necessary
experimental data about your samples. Here is a link to information
about the different mimarks packages,
[mimarks_data_packages](/wiki/MIMarks_Data_Packages).

2\. Create a project file. You can download a [ template
here](/wiki/Project_File).

3\. Run the [make.sra](/wiki/make.sra) command. This command will
parse your sff or fastq file and generate an xml file for submission.

4\. Email the SRA at NCBI (sra\@ncbi.nlm.nih.gov) to let them know you
are making a submission using mothur created files and need an aspera
key or ftp instructions. They will provide you with instructions from
there.
