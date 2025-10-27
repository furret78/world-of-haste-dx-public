extends MenuSelection

@export_enum("Author:0", "Title:1", "Comments:2") var detail_type: int
@export var show_tip_bool: bool = false

var actual_value: Label

func _ready() -> void:
	actual_value = get_child(0)

func _on_music_room_handler_change_track_ui(detail_table: PackedStringArray) -> void:
	if detail_type == 0 and actual_value:
		actual_value.text = detail_table[0]
		return
	if detail_type == 1 and actual_value:
		actual_value.text = detail_table[1]
		return
	if detail_type == 2 and actual_value:
		actual_value.text = detail_table[2]
		return
