extends LineEdit


func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	
	if Input.is_key_pressed(KEY_ENTER) or Input.is_action_pressed("back_key"):
		#text_submitted.emit()
		hide()
		clear()
