extends StaticBody

onready var confetti_emitter = $confetti_emitter

func _on_goal_area_body_exited(body):
	if body is RigidBody:
		confetti_emitter.emit_particles()
		change_ball_position(body)
		body.get_last_collision().inc_score()
		play_directional_light_animation()
		

func change_ball_position(ball: RigidBody) -> void:
	ball.set_mode(RigidBody.MODE_STATIC)
	ball.translation = Vector3(0,5,0)
	ball.set_mode(RigidBody.MODE_RIGID)
	
func play_directional_light_animation() -> void:
	var directional_light_AnimationPlayer = get_parent().get_node("DirectionalLight/AnimationPlayer")
	var flash_animation = directional_light_AnimationPlayer.get_animation("flash")
	flash_animation.track_set_key_value(0, 1, Color(0, 1, 0, 1))
	directional_light_AnimationPlayer.play("flash")
		

