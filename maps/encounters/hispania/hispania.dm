#include "hispania.dmm"

/obj/map_data/hispania
	name = "Nss Hispania"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	height = 1

/obj/effect/overmap/sector/hispania
	name = "Nss Hispania"
	desc = "An assorted clutter of small asteroids and space trash, seems to be long abandoned."
	icon_state = "sector"
	generic_waypoints = list(
		"nav_hispania_1",
		"nav_hispania_2"
	)
	known = 1

/obj/effect/shuttle_landmark/hispania/nav1
	name = "Abandoned Nss Hispania Ruins #1"
	icon_state = "shuttle-green"
	landmark_tag = "nav_hispania_1"
	base_turf = /turf/space

/obj/effect/shuttle_landmark/hispania/nav2
	name = "Abandoned Nss Hispania Ruins #2"
	icon_state = "shuttle-green"
	landmark_tag = "nav_hispania_2"
	base_turf = /turf/space


/area/space/hispania
	name = "Abandoned Nss Hispania Ruins"
	icon_state = "yellow"
	has_gravity = FALSE
	requires_power = 1
	power_light = 0
	power_equip = 0
	power_environ = 0
