extends Node

@onready var ambient: AudioStreamPlayer2D = $music/ambient
@onready var battery: AudioStreamPlayer2D = $SFX/battery
@onready var step: AudioStreamPlayer2D = $SFX/step


func volume_gauger(value: String) -> void:
	## remove later, just wanted to see the sound working for all the audio bus'
	ambient.set_bus(value) 
	ambient.play()
	match value:
		"SFX":
			pass
		"music":
			pass
		"Master":
			pass
