extends Node

signal change_track_UI
signal play_new_track

@export var track_list: Array = []
@export var current_track: int = 0
var playing_track: int = 0

func _ready() -> void:
	current_track = 0

func size() -> int:
	return track_list.size()

func change_track_details() -> void:
	#change_track_UI.emit(track_list[current_track]["details"])
	pass

func change_track_played() -> void:
	play_new_track.emit(track_list[current_track]["music"])
	change_track_UI.emit(track_list[current_track]["details"])
