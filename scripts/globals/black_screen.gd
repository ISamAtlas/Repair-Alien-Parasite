extends ColorRect
@onready var anim: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.connect("fade", _on_fade)

func _on_fade(fade_in:bool) -> void:
	if fade_in:
		anim.play("fade_in")
	else:
		anim.play_backwards("fade_in")
