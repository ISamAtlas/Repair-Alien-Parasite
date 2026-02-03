extends Node2D

@export var target: Marker2D
@export var distance_threshold:int = 20

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	target.global_position.x += direction * 100 * delta
	print(abs(global_position.x - target.global_position.x))
	if abs(global_position.x - target.global_position.x) > distance_threshold:
		print("yep!")
		#target.global_position.x = lerp(target.global_position.x, global_position.x, delta)
		target.global_position.x = global_position.x
