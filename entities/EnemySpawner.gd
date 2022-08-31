extends Spatial

onready var enemy = preload("res://entities/Enemy/Enemy.tscn")
var rng = RandomNumberGenerator.new()
export var on = true
const y = 1.3
const timer_minimum_wait_time = 1

func _on_Timer_timeout():
	if on:
		var enemy_instance = enemy.instance()
		rng.randomize()
		var x = 25 * ((rng.randi()%2)*2 -1) # 25 * -1 or 25 * 1
		rng.randomize()
		var z = rng.randf_range(15, -15)
		enemy_instance.translate(Vector3(x,y,z))
		add_child(enemy_instance)
		if $Timer.wait_time > timer_minimum_wait_time:
			$Timer.wait_time -= 0.01

	
