extends Camera

func _process(_delta):
	self.fov = get_node("Control/HSlider").value
		
