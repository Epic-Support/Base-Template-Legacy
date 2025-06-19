return {

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Argent sale',
	},

	['burger'] = {
		label = 'Burger Simple',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'Tu as étanché ta soif avec un sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Ordures',
	},

	['paperbag'] = {
		label = 'Sac en papier',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Culotte',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Crochetage',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = "Argent",
		weight = 0.01,
	},

	['mustard'] = {
		label = 'Moutarde',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'Tu as bu de la moutarde'
		}
	},

	['bread'] = {
		label = 'Pain',
		weight = 500, -- poids en grammes (ajuste selon ton système)
		client = {
			status = { hunger = 250000, }, -- restaure 25% de la faim
			anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
			prop = { model = `prop_sandwich_01`, pos = vec3(0.13, 0.05, 0.02), rot = vec3(-90.0, 0.0, 0.0) },
			usetime = 2500, -- durée de l'utilisation (2.5 sec)
			cancel = true,
			notification = 'Miam du bon Pain'
		}
	},

	['water'] = {
		label = 'Bouteille D\'eau',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Tu as bu de l\'eau rafraîchissante'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Gilet pare-balles',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Vêtements',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Carte de banque',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["alive_chicken"] = {
		label = "Poulet vivant",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Chalumeau",
		weight = 2,
		stack = true,
		close = true,
	},

	["bmx"] = {
		label = "BMX",
		weight = 1,
		stack = true,
		close = true,
	},

	["boombox"] = {
		label = "Boombox",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Kit carrosserie",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Outils",
		weight = 2,
		stack = true,
		close = true,
	},

	["cigarette"] = {
		label = "Cigarette",
		weight = 1,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Tissu",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Cuivre",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Couper du bois",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Poisson",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Trousse de réparation",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Outils de réparation",
		weight = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Bouteille de gaz",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Fer",
		weight = 1,
		stack = true,
		close = true,
	},

	["key"] = {
		label = "Clée de voiture",
		weight = 1,
		stack = true,
		close = true,
	},

	["kq_outfitbag"] = {
		label = "Sac de tenue",
		weight = 4,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Médikit",
		weight = 2,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Filet de poulet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Bois emballé",
		weight = 1,
		stack = true,
		close = true,
	},

	["permis"] = {
		label = "Permis de conduire",
		weight = 10,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Huile",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Huile transformée",
		weight = 1,
		stack = true,
		close = true,
	},

	["ppa"] = {
		label = "PPA",
		weight = 10,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Poulet abattu",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Pierre",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Pierre lavée",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Bois",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Laine",
		weight = 1,
		stack = true,
		close = true,
	},
--------- Identiter ----------

	['license_drive'] = {
		label = 'Permis de conduire',
	},

	['license_weapon'] = {
		label = 'Permis port d\'arme',
	},

	['id_card'] = {
		label = 'Carte D\'identité',
	},

	['vehicle_card'] = {
		label = 'Carte Grise',
		weight = 0,
		stack = false,
		close = true,
		client = {
			event = '_CH:_CH_OPEN_ID_CARD',
		}
	},

	-------------Cloth----------------
	['cloth'] = {
		label = 'Tenue',
		weight = 1,
		stack = false, 
		close = false,
	},
	['cloth_torso'] = {
		label = 'Veste',
		weight = 0.50,
		stack = false,
		close = false,
	},
	['cloth_tshirt'] = {
		label = 'T-Shirt',
		weight = 0.20,
		stack = false,
		close = false,
	},
	['cloth_arms'] = {
		label = 'Bras',
		weight = 0,
		stack = false,
		close = false,
	},
	['cloth_pants'] = {
		label = 'Pantalon',
		weight = 0.40,
		stack = false,
		close = false,
	},
	['cloth_shoes'] = {
		label = 'Chaussures',
		weight = 0.80,
		stack = false,
		close = false,
	},
	['cloth_decals'] = {
		label = 'Calques',
		weight = 0,
		stack = false,
		close = false,
	},
	['cloth_ears'] = {
		label = "Boucle d'Oreilles",
		weight = 0.01,
		stack = false,
		close = false,
	},
	['cloth_mask'] = {
		label = 'Masque',
		weight = 0.01,
		stack = false,
		close = false,
	},
	['cloth_bproof'] = {
		label = 'Gilet Par Balle',
		weight = 0.8,
		stack = false,
		close = false,
	},
	['cloth_chain'] = {
		label = 'Collier',
		weight = 0.03,
		stack = false,
		close = false,
	},
	['cloth_bags'] = {
		label = 'Sac',
		weight = 0.5,
		stack = false,
		close = false,
	},
	['cloth_glasses'] = {
		label = 'Lunettes',
		weight = 0.01,
		stack = false,
		close = false,
	},
	['cloth_watches'] = {
		label = 'Montre',
		weight = 0.01,
		stack = false,
		close = false,
	},
	['cloth_bracelets'] = {
		label = 'Bracelet',
		weight = 0.01,
		stack = false,
		close = false,
	},
	['cloth_helmet'] = {
		label = 'Chapeaux',
		weight = 0.05,
		stack = false,
		close = false,
	},

