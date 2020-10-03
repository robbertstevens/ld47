extends Node2D

export var spawn_rate = 5.0;

export (Array, PackedScene) var cloud_scenes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_cloud();

func spawn_cloud():
	var r_index = randi() % cloud_scenes.size()
	var cloud = cloud_scenes[r_index]
	var cloud_instance = cloud.instance();
	
	get_parent().add_child(cloud_instance)
	var rand_y = rand_range(0, 10)
	cloud_instance.position += Vector2(0,0)
	
	yield(get_tree().create_timer(spawn_rate), "timeout")
	spawn_cloud();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
