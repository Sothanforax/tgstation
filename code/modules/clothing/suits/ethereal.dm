/obj/item/clothing/suit/hooded/ethereal_raincoat
	name = "ethereal raincoat"
	desc = " A raincoat commonly worn by travelers or tourists not too fond of Sprout's rainy weather."
	icon = 'icons/map_icons/clothing/suit/_suit.dmi'
	worn_icon = 'icons/mob/clothing/suits/ethereal.dmi'
	icon_state = "/obj/item/clothing/suit/hooded/ethereal_raincoat"
	post_init_icon_state = "eth_raincoat"
	greyscale_config = /datum/greyscale_config/eth_raincoat
	greyscale_config_worn = /datum/greyscale_config/eth_raincoat/worn
	greyscale_colors = "#4e7cc7"
	flags_1 = IS_PLAYER_COLORABLE_1
	body_parts_covered = CHEST|GROIN|ARMS
	hoodtype = /obj/item/clothing/head/hooded/ethereal_rainhood

/obj/item/clothing/suit/hooded/ethereal_raincoat/Initialize(mapload)
	. = ..()
	update_icon(UPDATE_OVERLAYS)
	AddComponent(/datum/component/adjust_fishing_difficulty, -5)

/obj/item/clothing/suit/hooded/ethereal_raincoat/worn_overlays(mutable_appearance/standing, isinhands, icon_file)
	. = ..()
	if(!isinhands)
		. += emissive_appearance('icons/mob/clothing/suits/ethereal.dmi', "eth_raincoat_glow_worn", offset_spokesman = src, alpha = src.alpha)

/obj/item/clothing/suit/hooded/ethereal_raincoat/update_overlays()
	. = ..()
	. += emissive_appearance('icons/obj/clothing/suits/ethereal.dmi', "eth_raincoat_glow", offset_spokesman = src, alpha = src.alpha)

/obj/item/clothing/suit/hooded/ethereal_raincoat/trailwarden
	name = "trailwarden oilcoat"
	desc = "A masterfully handcrafted oilslick coat, supposedly makes for excellent camouflage among Sprout's vegetation. You can hear a faint electrical buzz emanating from the luminescent pattern."
	icon_state = "/obj/item/clothing/suit/hooded/ethereal_raincoat/trailwarden"
	greyscale_colors = "#32a87d"
	hoodtype = /obj/item/clothing/head/hooded/ethereal_rainhood/trailwarden

/obj/item/clothing/suit/hooded/ethereal_raincoat/trailwarden/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/adjust_fishing_difficulty, -7)

/obj/item/clothing/suit/hooded/ethereal_raincoat/trailwarden/equipped(mob/living/user, slot)
	. = ..()
	if(isethereal(user) && (slot & ITEM_SLOT_OCLOTHING))
		var/mob/living/carbon/human/ethereal = user
		to_chat(ethereal, span_notice("[src] gently quivers for a moment as you put it on."))
		set_greyscale(ethereal.dna.species.fixed_mut_color)
		ethereal.update_worn_oversuit()

/obj/item/clothing/head/hooded/ethereal_rainhood
	name = "ethereal rainhood"
	desc = "Protects against space rain."
	icon = 'icons/obj/clothing/head/ethereal.dmi'
	icon_state = "eth_rainhood"
	worn_icon = 'icons/mob/clothing/head/ethereal.dmi'
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEEARS|HIDEFACIALHAIR

/obj/item/clothing/head/hooded/ethereal_rainhood/trailwarden

/obj/item/clothing/head/hooded/ethereal_rainhood/trailwarden/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/adjust_fishing_difficulty, -6)
