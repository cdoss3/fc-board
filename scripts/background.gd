extends Area2D

@export var disk_scene: PackedScene

func _process(_delta: float):
	if Input.is_action_just_pressed("right_click"):
		var instance = disk_scene.instantiate()
		instance.position = get_local_mouse_position()
		add_child(instance)
		get_viewport().set_input_as_handled()
		print("right clicked!")
