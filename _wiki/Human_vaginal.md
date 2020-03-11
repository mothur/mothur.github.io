---
title: 'Human vaginal'
---
Here is a link to NCBI definition page for the [human
vaginal](https://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.human-vaginal.4.0/)
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
list [https://www.insdc.org/documents/country-qualifier-vocabulary](https://www.insdc.org/documents/country-qualifier-vocabulary). Use
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

### birth\_control

specification of birth control medication used

### chem\_administration

Descriptionlist of chemical compounds administered to the host or site
where sampling occurred, and when (e.g. antibiotics, N fertilizer, air
filter); can include multiple compounds. For Chemical Entities of
Biological Interest ontology (CHEBI) (v1.72), please see
[https://bioportal.bioontology.org/visualize/44603](https://bioportal.bioontology.org/visualize/44603)

### douche

date of most recent douche

### ethnicity

ethnicity of the subject

### gynecologic\_disord

history of gynecological disorders; can include multiple disorders

### host\_age

Age of host at the time of sampling

### host\_body\_mass\_index

body mass index of the host, calculated as weight/(height)squared

### host\_body\_product

substance produced by the host, e.g. stool, mucus, where the sample was
obtained from

### host\_body\_temp

core body temperature of the host when sample was collected

### host\_diet

type of diet depending on the sample for animals omnivore, herbivore
etc., for humans high-fat, meditteranean etc.; can include multiple diet
types

### host\_disease

Name of relevant disease, e.g. Salmonella gastroenteritis. Controlled
vocabulary, [https://bioportal.bioontology.org/ontologies/1009](https://bioportal.bioontology.org/ontologies/1009) or
[https://www.ncbi.nlm.nih.gov/mesh](https://www.ncbi.nlm.nih.gov/mesh)

### host\_family\_relationship

### host\_genotype

### host\_height

The height of subject

### host\_last\_meal

Content of last meal and time since feeding; can include multiple values

### host\_occupation

Most frequent job performed by subject

### host\_phenotype

### host\_pulse

Resting pulse of the host, measured as beats per minute

### host\_sex

Gender or physical sex of the host

### host\_subject\_id

A unique identifier by which each subject can be referred to,
de-identified, e.g. \#131

### host\_tissue\_sampled

Type of tissue the initial sample was taken from. Controlled vocabulary,
[https://bioportal.bioontology.org/ontologies/1005](https://bioportal.bioontology.org/ontologies/1005))

### host\_tot\_mass

Total mass of the host at collection, the unit depends on host

### hrt

Whether subject had hormone replacement theraphy, and if yes start date

### hysterectomy

Specification of whether hysterectomy was performed

### ihmc\_medication\_code

Can include multiple medication codes

### medic\_hist\_perform

Whether full medical history was collected

### menarche

Descriptiondate of most recent menstruation

### menopause

Date of onset of menopause

### organism\_count

Total count of any organism per gram or volume of sample,should include
name of organism followed by count; can include multiple organism counts

### oxy\_stat\_samp

Oxygenation status of sample

### perturbation

Type of perturbation, e.g. chemical administration, physical
disturbance, etc., coupled with time that perturbation occurred; can
include multiple perturbation types

### pregnancy

Date due of pregnancy

### rel\_to\_oxygen

Aerobic or anaerobic

### samp\_collect\_device

Method or device employed for collecting sample

### samp\_mat\_process

Processing applied to the sample during or after isolation

### samp\_salinity

### samp\_size

Amount or size of sample (volume, mass or area) that was collected

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

volume (mL) or weight (g) of sample processed for DNA extraction

### sexual\_act

Current sexual partner and frequency of sex

### source\_material\_id

Unique identifier assigned to a material sample used for extracting
nucleic acids, and subsequent sequencing. The identifier can refer
either to the original material collected or to any derived sub-samples.

### temp

Temperature of the sample at time of sampling

### urogenit\_disord

History of urogenital disorders, can include multiple disorders

### user\_defined

You may create your own optional fields to describe your sample.
