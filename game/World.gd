extends Spatial

onready var breakable_wall = preload("res://objects/BreakableWall.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_breakable_walls()
		
func generate_breakable_walls():
	var distance = 2
	for i in 22:
		var new_wall = breakable_wall.instance()
		new_wall.translate(Vector3(
			$BreakableWall.global_transform.origin.x + distance,
			$BreakableWall.global_transform.origin.y,
			$BreakableWall.global_transform.origin.z))
		new_wall.rotate_y($BreakableWall.global_rotation.y)
		distance += 2
		add_child(new_wall)
	distance = 2
	for i in 22:
		var new_wall = breakable_wall.instance()
		new_wall.translate(Vector3(
			$BreakableWall2.global_transform.origin.x - distance,
			$BreakableWall2.global_transform.origin.y,
			$BreakableWall2.global_transform.origin.z))
		new_wall.rotate_y($BreakableWall2.global_rotation.y)
		distance += 2	
		add_child(new_wall)
