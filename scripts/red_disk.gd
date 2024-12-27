extends CharacterBody2D

var speed: int = 10
var destination: Vector2 = position
var selected: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		destination = get_global_mouse_position()
	if position != destination:
		# This changes position instantly. I'd like for it to slide into place
		#position = destination
		
		# Attempt at adding sliding
		var path: Vector2
		path.x = destination.x - position.x
		path.y = destination.y - position.y
		
		position.x += path.x * speed * delta
		position.y += path.y * speed * delta
