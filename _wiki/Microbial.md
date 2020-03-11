---
title: 'Microbial'
---
Here is a link to NCBI definition page for the
[microbial](https://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.microbial.4.0/)
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
metagenome, marine metagenome, marine sediment metagenome, **microbial** mat
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

### elev

The elevation of the sampling site as measured by the vertical distance
from mean sea level.

    format: {float} {unit}

## Optional

### alkalinity

The alkalinity, the ability of a solution to neutralize acids to the
equivalence point of carbonate or bicarbonate.

    format: {float} {unit}

### alkyl\_diethers

The concentration of alkyl dithers.

    format: {float} {unit}

### altitude

The altitude of the sample is the vertical distance between Earth\'s
surface above Sea Level and the sampled position in the air.

    format: {float} m

### aminopept\_act

The measurement of amino peptidase activity.

    format: {float} {unit}

### ammonium

The concentration of ammonium.

    format: {float} {unit}

### bacteria\_carb\_prod

The measurement of bacterial carbon production.

    format: {float} {unit}

### biomass

The amount of biomass; should include the name for the part of biomass
measured, e.g. microbial, total. can include multiple measurements.

    format: {text};{float} {unit}

### bishomohopanol

The concentration of bishomohopanol.

    format: {float} {unit}

### bromide

The concentration of bromide.

    format: {float} {unit}

### calcium

The concentration of calcium.

    format: {float} {unit}

### carb\_nitro\_ratio

The ratio of amount or concentrations of carbon to nitrogen.

    format: {float} {unit}

### chem\_administration

The list of chemical compounds administered to the host or site where
sampling occurred, and when (e.g. antibiotics, N fertilizer, air
filter); can include multiple compounds. For Chemical Entities of
Biological Interest ontology (CHEBI) (v1.72), please see
<https://bioportal.bioontology.org/visualize/44603>.

    format: {term}; {timestamp}

### chloride

The concentration of chloride.

    format: {float} {unit}

### chlorophyll

The concentration of chlorophyll.

    format: {float} {unit}

### diether\_lipids

The concentration of diether lipids; can include multiple types of
diether lipids.

    format: {text};{float} {unit}

### diss\_carb\_dioxide

The concentration of dissolved carbon dioxide.

    format: {float} {unit}

### diss\_hydrogen

The concentration of dissolved hydrogen.

    format: {float} {unit}

### diss\_inorg\_carb

The dissolved inorganic carbon concentration.

    format: {float} {unit}

### diss\_org\_carb

The concentration of dissolved organic carbon.

    format: {float} {unit}

### diss\_org\_nitro

The dissolved organic nitrogen concentration measured as; total
dissolved nitrogen - NH4 - NO3 - NO2.

    format: {float} {unit}

### diss\_oxygen

The concentration of dissolved oxygen.

    format: {float} {unit}

### glucosidase\_act

The measurement of glucosidase activity.

    format: {float} {unit}

### magnesium

The concentration of magnesium.

    format: {float} {unit}

### mean\_frict\_vel

The measurement of mean friction velocity.

    format: {float} {unit}

### mean\_peak\_frict\_vel

The measurement of mean peak friction velocity.

    format: {float} {unit}

### methane

The methane (gas) amount or concentration at the time of sampling.

    format: {float} {unit}

### n\_alkanes

The concentration of n-alkanes; can include multiple n-alkanes.

    format: {text};{float} {unit}

### nitrate

The concentration of nitrate.

    format: {float} {unit}

### nitrite

The concentration of nitrite.

    format: {float} {unit}

### nitro

The concentration of nitrogen (total).

    format: {float} {unit}

### org\_carb

The concentration of organic carbon.

    format: {float} {unit}

### org\_matter

The concentration of organic matter.

    format: {float} {unit}

### org\_nitro

The concentration of organic nitrogen.

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

The concentration of particulate organic carbon.

    format: {float} {unit}

### perturbation

The type of perturbation, e.g. chemical administration, physical
disturbance, etc., coupled with time that perturbation occurred; can
include multiple perturbation types.

    format: {text};{interval}

### petroleum\_hydrocarb

The concentration of petroleum hydrocarbon.

    format: {float} {unit}

### ph

The pH measurement.

    format: {float} {unit}

### phaeopigments

The concentration of phaeopigments; can include multiple phaeopigments.

    format: {text};{float} {unit}

### phosphate

The concentration of phosphate.

    format: {float} {unit}

### phosplipid\_fatt\_acid

The concentration of phospholipid fatty acids; can include multiple
values.

    format: {text};{float} {unit}

### potassium

The concentration of potassium.

    format: {float} {unit}

### pressure

The pressure to which the sample is subject, in atmospheres.

    format: {float} {unit}

### redox\_potential

The redox potential, measured relative to a hydrogen cell, indicating
oxidation or reduction potential.

    format: {float} {unit}

### rel\_to\_oxygen

Aerobic or anaerobic

    format: [, 'aerobe', 'anaerobe', 'facultative', 'microaerophilic', 'microanaerobe', 'obligate aerobe', 'obligate anaerobe']

### salinity

The salinity measurement.

    format: {float} {unit}

### samp\_collect\_device

Method or device employed for collecting sample

    format: {text}

### samp\_mat\_process

Processing applied to the sample during or after isolation.

    format: {text|term}

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

### silicate

The concentration of silicate.

    format: {float} {unit}

### sodium

The concentration of sodium.

    format: {float} {unit}

### sulfate

The concentration of sulfate.

    format: {float} {unit}

### sulfide

The concentration of sulfide.

    format: {float} {unit}

### temp

The temperature of the sample at time of sampling.

    format: {float} {unit}

### tot\_carb

The total carbon contents.

    format: {float} {unit}

### tot\_nitro

The total nitrogen concentration, calculated by: total nitrogen = total
dissolved nitrogen + particulate nitrogen. Can also be measured without
filtering, reported as nitrogen.

    format: {float} {unit}

### tot\_org\_carb

Definition for soil: total organic C content of the soil units of g C/kg
soil. Definition otherwise: total organic carbon content.

    format: {float} {unit}

### turbidity

The turbidity measurement.

    format: {float} {unit}

### water\_content

The water content measurement.

    format: {float} {unit}

### user\_defined

You may create your own optional fields to describe your sample.
