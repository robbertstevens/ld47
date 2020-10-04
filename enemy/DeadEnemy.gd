extends Node2D

const DESPAWN_TIME = 3

var in_scene_time = 0

func _process(delta):
	in_scene_time += delta
	
	if in_scene_time > DESPAWN_TIME:
		queue_free()
