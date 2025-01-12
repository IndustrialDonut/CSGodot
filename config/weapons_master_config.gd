class_name MasterConfig extends Object


static var config = {
	"USP-S" : {
		"slot_code": Enums.SECONDARY,
		"firemode": FireMode.SEMI,
		"special": SuppressedSpecial.new(
			Shooter.new(
				"", # placeholder sound path
				"", # placeholder light path
				0, # set to 0 (ZERO) for emission strength, suppressor!!
			)
		),
		"mass" : 2.0,
		"model": "res://models/G18.tscn",
		"magsize": 12,
		"magmode": ReloadMode.MAGAZINE,
	},
	"G18" : {
		"slot_code": Enums.SECONDARY,
		"firemode": FireMode.SEMI,
		"special": ToggleSpecial.new(FireMode.BURST),
		"mass" : 1.5,
		"model": "res://models/G18.tscn",
		"magsize": 15,
		"magmode": ReloadMode.MAGAZINE,
	},
	#"G18-P" : {
		#"slot_code": Enums.PRIMARY,
		#"firemode": FireMode.SEMI,
		#"special": NoSpecial.new(),
		#"mass" : 5,
		#"model": "res://models/G18.tscn",
		#"magsize": 4,
		#"magmode": ReloadMode.SINGLE,
	#},
	"AWP" : {
		"slot_code": Enums.PRIMARY,
		"firemode": FireMode.SEMI,
		"special": ScopedSpecial.new(null), # build scope special W/ THE SCOPE
		"mass" : 5,
		"model": "res://models/AWP.tscn",
		"magsize": 4,
		"magmode": ReloadMode.SINGLE,
	},
}