-------------------------------- 

	['acetone'] = {
		label = "Acétone",
		weight = 0.01,
	},
	['ace_of_spades'] = {
		label = "As de Pique",
		weight = 0.01,
	},
	['acid'] = {
		label = "Acide",
		weight = 0.01,
	},
	['acide_lysergique'] = {
		label = "Acide Lysergique",
		weight = 0.01,
	},
	['acide_nitrique'] = {
		label = "Acide Nitrique",
		weight = 0.01,
	},
	['acier'] = {
		label = "Acier",
		weight = 0.01,
	},
	['acier_compact'] = {
		label = "Acier Compact",
		weight = 0.01,
	},
	['action_figure'] = {
		label = "Figurine d'Action",
		weight = 0.01,
	},
	['adobo'] = {
		label = "Adobo",
		weight = 0.01,
	},
	['adrenaline'] = {
		label = "Adrénaline",
		weight = 0.01,
	},
	['advancedhackware'] = {
		label = "Logiciel de Piratage Avancé",
		weight = 0.01,
	},
	['advancedkit'] = {
		label = "Kit Avancé",
		weight = 0.01,
	},
	['advanced_lockpick'] = {
		label = "Crochet de Serrure Avancé",
		weight = 0.01,
	},
	['advdecryptor'] = {
		label = "Décodeur Avancé",
		weight = 0.01,
	},
	['advrepairkit'] = {
		label = "Kit de Réparation Avancé",
		weight = 0.01,
	},
	['afishysandwich'] = {
		label = "Sandwich de Poisson",
		weight = 0.01,
	},
	['agrafe'] = {
		label = "Agrafe",
		weight = 0.01,
	},
	['airplane_ticket'] = {
		label = "Billet d'Avion",
		weight = 0.01,
	},
	['akabe'] = {
		label = "Akabé",
		weight = 0.01,
	},
	['album'] = {
		label = "Album",
		weight = 0.01,
	},
	['alcool'] = {
		label = "Alcool",
		weight = 0.01,
	},
	['alette'] = {
		label = "Alette",
		weight = 0.01,
	},
	['alienware'] = {
		label = "Alienware",
		weight = 0.01,
	},
	['alive_chicken'] = {
		label = "Poulet Vivant",
		weight = 0.01,
	},
	['allrepairkit'] = {
		label = "Kit de Réparation Complet",
		weight = 0.01,
	},
	['aluminium'] = {
		label = "Aluminium",
		weight = 0.01,
	},
	['aluminum'] = {
		label = "Aluminum",
		weight = 0.01,
	},
	['aluminum_oxide'] = {
		label = "Oxyde d'Aluminium",
		weight = 0.01,
	},
	['american_gothic'] = {
		label = "Gothique Américain",
		weight = 0.01,
	},
	['ammonia'] = {
		label = "Ammoniac",
		weight = 0.01,
	},

