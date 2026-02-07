extends CharacterBody2D

enum tools{hammer,wire_cutter}

const hammer: PackedScene = preload("uid://bj58b4m807sxf")

@export var tool:tools
@onready var walk_index:int= 1
@onready var legs :Node2D = $body/legs

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var can_place_battery : bool = false
var can_leave : bool = false

func _ready() -> void:
	$BodyShading.frame=0
	$EmptyBody.frame=0
	$ParasiteBody.frame=0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("s"):
		if !Global.is_battery_placed && can_place_battery:
			SignalManager.emit_signal("battery_placed")
		elif can_leave:
			Global.leave()
	
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
		var flipBool = Global.intToBool(direction)
		flipSprites(flipBool)
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func flipSprites(value:bool) -> void:
	if value != $"body/legs/left leg/shin".flip_h:	
		
		var leg_nodes : Array = legs.get_children()
		legs.move_child(leg_nodes[1],0)
		$ParasiteBody.flip_h = value
		$"body/legs/left leg/shin".flip_h = value
		$"body/legs/left leg/thigh".flip_h = value
		$"body/legs/left leg/foot".flip_h = value
		$"body/legs/right leg/shin".flip_h = value
		$"body/legs/right leg/thigh".flip_h = value
		$"body/legs/right leg/foot".flip_h = value
		$EmptyBody.flip_h = value
		$BodyShading.flip_h = value
	
func _on_walk_cycle_timeout() -> void:
	if !Global.jumped:
		walk_index *= -1
		SignalManager.emit_signal("step", walk_index)


func _on_battery_place_area_entered(area: Area2D) -> void:
	if get_type(area) == Global.area_type.door:
		can_leave = true
	if get_type(area) == Global.area_type.battery:
		can_place_battery = true

func _on_battery_place_area_exited(area: Area2D) -> void:
	if get_type(area) == Global.area_type.door:
		can_leave = false
	if get_type(area) == Global.area_type.battery:
		can_place_battery = false

func get_type(area: Area2D):
	return area.get_parent().type
