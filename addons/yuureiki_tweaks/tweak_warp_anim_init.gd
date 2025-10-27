extends Node

var new_suit_tweaks = CharacterManager.DEFAULT_SUIT_TWEAKS.duplicate()

func _ready() -> void:
	new_suit_tweaks.warp_animation = false
	
	if SettingsManager.get_tweak("player_warp_anim", false):
		for i in CharacterManager.MARIO_SUITS.keys():
			CharacterManager.add_suit_tweaks(new_suit_tweaks, "Mario", i, true)
		for i in CharacterManager.LUIGI_SUITS.keys():
			CharacterManager.add_suit_tweaks(new_suit_tweaks, "Luigi", i, true)
