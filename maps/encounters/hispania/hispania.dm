#include "hispania.dmm"

/turf/simulated/wall/airless
	oxygen = 0
	nitrogen = 0

/turf/simulated/wall/r_wall/airless
	oxygen = 0
	nitrogen = 0

/obj/map_data/hispania
	name = "Hispania Station"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	height = 1

/obj/effect/overmap/sector/hispania
	name = "Hispania Station"
	desc = "An assorted clutter of small asteroids and space trash, seems to be long abandoned."
	icon_state = "sector"
	generic_waypoints = list(
		"nav_hispania_1",
		"nav_hispania_2"
	)
	known = 1

/obj/effect/shuttle_landmark/hispania/nav1
	name = "Abandoned Hispania Station Ruins #1"
	icon_state = "shuttle-green"
	landmark_tag = "nav_hispania_1"
	base_turf = /turf/space

/obj/effect/shuttle_landmark/hispania/nav2
	name = "Abandoned Hispania Station Ruins #2"
	icon_state = "shuttle-green"
	landmark_tag = "nav_hispania_2"
	base_turf = /turf/space


/area/space/hispania
	name = "Abandoned Hispania Station Ruins"
	icon_state = "yellow"
	has_gravity = FALSE
	requires_power = 1
	power_light = 0
	power_equip = 0
	power_environ = 0
	always_unpowered = FALSE
	flags = null
	ambience = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambigen14.ogg', 'sound/ambience/ambisin2.ogg','sound/ambience/ambispace.ogg')
