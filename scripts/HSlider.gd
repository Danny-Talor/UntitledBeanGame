extends HSlider

func _ready():
	self.value = get_parent().get_parent().fov

func _input(event):
	get_parent().get_node("RichTextLabel2").text = str(self.value)
	if event.is_action("zoom_in"):
		self.value -= 1
	if event.is_action("zoom_out"):
		self.value += 1
