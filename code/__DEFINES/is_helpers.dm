
#define isweakref(A) istype(A, /weakref)

#define islist(A) istype(A, /list)

#define ismob(A) istype(A, /mob)

#define isobserver(A) istype(A, /mob/observer)

#define isghost(A) istype(A, /mob/observer/ghost)

#define isEye(A) istype(A, /mob/observer/eye)

#define isangel(A) istype(A, /mob/observer/eye/angel)

#define isnewplayer(A) istype(A, /mob/new_player)

#define isbst(A) istype(A, /mob/living/carbon/human/bst)

#define ismech(A) istype(A, /mob/living/exosuit)

//++++++++++++++++++++++++++++++++++++++++++++++

#define isliving(A) istype(A, /mob/living)
//---------------------------------------------------

#define iscarbon(A) istype(A, /mob/living/carbon)

#define isslime(A) istype(A, /mob/living/carbon/slime)

#define isbrain(A) istype(A, /mob/living/carbon/brain)

#define ishuman(A) istype(A, /mob/living/carbon/human)

//hispania
//Human sub-species
#define ishumanrace(A) is_species(A, /datum/species/human)
#define iskidan(A) is_species(A, /datum/species/kidan)
#define iskrell(A) is_species(A, /datum/species/skrell)
#define isdiona(A) is_species(A, /datum/species/dionae)
//fin hispania

//---------------------------------------------------

#define isanimal(A) istype(A, /mob/living/simple_animal)

#define iscorgi(A) istype(A, /mob/living/simple_animal/corgi)

#define ismouse(A) istype(A, /mob/living/simple_animal/mouse)

#define issuperioranimal(A) istype(A, /mob/living/carbon/superior_animal)

#define isburrow(A) istype(A, /obj/structure/burrow)
//---------------------------------------------------

#define issilicon(A) istype(A, /mob/living/silicon)

#define isAI(A) istype(A, /mob/living/silicon/ai)

#define ispAI(A) istype(A, /mob/living/silicon/pai)

#define isrobot(A) istype(A, /mob/living/silicon/robot)

#define isdrone(A) istype(A, /mob/living/silicon/robot/drone)

#define isblitzshell(A) istype(A, /mob/living/silicon/robot/drone/blitzshell)

//-----------------Objects
#define ismovable(A) istype(A, /atom/movable)

#define isobj(A) istype(A, /obj)

#define isHUDobj(A) istype(A, /obj/screen)

#define isitem(A) istype(A, /obj/item)

#define isorgan(A) istype(A, /obj/item/organ/external)

#define isgun(A) istype(A, /obj/item/weapon/gun)

#define istool(A) istype(A, /obj/item/weapon/tool)

#define isCoil(A) istype(A, /obj/item/stack/cable_coil)

#define isstructure(A) (istype(A, /obj/structure))

#define ismachinery(A) (istype(A, /obj/machinery))
