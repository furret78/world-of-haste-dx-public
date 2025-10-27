extends "res://stages/main_menu/scripts/label_space_key.gd"

@onready var musicroomselector: Node = Scenes.current_scene.get_node("MusicRoom/SubViewportContainer/SubViewport/MusicRoom/Selector")

func _physics_process(delta: float) -> void:
	super(delta)
	if musicroomselector:
		if musicroomselector._current_item_node.show_tip_bool and !visible:
			visible = true
		elif !musicroomselector._current_item_node.show_tip_bool and visible:
			visible = false
	return
