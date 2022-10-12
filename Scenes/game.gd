extends Node2D
var bullet_path := preload('res://Scenes/bullet.tscn')
var enemy_path := preload('res://Scenes/enemy.tscn')
onready var player = get_node("/root/game/Player")
var width = 900
var height = 200
var next_level = 100

func _physics_process(delta):
	var show_wapeon = Input.is_action_just_pressed("ui_select")
	
	if show_wapeon:
		shoot()
		
	if player:
		if player.score >= next_level:
			player.level += 1
			next_level = (100 * player.level) * 1.5
	
	if $AudioBackgroundGame.playing == false:
		$AudioBackgroundGame.play()

		
func shoot():
	var bullet = bullet_path.instance()
	if sign($Player.position2D.scale.x) == 1:
		bullet.check_bullet_direction(1)
	else:
		bullet.check_bullet_direction(-1)
	$projectiles.get_parent().add_child(bullet)
	bullet.position = $Player/Position2D/Node2D.global_position
	$AudioBullets.play()
	
func _ready():
	var level = 1
	if player:
		level = player.level
	$Timer.wait_time = 1/level
	$Timer.start()
	
func enemy_wave():
	var enemy = enemy_path.instance()
	$".".add_child(enemy)
	enemy.position = Vector2(width, randi()%height + 200)

func _on_Timer_timeout():
	enemy_wave()
