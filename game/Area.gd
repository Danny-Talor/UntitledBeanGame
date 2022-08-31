extends Area

func _on_Area_body_exited(body):
	if body.is_in_group("Ball"):
		body.set_mode(RigidBody.MODE_STATIC)
		body.translation = Vector3(0,10,0)
		body.set_mode(RigidBody.MODE_RIGID)
	if body.is_in_group("Player"):
		body.dec_health()
		body.translation = Vector3(0,5,0)

func _on_Area_body_entered(body):
	if body.is_in_group("Ball") or body.is_in_group("Player"):
		var play_ui_AnimationPlayer = get_parent().get_node("Camera/Control/AnimationPlayer")
		var directional_light_AnimationPlayer = get_parent().get_node("DirectionalLight/AnimationPlayer")
		var flash_animation = directional_light_AnimationPlayer.get_animation("flash")
		flash_animation.track_set_key_value(0, 1, Color(1,0,0,0))
		directional_light_AnimationPlayer.play("flash")
		play_ui_AnimationPlayer.play("health_lost_animation")
	
