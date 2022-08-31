extends KinematicBody

onready var player_model = $player_model
onready var weapon_hardpoint = $player_model/hardpoint

onready var bullet = preload("res://objects/bullet.tscn")

export var score = 0
export var health = 5

const max_slides = 4
const floor_max_angle = 0.785398
export var movement_speed = 12

var death_animation_played = false

var gravity_magnitude = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	self.add_to_group("Player")
	
func _physics_process(_delta):
	
	
	if health > 0:
		move_player()
		look_at_cursor()
		shoot()
	else:
		if not death_animation_played:
			death_animation_played = true
			$AnimationPlayer.play("death")
		get_parent().get_node("EnemySpawner").on = false
	
func check_point_touches_player(point_x,point_y):
	var player_pos = global_transform.origin
	var player_shape_radius = $CollisionShape.get_shape().get_radius()
	return (point_x - player_pos.x) * (point_x - player_pos.x) + (point_y - player_pos.y) * (point_y - player_pos.y) < player_shape_radius*player_shape_radius
	
func inc_score():
	score += 1

func look_at_cursor():
	var cursor_location = get_cursor_location()
	if cursor_location:
		player_model.look_at(cursor_location, Vector3.UP)
		if not check_point_touches_player(cursor_location.x, cursor_location.y):
			weapon_hardpoint.look_at(cursor_location, Vector3.UP)
			
func get_cursor_location():
	var player_pos = global_transform.origin
	var dropPlane = Plane(Vector3(0,1,0),player_pos.y)
	var mouse_position = get_viewport().get_mouse_position()
	var ray_origin = get_parent().get_node("Camera").project_ray_origin(mouse_position)
	var ray_length = 1000
	var ray_target = ray_origin + get_parent().get_node("Camera").project_ray_normal(mouse_position) * ray_length
	var cursor_location = dropPlane.intersects_ray(ray_origin,ray_target)
	return cursor_location

func move_player():
	var movement_direction = Vector2(
		Input.get_action_strength("player_right") - Input.get_action_strength("player_left"),
		Input.get_action_strength("player_down") - Input.get_action_strength("player_up")).normalized()
	
	var velocity = Vector3(
		movement_direction.x * movement_speed,
		-gravity_magnitude,
		movement_direction.y * movement_speed
	)
		
	velocity = move_and_slide(velocity, Vector3.UP, false, max_slides, floor_max_angle, false)

func shoot():
	if Input.is_action_just_pressed("fire_weapon_hardpoint"):
		var bullet_instance = bullet.instance()
		bullet_instance.translation = weapon_hardpoint.get_child(0).get_muzzle_location()
		weapon_hardpoint.get_child(0).shot()
		weapon_hardpoint.add_child(bullet_instance)
		
func dec_health():
	health -= 1
	var play_ui_AnimationPlayer = get_parent().get_node("Camera/Control/AnimationPlayer")
	var directional_light_AnimationPlayer = get_parent().get_node("DirectionalLight/AnimationPlayer")
	var flash_animation = directional_light_AnimationPlayer.get_animation("flash")
	flash_animation.track_set_key_value(0, 1, Color(1,0,0,0))
	directional_light_AnimationPlayer.play("flash")
	play_ui_AnimationPlayer.play("health_lost_animation")
