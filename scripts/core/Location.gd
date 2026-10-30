extends Node2D
class_name Location


func _ready():
	for h in get_tree().get_nodes_in_group('hotspot'):
		h.activated.connect(on_hotspot)
	await get_tree().process_frame
	start()


func start():
	pass


func on_hotspot(_id):
	pass


func say(lines):
	DialogueManager.play(lines)
	await DialogueManager.finished
