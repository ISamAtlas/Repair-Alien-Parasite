extends Button

@export var target_scene_path:String ##right click the target scene and press 'copy path'
@export var should_pause := false

var is_paused := false

func _ready() -> void:
	pressed.connect(_on_pressed) ## Automatically connects button to signal

func _on_pressed() -> void:
	get_tree().change_scene_to_file(target_scene_path)
	
	if should_pause != is_paused:
		get_tree().paused = should_pause
		is_paused = should_pause
