extends RichTextLabel

func _process(_delta):
	self.text = "Score: " + (get_parent().get_parent().get_parent().score as String)
