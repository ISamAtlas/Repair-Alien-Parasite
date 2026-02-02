extends HSlider

@export var bus_name:String
var bus_index:int
var init := false ## stops sound from playing on menu open

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	
	##Basic Sound Configurations
	set_max(1.5)
	set_step(0.001)
	
	value = db_to_linear(
		AudioServer.get_bus_volume_db(bus_index)
	)
	init = true
	
func _on_value_changed(value_on_trigger:float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value_on_trigger))
	if init:
		print(AudioServer.get_bus_volume_db(bus_index))
		AudioManager.volume_gauger(bus_name) ##Goes to global AudioPlayer File I made,and based on the bus name it will play a test sound
