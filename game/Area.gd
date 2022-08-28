extends Area

func _on_Area_body_exited(body):
	if body is RigidBody:
		body.set_mode(RigidBody.MODE_STATIC)
		body.translation = Vector3(0,10,0)
		body.set_mode(RigidBody.MODE_RIGID)
	else:
		body.translation = Vector3(0,5,0)
	


func _on_Area_body_entered(_body):
	var play_ui_AnimationPlayer = get_parent().get_node("Player/Camera/Control/AnimationPlayer")
	var directional_light_AnimationPlayer = get_parent().get_node("DirectionalLight/AnimationPlayer")
	var flash_animation = directional_light_AnimationPlayer.get_animation("flash")
	flash_animation.track_set_key_value(0, 1, Color(1,0,0,0))
	directional_light_AnimationPlayer.play("flash")
	play_ui_AnimationPlayer.play("health_lost_animation")
	
