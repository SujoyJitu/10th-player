extends Node

signal fear_changed(v)
signal chhaya_changed(v)
signal friend_died(who)

var fear := 0
var chhaya := 0
var battery := 3
var matches := 5
var chapter := 1
var items := []
var flags := {}
var alive := {'abir':true,'arafat':true,'bishal':true,'joy':true,'mong':true,'pritam':true,'tahamid':true,'waafe':true}


func add_fear(n):
	fear = clamp(fear + n, 0, 5)
	fear_changed.emit(fear)


func add_chhaya(n, victim := ''):
	chhaya = clamp(chhaya + n, 0, 5)
	chhaya_changed.emit(chhaya)
	if chhaya >= 5 and victim != '':
		kill(victim)
		chhaya = 3
		chhaya_changed.emit(chhaya)


func kill(who):
	if alive.get(who, false):
		alive[who] = false
		friend_died.emit(who)


func alive_count():
	return alive.values().count(true)


func sujoy_mood():
	if fear <= 1:
		return 'calm'
	if fear <= 3:
		return 'uneasy'
	return 'terrified'


func set_flag(k, v := true):
	flags[k] = v


func has_flag(k):
	return flags.get(k, false)


func add_item(i):
	if not items.has(i):
		items.append(i)


func has_item(i):
	return items.has(i)
