extends Area



func _on_goal_area_body_entered(body):
	if body is RigidBody:
		print(body)
