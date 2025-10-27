extends "res://engine/objects/core/checkpoint/checkpoint.gd"

const NEW_SOUND = preload("res://engine/objects/bumping_blocks/_sounds/appear.wav")

func _ready() -> void:
	super()
	if SettingsManager.get_tweak("player_check_sfx"):
		sound = NEW_SOUND
