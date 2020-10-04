extends Node2D

func _process(delta):
	if not $AnimationPlayer.is_playing():
		queue_free()
	
