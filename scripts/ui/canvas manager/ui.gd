extends Node2D

@onready var anim: AnimationPlayer = $anim
@onready var bar: ProgressBar = $ProgressBar

var increase_temp :bool = false
var bar_speed_increment: int = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.connect("reset", _on_reset)
	SignalManager.connect("battery_placed", _on_battery_placed)

func _on_battery_placed() -> void:
	anim.play("progress_bar_init")

func _on_reset() -> void:
	increase_temp = false

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "progress_bar_init":
		increase_temp = true

func _physics_process(delta: float) -> void:
	if increase_temp == true:
		bar.value += 5* delta


func _on_progress_bar_value_changed(value: float) -> void:
	if value == 100:
		SignalManager.emit_signal("heat_bar_full")
