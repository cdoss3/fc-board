extends Area2D

## PACKED SCENES FOR INSTANTIATION
@export var disk_scene: PackedScene
@export var menu_scene: PackedScene

## EVERY FRAME
func _process(_delta: float):
	# Input to instantiate new player disk
	if Input.is_action_just_pressed("right_click") and not Input.is_action_just_pressed("open_menu"):
		var disk_instance = disk_scene.instantiate()
		disk_instance.position = get_local_mouse_position()
		add_child(disk_instance)
		get_viewport().set_input_as_handled()
