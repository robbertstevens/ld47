extends PathFollow2D


var current_speed = 0;


func _process(delta):
	if Input.is_action_pressed("ui_up"): 
		current_speed += delta
		current_speed = min(current_speed, 0.55)
	elif	 Input.is_action_pressed("ui_down"):
		current_speed -= delta
		current_speed = max(current_speed, -0.55)
	
	offset += current_speed

