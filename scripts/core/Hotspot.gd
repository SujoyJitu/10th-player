extends Area2D

signal activated(id)

@export var id := ''
@export var needs_item := ''


func _ready():
	add_to_group('hotspot')
	input_pickable = true
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if needs_item == '' or GameState.has_item(needs_item):
			activated.emit(id)
