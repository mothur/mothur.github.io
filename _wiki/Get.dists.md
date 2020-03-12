---
title: 'Get.dists'
tags: 'commands'
---
The **get.dists** command selects distances from a
phylip or column file related to groups or sequences listed in an accnos
file.


## accnos

The accnos file contains a list of the groups or sequences you would
like distances selected for. For example:

final.test.accnos contains:

    F003D000   
    F003D002
    F003D004       
    F003D142   
    F003D144 

## phylip

The phylip option is used to specify the name of the [ phylip
formatted](phylip-formatted_distance_matrix) distance file
you would like to select distances from.

The final.tre1.weighted.ave.dist file contains:

    11
    F003D000   
    F003D002   0.219014    
    F003D004   0.405823    0.285439    
    F003D006   0.311126    0.227599    0.197012    
    F003D008   0.246074    0.221351    0.341801    0.220774    
    F003D142   0.381307    0.350587    0.175825    0.199702    0.331989    
    F003D144   0.380843    0.3943  0.350766    0.278915    0.37678 0.239005    
    F003D146   0.277258    0.300362    0.331904    0.242542    0.239576    0.246918    0.160718    
    F003D148   0.308621    0.299937    0.303805    0.254025    0.27361 0.246377    0.15778 0.120112    
    F003D150   0.315133    0.307792    0.206429    0.209389    0.27078 0.179998    0.260263    0.217917    0.195339    
    MOCK.GQY1XT001 0.64778 0.69245 0.769817    0.703035    0.61892 0.715547    0.662322    0.613735    0.648762    0.716918    

    mothur > get.dists(phylip=final.tre1.weighted.ave.dist, accnos=final.test.accnos)

creates a final.tre1.weighted.ave.pick.dist file:

    5
    F003D000   
    F003D002   0.219014    
    F003D004   0.405823    0.285439    
    F003D142   0.381307    0.350587    0.175825    
    F003D144   0.380843    0.3943  0.350766    0.239005    

## column

The column option is used to specify the name of the [ column
formatted](column-formatted_distance_matrix) distance file
you would like to select distances from.

    U68590 U68589 0.67
    U68591 U68589 0.7559
    U68591 U68590 0.8011
    U68592 U68589 0.6585
    U68592 U68590 0.6528
    U68592 U68591 0.7849
    U68593 U68589 0.6953
    U68593 U68590 0.6383
    U68593 U68591 0.7741
    U68593 U68592 0.6041
    U68594 U68589 0.7109
    U68594 U68590 0.7233
    ...

If you only want sequences U68589, U68590 and U68592.

    mothur > get.dists(column=amazon.dist, accnos=amazon.test.accnos)

amazon.pick.dist contains:

    U68590 U68589  0.67
    U68592 U68589  0.6585
    U68592 U68590  0.6528

## Revisions

-   1.30.0 - First Introduced


