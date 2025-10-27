extends Level

var alt_completion = preload("res://stages/world_1/music/touhou_win.ogg")

func _ready() -> void:
	if SettingsManager.get_tweak("alt_win_theme", true):
		completion_music = alt_completion
	super()
