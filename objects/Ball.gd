extends RigidBody

var last_collision = null

func _on_Area_body_entered(body):
	if body is KinematicBody:
		last_collision = body
		
func get_last_collision():
	return last_collision
