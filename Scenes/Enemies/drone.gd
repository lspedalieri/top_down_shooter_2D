extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var pos = Vector2.ZERO

func _process(_delta):
	var direction = Vector2.RIGHT
	velocity = direction * SPEED
	if position.x > 1920:
		pos.x = 0
		position.x = pos.x
	move_and_slide()

func hit():
	print("damage")
