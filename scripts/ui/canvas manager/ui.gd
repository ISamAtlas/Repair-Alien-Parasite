extends Node2D

@onready var anim: AnimationPlayer = $anim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.connect("battery_placed", _on_battery_placed)

func _on_battery_placed() -> void:
	anim.play("progress_bar_init")
