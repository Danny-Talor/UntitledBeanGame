extends KinematicBody

onready var player_model = $Spatial

export var movement_speed = 12

export var score = 0

var max_slides = 4
var floor_max_angle = 0.785398

var gravity_vector = ProjectSettings.get_setting("physics/3d/default_gravity_vector")
var gravity_magnitude = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(_delta):

	var movement_direction = Vector2(
		Input.get_action_strength("player_right") - Input.get_action_strength("player_left"),
		Input.get_action_strength("player_down") - Input.get_action_strength("player_up")).normalized()
	
	var velocity = Vector3(
		movement_direction.x * movement_speed,
		-gravity_magnitude,
		movement_direction.y * movement_speed
	)
	
	if is_on_floor():
		velocity.y = 0.0
		
	velocity = move_and_slide(velocity, Vector3.UP, false, max_slides, floor_max_angle, false)

func _input(event):
	var player_pos = global_transform.origin
	var dropPlane = Plane(Vector3(0,1,0),player_pos.y)
	if event is InputEventMouseMotion:
		var mouse_position = get_viewport().get_mouse_position()
		var ray_origin = $Camera.project_ray_origin(mouse_position)
		var ray_length = 1000
		var ray_target = ray_origin + $Camera.project_ray_normal(mouse_position) * ray_length
		var cursor_location = dropPlane.intersects_ray(ray_origin,ray_target)
		if cursor_location:
			player_model.look_at(cursor_location, Vector3.UP)
	
func inc_score():
	score += 1
