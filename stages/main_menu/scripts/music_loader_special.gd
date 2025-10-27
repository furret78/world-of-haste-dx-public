extends "res://engine/objects/core/music_loader/music_loader.gd"

func _on_music_room_handler_play_new_track(new_track: Object) -> void:
	Audio.stop_all_musics()
	Audio.play_music(new_track, 0)

func _on_exit_menu_reset_music() -> void:
	Audio.stop_all_musics()
	Audio.play_music(music[0], 0)
