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

func leave(next_level:String) -> void:
	SignalManager.emit_signal("reset")
	reset(true)
	get_tree().change_scene_to_file(next_level)

func reset(next:bool) -> void:
	print("reset")
	jumped = true
	SignalManager.emit_signal("fade", true)
	if !next:
		get_tree().change_scene_to_file(current_level.path)

func intToBool(number:int) -> bool:
	var value: bool = true
	if number == -1:
		value = false
	return value
