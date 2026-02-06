extends Button

@export var target_scene_path:String ##right click the target scene and press 'copy path'
@export var auto_assign_number:bool=true
@export var number:int #not added support for directly setting number yet

func _ready() -> void:
	pass

func unlock(given_number) -> void:
	print("unlocked level ", given_number)
	number = given_number
	connect("pressed", _on_pressed) #now it does something if you click

func _on_pressed() -> void:
	print("sending player to level ", number)
	get_tree().change_scene_to_file(target_scene_path)
	SignalManager.emit_signal("fade", true)
