extends Area2D

var speed: int = 10
var destination: Vector2 = position
var selected: bool = false
var color: String = "RED"
var player_name: String = "TEST_PLAYER"

func get_distance(a: Vector2, b: Vector2):
	return sqrt((a.x - b.x)**2 + (a.y - b.y)**2)

# Toggle "selected" status
func toggle_selected():
	if selected == false:
		selected = true
		modulate = Color(1.5, 1.5, 1.5)
	else:
		selected = false
		modulate = Color(1, 1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player_name:
		get_node("PlayerName").text = player_name
	destination = position
	pass # Replace with function body.


func _input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		print("clicked!")
		toggle_selected()
		print(selected)
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		destination = get_global_mouse_position()
	if get_distance(position, destination) > 5:
		var path: Vector2
		path.x = destination.x - position.x
		path.y = destination.y - position.y

		position.x += path.x * speed * delta
		position.y += path.y * speed * delta
