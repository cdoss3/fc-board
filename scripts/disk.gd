extends Area2D

## VARIABLES
# Translation
var speed: int = 6
var destination: Vector2 = position
# Boolean
var selected: bool = false
# Traits
@export var color: String
var player_name: String
# Load textures
const red_sprite: Texture2D = preload('res://graphics/red_dot.svg')
const blue_sprite: Texture2D = preload("res://graphics/blue_dot.png")
const yellow_sprite: Texture2D = preload("res://graphics/yellow_dot.png")

## USER-DEFINED FUNCTIONS
# Measure linear distance between two points
func get_distance(a: Vector2, b: Vector2):
	return sqrt((a.x - b.x)**2 + (a.y - b.y)**2)

# Change sprite assigned to Sprite2D child node
func change_sprite(sprite_path: Texture2D):
	$Sprite2D.texture = sprite_path


# Toggle "selected" status
func toggle_selected():
	if selected == false and get_tree().get_nodes_in_group("disk_selected").is_empty():
		selected = true
		self.add_to_group("disk_selected")
		modulate = Color(2, 2, 2)
	else:
		selected = false
		self.remove_from_group("disk_selected")
		modulate = Color(1, 1, 1)

## READY
func _ready() -> void:
	# Make sure the disk doesn't default coordinates to origin
	destination = position
	
	## Change sprite based on disk color var
	# Red disk
	if color == "RED":
		change_sprite(red_sprite)
	# Blue disk
	elif color == "BLUE":
		change_sprite(blue_sprite)
	# Yellow disk
	elif color == "YELLOW":
		change_sprite(yellow_sprite)

## HANDLE INPUTS
func _input_event(_viewport, event, _shape_idx):
	# Select disk with left click
	if event.is_action_released("left_click"):
		toggle_selected()
	# Open name-change LineEdit on input
	if event.is_action_released("open_menu"):
		$LineEdit.show()
		$LineEdit.grab_focus()


## EVERY FRAME
func _process(delta: float) -> void:
	## Move selected disk
	if selected and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		destination = get_global_mouse_position()
		toggle_selected()

	if position != destination:
		var path: Vector2
		
		path.x = destination.x - position.x
		path.y = destination.y - position.y

		position.x += path.x * speed * delta
		position.y += path.y * speed * delta

	# Update player name assigned to disk in case of changes
	if player_name:
		$PlayerName.text = player_name

## SIGNAL CATCHING
# Change name
func _on_line_edit_text_submitted(new_text: String) -> void:
	player_name = new_text