---------- Munition Arme -----------

	['ammo_advancedrifle'] = {
		label = "Munitions pour Fusil Avancé",
		weight = 0.01,
	},
	['ammo_antidote'] = {
		label = "Antidote",
		weight = 0.01,
	},
	['ammo_appistol'] = {
		label = "Munitions pour Pistolet Automatique",
		weight = 0.01,
	},
	['ammo_assaultrifle'] = {
		label = "Munitions pour Fusil d'Assaut",
		weight = 0.01,
	},
	['ammo_assaultrifle_mk2'] = {
		label = "Munitions pour Fusil d'Assaut Mk2",
		weight = 0.01,
	},
	['ammo_assaultshotgun'] = {
		label = "Munitions pour Fusil à Pompe",
		weight = 0.01,
	},
	['ammo_assaultsmg'] = {
		label = "Munitions pour Pistolet Mitrailleur",
		weight = 0.01,
	},
	['ammo_autoshotgun'] = {
		label = "Munitions pour Fusil à Pompe Automatique",
		weight = 0.01,
	},
	['ammo_bullpuprifle'] = {
		label = "Munitions pour Fusil Bullpup",
		weight = 0.01,
	},
	['ammo_bullpuprifle_mk2'] = {
		label = "Munitions pour Fusil Bullpup Mk2",
		weight = 0.01,
	},
	['ammo_bullpupshotgun'] = {
		label = "Munitions pour Fusil à Pompe Bullpup",
		weight = 0.01,
	},
	['ammo_carbinerifle'] = {
		label = "Munitions pour Carabine",
		weight = 0.01,
	},
	['ammo_carbinerifle_mk2'] = {
		label = "Munitions pour Carabine Mk2",
		weight = 0.01,
	},
	['ammo_combatmg'] = {
		label = "Munitions pour Mitrailleuse de Combat",
		weight = 0.01,
	},
	['ammo_combatmg_mk2'] = {
		label = "Munitions pour Mitrailleuse de Combat Mk2",
		weight = 0.01,
	},
	['ammo_combatpdw'] = {
		label = "Munitions pour Pistolet Mitrailleur de Combat",
		weight = 0.01,
	},
	['ammo_combatpistol'] = {
		label = "Munitions pour Pistolet de Combat",
		weight = 0.01,
	},
	['ammo_compactrifle'] = {
		label = "Munitions pour Fusil Compact",
		weight = 0.01,
	},
	['ammo_dbshotgun'] = {
		label = "Munitions pour Fusil à Pompe Double",
		weight = 0.01,
	},
	['ammo_doubleaction'] = {
		label = "Munitions pour Revolver Double Action",
		weight = 0.01,
	},
	['ammo_firework'] = {
		label = "Munitions pour Feu d'Artifice",
		weight = 0.01,
	},
	['ammo_firework_box'] = {
		label = "Boîte de Munitions pour Feu d'Artifice",
		weight = 0.01,
	},
	['ammo_flaregun'] = {
		label = "Munitions pour Lance-Flare",
		weight = 0.01,
	},
	['ammo_flaregun_box'] = {
		label = "Boîte de Munitions pour Lance-Flare",
		weight = 0.01,
	},
	['ammo_grenadelauncher'] = {
		label = "Munitions pour Lance-Grenades",
		weight = 0.01,
	},
	['ammo_grenadelauncher_smoke'] = {
		label = "Munitions pour Lance-Grenades Fumigènes",
		weight = 0.01,
	},
	['ammo_gusenberg'] = {
		label = "Munitions pour Pistolet Mitrailleur Gusenberg",
		weight = 0.01,
	},
	['ammo_heavypistol'] = {
		label = "Munitions pour Pistolet Lourd",
		weight = 0.01,
	},
	['ammo_heavyshotgun'] = {
		label = "Munitions pour Fusil à Pompe Lourd",
		weight = 0.01,
	},
	['ammo_heavysniper'] = {
		label = "Munitions pour Fusil de Sniper Lourd",
		weight = 0.01,
	},
	['ammo_heavysniper_mk2'] = {
		label = "Munitions pour Fusil de Sniper Lourd Mk2",
		weight = 0.01,
	},
	['ammo_hominglauncher'] = {
		label = "Munitions pour Lance-Missiles",
		weight = 0.01,
	},
	['ammo_machinepistol'] = {
		label = "Munitions pour Pistolet Mitrailleur",
		weight = 0.01,
	},
	['ammo_marksmanpistol'] = {
		label = "Munitions pour Pistolet de Tireur d'Élite",
		weight = 0.01,
	},
	['ammo_marksmanrifle'] = {
		label = "Munitions pour Fusil de Tireur d'Élite",
		weight = 0.01,
	},
	['ammo_marksmanrifle_mk2'] = {
		label = "Munitions pour Fusil de Tireur d'Élite Mk2",
		weight = 0.01,
	},
	['ammo_mg'] = {
		label = "Munitions pour Mitrailleuse",
		weight = 0.01,
	},
	['ammo_mg_box'] = {
		label = "Boîte de Munitions pour Mitrailleuse",
		weight = 0.01,
	},
	['ammo_microsmg'] = {
		label = "Munitions pour Pistolet Mitrailleur Micro",
		weight = 0.01,
	},
	['ammo_minigun'] = {
		label = "Munitions pour Minigun",
		weight = 0.01,
	},
	['ammo_minigun_box'] = {
		label = "Boîte de Munitions pour Minigun",
		weight = 0.01,
	},
	['ammo_minismg'] = {
		label = "Munitions pour Pistolet Mitrailleur Mini",
		weight = 0.01,
	},
	['ammo_musket'] = {
		label = "Munitions pour Mousquet",
		weight = 0.01,
	},
	['ammo_nailgun'] = {
		label = "Munitions pour Pistolet à Clous",
		weight = 0.01,
	},
	['ammo_nailgun_box'] = {
		label = "Boîte de Munitions pour Pistolet à Clous",
		weight = 0.01,
	},
	['ammo_needlerifle'] = {
		label = "Munitions pour Fusil à Aiguilles",
		weight = 0.01,
	},
	['ammo_needlerifle_box'] = {
		label = "Boîte de Munitions pour Fusil à Aiguilles",
		weight = 0.01,
	},
	['ammo_paintball'] = {
		label = "Munitions pour Paintball",
		weight = 0.01,
	},
	['ammo_paintball_box'] = {
		label = "Boîte de Munitions pour Paintball",
		weight = 0.01,
	},
	['ammo_pepperspray'] = {
		label = "Munitions pour Spray au Poivre",
		weight = 0.01,
	},
	['ammo_pistol'] = {
		label = "Munitions pour Pistolet",
		weight = 0.01,
	},
	['ammo_pistol50'] = {
		label = "Munitions pour Pistolet 50",
		weight = 0.01,
	},
	['ammo_pistol_box'] = {
		label = "Boîte de Munitions pour Pistolet",
		weight = 0.01,
	},
	['ammo_pistol_mk2'] = {
		label = "Munitions pour Pistolet Mk2",
		weight = 0.01,
	},
	['ammo_pumpshotgun'] = {
		label = "Munitions pour Fusil à Pompe",
		weight = 0.01,
	},
	['ammo_pumpshotgun_mk2'] = {
		label = "Munitions pour Fusil à Pompe Mk2",
		weight = 0.01,
	},
	['ammo_railgun'] = {
		label = "Munitions pour Fusil à Rail",
		weight = 0.01,
	},
	['ammo_railgun_box'] = {
		label = "Boîte de Munitions pour Fusil à Rail",
		weight = 0.01,
	},
	['ammo_raypistol'] = {
		label = "Munitions pour Pistolet à Rayons",
		weight = 0.01,
	},
	['ammo_raypistol_box'] = {
		label = "Boîte de Munitions pour Pistolet à Rayons",
		weight = 0.01,
	},
	['ammo_revolver'] = {
		label = "Munitions pour Revolver",
		weight = 0.01,
	},
	['ammo_revolver_mk2'] = {
		label = "Munitions pour Revolver Mk2",
		weight = 0.01,
	},
	['ammo_rifle'] = {
		label = "Munitions pour Fusil",
		weight = 0.01,
	},
	['ammo_rifle_box'] = {
		label = "Boîte de Munitions pour Fusil",
		weight = 0.01,
	},
	['ammo_rpg'] = {
		label = "Munitions pour Lance-Roquettes",
		weight = 0.01,
	},
	['ammo_rubber'] = {
		label = "Munitions pour Pistolet à Caoutchouc",
		weight = 0.01,
	},
	['ammo_rubber_box'] = {
		label = "Boîte de Munitions pour Pistolet à Caoutchouc",
		weight = 0.01,
	},
	['ammo_sawnoffshotgun'] = {
		label = "Munitions pour Fusil à Pompe Scié",
		weight = 0.01,
	},
	['ammo_shotgun'] = {
		label = "Munitions pour Fusil à Pompe",
		weight = 0.01,
	},
	['ammo_shotgun_box'] = {
		label = "Boîte de Munitions pour Fusil à Pompe",
		weight = 0.01,
	},
	['ammo_smg'] = {
		label = "Munitions pour Pistolet Mitrailleur",
		weight = 0.01,
	},
	['ammo_smg_box'] = {
		label = "Boîte de Munitions pour Pistolet Mitrailleur",
		weight = 0.01,
	},
	['ammo_smg_mk2'] = {
		label = "Munitions pour Pistolet Mitrailleur Mk2",
		weight = 0.01,
	},
	['ammo_sniper'] = {
		label = "Munitions pour Fusil de Sniper",
		weight = 0.01,
	},
	['ammo_sniperrifle'] = {
		label = "Munitions pour Fusil de Sniper",
		weight = 0.01,
	},
	['ammo_sniper_box'] = {
		label = "Boîte de Munitions pour Fusil de Sniper",
		weight = 0.01,
	},
	['ammo_snspistol'] = {
		label = "Munitions pour Pistolet de Sniper",
		weight = 0.01,
	},
	['ammo_snspistol_mk2'] = {
		label = "Munitions pour Pistolet de Sniper Mk2",
		weight = 0.01,
	},
	['ammo_specialcarbine'] = {
		label = "Munitions pour Carabine Spéciale",
		weight = 0.01,
	},
	['ammo_specialcarbine_mk2'] = {
		label = "Munitions pour Carabine Spéciale Mk2",
		weight = 0.01,
	},
	['ammo_stickybomb'] = {
		label = "Munitions pour Bombe Collante",
		weight = 0.01,
	},
	['ammo_vintagepistol'] = {
		label = "Munitions pour Pistolet Vintage",
		weight = 0.01,
	},

