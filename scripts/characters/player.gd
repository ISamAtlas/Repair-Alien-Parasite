extends CharacterBody2D

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var legs: Node2D = $legs
@onready var walk_index:int= 1

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if !is_on_floor():
		Global.jumped = true
		velocity += get_gravity() * delta

	# Handle jump.
	if is_on_floor():
		if Global.jumped:
			Global.jumped = false 
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_walk_cycle_timeout() -> void:
	if !Global.jumped:
		walk_index *= -1
		SignalManager.emit_signal("step", walk_index)
