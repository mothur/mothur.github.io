---
title: 'Human Associated'
---
Here is a link to NCBI definition page for the [human\_associated
package](https://www.ncbi.nlm.nih.gov/biosample/docs/packages/MIMARKS.survey.human-associated.4.0/).

## Required

===sample\_name This is your group name. Mothur will fill this in for
you, thanks mom!

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

### age

The age at the time of sampling; relevant scale depends on species and
study, e.g. could be seconds for amoebae or centuries for trees.

    format: {float} {unit}

### amniotic\_fluid\_color

The specification of the color of the amniotic fluid sample.

    format: {text}

### blood\_blood\_disord

The history of blood disorders; can include multiple disorders

    format: {text}

### body\_mass\_index

The body mass index, calculated as weight/(height)squared

    format: {float} {unit}

### body\_product

The substance produced by the plant where the sample was obtained from.

    format: {text}

### chem\_administration

The list of chemical compounds administered to the host or site where
sampling occurred, and when (e.g. antibiotics, N fertilizer, air
filter); can include multiple compounds. For Chemical Entities of
Biological Interest ontology (CHEBI) (v1.72), please see
[https://bioportal.bioontology.org/visualize/44603](https://bioportal.bioontology.org/visualize/44603).

    format: {term}; {timestamp}

### diet

The type of diet depending on the sample for animals omnivore, herbivore
etc., for humans high-fat, meditteranean etc.; can include multiple diet
types.

    format: {text}

### diet\_last\_six\_month

The specification of major diet changes in the last six months, if yes
the change should be specified.

    format: {boolean};{text}

### disease

The list of diseases diagnosed; can include multiple diagnoses. the
value of the field depends on host; for humans the terms should be
chosen from DO (Disease Ontology), free text for non-human. For DO
terms, please see
[https://gemina.svn.sourceforge.net/viewvc/gemina/trunk/Gemina/ontologies/gemina_symptom.obo?view=log](https://gemina.svn.sourceforge.net/viewvc/gemina/trunk/Gemina/ontologies/gemina_symptom.obo?view=log)

    format: {term}

### drug\_usage

Any drug used by subject and the frequency of usage; can include
multiple drugs used

    format: {text};{integer}/[year|month|week|day|hour]

### ethnicity

The ethnicity of the subject.

    format: {integer|text}

### family\_relationship

The relationships to other samples in the same study; can include
multiple relationships.

    format: {text}; {text}

### fetal\_health\_stat

The specification of fetal health status, should also include abortion.

    format: {text}

### genotype

The observed genotype.

    format: {text}

### gestation\_state

The specification of the gestation state.

    format: {text}

### height

The height of subject.

    format: {float} {unit}

### hiv\_stat

HIV status of subject, if yes HAART initiation status should also be
indicated as \[YES or NO\]

    format: {boolean};{boolean}

### host\_body\_temp

The core body temperature of the host when sample was collected.

    format: {float} {unit}

### host\_subject\_id

A unique identifier by which each subject can be referred to,
de-identified, e.g. \#131

    format: {text}

### ihmc\_medication\_code

can include multiple medication codes

    format: {integer}

### kidney\_disord

The history of kidney disorders; can include multiple disorders

    format: {text}

### last\_meal

The content of last meal and time since feeding; can include multiple
values.

    format: {text};{period}

### maternal\_health\_stat

The specification of the maternal health status.

    format: {text}

### medic\_hist\_perform

Whether full medical history was collected.

    format: {boolean}

### nose\_throat\_disord

The history of nose-throat disorders; can include multiple disorders.

    format: {text}

### occupation

The most frequent job performed by subject.

    format: {integer}

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

### pet\_farm\_animal

The specification of presence of pets or farm animals in the environment
of subject, if yes the animals should be specified; can include multiple
animals present.

    format: {boolean};{text}

### phenotype

Phenotype of sampled organism. For Phenotypic quality Ontology (PATO)
(v1.269) terms, please see
[https://bioportal.bioontology.org/visualize/44601](https://bioportal.bioontology.org/visualize/44601).

    format: {term}

### pulmonary\_disord

The history of pulmonary disorders; can include multiple disorders.

    format: {text}

### pulse

The resting pulse, measured as beats per minute.

    format: {float} {unit}

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

### smoker

The specification of smoking status.

    format: {boolean}

### study\_complt\_stat

The specification of study completion status, if no the reason should be
specified

    format: {boolean};[adverse event|non-compliance|lost to follow up|other-specify]

### temp

The temperature of the sample at time of sampling.

    format: {float} {unit}

### tissue

Type of tissue the sample was taken from.

### tot\_mass

The total mass of the host at collection, the unit depends on host.

    format: {float} {unit}

### travel\_out\_six\_month

The specification of the countries travelled in the last six months; can
include multiple travels.

    format: {text}

### twin\_sibling

The specification of twin sibling presence.

format: {boolean}

### urine\_collect\_meth

The specification of urine collection method.

    format: [, 'clean catch', 'catheter']

### urogenit\_tract\_disor

The history of urogenitaltract disorders; can include multiple
disorders.

    format: {text}

### weight\_loss\_3\_month

The specification of weight loss in the last three months, if yes should
be further specified to include amount of weight loss.

    format: {boolean};{float} {unit}

### user\_defined

You may create your own optional fields to describe your sample.
