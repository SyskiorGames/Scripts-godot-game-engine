extends KinematicBody2D

var motion = Vector2()
var moveSpeed = 200
var gravity = 1000
var jumpForce = -400
const UP = Vector2(0, -1)

func _physics_process(delta):
	_move_player(delta)
	

func _move_player(delta):
	motion.y += gravity * delta
	
	if Input.is_action_pressed("moveL"):
		motion.x = -moveSpeed
	elif Input.is_action_pressed("moveR"):
		motion.x = moveSpeed
	else:
		motion.x = 0
		
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		motion.y = jumpForce
		
	
	motion = move_and_slide(motion, UP)
