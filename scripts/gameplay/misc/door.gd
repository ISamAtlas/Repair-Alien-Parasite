extends Node2D

@export var next_scene:String

@onready var area: Area2D = $Area2D
var type:Global.area_type = Global.area_type.door

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.connect("battery_placed", _on_battery_placed)

func _on_battery_placed() -> void:
	area.process_mode = Node.PROCESS_MODE_PAUSABLE
