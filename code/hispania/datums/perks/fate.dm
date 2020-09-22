/datum/perk/cazador
	name = "Cazador"
	desc = "Cuantas vidas haz acabado? En cuantas batallas te metiste? Eso no te importa, tu eres un ¡CAZADOR!. La pregunta seria: ¿QUIEN SERA LA PROXIMA PRESA? \
			Tienes un aumento en tus stats necesarios para el combate, pero no eres capaz de hacer otra cosa."
	icon = 'code/hispania/effects/perks.dmi'
	icon_state = "cazador"

/datum/perk/cazador/assign(mob/living/carbon/human/H)
	..()
	holder.sanity.max_level += 10

/datum/perk/cazador/remove()
	holder.sanity.max_level -= 10
	..()