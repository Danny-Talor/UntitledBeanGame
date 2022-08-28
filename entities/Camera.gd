extends Camera

func _process(_delta):
	self.size = get_node("Control/HSlider").value
		
