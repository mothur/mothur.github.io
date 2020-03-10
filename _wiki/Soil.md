---
title: 'Soil'
---
Here is a link to NCBI definition page for the
[soil](http://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.soil.4.0/)
package.

## Required

### sample\_name

This is your group name. Mothur will fill this in for you, thanks mom!

### description

Description of sample

### sample\_title

The title for your sample.

    format: {text} 

### seq\_methods

The free form descriptions of methods used to create the sequencing
library.

    format: {text}

### organism

You must choose this from the NCBI\'s list found here. This is
controlled vocabulary. Your choices are: activated carbon metagenome,
activated sludge metagenome, air metagenome, anaerobic digester
metagenome, ant fungus garden metagenome, aquatic metagenome, activated
carbon metagenome, activated sludge metagenome, beach sand metagenome,
biofilm metagenome, biofilter metagenome, biogas fermenter metagenome,
bioreactor metagenome, bioreactor sludge metagenome, clinical
metagenome, coal metagenome, compost metagenome, dust metagenome,
fermentation metagenome, food fermentation metagenome, food metagenome,
freshwater metagenome, freshwater sediment metagenome, groundwater
metagenome, halite metagenome, hot springs metagenome, hydrocarbon
metagenome, hydrothermal vent metagenome, hypersaline lake metagenome,
ice metagenome, indoor metagenome, industrial waste metagenome, mangrove
metagenome, marine metagenome, marine sediment metagenome, microbial mat
metagenome, mine drainage metagenome, mixed culture metagenome, oil
production facility metagenome, paper pulp metagenome, permafrost
metagenome, plastisphere metagenome, power plant metagenome, retting
rhizosphere metagenome, rock metagenome, salt lake metagenome, saltern
metagenome, sediment metagenome, snow metagenome, soil metagenome,
stromatolite metagenome, terrestrial metagenome, tomb wall metagenome,
wastewater metagenome, wetland metagenome, whale fall metagenome, algae
metagenome, ant metagenome, bat metagenome, beetle metagenome, bovine
gut metagenome, bovine metagenome, chicken gut metagenome, coral
metagenome, echinoderm metagenome, endophyte metagenome, epibiont
metagenome, fish metagenome, fossil metagenome, gill metagenome, gut
metagenome, honeybee metagenome, human gut metagenome, human lung
metagenome, human metagenome, human nasal/pharyngeal metagenome, human
oral metagenome, human skin metagenome, insect gut metagenome, insect
metagenome, mollusc metagenome, mosquito metagenome, mouse gut
metagenome, mouse metagenome, mouse skin metagenome, nematode
metagenome, oral metagenome, phyllosphere metagenome, pig metagenome,
plant metagenome, primate metagenome, rat metagenome, root metagenome,
sea squirt metagenome, seed metagenome, shoot metagenome, skin
metagenome, snake metagenome, sponge metagenome, stomach metagenome,
symbiont metagenome, termite gut metagenome, termite metagenome, upper
respiratory tract metagenome, urine metagenome, viral metagenome,
wallaby gut metagenome, wasp metagenome, synthetic metagenome,
metagenome. You can modify your choice after submission.

### collection\_date

Date of sampling, in \\\"DD-Mmm-YYYY\\\", \\\"Mmm-YYYY\\\" or
\\\"YYYY\\\" format (single instance, eg., 05-Oct-1990, Oct-1990 or
1990) or ISO 8601 standard \\\"YYYY-mm-dd\\\" or
\\\"YYYY-mm-ddThh:mm:ss\\\" (eg. 1990-11-05 or 1990-11-05T14:41:36)

    format: {timestamp}

### env\_biome

Major class of ecologically similar communities of plants, animals, and
other organisms (eg., desert, coral reef).

    format: {term}

### env\_feature

Geographical environmental feature (eg., harbor, lake).

    format: {term}

### geo\_loc\_name

Geographical origin of the sample; use the appropriate name from this
list <http://www.insdc.org/documents/country-qualifier-vocabulary>. Use
a colon to separate the country or ocean from more detailed information
about the location, eg \\\"Canada: Vancouver\\\" or \\\"Germany: halfway
down Zugspitze, Alps\\\".

    format: {term}:{term}:{text}

### lat\_lon

The geographical coordinates of the location where the sample was
collected. Specify as degrees latitude and longitude in format
\\\"d\[d.dddd\] N\|S d\[dd.dddd\] W\|E\\\", eg, 38.98 N 77.11 W.

    format: {float} {float}

### env\_material

