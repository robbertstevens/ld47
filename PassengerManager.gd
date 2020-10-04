extends Node2D

const PASSENGER_SCENE=  preload("res://passenger/Passenger.tscn")

var next_spawn_in = rand_range(10, 40)


func _process(delta):
	next_spawn_in -= delta
	
	if next_spawn_in <= 0:
		var passenger = PASSENGER_SCENE.instance()
		find_parent("World").add_child(passenger)
		passenger.position = get_global_transform().get_origin()
		
		next_spawn_in = rand_range(10, 40)
