extends KinematicBody2D

var moveSpeed = 170

onready var animPlayer = $AnimationPlayer
onready var animTree = $AnimationTree
onready var animEstate = animTree.get("parameters/playback")

func _physics_process(delta):
	move_player(delta)


func move_player(delta):
	
	var motion = Vector2()
	
	if Input.is_action_pressed("moveR"):
		motion.x += moveSpeed * delta
	elif Input.is_action_pressed("moveL"):
		motion.x -= moveSpeed * delta
	elif Input.is_action_pressed("moveD"):
		motion.y += moveSpeed * delta
	elif Input.is_action_pressed("MoveU"):
		motion.y -= moveSpeed * delta
	
	if motion != Vector2():
		animTree.set("parameters/walk/blend_position", motion)
		animTree.set("parameters/idle/blend_position", motion)
		animEstate.travel("walk")
	else:
		animEstate.travel("idle")
	
	motion = motion.normalized()
	
	move_and_slide(motion * moveSpeed)
