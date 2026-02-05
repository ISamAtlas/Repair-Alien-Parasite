extends CenterContainer

@onready var pause_menu: PanelContainer = $"Pause Menu"
@onready var options: Panel = $Options

func pause() -> void:
	visible = true
	pause_menu.set_visible(true)
	get_tree().set_pause(true)

func resume() -> void:
	visible = false
	pause_menu.set_visible(false)
	options.set_visible(false)
	get_tree().set_pause(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape") and !get_tree().is_paused():
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().is_paused():
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_options_pressed() -> void:
	pause_menu.set_visible(false)
	options.set_visible(true)
