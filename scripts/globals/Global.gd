extends Node

var levels_unlocked := 1

#player
var jumped = true:
	set(value):
		jumped = value
		SignalManager.emit_signal("jumped")

func intToBool(number:int) -> bool:
	var value: bool = true
	if number == -1:
		value = false
	return value
