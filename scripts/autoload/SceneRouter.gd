extends CanvasLayer

var rect: ColorRect
var busy := false


func _ready():
	layer = 100
	rect = ColorRect.new()
	rect.color = Color.BLACK
	rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rect.modulate.a = 0.0
	add_child(rect)


func go(path: String):
	if busy:
		return
	busy = true
	rect.mouse_filter = Control.MOUSE_FILTER_STOP
	var t = create_tween()
	t.tween_property(rect, 'modulate:a', 1.0, 0.6)
	await t.finished
	get_tree().change_scene_to_file(path)
	await get_tree().process_frame
	var t2 = create_tween()
	t2.tween_property(rect, 'modulate:a', 0.0, 0.6)
	await t2.finished
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	busy = false
