/mob/living/carbon/human/kidan/New(new_loc)
	..(new_loc, SPECIES_KIDAN)

/// Resuscitate for Defib by Danaleja2005

/mob/living/carbon/human/proc/resuscitate()
	if(!is_asystole() || !should_have_organ(BP_HEART))
		return
	var/obj/item/organ/internal/heart/heart = internal_organs_by_name[BP_HEART]
	if(istype(heart) && !(heart.status & ORGAN_DEAD))
		if(!nervous_system_failure())
			visible_message("\The [src] jerks and gasps for breath!")
		else
			visible_message("\The [src] twitches a bit as \his heart restarts!")
		shock_stage = min(shock_stage, 100) // 120 is the point at which the heart stops.
		if(getOxyLoss() >= 75)
			setOxyLoss(75)
		heart.pulse = PULSE_NORM
		heart.handle_pulse()
		return TRUE

//// code for the good work of the defib

/mob/living/proc/nervous_system_failure()
	return FALSE

/mob/living/carbon/human/nervous_system_failure() //this checks if the mob have much oxy damage
	return getBrainLoss() >= maxHealth * 0.75
