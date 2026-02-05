extends Node2D
@onready var sprite: Sprite2D = $Hammer
@onready var collision: CollisionShape2D = $"../HammerHead"
@onready var pressing_dur:float=0.5:
	set(value):
		value = clamp(value, 0,9)
		pressing_dur=value

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var player_dir: int = Input.get_axis("left","right")
	var direction: int = Input.get_axis("tool_left", "tool_right")
	if direction != 0:
		pressing_dur += 0.07
	else:
		pressing_dur = 0.5
	
	if direction:
		rotate(pressing_dur*direction*delta) #** means power
		collision.rotation_degrees = rotation_degrees
		collision.global_position = sprite.global_position
	if player_dir:
		sprite.flip_h = !Global.intToBool(player_dir)
