extends Node2D

@onready var battery_icon: Sprite2D = $"../BatteryIcon"

@onready var death_message: Label = $CenterContainer/death_message
@onready var anim_death: AnimationPlayer = $CenterContainer/anim

@onready var anim: AnimationPlayer = $anim
@onready var bar: ProgressBar = $ProgressBar
@onready var temp: Label = $temperature

var increase_temp :bool = false
var bar_speed_increment: int = 5
var init_temp:int= 15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.connect("reset", _on_reset)
	SignalManager.connect("battery_placed", _on_battery_placed)

func _on_battery_placed() -> void:
	battery_icon.visible = false
	anim.play("progress_bar_init")

func _on_reset() -> void:
	battery_icon.visible = true
	increase_temp = false

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "progress_bar_init":
		increase_temp = true

func _physics_process(delta: float) -> void:
	if increase_temp == true:
		bar.value += bar_speed_increment * delta
		var percentage:float = bar.value / 100
		var degrees:float = (percentage * (100-init_temp)) + init_temp ##100-init temp represents the difference from ambient temperature to 100, and adding it back accounts for the ambient temperature (thus making the bar end at 100 via percentages, despite starting at the given temperature
		var display:String = str(round_to_dec(degrees,1), "°C")
		if degrees <= 75: #solid number until it reaches 85, in which case it shows the decimal place rapidly scaling
			display = str(int(degrees), "°C")
		temp.text = display

func _on_progress_bar_value_changed(value: float) -> void:
	if value >= 100:
		SignalManager.emit_signal("reset")
		
		var new_display:String = str(int(init_temp), "°C")
		bar.value = 0
		temp.text = new_display
		print(new_display)
		print(temp.text)
		anim.play("RESET")
		anim_death.play("appear")

func round_to_dec(num, digit) -> float:
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
