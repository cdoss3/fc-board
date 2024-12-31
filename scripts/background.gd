extends Area2D

## PACKED SCENES FOR INSTANTIATION
@export var disk_scene: PackedScene
@export var menu_scene: PackedScene

## EVERY FRAME
func _process(_delta: float):
	# Input to instantiate new red disk
	if Input.is_action_just_pressed("place_red_disk"):
		var disk_instance = disk_scene.instantiate()
		disk_instance.position = get_local_mouse_position()
		disk_instance.color = "RED"
		add_child(disk_instance)
		get_viewport().set_input_as_handled()
	
	# Input to instantiate new blue disk
	if Input.is_action_just_pressed("place_blue_disk"):
		var disk_instance = disk_scene.instantiate()
		disk_instance.position = get_local_mouse_position()
		disk_instance.color = "BLUE"
		add_child(disk_instance)
		get_viewport().set_input_as_handled()
