extends KinematicBody2D

var motion = Vector2(0,0)




const SPEED = 1300
const GRAVITY = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 5000
const WORLD_LIMIT = 650
const BOOST_MULTIPLIER = 1.5



func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)


func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("GameState", "end_game")
	if is_on_floor() and motion.y >0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = -JUMP_SPEED
		$Jump.play()
		
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed(("rigth")):
		motion.x = -SPEED
	elif Input.is_action_pressed("rigth") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
		
func animate():
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	elif motion.x >0:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif motion.x <0:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
	
	
	
	
func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -JUMP_SPEED
	$Hurt.play()

	
func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -JUMP_SPEED * BOOST_MULTIPLIER
	




