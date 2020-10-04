extends Node2D

export var spawn_rate = 20.0;

onready var cloud = preload("res://cloud/Cloud.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_cloud();

func spawn_cloud():	
	var cloud_instance = cloud.instance();
	get_parent().call_deferred('add_child', cloud_instance)
	var rand_y = rand_range(-300, 300)
	cloud_instance.position += Vector2(-400, rand_y)
	
	var rand_init_time = randi() % int(spawn_rate / 2);
	yield(get_tree().create_timer(spawn_rate + rand_init_time), "timeout")
	spawn_cloud();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