--------- Arme ----------

['weapon_3j7kq84d'] = {
		label = "Arme 3J7KQ84D",
		weight = 0.01,
	},
	['weapon_advancedrifle'] = {
		label = "Fusil Avancé",
		weight = 0.01,
	},
	['weapon_ak'] = {
		label = "AK",
		weight = 0.01,
	},
	['weapon_antidote'] = {
		label = "Antidote",
		weight = 0.01,
	},
	['weapon_appistol'] = {
		label = "Pistolet Automatique",
		weight = 0.01,
	},
	['weapon_armagodsword'] = {
		label = "Épée Armageddon",
		weight = 0.01,
	},
	['weapon_assaultrifle'] = {
		label = "Fusil d'Assaut",
		weight = 0.01,
	},
	['weapon_assaultrifle_mk2'] = {
		label = "Fusil d'Assaut Mk2",
		weight = 0.01,
	},
	['weapon_assaultshotgun'] = {
		label = "Fusil à Pompe d'Assaut",
		weight = 0.01,
	},
	['weapon_assaultsmg'] = {
		label = "Pistolet Mitrailleur d'Assaut",
		weight = 0.01,
	},
	['weapon_autoshotgun'] = {
		label = "Fusil à Pompe Automatique",
		weight = 0.01,
	},
	['weapon_ball'] = {
		label = "Balle",
		weight = 0.01,
	},
	['weapon_bat'] = {
		label = "Batte",
		weight = 0.01,
	},
	['weapon_battleaxe'] = {
		label = "Hache de Bataille",
		weight = 0.01,
	},
	['weapon_battlerifle'] = {
		label = "Fusil de Bataille",
		weight = 0.01,
	},
	['weapon_beanbag'] = {
		label = "Sac de Haricots",
		weight = 0.01,
	},
	['weapon_bighammer'] = {
		label = "Grosse Marteau",
		weight = 0.01,
	},
	['weapon_birdbomb'] = {
		label = "Bombe Oiseau",
		weight = 0.01,
	},
	['weapon_bird_crap'] = {
		label = "Crap d'Oiseau",
		weight = 0.01,
	},
	['weapon_book'] = {
		label = "Livre",
		weight = 0.01,
	},
	['weapon_bottle'] = {
		label = "Bouteille",
		weight = 0.01,
	},
	['weapon_bouteille'] = {
		label = "Bouteille",
		weight = 0.01,
	},
	['weapon_brick'] = {
		label = "Brique",
		weight = 0.01,
	},
	['weapon_bullpuprifle'] = {
		label = "Fusil Bullpup",
		weight = 0.01,
	},
	['weapon_bullpuprifle_mk2'] = {
		label = "Fusil Bullpup Mk2",
		weight = 0.01,
	},
	['weapon_bullpupshotgun'] = {
		label = "Fusil à Pompe Bullpup",
		weight = 0.01,
	},
	['weapon_bzgas'] = {
		label = "Gaz BZ",
		weight = 0.01,
	},
	['weapon_canette'] = {
		label = "Canette",
		weight = 0.01,
	},
	['weapon_carbinerifle'] = {
		label = "Carabine",
		weight = 0.01,
	},
	['weapon_carbinerifle_mk2'] = {
		label = "Carabine Mk2",
		weight = 0.01,
	},
	['weapon_cash'] = {
		label = "Argent",
		weight = 0.01,
	},
	['weapon_ceramicpistol'] = {
		label = "Pistolet en Céramique",
		weight = 0.01,
	},
	['weapon_chainsaw'] = {
		label = "Scie Électrique",
		weight = 0.01,
	},
	['weapon_combatmg'] = {
		label = "Mitrailleuse de Combat",
		weight = 0.01,
	},
	['weapon_combatmg_mk2'] = {
		label = "Mitrailleuse de Combat Mk2",
		weight = 0.01,
	},
	['weapon_combatpdw'] = {
		label = "Pistolet Mitrailleur de Combat",
		weight = 0.01,
	},
	['weapon_combatpistol'] = {
		label = "Pistolet de Combat",
		weight = 0.01,
	},
	['weapon_combatshotgun'] = {
		label = "Fusil à Pompe de Combat",
		weight = 0.01,
	},
	['weapon_compactlauncher'] = {
		label = "Lanceur Compact",
		weight = 0.01,
	},
	['weapon_compactrifle'] = {
		label = "Fusil Compact",
		weight = 0.01,
	},
	['weapon_crowbar'] = {
		label = "Barre à Mine",
		weight = 0.01,
	},
	['weapon_dagger'] = {
		label = "Dague",
		weight = 0.01,
	},
	['weapon_dbshotgun'] = {
		label = "Fusil à Pompe Double",
		weight = 0.01,
	},
	['weapon_digiscanner'] = {
		label = "Numériseur",
		weight = 0.01,
	},
	['weapon_doubleaction'] = {
		label = "Pistolet Double Action",
		weight = 0.01,
	},
	['weapon_electric_fence'] = {
		label = "Clôture Électrique",
		weight = 0.01,
	},
	['weapon_emplauncher'] = {
		label = "Lanceur EMP",
		weight = 0.01,
	},
	['weapon_fakeak'] = {
		label = "AK Factice",
		weight = 0.01,
	},
	['weapon_fakeaku'] = {
		label = "AKU Factice",
		weight = 0.01,
	},
	['weapon_fakecombatpistol'] = {
		label = "Pistolet de Combat Factice",
		weight = 0.01,
	},
	['weapon_fakem4'] = {
		label = "M4 Factice",
		weight = 0.01,
	},
	['weapon_fakemicrosmg'] = {
		label = "Micro SMG Factice",
		weight = 0.01,
	},
	['weapon_fakeshotgun'] = {
		label = "Fusil à Pompe Factice",
		weight = 0.01,
	},
	['weapon_fakesmg'] = {
		label = "SMG Factice",
		weight = 0.01,
	},
	['weapon_fertilizercan'] = {
		label = "Canette de Fertilisant",
		weight = 0.01,
	},
	['weapon_fireextinguisher'] = {
		label = "Extincteur",
		weight = 0.01,
	},
	['weapon_firework'] = {
		label = "Feu d'Artifice",
		weight = 0.01,
	},
	['weapon_flamethrower'] = {
		label = "Lance-Flammes",
		weight = 0.01,
	},
	['weapon_flamethrower2'] = {
		label = "Lance-Flammes 2",
		weight = 0.01,
	},
	['weapon_flare'] = {
		label = "Fusée de Signalisation",
		weight = 0.01,
	},
	['weapon_flaregun'] = {
		label = "Pistolet Flare",
		weight = 0.01,
	},
	['weapon_flashlight'] = {
		label = "Lampe Torche",
		weight = 0.01,
	},
	['weapon_gadgetpistol'] = {
		label = "Pistolet Gadget",
		weight = 0.01,
	},
	['weapon_garbagebag'] = {
		label = "Sac à Ordure",
		weight = 0.01,
	},
	['glock20'] = {
		label = "Glock",
		weight = 0.01,
		ammoname = 'ammo-9',
	},
	['w_pi_glock'] = {
		label = 'Glock',
		weight = 1500,
		durability = 0.075,
		ammoname = 'ammo-9',
	},
	['w_pi_combatpistol'] = {
		label = 'Glock',
		weight = 1500,
		durability = 0.075,
		ammoname = 'ammo-9',
	},
	['weapon_glock20'] = {
		label = "Glock 20",
		weight = 0.01,
	},
	['weapon_golfclub'] = {
		label = "Club de Golf",
		weight = 0.01,
	},
	['weapon_gravhammer'] = {
		label = "Marteau Gravitationnel",
		weight = 0.01,
	},
	['weapon_grenade'] = {
		label = "Grenade",
		weight = 0.01,
	},
	['weapon_grenadelauncher'] = {
		label = "Lance-Grenades",
		weight = 0.01,
	},
	['weapon_grenadelauncher_smoke'] = {
		label = "Lance-Grenades Fumigènes",
		weight = 0.01,
	},
	['weapon_gtx1080'] = {
		label = "GTX 1080",
		weight = 0.01,
	},
	['weapon_guitar'] = {
		label = "Guitare",
		weight = 0.01,
	},
	['weapon_gusenberg'] = {
		label = "Gusenberg",
		weight = 0.01,
	},
	['weapon_hackingdevice'] = {
		label = "Dispositif de Piratage",
		weight = 0.01,
	},
	['weapon_hammer'] = {
		label = "Marteau",
		weight = 0.01,
	},
	['weapon_handcuffs'] = {
		label = "Menottes",
		weight = 0.01,
	},
	['weapon_hatchet'] = {
		label = "Hachette",
		weight = 0.01,
	},
	['weapon_hazardcan'] = {
		label = "Bidon de Déchets",
		weight = 0.01,
	},
	['weapon_heavypistol'] = {
		label = "Pistolet Lourd",
		weight = 0.01,
	},
	['weapon_heavyrifle'] = {
		label = "Fusil Lourd",
		weight = 0.01,
	},
	['weapon_heavyshotgun'] = {
		label = "Fusil à Pompe Lourd",
		weight = 0.01,
	},
	['weapon_heavysniper'] = {
		label = "Fusil de Sniper Lourd",
		weight = 0.01,
	},
	['weapon_heavysniper_mk2'] = {
		label = "Fusil de Sniper Lourd Mk2",
		weight = 0.01,
	},
	['weapon_hk417'] = {
		label = "HK417",
		weight = 0.01,
	},
	['weapon_hominglauncher'] = {
		label = "Lanceur Autoguidé",
		weight = 0.01,
	},
	['weapon_hunt'] = {
		label = "Fusil de Chasse",
		weight = 0.01,
	},
	['weapon_infinitygauntlet'] = {
		label = "Gant de l'Infini",
		weight = 0.01,
	},
	['weapon_jrevolver'] = {
		label = "Revolver J",
		weight = 0.01,
	},
	['weapon_katana'] = {
		label = "Katana",
		weight = 0.01,
	},
	['weapon_katana2'] = {
		label = "Katana 2",
		weight = 0.01,
	},
	['weapon_katana3'] = {
		label = "Katana 3",
		weight = 0.01,
	},
	['weapon_katana4'] = {
		label = "Katana 4",
		weight = 0.01,
	},
	['weapon_katana5'] = {
		label = "Katana 5",
		weight = 0.01,
	},
	['weapon_katana6'] = {
		label = "Katana 6",
		weight = 0.01,
	},
	['weapon_knife'] = {
		label = "Couteau",
		weight = 0.01,
	},
	['weapon_knuckle'] = {
		label = "Coup-de-Poing Américain",
		weight = 0.01,
	},
	['weapon_liberty_statue'] = {
		label = "Statue de la Liberté",
		weight = 0.01,
	},
	['weapon_m9'] = {
		label = "M9",
		weight = 0.01,
	},
	['weapon_machete'] = {
		label = "Machette",
		weight = 0.01,
	},
	['weapon_machinepistol'] = {
		label = "Pistolet-Mitrailleur",
		weight = 0.01,
	},
	['weapon_marksmanpistol'] = {
		label = "Pistolet Marksman",
		weight = 0.01,
	},
	['weapon_marksmanrifle'] = {
		label = "Fusil Marksman",
		weight = 0.01,
	},
	['weapon_marksmanrifle_mk2'] = {
		label = "Fusil Marksman Mk2",
		weight = 0.01,
	},
	['weapon_medbag'] = {
		label = "Sac Médical",
		weight = 0.01,
	},
	['weapon_metaldetector'] = {
		label = "Détecteur de Métaux",
		weight = 0.01,
	},
	['weapon_mg'] = {
		label = "Mitrailleuse",
		weight = 0.01,
	},
	['weapon_mga7000'] = {
		label = "MGA7000",
		weight = 0.01,
	},
	['weapon_microsmg'] = {
		label = "Micro SMG",
		weight = 0.01,
	},
	['weapon_militaryrifle'] = {
		label = "Fusil Militaire",
		weight = 0.01,
	},
	['weapon_minigun'] = {
		label = "Minigun",
		weight = 0.01,
	},
	['weapon_minismg'] = {
		label = "Mini SMG",
		weight = 0.01,
	},
	['weapon_molette'] = {
		label = "Molette",
		weight = 0.01,
	},
	['weapon_molotov'] = {
		label = "Molotov",
		weight = 0.01,
	},
	['weapon_musket'] = {
		label = "Mousquet",
		weight = 0.01,
	},
	['weapon_nailgun'] = {
		label = "Cloueuse",
		weight = 0.01,
	},
	['weapon_navyrevolver'] = {
		label = "Revolver de Marine",
		weight = 0.01,
	},
	['weapon_needlerrifle'] = {
		label = "Fusil à Aiguilles",
		weight = 0.01,
	},
	['weapon_nightstick'] = {
		label = "Matraque",
		weight = 0.01,
	},
	['weapon_notes7'] = {
		label = "Notes 7",
		weight = 0.01,
	},
	['weapon_old_shotgun'] = {
		label = "Vieux Fusil à Pompe",
		weight = 0.01,
	},
	['weapon_paintball'] = {
		label = "Lanceur de Paintball",
		weight = 0.01,
	},
	['weapon_pelle'] = {
		label = "Pelle",
		weight = 0.01,
	},
	['weapon_penetrator'] = {
		label = "Pénétrateur",
		weight = 0.01,
	},
	['weapon_pepperspray'] = {
		label = "Spray au Poivre",
		weight = 0.01,
	},
	['weapon_pericopistol'] = {
		label = "Pistolet Périscope",
		weight = 0.01,
	},
	['weapon_petrolcan'] = {
		label = "Jerrican",
		weight = 0.01,
	},
	['weapon_phone'] = {
		label = "Téléphone",
		weight = 0.01,
	},
	['weapon_pickaxe'] = {
		label = "Pioche",
		weight = 0.01,
	},
	['weapon_pipebomb'] = {
		label = "Bombe Artisanale",
		weight = 0.01,
	},
	['weapon_pistol'] = {
		label = "Pistolet",
		weight = 0.01,
	},
	['weapon_pistol50'] = {
		label = "Pistolet .50",
		weight = 0.01,
	},
	['weapon_pistol_mk2'] = {
		label = "Pistolet Mk2",
		weight = 0.01,
	},
	['weapon_plasmap'] = {
		label = "Plasmap",
		weight = 0.01,
	},
	['weapon_poolcue'] = {
		label = "Queue de Billard",
		weight = 0.01,
	},
	['weapon_precisionrifle'] = {
		label = "Fusil de Précision",
		weight = 0.01,
	},
	['weapon_proxmine'] = {
		label = "Mine de Proximité",
		weight = 0.01,
	},
	['weapon_pumpshotgun'] = {
		label = "Fusil à Pompe",
		weight = 0.01,
	},
	['weapon_pumpshotgun_mk2'] = {
		label = "Fusil à Pompe Mk2",
		weight = 0.01,
	},
	['weapon_radarpistol'] = {
		label = "Pistolet Radar",
		weight = 0.01,
	},
	['weapon_railgun'] = {
		label = "Fusil à Rail",
		weight = 0.01,
	},
	['weapon_raycarbine'] = {
		label = "Carabine à Rayons",
		weight = 0.01,
	},
	['weapon_rayminigun'] = {
		label = "Minigun à Rayons",
		weight = 0.01,
	},
	['weapon_raypistol'] = {
		label = "Pistolet à Rayons",
		weight = 0.01,
	},
	['weapon_remotesniper'] = {
		label = "Fusil de Sniper Télécommandé",
		weight = 0.01,
	},
	['weapon_revolver'] = {
		label = "Revolver",
		weight = 0.01,
	},
	['weapon_revolver_mk2'] = {
		label = "Revolver Mk2",
		weight = 0.01,
	},
	['weapon_rpg'] = {
		label = "RPG",
		weight = 0.01,
	},
	['weapon_sawnoffshotgun'] = {
		label = "Fusil à Pompe Scié",
		weight = 0.01,
	},
	['weapon_shotgun'] = {
		label = "Fusil à Pompe",
		weight = 0.01,
	},
	['weapon_sledgehammer'] = {
		label = "Masse",
		weight = 0.01,
	},
	['weapon_smg'] = {
		label = "SMG",
		weight = 0.01,
	},
	['weapon_smg_mk2'] = {
		label = "SMG Mk2",
		weight = 0.01,
	},
	['weapon_smokegrenade'] = {
		label = "Grenade Fumigène",
		weight = 0.01,
	},
	['weapon_smokelspd'] = {
		label = "Fumigène LSPD",
		weight = 0.01,
	},
	['weapon_sniperrifle'] = {
		label = "Fusil de Sniper",
		weight = 0.01,
	},
	['weapon_snowball'] = {
		label = "Boule de Neige",
		weight = 0.01,
	},
	['weapon_snowlauncher'] = {
		label = "Lance-Neige",
		weight = 0.01,
	},
	['weapon_snspistol'] = {
		label = "Pistolet SNS",
		weight = 0.01,
	},
	['weapon_snspistol_mk2'] = {
		label = "Pistolet SNS Mk2",
		weight = 0.01,
	},
	['weapon_snub'] = {
		label = "Pistolet Snub",
		weight = 0.01,
	},
	['weapon_specialcarbine'] = {
		label = "Carabine Spéciale",
		weight = 0.01,
	},
	['weapon_specialcarbine_mk2'] = {
		label = "Carabine Spéciale Mk2",
		weight = 0.01,
	},
	['weapon_spikedclub'] = {
		label = "Massue à Pointes",
		weight = 0.01,
	},
	['weapon_splaser'] = {
		label = "Pistolet Laser",
		weight = 0.01,
	},
	['weapon_stickybomb'] = {
		label = "Bombe Collante",
		weight = 0.01,
	},
	['weapon_stinger'] = {
		label = "Stinger",
		weight = 0.01,
	},
	['weapon_stone_hatchet'] = {
		label = "Hachette en Pierre",
		weight = 0.01,
	},
	['weapon_stungun'] = {
		label = "Taser",
		weight = 0.01,
	},
	['weapon_stungun_02'] = {
		label = "Taser 02",
		weight = 0.01,
	},
	['weapon_stungun_mp'] = {
		label = "Taser MP",
		weight = 0.01,
	},
	['weapon_stunrod'] = {
		label = "Matraque Électrique",
		weight = 0.01,
	},
	['weapon_sweepershotgun'] = {
		label = "Fusil à Pompe Balayeur",
		weight = 0.01,
	},
	['weapon_switchblade'] = {
		label = "Couteau à Cran d'Arrêt",
		weight = 0.01,
	},
	['weapon_tacticalrifle'] = {
		label = "Fusil Tactique",
		weight = 0.01,
	},
	['weapon_tecpistol'] = {
		label = "Pistolet TEC",
		weight = 0.01,
	},
	['weapon_throwingaxe'] = {
		label = "Hachette de Lancer",
		weight = 0.01,
	},
	['weapon_toz'] = {
		label = "Fusil TOZ",
		weight = 0.01,
	},
	['weapon_tranquilizer'] = {
		label = "Pistolet Tranquillisant",
		weight = 0.01,
	},
	['weapon_unarmed'] = {
		label = "Non Armé",
		weight = 0.01,
	},
	['weapon_uvlight'] = {
		label = "Lumière UV",
		weight = 0.01,
	},
	['weapon_uzi'] = {
		label = "Uzi",
		weight = 0.01,
	},
	['weapon_vintagepistol'] = {
		label = "Pistolet Vintage",
		weight = 0.01,
	},
	['weapon_waffe'] = {
		label = "Waffe",
		weight = 0.01,
	},
	['weapon_waterpistol'] = {
		label = "Pistolet à Eau",
		weight = 0.01,
	},
	['weapon_wrench'] = {
		label = "Clé à Molette",
		weight = 0.01,
	},

