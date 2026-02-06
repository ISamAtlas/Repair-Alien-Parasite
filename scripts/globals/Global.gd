extends Node

var levels_unlocked :int= 1
#player
var jumped: bool = true:
	set(value):
		jumped = value
		SignalManager.emit_signal("jumped")

func intToBool(number:int) -> bool:
	var value: bool = true
	if number == -1:
		value = false
	return value

var is_battery_placed :bool= false ##set to false at the start of every level
