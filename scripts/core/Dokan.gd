extends Location

var choice_done := false


func start():
	await say([
		{'who':'avi','mood':'calm','text':'Eto raate pothik? Kothay jabe?'},
		{'who':'sujoy','mood':'calm','text':'Shamner villa te. Bondhu ra ghurte eshechhi.'},
		{'who':'avi','mood':'calm','text':'Raat bere gele ferar rasta bondho hoye jay. Jodi fire jete chao, ekhoni jao.'},
		{'who':'arafat','mood':'calm','text':'Gari jabe na. Amra ekhane thakbo.'},
		{'who':'avi','mood':'uneasy','text':'Mone rekho: joto bhalo kore bhabo, tar cheye beshi lukano ache.'},
		{'who':'joy','mood':'calm','text':'Chacha, pani ache? Gola shukiye geche.'},
		{'who':'abir','mood':'calm','text':'Amar bottle ta thanda. Tui nibi?'},
	])
	print('ABOUT TO CHOOSE')
	var c = await DialogueManager.choose([
		'A: Pani nao, shobai ke dao',
		'B: Pani nao, kintu nije khabo na',
		'C: Pani na, matchbox ar torch battery chao',
	])
	match c:
		0:
			GameState.set_flag('tahamid_drugged')
			await say([
				{'who':'sujoy','mood':'calm','text':'Nao shobai, ek ek ta bottle.'},
			])
		1:
			GameState.set_flag('sujoy_careful')
			await say([
				{'who':'sujoy','mood':'uneasy','text':'Ami pore khabo. Ekhon lagbe na.'},
			])
		2:
			GameState.add_item('matchbox')
			GameState.battery += 2
			await say([
				{'who':'avi','mood':'uneasy','text':'Eta nao. Alo nibhe gele ar kono sathi thake na.'},
			])
	GameState.add_fear(1)
	await say([
		{'who':'bishal','mood':'calm','text':'Keu ache ki?'},
		{'who':'sujoy','mood':'uneasy','text':'Ei lok ta amader sathe chhilo na.'},
	])
	choice_done = true


func on_hotspot(id):
	if not choice_done:
		return
	match id:
		'avi':
			say([
				{'who':'avi','mood':'uneasy','text':'Gachh e juta gune ashbe. Ekta jora kom.'},
			])
		'gate':
			await say([
				{'who':'sujoy','mood':'calm','text':'Chol, villa dike jai.'},
			])
			var p = 'res://scenes/locations/Gate.tscn'
			if ResourceLoader.exists(p):
				SceneRouter.go(p)
