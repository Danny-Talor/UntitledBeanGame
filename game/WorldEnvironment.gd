extends WorldEnvironment

# Called when the node enters the scene tree for the first time.
func _ready():
	var environment = self.get_environment()
	var sky = environment.get_sky()
	sky.set_sky_top_color("f2f2f2") 
	sky.set_sky_horizon_color("f2f2f2")
	sky.set_sky_curve(0.0)
	sky.set_sky_energy(0.9)
	sky.set_ground_bottom_color("f2f2f2")
	sky.set_ground_horizon_color("f2f2f2")
	sky.set_ground_curve(0.0)
	sky.set_ground_energy(0.9)
	set_environment(environment)
