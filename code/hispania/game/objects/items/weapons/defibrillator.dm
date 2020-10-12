#define DEFIB_TIME_LIMIT (8 MINUTES) //past this many seconds, defib is useless. Currently 8 Minutes
#define DEFIB_TIME_LOSS  (2 MINUTES) //past this many seconds, brain damage occurs. Currently 2 minutes

/// Defibrillator from Bay-Station by Danaleja2005 ///
/obj/item/weapon/defibrillator
	name = "Defibrillator"
	desc = "A device that delivers powerful shocks via detachable paddles to resuscitate incapacitated patients."
	icon = 'icons/obj/defibrillator.dmi'
	icon_state = "defibunit"
	icon_state = "defibunit"
	force = 5
	throwforce = 6
	w_class = ITEM_SIZE_BULKY

	var/obj/item/weapon/cell/cell
	var/suitable_cell = /obj/item/weapon/cell/medium
	var/chargecost = 50
	var/chargetime = (2 SECONDS)	
	var/cooldown = FALSE
	var/cooldowntime = (5 SECONDS)
	var/busy = FALSE
	var/active = FALSE
	var/combat = FALSE
	var/safety = TRUE
	var/burn_damage_amt = 5

/obj/item/weapon/defibrillator/Initialize()
	. = ..()
	if(!cell && suitable_cell)
		cell = new /obj/item/weapon/cell/medium/super(src)
		update_icon()

/obj/item/weapon/defibrillator/Destroy()
	. = ..()
	QDEL_NULL(cell)

/obj/item/weapon/defibrillator/update_icon()
	. = ..()
	var/list/new_overlays = list()

	if(active)
		icon_state = "defibunit-on"
	else
		icon_state = "defibunit-off"

	if(cell)
		var/ratio = CEILING(cell.percent()/25,1) * 25
		new_overlays += "[(icon_state)]-charge[ratio]"
	else
		new_overlays += "[(icon_state)]-nocell"

	overlays = new_overlays

/obj/item/weapon/defibrillator/examine(mob/user)
	. = ..()
	if(cell)
		to_chat(user, "The charge meter is showing [cell.percent()]% charge left.")
	else
		to_chat(user, "There is no cell inside")

/obj/item/weapon/defibrillator/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/cell))
		if(cell)
			to_chat(user,  SPAN_NOTICE("The [src] already has a cell."))
		else
			if(!user.unEquip(W))
				return
			W.forceMove(src)
			cell = W
			to_chat(user, SPAN_NOTICE("You install a cell in the [src]."))
			update_icon()
	else if(QUALITY_SCREW_DRIVING in W.tool_qualities)
		if(cell)
			cell.update_icon()
			cell.loc = get_turf(user)
			cell = null
			active = FALSE
			to_chat(user, SPAN_NOTICE("You remove the cell from the [src]."))
			update_icon()
	else
		return ..()

/obj/item/weapon/defibrillator/attack_self(mob/living/user)
	if(!cell)
		to_chat(user, SPAN_NOTICE("You cannot turn on the [src] without a cell!."))
		update_icon()
	else
		if(!active)
			to_chat(user,	SPAN_NOTICE("You turn the [src] on ."))
			active = TRUE
			update_icon()
		else
			to_chat(user, SPAN_NOTICE("You turn the [src] off ."))
			active = FALSE
			update_icon()
			return
		
/obj/item/weapon/defibrillator/proc/set_cooldown(delay)
	cooldown = TRUE
	update_icon()

	spawn(delay)
		if(cooldown)
			cooldown = FALSE
			update_icon()

			make_announcement("beeps, \"Unit is re-energized.\"", "notice")
			playsound(src, 'sound/machines/defib_ready.ogg', 50, 0)

/obj/item/weapon/defibrillator/proc/can_use(mob/user, mob/living/carbon/human/H)
	if(busy)
		return FALSE
	if(!check_charge(chargecost))
		to_chat(user,  SPAN_WARNING("The [src] doesn't have enough charge left to do that."))
		return FALSE
	if(cooldown)
		to_chat(user,  SPAN_WARNING("The [src] is recharging!."))
		return FALSE
	if(!active)
		to_chat(user, SPAN_WARNING("The [src] is off, you need to turn it on in order to use it."))
		return FALSE
	return TRUE

/obj/item/weapon/defibrillator/proc/active_heart(mob/user, mob/living/carbon/human/H)
	if(H.stat != DEAD)
		to_chat(user, SPAN_WARNING("The [H]'s Hearth is active!."))	
		return TRUE
	return FALSE

//Checks for various conditions to see if the mob is revivable	
/obj/item/weapon/defibrillator/proc/can_defib(mob/living/carbon/human/H) //This is checked before doing the defib operation
	if(H.isSynthetic())
		return "buzzes, \"Unrecogized physiology. Operation aborted.\""
	if(!check_contact(H))
		return "buzzes, \"Patient's chest is obstructed. Operation aborted.\""

