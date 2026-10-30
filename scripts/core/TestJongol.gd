extends Node2D


func _ready():
	for h in get_tree().get_nodes_in_group('hotspot'):
		h.activated.connect(_on_hotspot)
	DialogueManager.play([
		{'who':'abir','mood':'calm','text':'Bhai, eta ki shotti-i thik jaygay eshechhi?'},
		{'who':'sujoy','mood':'calm','text':'Chinta koro na. Chol, ektu ghure dekhi.'},
	])


func _on_hotspot(id):
	match id:
		'shoes':
			DialogueManager.play([
				{'who':'pritam','mood':'calm','text':'12 jora. Aro ekta ekla juta.'},
				{'who':'waafe','mood':'uneasy','text':'Eta prank noy. Juta gulo purono.'},
			])
		'gate':
			DialogueManager.play([
				{'who':'mong','mood':'calm','text':'Gate bondho. Code lagbe.'},
			])
