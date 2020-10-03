extends KinematicBody2D

const SPEED = 10

func _ready():
	$AnimationPlayer.play("walk")

func _physics_process(delta):
	var direction = (find_target() - position).normalized()
	var motion = direction * SPEED
	
	move_and_collide(motion * delta)
	
func find_target():
	return Vector2(0, 0)
	
func wander():
	pass
