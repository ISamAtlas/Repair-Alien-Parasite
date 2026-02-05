extends Node2D
@onready var sprite: Sprite2D = $Hammer
@onready var collision: CollisionShape2D = $"../HammerHead"

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var player_dir: int = Input.get_axis("left","right")
	var direction: int = Input.get_axis("tool_left", "tool_right")
	
	if direction:
		print("yerd")
		rotate(2.5*direction*delta)
		collision.rotation_degrees = rotation_degrees
		collision.global_position = sprite.global_position
	if player_dir:
		sprite.flip_h = !Global.intToBool(player_dir)
