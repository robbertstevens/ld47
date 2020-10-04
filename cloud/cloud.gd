extends Node2D

export var speed = 10.0;

export (Array, Image) var cloud_sprite = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var r_index = randi() % cloud_sprite.size()
	var cloudSprite = cloud_sprite[r_index]
	get_node("Sprite").texture = cloudSprite
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(1, 0) * delta * speed
	if position.x > 500:
		queue_free()