/obj/item/weapon/defibrillator/proc/check_contact(mob/living/carbon/human/H)
	if(!combat)
		for(var/obj/item/clothing/cloth in list(H.wear_suit, H.w_uniform))
			if((cloth.body_parts_covered & UPPER_TORSO) && (cloth.item_flags & THICKMATERIAL))
				return FALSE
	return TRUE

/obj/item/weapon/defibrillator/proc/check_blood_level(mob/living/carbon/human/H)
	if(!H.should_have_organ(BP_HEART))
		return FALSE
	var/obj/item/organ/internal/heart/heart = H.internal_organs_by_name[BP_HEART]
	if(!heart || H.get_blood_volume() < BLOOD_VOLUME_SURVIVE)
		return TRUE
	return FALSE

/obj/item/weapon/defibrillator/proc/check_charge(charge_amt)
	return (cell && cell.check_charge(charge_amt))

/obj/item/weapon/defibrillator/proc/checked_use(charge_amt)
	return (cell && cell.checked_use(charge_amt))
	
/obj/item/weapon/defibrillator/attack(mob/living/M, mob/living/user, target_zone)
	if(!ishuman(M))
		return ..()
	var/mob/living/carbon/human/H = M
	if(!istype(H) || user.a_intent == I_HURT)
		return ..() //Do a regular attack. Harm intent shocking happens as a hit effect

	if(can_use(user, H) && !active_heart(user, H))
		busy = TRUE
		update_icon()

		do_revive(H, user)

		busy = FALSE
		update_icon()

	return TRUE

/obj/item/weapon/defibrillator/apply_hit_effect(mob/living/target, mob/living/user, hit_zone)
	if(ishuman(target) && can_use(user, target))
		busy = TRUE
		update_icon()

		do_electrocute(target, user, hit_zone)

		busy = FALSE
		update_icon()

		return TRUE	

	return ..()

/obj/item/weapon/defibrillator/proc/do_revive(mob/living/carbon/human/H, mob/living/carbon/human/user)
	if(H.species.show_ssd)
		to_chat(find_dead_player(H.ckey, 1), SPAN_NOTICE("Someone is attempting to resuscitate you. Re-enter your body if you want to be revived!"))

	//beginning to place the paddles on patient's chest to allow some time for people to move away to stop the process
	user.visible_message(SPAN_WARNING("The [user] begins to place [src] on [H]'s chest."), SPAN_WARNING("You begin to place [src] on [H]'s chest..."))
	if(!do_after(user, 3 SECONDS * user.stats.getMult(STAT_BIO, STAT_LEVEL_GODLIKE), H))
		return
	user.visible_message(SPAN_NOTICE("The [user] places [src] on [H]'s chest."), SPAN_WARNING("You place [src] on [H]'s chest."))
	playsound(get_turf(src), 'sound/machines/defib_charge.ogg', 50, 0)

	var/error = can_defib(H)
	if(error)
		make_announcement(error, "warning")
		playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 50, 0)
		return

	if(check_blood_level(H))
		make_announcement("buzzes, \"Warning - Patient is in hypovolemic shock and may require a blood transfusion.\"", "warning")	 //also includes heart damage
		playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 50, 0)
		return
	//placed on chest and short delay to shock for dramatic effect, revive time is 5sec total
	if(!do_after(user, chargetime, H))
		return

	//deduct charge here, in case the base unit was EMPed or something during the delay time
	if(!checked_use(chargecost))
		make_announcement("buzzes, \"Insufficient charge.\"", "warning")
		playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 50, 0)
		return

	H.visible_message(SPAN_WARNING("The [H]'s body convulses a bit."))
	playsound(get_turf(src), "bodyfall", 50, 1)
	playsound(get_turf(src), 'sound/machines/defib_zap.ogg', 50, 1, -1)
	set_cooldown(cooldowntime)

	if(!user.stat_check(STAT_BIO, STAT_LEVEL_BASIC))
		if(prob(30))	
			playsound(get_turf(src), 'sound/machines/defib_zap.ogg', 100, 1, -1)
			H.electrocute_act(burn_damage_amt*4, src, def_zone = BP_CHEST)
			user.visible_message(SPAN_WARNING("<i>The paddles were misaligned! The [user] shocks [H] with the [src]!"), SPAN_WARNING("The paddles were misaligned! You shock [H] with the [src]!"))
			return
		if(prob(40))
			playsound(get_turf(src), 'sound/machines/defib_zap.ogg', 100, 1, -1)
			user.electrocute_act(burn_damage_amt*2, user, def_zone = BP_L_ARM)
			user.electrocute_act(burn_damage_amt*2, user, def_zone = BP_R_ARM)
			user.visible_message(SPAN_WARNING("<i>The [user] shocks themselves with the [src]!</i>"), SPAN_WARNING("You forget to move your hands away and shock yourself with the [src]!"))
			return

//set oxyloss so that the patient is just barely in crit, if possible
	make_announcement("pings, \"Resuscitation successful.\"", "notice")
	playsound(get_turf(src), 'sound/machines/defib_success.ogg', 50, 0)
	H.AdjustSleeping(-60)
	make_alive(H)
	log_and_message_admins("used \a [src] to revive [key_name(H)].")

