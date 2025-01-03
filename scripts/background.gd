extends Area2D

## PACKED SCENES FOR INSTANTIATION
@export var disk_scene: PackedScene
@export var menu_scene: PackedScene

## EVERY FRAME
func _process(_delta: float):
	# Constant scaling for background
	# Input to instantiate new red disk
	if Input.is_action_just_pressed("place_red_disk"):
		var disk_instance = disk_scene.instantiate()
		disk_instance.add_to_group("red_disks")
		disk_instance.position = get_local_mouse_position()
		disk_instance.color = "RED"
		add_child(disk_instance)
		get_viewport().set_input_as_handled()
	
	# Input to instantiate new blue disk
	if Input.is_action_just_pressed("place_blue_disk"):
		var disk_instance = disk_scene.instantiate()
		disk_instance.add_to_group("blue_disks")
		disk_instance.position = get_local_mouse_position()
		disk_instance.color = "BLUE"
		add_child(disk_instance)
		get_viewport().set_input_as_handled()

## BUTTON SIGNALS
func _on_grow_disks_button_up() -> void:
	## Scale all disks up on button press
	var active_disks = get_children()
	for disk in active_disks:
		if disk is Area2D:
			disk.scale += Vector2(0.02, 0.02)


func _on_shrink_disks_button_up() -> void:
	## Scale all disks down on button press
	var active_disks = get_children()
	for disk in active_disks:
		if disk is Area2D:
			disk.scale -= Vector2(0.02, 0.02)
	pass # Replace with function body.
