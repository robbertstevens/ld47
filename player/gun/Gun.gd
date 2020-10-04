extends PathFollow2D

const BULLET_SCENE = preload("res://player/gun/Bullet.tscn")
const SPEED = 100
const SHOT_DELAY = .05

var last_shot = 0

func _process(delta):
	last_shot -= delta


func shoot():
	var bullet = BULLET_SCENE.instance()
	find_parent("World").add_child(bullet)
	bullet.position = get_global_transform().get_origin()
	bullet.set_dir((get_global_mouse_position() - get_global_transform().get_origin()).normalized())

func _input(event):
	if event.is_action("ui_accept"):
		if last_shot < 0:
			shoot()
			last_shot = SHOT_DELAY
