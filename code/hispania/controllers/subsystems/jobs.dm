/datum/controller/subsystem/job/proc/get_ideal_age(mob/M, ideal_age)
	var/real_idel_age = ideal_age
	if(M.client.prefs.species)
		var/datum/species/S = all_species[M.client.prefs.species]
		var/datum/species/human = all_species[SPECIES_HUMAN]
		real_idel_age += S.min_age - human.min_age
	return real_idel_age
