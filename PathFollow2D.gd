extends PathFollow2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed = 0
	if Input.is_action_pressed("ui_right"): 
		speed = 1
	elif	 Input.is_action_pressed("ui_left"):
		speed = -1
		
	offset += speed
	

		

