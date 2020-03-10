---
title: 'Air environment'
---
Here is a link to NCBI definition page for the [air
package](http://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.air.4.0/).

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

format: {term}

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

### altitude

The altitude of the sample is the vertical distance between Earth\'s
surface above Sea Level and the sampled position in the air.

    format: {float} m

## Optional

### barometric\_press

The force per unit area exerted against a surface by the weight of air
above that surface.

    format: {float} {unit}

### carb\_dioxide

The carbon dioxide (gas) amount or concentration at the time of
sampling.

    format: {float} {unit}

### carb\_monoxide

The carbon monoxide (gas) amount or concentration at the time of
sampling.

    format: {float} {unit}

### chem\_administration

The list of chemical compounds administered to the host or site where
sampling occurred, and when (e.g. antibiotics, N fertilizer, air
filter); can include multiple compounds. For Chemical Entities of
Biological Interest ontology (CHEBI) (v1.72), please see
<http://bioportal.bioontology.org/visualize/44603>.

    format: {term}; {timestamp}

### elev

The elevation of the sampling site as measured by the vertical distance
from mean sea level.

    format: {float} {unit}

### humidity

The amount of water vapour in the air, at the time of sampling.

    format: {float} {unit}

### methane

The methane (gas) amount or concentration at the time of sampling.

    format: {float} {unit}

### organism\_count

The total count of any organism per gram or volume of sample,should
include name of organism followed by count; can include multiple
organism counts.

    format: {text};{float} {unit}

### oxy\_stat\_samp

The oxygenation status of sample.

    format: [, 'aerobic', 'anaerobic']

### oxygen

The oxygen (gas) amount or concentration at the time of sampling.

    format: {float} {unit}

### perturbation

The type of perturbation, e.g. chemical administration, physical
disturbance, etc., coupled with time that perturbation occurred; can
include multiple perturbation types.

    format: {text};{interval}

### pollutants

The pollutant types and, amount or concentrations measured at the time
of sampling; can report multiple pollutants by entering numeric values
preceded by name of pollutant.

    format: {text};{float} {unit}

### rel\_to\_oxygen

Aerobic or anaerobic

    format: [, 'aerobe', 'anaerobe', 'facultative', 'microaerophilic', 'microanaerobe', 'obligate aerobe', 'obligate anaerobe']

### resp\_part\_matter

The concentration of substances that remain suspended in the air, and
comprise mixtures of organic and inorganic substances (PM10 and PM2.5);
can report multiple PM\'s by entering numeric values preceded by name of
PM

    format: {text};{float} {unit}

### samp\_collect\_device

Method or device employed for collecting sample

    format: {text}

### samp\_mat\_process

Processing applied to the sample during or after isolation.

    format: {text|term}

### samp\_salinity

The sample salinity.

    format: {float} {unit}

### samp\_size

The sample size.

    format: {float} {unit}

### samp\_store\_dur

The sample storage duration.

    format: {interval}

### samp\_store\_loc

The sample storage location. Usually name of a specific freezer/room

    format: {text}

### samp\_store\_temp

The sample storage temperature.

    format: {float} {unit}

### solar\_irradiance

The amount of solar energy that arrives at a specific area of a surface
during a specific time interval.

    format: {float} {unit}

### temp

The temperature of the sample at time of sampling.

    format: {float} {unit}

### ventilation\_rate

The ventilation rate of the system in the sampled premises.

    format: {float} {unit}

### ventilation\_type

The ventilation system used in the sampled premises.

    format: {text}

### volatile\_org\_comp

The concentration of carbon-based chemicals that easily evaporate at
room temperature; can report multiple volatile organic compounds by
entering numeric values preceded by name of compound.

    format: {text};{float} {unit}

### wind\_direction

The wind direction is the direction from which a wind originates.

    format: {text}

### wind\_speed

The speed of wind measured at the time of sampling.

    format: {float} {unit}

### user\_defined

You may create your own optional fields to describe your sample.
