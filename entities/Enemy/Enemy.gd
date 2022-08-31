extends KinematicBody

var health = 1
var target
const speed = 7

var death_sound_played = false

func _ready():
	self.add_to_group("Enemies")
	set_as_toplevel(true)
	target = get_parent().get_parent().get_node("Ball")
	
func _physics_process(_delta):
	if not target == self:
		look_at(target.global_transform.origin,Vector3.UP)
		var _velcoity = move_and_slide(((target.global_transform.origin - transform.origin)).normalized()  * speed)
		
	if health <= 0:
		death_delay_timer()
		target = self
		play_death_sound_once()
		$CPUParticles.set_emitting(true)
		$Body.visible = false
		
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("float")

func play_death_sound_once():
	if not death_sound_played:
		$AudioStreamPlayer.play()
		death_sound_played = true

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		target = body

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		target = get_parent().get_parent().get_node("Ball")
	
func _on_Hitbox_body_entered(body):
	if body.is_in_group("Projectiles"):
		self.health -= 1
		body.queue_free()
	if body.is_in_group("Player"):
		body.dec_health()
		self.health -= 1

func death_delay_timer():
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.1)
	timer.connect("timeout",self,"on_timeout_complete")
	add_child(timer)
	timer.start()
	
func on_timeout_complete():
	queue_free()


