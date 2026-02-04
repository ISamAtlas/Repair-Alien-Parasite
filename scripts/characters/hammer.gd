extends Node2D
@onready var sprite: Sprite2D = $Hammer


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var player_dir: int = Input.get_axis("left","right")
	var direction: int = Input.get_axis("tool_left", "tool_right")
	
	if direction:
		rotate(2.5*direction*delta)
	if player_dir:
		sprite.flip_h = Global.intToBool(player_dir)
