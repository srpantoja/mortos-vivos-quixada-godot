extends Node2D
onready var player = get_node("/root/game/Player")

func _process(delta):
	if player:
		$Display/SCORE.text = "SCORE: " + str(player.score)
		var life_str = "LIFE"
		for i in range(0, player.life):
			life_str += " X"
		$Display/LIFE.text = life_str
		$Display/Level.text = "LEVEL " + str(player.level)
