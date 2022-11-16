extends Area2D
onready var player = get_node("/root/game/Player")
var velocity = Vector2(1, 0)
var speed = 400
var direction = 1


func check_bullet_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true


func _physics_process(delta):
	velocity.x = speed * delta * direction
	translate(velocity)


func _on_bullet_body_entered(body):
	if "enemy" in body.name:
		body.life -= 1
		if body.life <= 0:
			player.sum_score()
			body.queue_free()
	queue_free()
