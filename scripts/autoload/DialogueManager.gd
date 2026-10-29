extends CanvasLayer

signal finished

var lines := []
var idx := 0
var typing_tween: Tween

@onready var box = $Box
@onready var portrait = $Box/Portrait
@onready var name_label = $Box/Name
@onready var text_label = $Box/Text


func _ready():
	box.hide()


func play(data: Array):
	lines = data
	idx = 0
	box.show()
	_show_line()


func _show_line():
	if idx >= lines.size():
		box.hide()
		finished.emit()
		return
	var l = lines[idx]
	var who = l.get('who', '')
	var mood = l.get('mood', 'calm')
	if who == 'sujoy':
		mood = GameState.sujoy_mood()
	name_label.text = who.capitalize()
	var path = 'res://assets/portraits/%s_%s.jpg' % [who, mood]
	if ResourceLoader.exists(path):
		portrait.texture = load(path)
	text_label.text = l.get('text', '')
	text_label.visible_ratio = 0.0
	if typing_tween:
		typing_tween.kill()
	typing_tween = create_tween()
	typing_tween.tween_property(text_label, 'visible_ratio', 1.0, 0.03 * text_label.text.length())


func _input(e):
	if not box.visible:
		return
	if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT:
		get_viewport().set_input_as_handled()
		if text_label.visible_ratio < 1.0:
			typing_tween.kill()
			text_label.visible_ratio = 1.0
		else:
			idx += 1
			_show_line()
