---
title: 'sens.spec'
tags: 'commands'
redirect_from: '/wiki/Sens.spec'
---
The **sens.spec** command\...

## Default Parameters

    mothur > sens.spec(list=96_lt_column_amazon.fn.list, column=96_lt_column_amazon.dist, name=amazon.names)

or

    mothur > sens.spec(list=96_lt_column_amazon.fn.list, column=96_lt_column_amazon.dist, count=amazon.count_table)

or

    mothur > sens.spec(list=96_lt_column_amazon.fn.list, phylip=98_lt_phylip_amazon.dist)

If you open 96\_lt\_column\_amazon.fn.sensspec, you would see:

    label  cutoff  tp  tn  fp  fn  sensitivity specificity ppv npv fdr   accuracy  mcc f1score
    unique unique  2   4751    0   0   1   1   1   1   0   1   1   1
    0.00   0.00    3   4750    0   0   1   1   1   1   0   1   1   1
    0.01   0.01    5   4746    0   2   0.7143  1   1   0.9996  0   0.9996  0.845   0.8333
    0.02   0.02    14  4737    0   2   0.875   1   1   0.9996  0   0.9996  0.9352  0.9333
    0.03   0.03    21  4732    0   0   1   1   1   1   0   1   1   1
    0.04   0.04    24  4728    0   1   0.96    1   1   0.9998  0   0.9998  0.9797  0.9796
    0.05   0.05    34  4717    0   2   0.9444  1   1   0.9996  0   0.9996  0.9716  0.9714

## Options

### name

The name parameter allows you to enter a name file associated with your
distance matrix.

### count

The count parameter allows you to enter a count file associated with
your distance matrix.

### hard

### precision

### cutoff

### label

## Revision

-   1.23.0 - fixed label option and added smart distancing.
-   1.29.0 - increased speed and reduced memory required.
-   1.38.0 - added count parameter


