extends YSort

func _process(delta):
	if get_tree().paused:
		if Input.is_action_just_pressed("ui_restart"):
			get_tree().reload_current_scene()
