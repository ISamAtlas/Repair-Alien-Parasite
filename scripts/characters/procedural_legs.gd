extends Node2D

@export var target: Marker2D
@export var distance_threshold:int = 26
@export var walk_index:int

var move:bool = false

func _ready() -> void:
	SignalManager.connect("jumped", _on_jumped)
	SignalManager.connect("step", _on_stepped)

func _on_stepped(index) -> void:
	if index == walk_index:
		move = true
	else:
		move = false

func _physics_process(delta: float) -> void:
	target.global_position.y = global_position.y
	var direction := Input.get_axis("left", "right")
	target.global_position.x += direction*-1 * 100 * delta
	if move:
		if !Global.jumped:
			if abs(global_position.x - target.global_position.x) > distance_threshold:
				target.global_position.x = global_position.x
func _on_jumped() -> void:
	target.global_position.y = global_position.y+-40
