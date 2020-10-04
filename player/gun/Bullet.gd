extends KinematicBody2D

onready var EXPLOSION_SCENE = preload("res://player/gun/Explosion.tscn")

var BULLET_SPEED = 50
var BULLET_LIFE_TIME = 10

var alive_for_seconds = 0

var direction = Vector2.ZERO

func set_dir(dir):
	direction = dir

func _process(delta):
	alive_for_seconds += delta
	if alive_for_seconds >= BULLET_LIFE_TIME:
		queue_free()

func _physics_process(delta):
	var motion = direction * BULLET_SPEED
	var collider = move_and_collide(motion * delta)
	
	collision(collider)

func collision(collider: KinematicCollision2D):
	if not collider:
		return
	
	collider.collider.take_damage()
	spawn_explosion()
	queue_free()

func spawn_explosion():
	var explosion = EXPLOSION_SCENE.instance()
	find_parent("World").add_child(explosion)
	explosion.position = get_global_transform().get_origin()
