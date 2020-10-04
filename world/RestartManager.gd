extends Node2D

func _process(delta):
	if get_tree().paused:
		$CanvasLayer/Control.visible = true
		if Input.is_action_just_pressed("ui_restart"):
			get_tree().reload_current_scene()
			get_tree().paused = false
