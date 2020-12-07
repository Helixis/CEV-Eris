/datum/species/kidan
	name = SPECIES_KIDAN
	name_plural = SPECIES_KIDAN
	icobase = 'icons/hispania/mob/human_races/r_kidan.dmi'
	deform = 'icons/hispania/mob/human_races/r_def_kidan.dmi'
	faceicobase = 'icons/hispania/mob/human_face.dmi'
	blurb = "The Kidan are ant-like creatures who posses an exoskeleton. \
	They originate from the world of Aurum, a harsh world with a poor atmosphere now lost with the destruction of the Milky Way. \
	The last Kidan Empress was killed and their planets conquered at least a century ago in a war with humanity. \
	After unconditional surrender the kidan were strictly controlled and under sanctions. \
	Most of the kidan in Canis Major are now refugees."
	name_language = LANGUAGE_KIDAN
	language = LANGUAGE_KIDAN           // Default racial language, if any.
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE | HAS_EYE_COLOR | HAS_FACIAL_MIMETISATION
	num_alternate_languages = 1
	min_age = 15
	max_age = 60
	unarmed_types = list(/datum/unarmed_attack/claws, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	reagent_tag = IS_KIDAN
	spawn_flags = CAN_JOIN
	breath_pressure = 10 //deafault 16
	brute_mod = 0.8
	burn_mod = 1.5
	radiation_mod = 0.5
	toxins_mod = 0.5
	max_skin_tone = 90

	eyes = "kidan_eyes"
	flesh_color = "#ba7814"
	blood_color = "#FB9800"

	has_process = list(
		OP_HEART =    /obj/item/organ/internal/heart/kidan,
		OP_LUNGS =    /obj/item/organ/internal/lungs/kidan,
		OP_LIVER =    /obj/item/organ/internal/liver/kidan,
		OP_KIDNEYS =  /obj/item/organ/internal/kidneys/kidan,
		BP_BRAIN =    /obj/item/organ/internal/brain/kidan,
		OP_APPENDIX = /obj/item/organ/internal/appendix,
		OP_EYES =     /obj/item/organ/internal/eyes/kidan, //Default darksight of 2.
		)

/datum/species/kidan/get_bodytype()
	return SPECIES_KIDAN

/datum/species/skrell
	name = SPECIES_SKRELL
	name_plural = SPECIES_SKRELL
	icobase = 'icons/hispania/mob/human_races/r_skrell.dmi'
	deform = 'icons/hispania/mob/human_races/r_def_skrell.dmi'
	faceicobase = 'icons/hispania/mob/human_face.dmi'
	name_language = LANGUAGE_SKRELL
	language = LANGUAGE_SKRELL
	num_alternate_languages = 1
	//primitive_form = /datum/species/monkey/skrell esto no tiene utilidad en eris pero luego podria servir, lo dejo como recordatorio

	blurb = "An amphibious species, Skrell come from the star system known as Qerr'Vallis, which translates to 'Star of \
	the royals' or 'Light of the Crown'.<br/><br/>Skrell are a highly advanced and logical race who live under the rule \
	of the Qerr'Katish, a caste within their society which keeps the empire of the Skrell running smoothly. Skrell are \
	herbivores on the whole and tend to be co-operative with the other species of the galaxy, although they rarely reveal \
	the secrets of their empire to their allies."

	//species_traits = list(LIPS)
	spawn_flags = CAN_JOIN
	appearance_flags = HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_HAIR_MIMETISATION | HAS_FACIAL_MIMETISATION
	taste_sensitivity = TASTE_DULL
	flesh_color = "#8CD7A3"
	blood_color = "#1D2CBF"
	base_color = "#38b661" //RGB: 56, 182, 97.
	eyes = "skrell_eyes"
	min_age = 25
	max_age = 150
	breath_pressure = 20                          // Minimum partial pressure safe for breathing, kPa from 16
	cold_level_1 = 220                            // from 260
	cold_level_2 = 160								// from 200
	cold_level_3 = 80                            // from 120
	heat_level_1 = 310                            // from 360
	heat_level_2 = 350                            // from 400
	heat_level_3 = 9950                           // Heat damage level 3 above this point.
	hazard_high_pressure = HAZARD_HIGH_PRESSURE+15   // Dangerously high pressure.
	warning_high_pressure = WARNING_HIGH_PRESSURE+15 // High pressure warning.
	warning_low_pressure = WARNING_LOW_PRESSURE+15   // Low pressure warning.
	hazard_low_pressure = HAZARD_LOW_PRESSURE+15     // Dangerously low pressure.
	heat_discomfort_level = 300						// from 315
	cold_discomfort_level = 270						// from 285
	body_temperature = 295							// from 310.15
	//Default styles for created mobs.
	reagent_tag = IS_SKRELL
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	genders = list(NEUTER)
	has_process = list(
		OP_HEART =    /obj/item/organ/internal/heart/skrell,
		OP_LUNGS =    /obj/item/organ/internal/lungs/skrell,
		OP_LIVER =    /obj/item/organ/internal/liver/skrell,
		OP_KIDNEYS =  /obj/item/organ/internal/kidneys/skrell,
		BP_BRAIN =    /obj/item/organ/internal/brain/skrell,
		OP_APPENDIX  = /obj/item/organ/internal/appendix,
		OP_EYES  =     /obj/item/organ/internal/eyes/skrell, //Default darksight of 2.
		)

/datum/species/skrell/get_bodytype()
	return SPECIES_SKRELL
