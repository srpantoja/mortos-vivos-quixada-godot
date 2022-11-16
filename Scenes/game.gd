extends Node2D
var enemy_path := preload('res://Scenes/enemy.tscn')
onready var player = get_node("/root/game/Player")
var width = 900
var height = 200

func _ready():
	var level = 1
	$Timer.wait_time = 1/level
	$Timer.start()
	
func enemy_wave():
	var enemy = enemy_path.instance()
	$".".add_child(enemy)
	enemy.position = Vector2(width, randi()%height + 200)

func _on_Timer_timeout():
	enemy_wave()
