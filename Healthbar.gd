extends Control

func _on_health_updated(health, amount):
	$HealthBar.value = health
	
func _on_max_health_updated(max_health):
	$HealthBar.max_value = max_health
