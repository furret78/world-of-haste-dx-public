extends MenuSelection

var selection_index: int
var toggle_sound = preload("res://engine/scenes/main_menu/sounds/change.wav")

@onready var musicroomhandler: Node = $MusicRoomHandler
@onready var value: Label = $TrackSelected/CurrentTrack
@onready var arrow_l: Label = $TrackSelected/CurrentTrack/arrow
@onready var arrow_r: Label = $TrackSelected/ArrowRight/arrow
@export var show_tip_bool: bool = true

func _ready():
	_update_string.call_deferred()

func _handle_select(mouse_input: bool = false) -> void:
	#super(mouse_input)
	if !focused || !get_parent().focused: return
	var old_track = musicroomhandler.current_track
	
	selection_index = wrapi(selection_index + 1, 0, musicroomhandler.size())
	musicroomhandler.current_track = selection_index
	_toggled_option(old_track, musicroomhandler.current_track)


func _physics_process(delta: float) -> void:
	super(delta)
	
	arrow_r.visible = focused
	arrow_l.visible = focused
	
	if !get_parent().focused: return
	
	if !focused: return
	
	if !musicroomhandler: return
	var old_track = musicroomhandler.current_track
	
	if Input.is_action_just_pressed("ui_right"):
		selection_index = wrapi(selection_index + 1, 0, musicroomhandler.size())
		musicroomhandler.current_track = selection_index
		_toggled_option(old_track, musicroomhandler.current_track)
	elif Input.is_action_just_pressed("ui_left"):
		selection_index = wrapi(selection_index - 1, 0, musicroomhandler.size())
		musicroomhandler.current_track = selection_index
		_toggled_option(old_track, musicroomhandler.current_track)
	elif Input.is_action_just_pressed(&"ui_select"):
		musicroomhandler.change_track_played()


func _toggled_option(old_val, new_val) -> void:
	if old_val == new_val: return
	Audio.play_1d_sound(toggle_sound, true, { "ignore_pause": true, "bus": "1D Sound" })
	#SettingsManager._process_settings()
	musicroomhandler.change_track_details()
	_update_string()

func _update_string() -> void:
	value.text = "Track No. " + str(musicroomhandler.current_track + 1)
	#value.text = str(musicroomhandler.track_list[musicroomhandler.current_track]["details"][1])
	#var findings := clampi(int(character_list.find(SettingsManager.settings.character)), 0, 99)
	#selection_index = findings
	#if selection_index >= character_list.size():
	#	selection_index = 0

func _handle_focused(focused: bool) -> void:
	super(focused)
