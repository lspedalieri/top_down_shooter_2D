extends RigidBody2D

const SPEED : int = 500

func explode():
	print("explosion")
	$ExplosionAnimation.play("explosion")
