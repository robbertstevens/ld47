extends Node2D


onready var ENEMY_SCENE = preload("res://Enemy.tscn")

const SPAWN_RATE = 1

var last_spawn = 0;

func _process(delta):
	last_spawn -= delta
	
	if last_spawn <= 0:
		spawn_enemy()	
		last_spawn = SPAWN_RATE
		
func spawn_enemy(): 
	var enemey = ENEMY_SCENE.instance()
	get_parent().add_child(enemey)
	enemey.position = get_random_pos_around(get_global_transform().get_origin())

func get_random_pos_around(pos):
	var offset_x = rand_range(-15, 15)
	var offset_y = rand_range(-15, 15)
	
	return Vector2(pos.x + offset_x, pos.y + offset_y)
