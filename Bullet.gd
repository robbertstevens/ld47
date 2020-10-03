extends Area2D

var SPEED = 50
var BULLET_LIFE_TIME = 10

var alive_for_seconds = 0

var direction = Vector2.ZERO

func set_dir(dir):
	direction = dir

func _process(delta):
	alive_for_seconds += delta
	
	var motion = direction * SPEED
	
	position += motion * delta

	if alive_for_seconds >= BULLET_LIFE_TIME:
		queue_free()
