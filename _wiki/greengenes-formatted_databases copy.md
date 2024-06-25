---
title: 'greengenes2-formatted databases'
redirect_from: '/wiki/greengenes2-formatted_databases'
---

The [biocore group](https://github.com/biocore/greengenes2/) released an updated version of the greengenes taxonomy in [October 2022](https://ftp.microbio.me/greengenes_release/2022.10/), which was published in [Nature Biotechnology](https://www.nature.com/articles/s41587-023-01845-1). If you use these files, you should cite McDonald et al.

I have modified the version made available on the greengenes2 ftp server. The most notable difference is that I removed the species level names since more than two thirds of the genera only have one species name. In my opinion, this would give an overly specific sense of the classification of your sequences since there is insufficient diversity within each species. If you would like to see how to get the species names and see how else I modified the files, please see the [mothur blog post](/blog/2014/greengenes-v13_8_99-reference-files) which is the same as the README file found within the download that I am making available.

* [greengenes2 (2020_10, wo/ species level names)](https://mothur.s3.us-east-2.amazonaws.com/wiki/greengenes2_2020_10.wo_sp.tgz)