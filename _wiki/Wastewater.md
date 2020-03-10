---
title: 'Wastewater'
---
Here is a link to NCBI definition page for the
[wastewater](http://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.wastewater.4.0/)
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

## Optional

### alkalinity

Alkalinity, the ability of a solution to neutralize acids to the
equivalence point of carbonate or bicarbonate

### biochem\_oxygen\_dem

A measure of the relative oxygen-depletion effect of a waste contaminant

### chem\_administration

List of chemical compounds administered to the host or site where
sampling occurred, and when (e.g. antibiotics, N fertilizer, air
filter); can include multiple compounds. For Chemical Entities of
Biological Interest ontology (CHEBI) (v1.72), please see
<http://bioportal.bioontology.org/visualize/44603>

### chem\_oxygen\_dem

A measure of the relative oxygen-depletion effect of a waste contaminant

### depth

Depth is defined as the vertical distance below surface, e.g. for
sediment or soil samples depth is measured from sediment or soil
surface, respectivly. Depth can be reported as an interval for
subsurface samples.

    format: {float} m

### efficiency\_percent

Percentage of volatile solids removed from the anaerobic digestor

### emulsions

Amount or concentration of substances such as paints, adhesives,
mayonnaise, hair colorants, emulsified oils, etc.; can include multiple
emulsion types

### gaseous\_substances

Amount or concentration of substances such as hydrogen sulfide, carbon
dioxide, methane, etc.; can include multiple substances

### indust\_eff\_percent

Percentage of industrial effluents received by **wastewater** treatment
plant

### inorg\_particles

Concentration of particles such as sand, grit, metal particles,
ceramics, etc.; can include multiple particles

### misc\_param

Any other measurement performed or parameter collected, that is not
listed here

### nitrate

Concentration of nitrate

### org\_particles

Concentration of particles such as faeces, hairs, food, vomit, paper
fibers, plant material, humus, etc.

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

### ph

The pH measurement.

    format: {float} {unit}

### phosphate

Concentration of phosphate

### pre\_treatment

The process of pre-treatment removes materials that can be easily
collected from the raw wastewater

### primary\_treatment

The process to produce both a generally homogeneous liquid capable of
being treated biologically and a sludge that can be separately treated
or processed

### reactor\_type

Anaerobic digesters can be designed and engineered to operate using a
number of different process configurations, as batch or continuous,
mesophilic, high solid or low solid, and single stage or multistage
relationship to oxygen

### rel\_to\_oxygen

Aerobic or anaerobic

    format: [, 'aerobe', 'anaerobe', 'facultative', 'microaerophilic', 'microanaerobe', 'obligate aerobe', 'obligate anaerobe']

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

### secondary\_treatment

The process for substantially degrading the biological content of the
sewage

### sewage\_type

Type of **wastewater** treatment plant as municipial or industrial

### sludge\_retent\_time

The time activated sludge remains in reactor

### sodium

Sodium concentration

### soluble\_inorg\_mat

Concentration of substances such as ammonia, road-salt, sea-salt,
cyanide, hydrogen sulfide, thiocyanates, thiosulfates, etc.

### soluble\_org\_mat

Concentration of substances such as urea, fruit sugars, soluble
proteins, drugs, pharmaceuticals, etc.

### source\_material\_id

Unique identifier assigned to a material sample used for extracting
nucleic acids, and subsequent sequencing. The identifier can refer
either to the original material collected or to any derived sub-samples.

### suspend\_solids

Descriptionconcentration of substances including a wide variety of
material, such as silt, decaying plant and animal matter, etc,; can
include multiple substances temperature

### temp

The temperature of the sample at time of sampling.

    format: {float} {unit}

### tertiary\_treatment

The process providing a final treatment stage to raise the effluent
quality before it is discharged to the receiving environment

### tot\_nitro

Total nitrogen content of the sample

### tot\_phosphate

Total amount or concentration of phosphate

### wastewater\_type

The origin of **wastewater** such as human waste, rainfall, storm drains,
etc.

### user\_defined

You may create your own optional fields to describe your sample.
