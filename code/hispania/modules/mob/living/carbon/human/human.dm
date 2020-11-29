/mob/living/carbon/human/kidan/New(new_loc)
	..(new_loc, SPECIES_KIDAN)

/// Resuscitate for Defib by Danaleja2005

/mob/living/carbon/human/proc/resuscitate(/mob/living/carbon/human/H)
	if(!is_asystole() || !should_have_process(OP_HEART))
		return
	var/obj/item/organ/internal/heart/heart = random_organ_by_process(OP_HEART)
	if(istype(heart) && !(heart.status & ORGAN_DEAD))
		if(!nervous_system_failure())
			visible_message("\The [src] jerks and gasps for breath!")
		else
			visible_message("\The [src] twitches a bit as \his heart restarts!")
		shock_stage = min(shock_stage, 100) // 120 is the point at which the heart stops.
		if(getOxyLoss() >= 75)
			setOxyLoss(75)
		pulse = PULSE_NORM
		heart_process()
		return TRUE

//// code for the good work of the defib

/mob/living/proc/nervous_system_failure()
	return FALSE

/mob/living/carbon/human/nervous_system_failure() //this checks if the mob have much oxy damage
	return getBrainLoss() >= maxHealth * 0.75
