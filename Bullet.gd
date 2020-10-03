extends KinematicBody2D

var BULLET_SPEED = 50
var BULLET_LIFE_TIME = 10

var alive_for_seconds = 0

var direction = Vector2.ZERO
var velocity = Vector2()

func set_dir(dir):
	direction = dir

func _process(delta):
	alive_for_seconds += delta
	if alive_for_seconds >= BULLET_LIFE_TIME:
		queue_free()

func _physics_process(delta):
	var motion = direction * BULLET_SPEED
	velocity = move_and_collide(motion * delta)
