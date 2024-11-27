class_name MasterConfig extends Object


static var config = {
	"G18" : {
		"slot_code": Enums.SECONDARY,
		"firemode": "res://components/firemodes/semi_auto.gd",
		"special": "res://weapons/ToggleableSpecialPolicy.gd",
		"mass" : 1.5,
		"model": "res://models/G18.tscn",
	},
	"SCAR-H" : {
		"magazine_protocol": "STANAG",
		"fire_modes": [
			"fire_modes/semi_auto.gd",
			"fire_modes/full_auto.gd",
		],
		"muzzle_velocity": "800", # m/s
		"mass" : 1.5,
		"model_config_path": "model_config/weapon_config_scarh.tscn",
		"default_magazine_model": "model_config/scarh_magazine.tscn",
	},
	"M4A1" : {
		"magazine_protocol": "STANAG",
		"fire_modes": [
			"fire_modes/semi_auto.gd",
			"fire_modes/full_auto.gd",
		],
		"muzzle_velocity": "790", # m/s
		"mass" : 0.9,
		"model_config_path": "model_config/weapon_config_m4a1.tscn",
		"default_magazine_model": "model_config/M4_mag.tscn",
	},
	"FAMAS" : {
		"slot_code": Enums.PRIMARY,
		"magazine": "STANAG",
		"firemode": "fire_modes/full_auto.gd",
		"shooter": {
			"model": null,
			"sound": "famas-sound.wav",
			"map_emit": 0.5,
			"flash": 0.6,
		},
		"special": {
			"toggle": "fire_modes/burst.gd"
		},
		"muzzle_velocity": "790", # m/s
		"mass" : 0.9,
		"model_config_path": "model_config/weapon_config_m4a1.tscn",
		"default_magazine_model": "model_config/M4_mag.tscn",
	},
	"M4A1S" : {
		"slot_code": Enums.PRIMARY,
		"magazine": "STANAG",
		"firemode": "fire_modes/full_auto.gd",
		"shooter": {
			"model": null,
			"sound": "m4a1s-loud-sound.wav",
			"map_emit": 0.4,
			"flash": 0.5,
		},
		"special": {
			"suppressor": {
				"model": "M4A1S-suppressor.obj",
				"sound": "m4a1s-suppressed-sound.wav",
				"map_emit": 0,
				"flash": 0.1,
			}
		},
		"muzzle_velocity": "790", # m/s
		"mass" : 0.9,
		"model_config_path": "model_config/weapon_config_m4a1.tscn",
		"default_magazine_model": "model_config/M4_mag.tscn",
	},
	"USP-S" : {
		"slot_code": Enums.SECONDARY,
		"magazine": "9mm",
		"firemode": "fire_modes/semi_auto.gd",
		"shooter": {
			"model": null,
			"sound": "usps-loud-sound.wav",
			"map_emit": 0.3,
			"flash": 0.3,
		},
		"special": {
			"suppressor": {
				"model": "usps-suppressor.obj",
				"sound": "usps-suppressed-sound.wav",
				"map_emit": 0,
				"flash": 0.1,
			}
		},
		"muzzle_velocity": "300", # m/s
		"mass" : 0.5,
		"model_config_path": "model_config/weapon_config_usps.tscn",
		"default_magazine_model": "model_config/usps_mag.tscn",
	},
	"AWP" : {
		"slot_code": Enums.PRIMARY,
		"magazine": "AWP",
		"firemode": "fire_modes/bolt_action.gd",
		"shooter": {
			"model": null,
			"sound": "awp.wav",
			"map_emit": 1.0,
			"flash": 1.0,
		},
		"special": {
			"scope": {
				"model": "awp-scope.obj",
				"texture": "black-scope-texture.tex",
				"zooms": [
					4, # 4x
					8, # 8x
				],
			}
		},
		"muzzle_velocity": "1000", # m/s
		"mass" : 1.5,
		"model_config_path": "model_config/weapon_config_awp.tscn",
		"default_magazine_model": "model_config/awp_mag.tscn",
	},
	"AK-74" : {
		"magazine_protocol": "AK",
		"fire_modes": [
			"fire_modes/semi_auto.gd",
			#"fire_modes/full_auto.gd",
		],
		"muzzle_velocity": "720", # m/s
		"mass" : 1.1,
		"model_config_path": "model_config/weapon_config_ak74.tscn",
		"default_magazine_model": "model_config/AK_mag.tscn",
	},
	"M249" : {
		"magazine_protocol": "BELT",
		"fire_modes": [
			#"fire_modes/semi_auto.gd",
			"fire_modes/full_auto.gd",
		],
		"muzzle_velocity": "890", # m/s
		"mass" : 1.1,
		"model_config_path": "model_config/weapon_config_m249.tscn",
		"default_magazine_model": null,
	},
}