The matter displaced by the sample (eg., air, soil, water).

    format: {term}

### depth

Depth is defined as the vertical distance below surface, e.g. for
sediment or soil samples depth is measured from sediment or soil
surface, respectivly. Depth can be reported as an interval for
subsurface samples.

    format: {float} m

### elev

The elevation of the sampling site as measured by the vertical distance
from mean sea level.

    format: {float} {unit}

## Optional

### agrochem\_addition

The addition of fertilizers, pesticides, etc. - amount and time of
applications.

    format: {text};{float} {unit};{timestamp}

### al\_sat

The aluminum saturation (esp. for tropical soils).

    format: {float} {unit}

### al\_sat\_meth

The reference or method used in determining Al saturation.

    format: {PMID|DOI|URL}

### ammonium

The concentration of ammonium.

    format: {float} {unit}

### altitude

The altitude of the sample is the vertical distance between Earth\'s
surface above Sea Level and the sampled position in the air.

    format: {float} m

### annual\_season\_precpt

The mean annual and seasonal precipitation (mm).

    format: {float} {unit}

### annual\_season\_temp

The mean annual and seasonal temperature (oC).

    format: {float} {unit}

### crop\_rotation

Whether or not crop is rotated, and if yes, rotation schedule.

    format: {boolean};Rn/{timestamp}/{period}

### cur\_land\_use

The present state of sample sitel.

    format: [, 'cities', 'farmstead', 'industrial areas', 'roads/railroads', 'rock', 'sand', 'gravel', 'mudflats', 'salt flats', 'badlands', 'permanent snow or ice', 'saline seeps', 'mines/quarries', 'oil waste areas', 'small grains', 'row crops', 'vegetable crops', 'horticultural plants (e.g. tulips)', 'marshlands (grass,sedges,rushes)', 'tundra (mosses,lichens)', 'rangeland', 'pastureland (grasslands used for livestock grazing)', 'hayland', 'meadows (grasses,alfalfa,fescue,bromegrass,timothy)', 'shrub land (e.g. mesquite,sage-brush,creosote bush,shrub oak,eucalyptus)', 'successional shrub land (tree saplings,hazels,sumacs,chokecherry,shrub dogwoods,blackberries)', 'shrub crops (blueberries,nursery ornamentals,filberts)', 'vine crops (grapes)', 'conifers (e.g. pine,spruce,fir,cypress)', 'hardwoods (e.g. oak,hickory,elm,aspen)', 'intermixed hardwood and conifers', 'tropical (e.g. mangrove,palms)', 'rainforest (evergreen forest receiving >406 cm annual rainfall)', 'swamp (permanent or semi-permanent water body dominated by woody plants)', 'crop trees (nuts,fruit,christmas trees,nursery trees)']

### cur\_vegetation

The vegetation classification from one or more standard classification
systems, or agricultural crop.

    format: {text}

### cur\_vegetation\_meth

The reference or method used in vegetation classification.

    format: {PMID|DOI|URL}

### depth

Depth is defined as the vertical distance below surface, e.g. for
sediment or soil samples depth is measured from sediment or soil
surface, respectivly. Depth can be reported as an interval for
subsurface samples..

    format: {float} m

### drainage\_class

The drainage classification from a standard system such as the USDA
system.

    format: [, 'very poorly', 'poorly', 'somewhat poorly', 'moderately well', 'well', 'excessively drained']

### extreme\_event

The unusual physical events that may have affected microbial
populations.

    format: {timestamp}

### extreme\_salinity

The measured salinity.

    format: {float} {unit}

### fao\_class

The soil classification from the FAO World Reference Database for Soil
Resources.

    format: {term}

### fire

The historical and/or physical evidence of fire.

    format: {timestamp}

### flooding

The historical and/or physical evidence of flooding.

    format:  {timestamp}

### heavy\_metals

The heavy metals present and concentrationsany drug used by subject and
the frequency of usage; can include multiple heavy metals and
concentrations.

    format: {text};{float} {unit}

### heavy\_metals\_meth

The reference or method used in determining heavy metals.

    format: {PMID|DOI|URL}

### horizon

The specific layer in the land area which measures parallel to the soil
surface and possesses physical characteristics which differ from the
layers above and beneath.

    format: [, 'O horizon', 'A horizon', 'E horizon', 'B horizon', 'C horizon', 'R layer', 'Permafrost']

### horizon\_meth

The reference or method used in determining the horizon.

    format: {PMID|DOI|URL}

### link\_addit\_analys

