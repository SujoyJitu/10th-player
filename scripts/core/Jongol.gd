extends Location


func start():
	await say([
		{'who':'abir','mood':'calm','text':'Bhai, eta ki shotti-i thik jaygay eshechhi?'},
		{'who':'sujoy','mood':'calm','text':'Chinta koro na. Chol, ektu ghure dekhi.'},
	])


func on_hotspot(id):
	match id:
		'shoes':
			say([
				{'who':'pritam','mood':'calm','text':'12 jora. Aro ekta ekla juta.'},
				{'who':'waafe','mood':'uneasy','text':'Eta prank noy. Juta gulo purono.'},
			])
		'gate':
			say([
				{'who':'mong','mood':'calm','text':'Gate bondho. Code lagbe.'},
			])
