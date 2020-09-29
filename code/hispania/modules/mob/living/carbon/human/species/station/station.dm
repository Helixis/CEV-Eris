/datum/species/kidan
	name = SPECIES_KIDAN
	name_plural = SPECIES_KIDAN
	icobase = 'icons/hispania/mob/human_races/r_kidan.dmi'
	deform = 'icons/hispania/mob/human_races/r_def_kidan.dmi'
	faceicobase = 'icons/hispania/mob/kidan_face.dmi'
	blurb = "The Kidan are ant-like creatures who posses an exoskeleton. \
	They originate from the world of Aurum, a harsh world with a poor atmosphere now lost with the destruction of the Milky Way. \
	The last Kidan Empress was killed and their planets conquered at least a century ago in a war with humanity. \
	After unconditional surrender the kidan were strictly controlled and under sanctions. \
	Most of the kidan in Canis Major are now refugees."
	name_language = LANGUAGE_KIDAN
	language = LANGUAGE_KIDAN           // Default racial language, if any.
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE | HAS_EYE_COLOR
	num_alternate_languages = 1
	min_age = 18
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

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart/kidan,
		BP_LUNGS =    /obj/item/organ/internal/lungs/kidan,
		BP_LIVER =    /obj/item/organ/internal/liver/kidan,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys/kidan,
		BP_BRAIN =    /obj/item/organ/internal/brain/kidan,
		BP_APPENDIX = /obj/item/organ/internal/appendix,
		BP_EYES =     /obj/item/organ/internal/eyes/kidan, //Default darksight of 2.
		)

/datum/species/kidan/get_bodytype()
	return SPECIES_KIDAN



/datum/species/slimepeople
	name = SPECIES_SLIMEPEOPLE
	name_plural = SPECIES_SLIMEPEOPLE
	icobase = 'icons/hispania/mob/human_races/r_slimepeople.dmi'
	deform = 'icons/hispania/mob/human_races/r_slimepeople.dmi'
	blurb = " ."
	language = LANGUAGE_SLIMEPEOPLE           // Default racial language, if any.
	flags = NO_BREATHE | NO_SLIP | NO_MINOR_CUT
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | HAS_FACIAL_COLOR
	num_alternate_languages = 1
	siemens_coefficient = 3 //conductive
	darksight = 3
	min_age = 18
	max_age = 100
	spawn_flags = CAN_JOIN
	breath_type = null
	poison_type = null
	flesh_color = HAS_SKIN_COLOR
	blood_color = HAS_SKIN_COLOR
	remains_type = /obj/effect/decal/cleanable/ash
	death_message = "rapidly loses cohesion, splattering across the ground..."


	has_organ = list(
		BP_BRAIN = /obj/item/organ/internal/brain/slime
		)

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/slime,
		BP_GROIN =  new /datum/organ_description/groin/slime,
		BP_HEAD =   new /datum/organ_description/head/slime,
		BP_L_ARM =  new /datum/organ_description/arm/left/slime,
		BP_R_ARM =  new /datum/organ_description/arm/right/slime,
		BP_L_LEG =  new /datum/organ_description/leg/left/slime,
		BP_R_LEG =  new /datum/organ_description/leg/right/slime
	)


/datum/species/slimepeople/get_bodytype()
	return SPECIES_SLIMEPEOPLE
