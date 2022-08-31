extends RigidBody

var last_collision = null
onready var sounds = $sounds.get_children()

func _ready():
	self.add_to_group("Ball")
	
func _on_Area_body_entered(body):
	sounds[randi()%sounds.size()].play()
	if body.is_in_group("Player"):
		last_collision = body
		
func get_last_collision():
	return last_collision
