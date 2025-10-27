extends AnimatedSprite2D

signal lightning_emitted

@export_category("Lightning")
@export var lightning_enabled: bool = true
@export_range(0, 20, 0.001, "suffix:s") var lightning_interval_base: float = 3
@export_range(0, 10, 0.001, "suffix:s") var lightning_interval_extra: float = 2
@export_range(0, 1, 0.001, "suffix:s") var lightning_appearing_duration_base: float = 0.1
@export_range(0, 1, 0.001, "suffix:s") var lightning_appearing_duration_extra: float = 0.3
@export_group("Sound", "sound_")
@export var sound_thunder:= preload("res://stages/world_1/gfx/lightning/thunder.wav")

var _stop: bool

func _ready() -> void:
	visible = false
	lightning()

func lightning() -> void:
	await get_tree().create_timer(lightning_interval_base + randf_range(0, lightning_interval_extra), false).timeout
	
	if lightning_enabled:
		if _stop:
			_stop = false
			return
		
		position.x = get_centerX_cam() + randf_range(-160.0, 160)
		
		Audio.play_1d_sound(sound_thunder, false, {pitch = randf_range(0.75, 1.25)})
		visible = true
		modulate.a = 1
		
		scale = Vector2.ONE * randf_range(0.8, 1.3)
		lightning_emitted.emit()
		
		var tw: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		tw.tween_property(self, ^"modulate:a", 0.0, 0.5)
		await tw.finished
		visible = false
	
	lightning()

func get_centerX_cam() -> float:
	var cam := Thunder._current_camera
	if !cam: return 0
	return Thunder._current_camera.get_screen_center_position().x
