extends KinematicBody2D
onready var position2D = $Position2D
export(int) var speed = 200.0
var velocity : Vector2
var max_speed = 200
var friction = 0.2
var score = 0
var direction
var life = 5
var level = 1

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	direction = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	input_vector.x += direction
	input_vector.y += (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * speed * delta
		velocity = velocity.clamped(max_speed)
	else:
		velocity = velocity.linear_interpolate(Vector2.ZERO, friction)
		
	velocity = move_and_slide(velocity)
	
	if input_vector != Vector2.ZERO:
		if $AnimationPlayer.get_current_animation() != 'walk':
			$AnimationPlayer.stop()
			$AnimationPlayer.play("idle")
	else:
		if $AnimationPlayer.get_current_animation() != 'idle':
			$AnimationPlayer.stop()
			$AnimationPlayer.play("walk")
	
	if direction > 0:
		position2D.scale.x = 1
	elif direction < 0:
		position2D.scale.x = -1
		
func sum_score():
	score = score + 10
