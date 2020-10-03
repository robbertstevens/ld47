extends PathFollow2D

var current_speed = 0;
var speed_increment = 5
var max_speed = 100;


func _process(delta):
	offset += delta * current_speed

func _input(event):
	if event.is_action("ui_up"):
		current_speed += speed_increment
		current_speed = min(max_speed, current_speed);
	
	if event.is_action("ui_down"):
		current_speed -= speed_increment
		current_speed = max(0, current_speed);
	
