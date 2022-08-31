extends MeshInstance

onready var sounds = $Node.get_children()

func get_muzzle_location():
	return Vector3(0,0.23,-2.9)

func shot():
	sounds[randi() % sounds.size()].play()
