extends Node

var levels_unlocked := 1

#player
var jumped = true:
	set(value):
		jumped = value
		SignalManager.emit_signal("jumped")
