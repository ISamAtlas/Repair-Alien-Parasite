extends Marker2D

@onready var target: Marker2D = $"../../target"

func _physics_process(delta: float) -> void:
	
	var distance:float = (global_position.x - target.global_position.x)
	print(distance)
