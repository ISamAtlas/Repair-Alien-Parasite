extends Node2D

@onready var battery_insertion: Node2D = $"tutorial labels/battery insertion"
@onready var heat_warning: Node2D = $"tutorial labels/heat warning"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.is_battery_placed = false
	SignalManager.connect("battery_placed",_on_battery_placed)

func _on_battery_placed() -> void:
	battery_insertion.visible = false
	heat_warning.visible = true
	AudioManager.battery.play()
