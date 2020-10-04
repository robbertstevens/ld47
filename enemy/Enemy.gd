extends KinematicBody2D

onready var DEAD_ENEMY_SCENE = preload("res://enemy/DeadEnemy.tscn")

const SPEED = 10
const MAX_HEALTH = 50

var current_health = MAX_HEALTH
var last_time_damaged = 0
var invulnerability_period = 0.01

func _ready():
	$AnimationPlayer.play("walk")

func _process(delta):
	last_time_damaged -= delta

	if current_health <= 0:
		queue_free()
		var dead_enemy = DEAD_ENEMY_SCENE.instance()
		find_parent("World").add_child(dead_enemy)
		dead_enemy.position = get_global_transform().get_origin()

func _physics_process(delta):
	var direction = (find_target() - position).normalized()
	var motion = direction * SPEED
	
	var collider = move_and_collide(motion * delta)
	
func find_target():
	return get_tree().get_root().find_node("Player", true, false).get_global_transform().get_origin()
	

func take_damage(damage: int = 10):
	if last_time_damaged <= 0:
		$AnimationPlayer.play("hurt")
		current_health -= damage
		last_time_damaged = invulnerability_period
		
