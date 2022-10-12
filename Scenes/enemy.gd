extends KinematicBody2D

onready var player = get_node("/root/game/Player")
var move
var speed = 50
var life = 3

func _physics_process(delta):
	if player:
		move = Vector2.ZERO
		move = position.direction_to(player.position) * speed
		move = move.normalized()
		move = move_and_collide(move)
		
		if position.x > player.position.x:
			$Position2D.scale.x = -1
		else:
			$Position2D.scale.x = 1
			
		$Position2D/AnimationEnemy.play("enemy_walk")
	$ProgressBar.value = life

func _on_attackbody_body_entered(body):
	if "Player" in body.name:
		body.life -= 1
		queue_free()
		if body.life <= 0:
			get_tree().change_scene("res://Scenes/game_over.tscn")
