extends "res://engine/scenes/save_game_room/scripts/saved_level_label.gd"

func update_label() -> void:
	if !pipe_save.profile_name:
		set_empty()
		return
	
	var profile_name = pipe_save.profile_name

	if ProfileManager.profiles.has(profile_name):
		var prof: ProfileManager.Profile = ProfileManager.profiles[profile_name]
		
		var full_numbers: String = prof.get_world_numbers()
		var world_numbers: Array = full_numbers.split("-")
		if !world_numbers[0]:
			set_empty()
			return
		
		pipe_save.is_empty = false
		if world_numbers.size() < 2: world_numbers.append("0")
		full_numbers = world_numbers[1]
		
		text = text_template % full_numbers.replace("-", " - ")
	else:
		set_empty()
