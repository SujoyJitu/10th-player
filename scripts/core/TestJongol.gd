extends Node2D


func _ready():
	DialogueManager.play([
		{'who':'abir','mood':'calm','text':'Bhai, eta ki shotti-i thik jaygay eshechhi?'},
		{'who':'sujoy','mood':'calm','text':'Chinta koro na, shobai ek shathe achhi.'},
		{'who':'abir','mood':'terrified','text':'Oi dekho... gachh e juta jhulche!'},
	])
