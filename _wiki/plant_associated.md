---
title: 'Plant associated'
redirect_from: '/wiki/Plant_associated'
---
Here is a link to NCBI definition page for the [plant\_associated
package](https://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.plant-associated.4.0/).

## Required

### sample\_name

This is your group name. mothur will fill this in for you, thanks mom!

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

You must choose this from the NCBI's list found here. This is
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

Date of sampling, in \\"DD-Mmm-YYYY\\", \\"Mmm-YYYY\\" or
\\"YYYY\\" format (single instance, eg., 05-Oct-1990, Oct-1990 or
1990) or ISO 8601 standard \\"YYYY-mm-dd\\" or
\\"YYYY-mm-ddThh:mm:ss\\" (eg. 1990-11-05 or 1990-11-05T14:41:36)

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
list [http://www.insdc.org/documents/country-qualifier-vocabulary](http://www.insdc.org/documents/country-qualifier-vocabulary). Use
a colon to separate the country or ocean from more detailed information
about the location, eg \\"Canada: Vancouver\\" or \\"Germany: halfway
down Zugspitze, Alps\\".

    format: {term}:{term}:{text}

### lat\_lon

The geographical coordinates of the location where the sample was
collected. Specify as degrees latitude and longitude in format
\\"d\[d.dddd\] N\|S d\[dd.dddd\] W\|E\\", eg, 38.98 N 77.11 W.

    format: {float} {float}

### env\_material

The matter displaced by the sample (eg., air, soil, water).

    format: {term}

### host

The natural (as opposed to laboratory) host to the organism from which
sample was obtained.

## Optional

### air\_temp\_regm

Information about treatment involving an exposure to varying
temperatures; should include the temperature, treatment duration,
interval and total experimental duration; can include different
temperature regimens.

### antibiotic\_regm

Information about treatment involving antibiotic administration; should
include the name of antibiotic, amount administered, treatment duration,
interval and total experimental duration; can include multiple
antibiotic regimens.

### altitude

The altitude of the sample is the vertical distance between Earth's
surface above Sea Level and the sampled position in the air.

    format: {float} m

### chem\_administration

The list of chemical compounds administered to the host or site where
sampling occurred, and when (e.g. antibiotics, N fertilizer, air
filter); can include multiple compounds. For Chemical Entities of
Biological Interest ontology (CHEBI) (v1.72), please see
[https://bioportal.bioontology.org/visualize/44603](https://bioportal.bioontology.org/visualize/44603).

### chem\_mutagen

Treatment involving use of mutagens; should include the name of mutagen,
amount administered, treatment duration, interval and total experimental
duration; can include multiple mutagen regimens

### climate\_environment

Treatment involving an exposure to a particular climate; can include
multiple climates

    format: {term}; {timestamp}

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

### fertilizer\_regm

Information about treatment involving the use of fertilizers; should
include the name fertilizer, amount administered, treatment duration,
interval and total experimental duration; can include multiple
fertilizer regimens fungicide regimen

### fungicide\_regm

Information about treatment involving use of fungicides; should include
the name of fungicide, amount administered, treatment duration, interval
and total experimental duration; can include multiple fungicide regimens

### gaseous\_environment

Use of conditions with differing gaseous environments; should include
the name of gaseous compound, amount administered, treatment duration,
interval and total experimental duration; can include multiple gaseous
environment regimens

### gravity

Information about treatment involving use of gravity factor to study
various types of responses in presence, absence or modified levels of
gravity; can include multiple treatments growth hormone regimen

### growth\_hormone\_regm

Information about treatment involving use of growth hormones; should
include the name of growth hormone, amount administered, treatment
duration, interval and total experimental duration; can include multiple
growth hormone regimens

### growth\_med

Information about growth media for growing the plants or tissue cultured
samples

### herbicide\_regm

Information about treatment involving use of herbicides; information
about treatment involving use of growth hormones; should include the
name of herbicide, amount administered, treatment duration, interval and
total experimental duration; can include multiple regimens

### host\_age

Age of host at the time of sampling host disease

### host\_disease

Name of relevant disease, e.g. Salmonella gastroenteritis. Controlled
vocabulary, [https://bioportal.bioontology.org/ontologies/1009](https://bioportal.bioontology.org/ontologies/1009) or
[https://www.ncbi.nlm.nih.gov/mesh](https://www.ncbi.nlm.nih.gov/mesh)

### host\_dry\_mass

Measurement of dry mass

### host\_genotype

### host\_height

Height of subject

### host\_infra\_specific\_name

Taxonomic information subspecies level

### host\_infra\_specific\_rank

Taxonomic rank information below subspecies level, such as variety,
form, rank etc.

### host\_length

The length of subject

### host\_life\_stage

Description of host life stage

### host\_phenotype

### host\_taxid

NCBI taxonomy ID of the host, e.g. 9606

### host\_tot\_mass

Total mass of the host at collection, the unit depends on host

### host\_wet\_mass

Measurement of wet mass

### humidity\_regm

Information about treatment involving an exposure to varying degree of
humidity; information about treatment involving use of growth hormones;
should include amount of humidity administered, treatment duration,
interval and total experimental duration; can include multiple regimens

### mechanical\_damage

Information about any mechanical damage exerted on the plant; can
include multiple damages and sites

### mineral\_nutr\_regm

Information about treatment involving the use of mineral supplements;
should include the name of mineral nutrient, amount administered,
treatment duration, interval and total experimental duration; can
include multiple mineral nutrient regimens

### non\_mineral\_nutr\_regm

Information about treatment involving the exposure of plant to
non-mineral nutrient such as oxygen, hydrogen or carbon; should include
the name of non-mineral nutrient, amount administered, treatment
duration, interval and total experimental duration; can include multiple
non-mineral nutrient regimens

### organism\_count

The total count of any organism per gram or volume of sample,should
include name of organism followed by count; can include multiple
organism counts.

    format: {text};{float} {unit}

### oxy\_stat\_samp

The oxygenation status of sample.

    format: [, 'aerobic', 'anaerobic']

### perturbation

The type of perturbation, e.g. chemical administration, physical
disturbance, etc., coupled with time that perturbation occurred; can
include multiple perturbation types.

    format: {text};{interval}

### pesticide\_regm

Information about treatment involving use of insecticides; should
include the name of pesticide, amount administered, treatment duration,
interval and total experimental duration; can include multiple pesticide
regimens

### ph\_regm

Information about treatment involving exposure of plants to varying
levels of pH of the growth media; can include multiple regimen

### plant\_body\_site

Name of body site that the sample was obtained from. For Plant Ontology
(PO) (v 20) terms, see [https://purl.bioontology.org/ontology/PO](https://purl.bioontology.org/ontology/PO)

### plant\_product

Substance produced by the plant, where the sample was obtained from

### radiation\_regm

Information about treatment involving exposure of plant or a plant part
to a particular radiation regimen; should include the radiation type,
amount or intensity administered, treatment duration, interval and total
experimental duration; can include multiple radiation regimens

### rainfall\_regm

Information about treatment involving an exposure to a given amount of
rainfall; can include multiple regimens

### rel\_to\_oxygen

Aerobic or anaerobic

    format: [, 'aerobe', 'anaerobe', 'facultative', 'microaerophilic', 'microanaerobe', 'obligate aerobe', 'obligate anaerobe']

### salt\_regm

Information about treatment involving use of salts as supplement to
liquid and soil growth media; should include the name of salt, amount
administered, treatment duration, interval and total experimental
duration; can include multiple salt regimens

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

### samp\_vol\_we\_dna\_ext

Volume (mL) or weight (g) of sample processed for DNA extraction

### season\_environment

Treatment involving an exposure to a particular season (e.g. winter,
summer, rabi, rainy etc.)

### source\_material\_id

Unique identifier assigned to a material sample used for extracting
nucleic acids, and subsequent sequencing. The identifier can refer
either to the original material collected or to any derived sub-samples.

### standing\_water\_regm

Treatment involving an exposure to standing water during a plant's life
span, types can be flood water or standing water; can include multiple
regimens

### temp

The temperature of the sample at time of sampling.

    format: {float} {unit}

### tiss\_cult\_growth\_med

Description of plant tissue culture growth media used

### water\_temp\_regm

Information about treatment involving an exposure to water with varying
degree of temperature; can include multiple regimens

### watering\_regm

Information about treatment involving an exposure to watering
frequencies; can include multiple regimens

### user\_defined

You may create your own optional fields to describe your sample.
