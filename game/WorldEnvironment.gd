extends WorldEnvironment

# Called when the node enters the scene tree for the first time.
func _ready():
	var environment = self.get_environment()
	var sky = environment.get_sky()
	sky.set_sky_horizon_color("ffffff")
	sky.set_sky_top_color("ffffff") 
	sky.set_ground_bottom_color("ffffff")
	sky.set_ground_horizon_color("ffffff")
	set_environment(environment)
