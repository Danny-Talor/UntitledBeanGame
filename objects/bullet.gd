extends RigidBody

func _ready():
	self.add_to_group("Projectiles")
	set_as_toplevel(true)
	
func _physics_process(_delta):
	apply_impulse(transform.basis.z, -transform.basis.z)


func _on_VisibilityNotifier_camera_exited(_camera):
	queue_free()


func _on_VisibilityNotifier_camera_entered(_camera):
	$AnimationPlayer.play("shot")
