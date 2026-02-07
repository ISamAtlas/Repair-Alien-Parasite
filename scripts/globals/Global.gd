extends Node

enum area_type{door,battery} 

var levels_unlocked :int= 1

var levels:Dictionary = {"1":"res://scenes/gameplay/levels/level 1.tscn", "2":"res://scenes/gameplay/levels/level 2.tscn"}

var current_level:Dictionary = {"number": 1, "path": "res://scenes/gameplay/levels/level 1.tscn"}:
	set(value):
		current_level = value
		print(value)
		#{"number": ..., "path": ...}
#player
var jumped: bool = true:
	set(value):
		jumped = value
		SignalManager.emit_signal("jumped")

var is_battery_placed :bool= false ##set to false at the start of every level

func _ready() -> void:
	SignalManager.connect("reset",reset)

func reset() -> void:
	jumped = true
	get_tree().change_scene_to_file(current_level.path)
	SignalManager.emit_signal("fade", true)

func intToBool(number:int) -> bool:
	var value: bool = true
	if number == -1:
		value = false
	return value
