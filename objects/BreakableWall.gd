extends StaticBody

var health = 1

func _process(_delta):
	if health <= 0:
		queue_free()

func _on_Area_body_entered(body):
	if body.is_in_group("Projectiles"):
		body.queue_free()
		health -= 1
