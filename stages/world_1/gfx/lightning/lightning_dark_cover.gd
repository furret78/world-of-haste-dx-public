extends DirectionalLight2D

@export_range(0, 20, 0.001, "suffix:lux") var lightning_energy = 0.6

@onready var initial_energy: float = energy

func _on_lightning_mario_lightning_emitted() -> void:
	var tw: Tween = create_tween().set_trans(Tween.TRANS_SINE)
	for i in 5:
		tw.tween_property(self, ^"energy", initial_energy, 0.06)
		tw.tween_property(self, ^"energy", lightning_energy, 0.06)
	tw.tween_property(self, ^"energy", initial_energy, 1.5)
	pass