---------------------------------------

	['amnesia'] = {
		label = "Amnésie",
		weight = 0.01,
	},
	['anelli'] = {
		label = "Anelli",
		weight = 0.01,
	},
	['anime_poster'] = {
		label = "Affiche d'Anime",
		weight = 0.01,
	},
	['anneau'] = {
		label = "Anneau",
		weight = 0.01,
	},
	['antidouleur'] = {
		label = "Antidouleur",
		weight = 0.01,
	},
	['antlers'] = {
		label = "Bois de Cerf",
		weight = 0.01,
	},
	['aod_cut'] = {
		label = "AOD Cut",
		weight = 0.01,
	},
	['applepie'] = {
		label = "Tarte aux Pommes",
		weight = 0.01,
	},
	['apple_iphone'] = {
		label = "iPhone Apple",
		weight = 0.01,
	},
	['armor'] = {
		label = "Armure",
		weight = 0.01,
	},
	['armor1'] = {
		label = "Armure 1",
		weight = 0.01,
	},
	['armor2'] = {
		label = "Armure 2",
		weight = 0.01,
	},
	['armor3'] = {
		label = "Armure 3",
		weight = 0.01,
	},
	['armor_plate'] = {
		label = "Plaque d'Armure",
		weight = 0.01,
	},
	['armor_plate_2'] = {
		label = "Plaque d'Armure 2",
		weight = 0.01,
	},
	['arm_xray'] = {
		label = "Radiographie du Bras",
		weight = 0.01,
	},
	['aspartam'] = {
		label = "Aspartame",
		weight = 0.01,
	},
	['aspirin'] = {
		label = "Aspirine",
		weight = 0.01,
	},
	['atelle'] = {
		label = "Atelle",
		weight = 0.01,
	},
	['autocollant'] = {
		label = "Autocollant",
		weight = 0.01,
	},

	["carteidentite"] = {
		label = "Carte Identité",
		weight = 10,
		stack = true,
		close = true,
	},

	["puffaumelon"] = {
		label = "Puff Melon",
		weight = 1,
		stack = true,
		close = true,
	},
}