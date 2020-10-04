extends KinematicBody2D

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

func _physics_process(delta):
	var direction = (find_target() - position).normalized()
	var motion = direction * SPEED
	
	var collider = move_and_collide(motion * delta)
	
func find_target():
	return Vector2(0, 0)
	

func take_damage(damage: int = 10):
	if last_time_damaged <= 0:
		$AnimationPlayer.play("hurt")
		current_health -= damage
		last_time_damaged = invulnerability_period
		
