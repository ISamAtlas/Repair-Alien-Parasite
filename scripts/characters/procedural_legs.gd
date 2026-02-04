extends Node2D

@export var target: Marker2D
@export var distance_threshold:int = 23

func _physics_process(delta: float) -> void:
	target.global_position.y = global_position.y
	var direction := Input.get_axis("left", "right")
	target.global_position.x += direction * -100 * delta
	if abs(global_position.x - target.global_position.x) > distance_threshold:
		target.global_position.x = global_position.x
