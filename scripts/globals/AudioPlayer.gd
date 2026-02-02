extends Node

@onready var test: AudioStreamPlayer2D = $SFX/AudioStreamPlayer2D

func volume_gauger(value: String) -> void:
	## remove later, just wanted to see the sound working for all the audio bus'
	test.set_bus(value) 
	test.play()
	match value:
		"SFX":
			pass
		"music":
			pass
		"Master":
			pass
