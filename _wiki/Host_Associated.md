---
title: 'Host Associated'
---
Here is a link to NCBI definition page for the [host\_associated
package](http://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.host-associated.4.0/).

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

### host

The natural (as opposed to laboratory) host to the organism from which
sample was obtained.

## Optional

### age

The age at the time of sampling; relevant scale depends on species and
study, e.g. could be seconds for amoebae or centuries for trees.

    format: {float} {unit}

### altitude

The altitude of the sample is the vertical distance between Earth\'s
surface above Sea Level and the sampled position in the air.

    format: {float} m

### blood\_press\_diast

The resting diastolic blood pressure, measured as mm mercury.

    format: {float} {unit}

### blood\_press\_syst

The resting systolic blood pressure, measured as mm mercury.

    format: {float} {unit}

### body\_habitat

The original body habitat where the sample was obtained from.

    format: {text}

### body\_product

The substance produced by the plant where the sample was obtained from.

    format: {text}

### chem\_administration

The list of chemical compounds administered to the host or site where
sampling occurred, and when (e.g. antibiotics, N fertilizer, air
filter); can include multiple compounds. For Chemical Entities of
Biological Interest ontology (CHEBI) (v1.72), please see
<http://bioportal.bioontology.org/visualize/44603>.

    format: {term}; {timestamp}

### depth

Depth is defined as the vertical distance below surface, e.g. for
sediment or soil samples depth is measured from sediment or soil
surface, respectivly. Depth can be reported as an interval for
subsurface samples.

    format: {float} m

### diet

The type of diet depending on the sample for animals omnivore, herbivore
etc., for humans high-fat, meditteranean etc.; can include multiple diet
types.

    format: {text}

### disease

The list of diseases diagnosed; can include multiple diagnoses. the
value of the field depends on host; for humans the terms should be
chosen from DO (Disease Ontology), free text for non-human. For DO
terms, please see
<http://gemina.svn.sourceforge.net/viewvc/gemina/trunk/Gemina/ontologies/gemina_symptom.obo?view=log>

    format: {term}

### dry\_mass

The measurement of dry mass.

    format: {float} {unit}

### elev

The elevation of the sampling site as measured by the vertical distance
from mean sea level.

    format: {float} {unit}

### family\_relationship

The relationships to other samples in the same study; can include
multiple relationships.

    format: {text}; {text}

### genotype

The observed genotype.

    format: {text}

### gravidity

Whether or not subject is gravid, and if yes date due or date
post-conception, specifying which is used.

    format: {boolean};{timestamp}

### height\_or\_length

The measurement of height or length.

    format: {float} {unit}

### host\_body\_temp

The core body temperature of the host when sample was collected.

    format: {float} {unit}

### host\_color

The color of host.

    format: {text}

### host\_growth\_cond

The literature reference giving growth conditions of the host.

    format: {PMID|DOI|URL}

### host\_shape

The morphological shape of host.

    format: {text}

### host\_subject\_id

A unique identifier by which each subject can be referred to,
de-identified, e.g. \#131

    format: {text}

### host\_taxid

NCBI taxonomy ID of the host, e.g. 9606

    format: {integer}

### infra\_specific\_name

The taxonomic information subspecies level.

    format: {text}

### infra\_specific\_rank

The taxonomic rank information below subspecies level, such as variety,
form, rank etc.

    format: {text}

### last\_meal

The content of last meal and time since feeding; can include multiple
values.

    format: {text};{period}

### life\_stage

The description of life stage.

    format: {text}

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

### phenotype

Phenotype of sampled organism. For Phenotypic quality Ontology (PATO)
(v1.269) terms, please see
<http://bioportal.bioontology.org/visualize/44601>.

    format: {term}

### rel\_to\_oxygen

Aerobic or anaerobic

    format: [, 'aerobe', 'anaerobe', 'facultative', 'microaerophilic', 'microanaerobe', 'obligate aerobe', 'obligate anaerobe']

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

### sex

The physical sex of sampled organism.

    format: [, 'male', 'female', 'neuter', 'hermaphrodite', 'not determined']

### substrate

The growth substrate of the host.

    format: {text}

### temp

The temperature of the sample at time of sampling.

    format: {float} {unit}

### tissue

Type of tissue the sample was taken from.

### tot\_mass

The total mass of the host at collection, the unit depends on host.

    format: {float} {unit}

### user\_defined

You may create your own optional fields to describe your sample.
