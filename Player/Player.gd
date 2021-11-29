extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1300
const GRAVITY = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 5000

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = -JUMP_SPEED
		
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
	
	
	
	
