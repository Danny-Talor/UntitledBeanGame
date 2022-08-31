extends RichTextLabel

func _process(_delta):
	self.set_bbcode("[b][color=black]Score: " + (get_parent().get_parent().get_parent().get_node("Player").score as String) + "[/color][/b]")
