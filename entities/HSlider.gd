extends HSlider

func _ready():
	self.value = get_parent().get_parent().size

func _input(event):
	get_parent().get_node("RichTextLabel2").set_bbcode("[b][color=black]camera distance: " + str(self.value) + "[/color][/b]")
	if event.is_action("zoom_in"):
		self.value -= 1
	if event.is_action("zoom_out"):
		self.value += 1
		
func _process(_delta):
	get_parent().get_node("RichTextLabel3").set_bbcode("[b][color=black]fps: "+ str(Engine.get_frames_per_second()) +"[/color][/b]")
	
