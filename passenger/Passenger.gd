extends Node2D

const MAX_TIME_ALIVE = 9

var current_time_alive = 0

func _ready():
	$AnimationPlayer.play("idle")

func _process(delta):
	current_time_alive += delta
	
	if current_time_alive > MAX_TIME_ALIVE:
		queue_free()
