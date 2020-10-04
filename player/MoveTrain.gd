extends Path2D

var audioStreamPlayer
var GUN_SCENE = preload("res://player/gun/Gun.tscn")
var current_speed = 0;

func _ready():
	audioStreamPlayer = get_tree().get_root().find_node("YeahPlayer", true, false)

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"): 
		current_speed += delta
		current_speed = min(current_speed, 0.55)
	elif	 Input.is_action_pressed("ui_down"):
		current_speed -= delta
		current_speed = max(current_speed, -0.55)
	
	if Input.is_action_just_pressed("ui_load"):
		var colliders = $Player.get_node("Area2D").get_overlapping_areas()
		
		for collider in colliders:
			if not collider.get_collision_layer() == 16:
				continue
				
			collider.get_parent().queue_free();
			
			var all_trains = get_children()
			var last_train = all_trains.back()

			var train = GUN_SCENE.instance()
			train.offset = last_train.offset - 16
			audioStreamPlayer.play()
			add_child(train)

	
	var children = get_children()
	
	for child in children: 
		child.offset += current_speed

func take_damage(damage:int = 1):
	var childs = get_children()
	childs.back().take_damage(damage)
	
	
