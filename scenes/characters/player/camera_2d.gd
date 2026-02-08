extends Camera2D
@onready var cameraShakeNoise = FastNoiseLite.new()

func _ready() -> void:
	SignalManager.connect("battery_placed", _on_battery_placed)

func _on_battery_placed() -> void:
	shake(10,1)

func shake(IntensityMultiplier := 5.0, duration := 0.5, x_offset_least := -1, y_offset_least := -1, x_offset_most := x_offset_least*-1, y_offset_most := y_offset_least*-1):
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(ApplyValues.bind(IntensityMultiplier, x_offset_least, x_offset_most, y_offset_least, y_offset_most), 0.5, 1.0, duration)
	camera_tween.connect("finished", _tweenCompleted)

func ApplyValues(intensity, IntensityMultiplier:float, x_offset_least:int, y_offset_least:int, x_offset_most:int, y_offset_most:int):
	var cameraOffset = cameraShakeNoise.get_noise_1d(Time.get_ticks_msec()) * (intensity * IntensityMultiplier)
	self.offset = Vector2(cameraOffset*randi_range(x_offset_least,x_offset_most),cameraOffset*randi_range(y_offset_least,y_offset_most))
	
func _tweenCompleted():
	self.offset = Vector2(0,0)
