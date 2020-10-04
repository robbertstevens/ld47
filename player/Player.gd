extends PathFollow2D

var PASSENGER_SCENE = preload("res://passenger/Passenger.tscn")
export var last:bool = false

const MAX_HEALTH = 100

var current_health = MAX_HEALTH

var current_passenger = 0

func _ready():
	$Control/HealthBar.value = MAX_HEALTH
	$Control/HealthBar.max_value = MAX_HEALTH

func	 _process(delta):
	if current_health <= 0:
		get_tree().paused = true 

func take_damage(damage: int = 10):
	if last: 
		current_health -= damage
		$Control/HealthBar.value = current_health
