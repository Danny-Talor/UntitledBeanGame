extends Area

func _on_Area_body_entered(body):
	if body is RigidBody:
		body.set_mode(RigidBody.MODE_STATIC)
		body.translation = Vector3(0,10,0)
		body.set_mode(RigidBody.MODE_RIGID)
	else:
		body.translation = Vector3(0,5,0)
