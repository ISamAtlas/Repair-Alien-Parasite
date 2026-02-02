extends Node2D

@onready var level_list := get_tree().get_nodes_in_group("level")
# Called when the node enters the scene tree for the first time.
func _ready() -> void: #make sure to keep levels ordered in the tree heirarchy
	var auto_level_assigner := 1
	for level in level_list:
		var level_numb:int
		if !level.auto_assign_number: #if auto level assigner is off find its preferred number
			level_numb = level.number
		else: #automatically assign level number
			level_numb = auto_level_assigner
			auto_level_assigner += 1
		if Global.levels_unlocked >= level_numb: #if the level is LESS THAN OR EQUAL to the current level being tested, then call on the level to allow interaction
			level.unlock(level_numb)
