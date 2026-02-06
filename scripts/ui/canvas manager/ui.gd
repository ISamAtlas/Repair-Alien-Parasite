extends Node2D

@onready var anim: AnimationPlayer = $anim
@onready var bar: ProgressBar = $ProgressBar
@onready var temp: Label = $temperature

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
		bar.value += bar_speed_increment * delta
		var percentage:float = bar.value / 100
		var degrees:float = (percentage * 85) + 15 ##85 represents the difference from 15 to 100, and adding 15 accounts for the ambient temperature (thus making the bar end at 100 via percentages, despite starting at 15
		var display:String = str(round_to_dec(degrees,1), "°C")
		if degrees <= 75: #solid number until it reaches 85, in which case it shows the decimal place rapidly scaling
			display = str(int(degrees), "°C")
		temp.text = display

func _on_progress_bar_value_changed(value: float) -> void:
	if value == 100:
		SignalManager.emit_signal("reset")

func round_to_dec(num, digit) -> float:
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
