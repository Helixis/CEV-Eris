/obj/item/organ/internal/liver/skrell
	name = "skrell liver"
	icon = 'icons/hispania/obj/species/organs/skrell.dmi'
	alcohol_mod_damage = 4

/obj/item/organ/internal/heart/skrell
	name = "skrell heart"
	desc = "A stream lined heart"
	icon = 'icons/hispania/obj/species/organs/skrell.dmi'

/obj/item/organ/internal/brain/skrell
	icon = 'icons/hispania/obj/species/organs/skrell.dmi'
	desc = "A brain with a odd division in the middle."
	icon_state = "brain2"

/obj/item/organ/internal/lungs/skrell
	name = "skrell lungs"
	icon = 'icons/hispania/obj/species/organs/skrell.dmi'

/obj/item/organ/internal/kidneys/skrell
	name = "skrell kidneys"
	icon = 'icons/hispania/obj/species/organs/skrell.dmi'
	desc = "The smallest kidneys you have ever seen, it probably doesn't even work."

/obj/item/organ/internal/eyes/skrell
	name = "skrell eyeballs"
	icon_state = "skrell_eyes"
	icon = 'icons/hispania/obj/species/organs/skrell.dmi'

/obj/item/organ/internal/eyes/skrell/get_icon()
	var/icon/eyes_icon = new/icon('icons/hispania/mob/human_face.dmi', "skrell_eye_l")
	eyes_icon.Blend(icon('icons/hispania/mob/human_face.dmi', "skrell_eye_r"), ICON_OVERLAY)
	eyes_icon.Blend(BP_IS_ROBOTIC(src) ? robo_color : eyes_color, ICON_ADD)
	return eyes_icon

//Subtypes
/obj/item/organ/internal/eyes/skrell/oneeye
	icon_state = "skrell_eyes_l"
	cache_key = "left_eye"

/obj/item/organ/internal/eyes/skrell/oneeye/get_icon()
	var/icon/eyes_icon
	eyes_icon = icon('icons/hispania/mob/human_face.dmi', "[icon_state]")
	eyes_icon.Blend(BP_IS_ROBOTIC(src) ? robo_color : eyes_color, ICON_ADD)
	return eyes_icon

/obj/item/organ/internal/eyes/skrell/oneeye/right
	icon_state = "skrell_eyes_r"
	cache_key = "right_eye"
// fin subtypes
