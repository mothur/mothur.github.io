---
title: 'Water'
---
Here is a link to NCBI definition page for the
[water](https://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.water.4.0/)
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
list <https://www.insdc.org/documents/country-qualifier-vocabulary>. Use
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

## Optional

### alkalinity

Alkalinity, the ability of a solution to neutralize acids to the
equivalence point of carbonate or bicarbonate

### alkyl\_diethers

Concentration of alkyl diethers

    format: {float} {unit}

### altitude

The altitude of the sample is the vertical distance between Earth\'s
surface above Sea Level and the sampled position in the air.

    format: {float} m

### aminopept\_act

Asurement of aminopeptidase activity

### ammonium

Concentration of ammonium

    format: {float} {unit}

### atmospheric\_data

Measurement of atmospheric data; can include multiple data

### bac\_prod

Bacterial production in the **water** column measured by isotope uptake

### bac\_resp

Measurement of bacterial respiration in the **water** column

### bacteria\_carb\_prod

Measurement of bacterial carbon production

### biomass

Amount of biomass; should include the name for the part of biomass
measured, e.g. microbial, total. can include multiple measurements

### bishomohopanol

Concentration of bishomohopanol

    format: {float} {unit}

### bromide

Concentration of bromide

    format: {float} {unit}

### calcium

Concentration of calcium

    format: {float} {unit}

### carb\_nitro\_ratio

Ratio of amount or concentrations of carbon to nitrogen

### chem\_administration

The list of chemical compounds administered to the host or site where
sampling occurred, and when (e.g. antibiotics, N fertilizer, air
filter); can include multiple compounds. For Chemical Entities of
Biological Interest ontology (CHEBI) (v1.72), please see
<https://bioportal.bioontology.org/visualize/44603>.

    format: {term}; {timestamp}

### chloride

Concentration of chloride

    format: {float} {unit}

### chlorophyll

Concentration of chlorophyll

    format: {float} {unit}

### conduc

Electrical conductivity of water

### density

Density of sample

### diether\_lipids

Concentration of diether lipids; can include multiple types of dither
lipids

    format: {float} {unit}

### diss\_carb\_dioxide

Concentration of dissolved carbon dioxide

    format: {float} {unit}

### diss\_hydrogen

Concentration of dissolved hydrogen

    format: {float} {unit}

### diss\_inorg\_carb

Dissolved inorganic carbon concentration

### diss\_inorg\_nitro

Concentration of dissolved inorganic nitrogen

    format: {float} {unit}

### diss\_inorg\_phosp

Concentration of dissolved inorganic phosphorus

    format: {float} {unit}

### diss\_org\_carb

Concentration of dissolved organic carbon

    format: {float} {unit}

### diss\_org\_nitro

Dissolved organic nitrogen concentration measured as; total dissolved
nitrogen - NH4 - NO3 - NO2

    format: {float} {unit}

### diss\_oxygen

Concentration of dissolved oxygen

    format: {float} {unit}

### down\_par

Visible waveband radiance and irradiance measurements in the water
column

### elev

The elevation of the sampling site as measured by the vertical distance
from mean sea level.

    format: {float} {unit}

### fluor

Raw or converted fluorescence of water

### glucosidase\_act

Measurement of glucosidase activity

### light\_intensity

Measurement of light intensity

### magnesium

Concentration of magnesium

    format: {float} {unit}

### mean\_frict\_vel

Measurement of mean friction velocity

### mean\_peak\_frict\_vel

Measurement of mean peak friction velocity

### n\_alkanes

Concentration of n-alkanes; can include multiple n-alkanes

    format: {float} {unit}

### nitrate

Concentration of nitrate

    format: {float} {unit}

### nitrite

Concentration of nitrite

    format: {float} {unit}

### nitro

Concentration of nitrogen (total)

    format: {float} {unit}

### org\_carb

Concentration of organic carbon

    format: {float} {unit}

### org\_matter

Concentration of organic matter

    format: {float} {unit}

### org\_nitro

Concentration of organic nitrogen

    format: {float} {unit}

### organism\_count

The total count of any organism per gram or volume of sample,should
include name of organism followed by count; can include multiple
organism counts.

    format: {text};{float} {unit}

### oxy\_stat\_samp

The oxygenation status of sample.

    format: [, 'aerobic', 'anaerobic']

### part\_org\_carb

Concentration of particulate organic carbon

    format: {float} {unit}

### part\_org\_nitro

Concentration of particulate organic nitrogen

    format: {float} {unit}

### perturbation

The type of perturbation, e.g. chemical administration, physical
disturbance, etc., coupled with time that perturbation occurred; can
include multiple perturbation types.

    format: {text};{interval}

### petroleum\_hydrocarb

Concentration of petroleum hydrocarbon

    format: {float} {unit}

### ph

pH measurement

### phaeopigments

Concentration of phaeopigments; can include multiple phaeopigments

    format: {float} {unit}

### phosphate

Concentration of phosphate

    format: {float} {unit}

### phosplipid\_fatt\_acid

Concentration of phospholipid fatty acids; can include multiple values

    format: {float} {unit}

### photon\_flux

Measurement of photon flux

### potassium

Concentration of potassium

    format: {float} {unit}

### pressure

Pressure to which the sample is subject, in atmospheres

    format: {float} {unit}

### primary\_prod

Measurement of primary production

    format: {float} {unit}

### redox\_potential

Redox potential, measured relative to a hydrogen cell, indicating
oxidation or reduction potential

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

### silicate

Concentration of silicate

    format: {float} {unit}

### sodium

Sodium concentration

    format: {float} {unit}

### soluble\_react\_phosp

Concentration of soluble reactive phosphorus

    format: {float} {unit}

### source\_material\_id

Unique identifier assigned to a material sample used for extracting
nucleic acids, and subsequent sequencing. The identifier can refer
either to the original material collected or to any derived sub-samples.

### sulfate

Concentration of sulfate

    format: {float} {unit}

### sulfide

Concentration of sulfide

    format: {float} {unit}

### suspend\_part\_matter

Concentration of suspended particulate matter

    format: {float} {unit}

### temp

The temperature of the sample at time of sampling.

    format: {float} {unit}

### tidal\_stage

Stage of tide

### tot\_depth\_water\_col

Measurement of total depth of **water** column

### tot\_diss\_nitro

Total dissolved nitrogen concentration, reported as nitrogen, measured
by: total dissolved nitrogen = NH4 + NO3NO2 + dissolved organic nitrogen

### tot\_inorg\_nitro

Total inorganic nitrogen content

### tot\_nitro

Total nitrogen content of the sample

### tot\_part\_carb

Total particulate carbon content

### tot\_phosp

Total phosphorus concentration, calculated by: total phosphorus = total
dissolved phosphorus + particulate phosphorus. Can also be measured
without filtering, reported as phosphorus

### water\_current

Measurement of magnitude and direction of flow within a fluid

### user\_defined

You may create your own optional fields to describe your sample.
