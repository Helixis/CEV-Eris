//WATER SHIT

/datum/reagent/water/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(ishuman(M) && isdiona(M))
		M.adjustNutrition(1)
