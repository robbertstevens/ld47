extends Node2D

var SMOKE = preload("res://Smoke.tscn")
var smoke_frequency = .15
var last_smoke = smoke_frequency

func _process(delta):
	last_smoke -= delta
	
	if last_smoke <= 0:	
		var smoke = SMOKE.instance()
		find_parent("World").add_child(smoke)
		smoke.position = get_random_pos_around(get_global_transform().get_origin())
		
		last_smoke = smoke_frequency


func get_random_pos_around(pos):
	var offset_x = rand_range(-2, 2)
	var offset_y = rand_range(-2, 2)
	
	return Vector2(pos.x + offset_x, pos.y + offset_y)