Links to additional analysis.

    format: {PMID|DOI|URL}

### link\_class\_info

The link to digitized soil maps or other soil classification
information.

    format: {PMID|DOI|URL}

### link\_climate\_info

The link to climate resource.

    format: {PMID|DOI|URL}

### local\_class

The soil classification based on local soil classification system.

    format: {text} 

### local\_class\_meth

The reference or method used in determining the local soil
classification

    format: {PMID|DOI|URL}

### microbial\_biomass

The the part of the organic matter in the soil that constitutes living
microorganisms smaller than 5-10 µm. IF you keep this, you would need to
have correction factors used for conversion to the final units, which
should be mg C (or N)/kg soil)..

    format: {float} {unit}

### microbial\_biomass\_meth

The reference or method used in determining microbial biomass.

    format: {PMID|DOI|URL}

### ph

The pH measurement.

    format: {float} {unit}

### ph\_meth

The reference or method used in determining pH.

    format: {PMID|DOI|URL}

### pool\_dna\_extracts

Were multiple DNA extractions mixed? how many?.

    format: {boolean};{float} {unit}

### previous\_land\_use

The previous land use and dates.

    format: {text};{timestamp}

### previous\_land\_use\_meth

The reference or method used in determining previous land use and dates.

    format: {PMID|DOI|URL}

### profile\_position

The cross-sectional position in the hillslope where sample was
collected.sample area position in relation to surrounding areas.

    format: [, 'summit', 'shoulder', 'backslope', 'footslope', 'toeslope']

### rel\_to\_oxygen

Aerobic or anaerobic

    format: [, 'aerobe', 'anaerobe', 'facultative', 'microaerophilic', 'microanaerobe', 'obligate aerobe', 'obligate anaerobe']

### salinity\_meth

The reference or method used in determining salinity.

    format: {PMID|DOI|URL}

### samp\_collect\_device

Method or device employed for collecting sample

    format: {text}

### samp\_mat\_process

Processing applied to the sample during or after isolation.

    format: {text|term}

### samp\_size

The sample size.

    format: {float} {unit}

### samp\_weight\_dna\_ext

The weight (g) of soil processed.

    format: {float} g

### sieving

The collection design of pooled samples and/or sieve size and amount of
sample sieved.

    format: ``{ {text}|{float} {unit}}`{=mediawiki}`;{float} {unit}

### slope\_aspect

The the direction a slope faces. While looking down a slope use a
compass to record the direction you are facing (direction or degrees);
e.g., NW or 315°. This measure provides an indication of sun and wind
exposure that will influence soil .

    format: {float} {unit}

### slope\_gradient

The commonly called \\\\u201cslope.\\\\u201d The angle between ground
surface and a horizontal line (in percent). This is the direction that
overland water would flow. This measure is usually taken with a hand
level meter or clinometer.

    format: {float} {unit}

### soil\_type

The soil series name or other lower-level classification.

    format: {text} 

### soil\_type\_meth

The reference or method used in determining soil series name or other
lower-level classification.

    format: {PMID|DOI|URL}

### store\_cond

Explain how and for how long the soil sample was stored before DNA
extraction..

    format: {text};{period}

### texture

The the relative proportion of different grain sizes of mineral
particles in a soil, as described using a standard system; express as %
sand (50 um to 2 mm), silt (2 um to 50 um), and clay (\<2 um) with
textural name (e.g., silty clay loam) optional.

    format: {float} {unit}

### texture\_meth

The reference or method used in determining soil texture.

    format: {PMID|DOI|URL}

### tillage

The note method(s) used for tilling.

    format: [, 'drill', 'cutting disc', 'ridge till', 'strip tillage', 'zonal tillage', 'chisel', 'tined', 'mouldboard', 'disc plough']

### tot\_n

The total nitrogen content of the soil Units of g N/kg soil.

    format: {float} {unit}

### tot\_n\_meth

The reference or method used in determining the total N.

    format: {PMID|DOI|URL}

### tot\_org\_c\_meth

The reference or method used in determining total organic C.

    format: {PMID|DOI|URL}

### tot\_org\_carb

Definition for soil: total organic C content of the soil units of g C/kg
soil. Definition otherwise: total organic carbon content.

    format: {float} {unit}

### water\_content\_soil

The water content (g/g or cm3/cm3).

    format: {float} [g/g|cm3/cm3]

### water\_content\_soil\_meth

The reference or method used in determining the water content of soil.

    format: {PMID|DOI|URL}

### user\_defined

You may create your own optional fields to describe your sample.
