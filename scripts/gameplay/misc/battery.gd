extends Sprite2D

var type:Global.area_type = Global.area_type.battery

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.connect("battery_placed",_on_battery_placed)

func _on_battery_placed() -> void:
	frame = 1
