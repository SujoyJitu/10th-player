extends PointLight2D

var on := true
var drain := 0.0


func _process(delta):
	global_position = get_global_mouse_position()
	if on:
		drain += delta
		if drain >= 90.0:
			drain = 0.0
			GameState.battery -= 1
			if GameState.battery <= 0:
				on = false
				enabled = false


func _unhandled_input(e):
	if e.is_action_pressed('toggle_torch') and GameState.battery > 0:
		on = not on
		enabled = on
