extends StaticBody
	
func _on_goal_area_body_entered(body):
	if body is RigidBody:
		$Confetti.emitting = true
		body.set_mode(RigidBody.MODE_STATIC)
		body.translation = Vector3(0,10,0)
		body.set_mode(RigidBody.MODE_RIGID)
		if body:
			body.get_last_collision().inc_score()
