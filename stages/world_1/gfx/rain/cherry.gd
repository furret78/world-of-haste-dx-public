extends GPUParticles2D

var _prev_is_player_in_rect: bool = false
var _is_player_in_rect: bool = false
var _tweening: bool = false

@onready var particles: int = amount

func _ready() -> void:
	SettingsManager.settings_updated.connect(_update_visibility, CONNECT_DEFERRED)
	_update_visibility.call_deferred()

func _update_visibility() -> void:
	match SettingsManager.QUALITY:
		SettingsManager.QUALITY.MIN:
			amount = mini(50, ceili(particles * 0.5))
		
		SettingsManager.QUALITY.MID:
			amount = mini(200, ceili(particles * 0.8))
		
		SettingsManager.QUALITY.MAX:
			amount = particles
