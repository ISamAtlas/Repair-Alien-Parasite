extends Marker2D

@export var target: Marker2D
@export var distance_threshold:int = 26
@export var range:int=100 
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
	if !Global.jumped && move: 
		var direction := Input.get_axis("left","right")
		if direction!= 0:
			target.global_position.x += direction *-1 * range * delta
			target.global_position.y += -50*delta
			if abs(global_position.x - target.global_position.x) > distance_threshold:
				target.global_position = global_position
func _on_jumped() -> void:
	target.global_position.y = global_position.y-20