/obj/item/weapon/defibrillator/proc/do_electrocute(mob/living/carbon/human/H, mob/user, target_zone)
	var/obj/item/organ/external/affecting = H.get_organ(target_zone)
	if(!affecting)
		to_chat(user, SPAN_WARNING("They are missing that body part!"))
		return

	//no need to spend time carefully placing the paddles, we're just trying to shock them
	user.visible_message(SPAN_DANGER("The [user] slaps [src] onto [H]'s [affecting.name]."), SPAN_DANGER("You overcharge [src] and slap them onto [H]'s [affecting.name]."))

	//Just stop at awkwardly slapping electrodes on people if the safety is enabled
	if(safety)
		to_chat(user, SPAN_WARNING("You can't do that while the safety is enabled."))
		return

	//deduct charge here, in case the base unit was EMPed or something during the delay time
	if(!checked_use(chargecost))
		make_announcement("buzzes, \"Insufficient charge.\"", "warning")
		playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 50, 0)
		return

	user.visible_message(SPAN_DANGER("<i>The [user] shocks [H] with \the [src]!</i>"), SPAN_WARNING("You shock [H] with the [src]!"))
	playsound(get_turf(src), 'sound/machines/defib_zap.ogg', 100, 1, -1)
	playsound(loc, 'sound/weapons/Egloves.ogg', 100, 1, -1)
	set_cooldown(cooldowntime)

	H.stun_effect_act(2, 120, target_zone)
	var/burn_damage = H.electrocute_act(burn_damage_amt*2, src, def_zone = target_zone)
	if(burn_damage > 15 && !(H.species.flags & NO_PAIN))
		H.emote("scream")
	var/obj/item/organ/internal/heart/doki = LAZYACCESS(affecting.internal_organs, BP_HEART)
	if(istype(doki) && doki.pulse && !doki.open && prob(10))
		to_chat(doki, SPAN_DANGER("Your [doki] has stopped!"))
		doki.pulse = PULSE_NONE

	admin_attack_log(user, H, "Electrocuted using \a [src]", "Was electrocuted with \a [src]", "used \a [src] to electrocute")

/obj/item/weapon/defibrillator/proc/make_alive(mob/living/carbon/human/M) //This revives the mob
	var/deadtime = world.time - M.timeofdeath

	M.switch_from_dead_to_living_mob_list()
	M.timeofdeath = 0
	M.set_stat(UNCONSCIOUS) //Life() can bring them back to consciousness if it needs to.
	M.regenerate_icons()
	M.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.
	M.resuscitate() // this resuscitate the mob

	BITSET(M.hud_updateflag, HEALTH_HUD)
	BITSET(M.hud_updateflag, STATUS_HUD)
	BITSET(M.hud_updateflag, LIFE_HUD)


	M.emote("gasp")
	M.Weaken(rand(10,25))
	M.updatehealth()
	apply_brain_damage(M, deadtime)

/obj/item/weapon/defibrillator/proc/make_announcement(message, msg_class)
	audible_message("<b>The [src]</b> [message]", "The [src] vibrates slightly.")

obj/item/weapon/defibrillator/proc/apply_brain_damage(mob/living/carbon/human/H, deadtime)
	if(deadtime < DEFIB_TIME_LOSS) return

	if(!H.should_have_organ(BP_BRAIN)) return //no brain

	var/obj/item/organ/internal/brain/brain = H.internal_organs_by_name[BP_BRAIN]
	if(!brain) return //no brain

	var/brain_damage = CLAMP((deadtime - DEFIB_TIME_LOSS)/(DEFIB_TIME_LIMIT - DEFIB_TIME_LOSS)*brain.max_damage, H.getBrainLoss(), brain.max_damage)
	H.setBrainLoss(brain_damage)

/obj/item/weapon/defibrillator/emag_act(var/uses, var/mob/user, obj/item/weapon/defibrillator/base)
	if(!base)
		return
	if(safety)
		safety = FALSE
		to_chat(user, SPAN_WARNING("You silently disable the [src]'s safety protocols with the cryptographic sequencer."))
		burn_damage_amt *= 3
		base.update_icon()
		return TRUE
	else
		safety = TRUE
		to_chat(user, SPAN_NOTICE("You silently enable the [src]'s safety protocols with the cryptographic sequencer."))
		burn_damage_amt = initial(burn_damage_amt)
		base.update_icon()
		return FALSE

/obj/item/weapon/defibrillator/emp_act(severity)
	var/new_safety = rand(0, 1)
	if(safety != new_safety)
		safety = new_safety
		if(safety)
			make_announcement("beeps, \"Safety protocols enabled!\"", "notice")
			playsound(get_turf(src), 'sound/machines/defib_safetyon.ogg', 50, 0)
		else
			make_announcement("beeps, \"Safety protocols disabled!\"", "warning")
			playsound(get_turf(src), 'sound/machines/defib_safetyoff.ogg', 50, 0)
		update_icon()
	..()


#undef DEFIB_TIME_LIMIT
#undef DEFIB_TIME_LOSS
