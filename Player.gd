extends Sprite

onready var Track = get_parent()

var last_move = 0;
var movespeed = .5;
var track = []

func _ready():
	track = [
		Vector2(0,0),
		Vector2(1,0),
		Vector2(2,0),
		Vector2(3,0),
		Vector2(4,0),
		Vector2(4,1),
		Vector2(4,2),
		Vector2(4,3),
		Vector2(3,3),
		Vector2(2,3),
		Vector2(1,3),
		Vector2(0,3),
		Vector2(0,2),
		Vector2(0,1),
	]

func _process(delta):
	last_move -= delta;
	
	if last_move <= 0: 
		var next_move = track.pop_front()
		track.push_back(next_move)
		
		position = next_move*16
		
		last_move = movespeed
