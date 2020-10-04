extends Node2D

onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("smoke")

func _process(delta):
	if not animation_player.is_playing():
		queue_free()
