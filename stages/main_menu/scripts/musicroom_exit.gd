extends MenuSelection

signal reset_music
signal reset_all

@export var show_tip_bool: bool = false

func _handle_select(mouse_input: bool = false) -> void:
	super(mouse_input)
	GlobalViewport.vp.get_camera_2d().position.y -= 960
	GlobalViewport.vp.get_camera_2d().position.x += 640
	GlobalViewport.vp.get_camera_2d().reset_physics_interpolation()
	await get_tree().physics_frame
	get_parent().move_selector(0)
	Scenes.current_scene.get_node("Menu/MainMenuControls").focused = true
	Scenes.current_scene.get_node("MusicRoom/SubViewportContainer/SubViewport/MusicRoom/MusicRoom").focused = false
	
	reset_music.emit()
	reset_all.emit()
