extends DirectionalLight

var prev_player_score = 0

func _process(delta):
	var player_score = get_parent().get_node("Player").score
	