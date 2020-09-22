/datum/category_group/setup_option_category/background/fate
	name = "Fate"
	category_item_type = /datum/category_item/setup_option/background/fate

/datum/category_item/setup_option/background/fate

/datum/category_item/setup_option/background/fate/cazador
	name = "Cazador"
	desc = "Cuantas vidas haz acabado? En cuantas batallas te metiste? Eso no te importa, tu eres un ¡CAZADOR!. La pregunta seria: ¿QUIEN SERA LA PROXIMA PRESA? \
			Tienes un aumento en tus stats necesarios para el combate, pero no eres capaz de hacer otra cosa."

	restricted_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/chaplain, /datum/job/merchant, /datum/job/cmo, /datum/job/rd)
	restricted_depts = MEDICAL | SCIENCE

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = -25,
		STAT_MEC = -25,
		STAT_VIG = 10,
		STAT_COG = -25
	)
	perks = list(PERK_CAZADOR)