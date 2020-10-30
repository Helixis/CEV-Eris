//PLANTBGONE SHIT

/datum/reagent/toxin/plantbgone/affect_touch(mob/living/carbon/human/M, alien, effect_multiplier)
	..()
	if(isdiona(M))
		M.apply_damage(15, BURN)
		M.visible_message(SPAN_WARNING("[M]'s flesh sizzles where the liquid touches it!"), SPAN_DANGER("Your flesh burns in the liquid!"))
