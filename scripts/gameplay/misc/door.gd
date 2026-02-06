extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.connect("battery_placed", _on_battery_placed)


func _on_battery_placed() -> void:
	print("yellow")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(_area: Area2D) -> void:
	print("hello")
