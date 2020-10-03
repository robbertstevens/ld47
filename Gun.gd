extends Position2D

const BULLET_SCENE = preload("res://Bullet.tscn")
const SPEED = 100


func shoot():
	var bullet = BULLET_SCENE.instance()
	find_parent("World").add_child(bullet)
	bullet.position = get_global_transform().get_origin()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		shoot()
