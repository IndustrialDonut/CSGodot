class_name MasterConfig extends Object


static var config = {
	"G18" : {
		"slot_code": Enums.SECONDARY,
		"firemode": FireMode.SEMI,
		"special": ToggleableSpecial.new(FireMode.BURST),
		"mass" : 1.5,
		"model": "res://models/G18.tscn",
		"magsize": 15,
		"magmode": ReloadMode.MAGAZINE,
	},
	"G18-P" : {
		"slot_code": Enums.PRIMARY,
		"firemode": FireMode.SEMI,
		"special": NoSpecial.new(),
		"mass" : 5,
		"model": "res://models/G18.tscn",
		"magsize": 4,
		"magmode": ReloadMode.SINGLE,
	},
	"AWP" : {
		"slot_code": Enums.PRIMARY,
		"firemode": FireMode.SEMI,
		"special": ScopedSpecial.new(),
		"mass" : 5,
		"model": "res://models/AWP.tscn",
		"magsize": 4,
		"magmode": ReloadMode.SINGLE,
	},
}
