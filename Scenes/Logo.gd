extends Sprite2D

var pos : Vector2 = Vector2.ZERO
var test_scale : int = 1
const speed : int = 10
const test_rotation : int = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(100, 100)
#	position = pos
#	test_scale = 2
#	scale = Vector2(test_scale, test_scale)
	$"..".test_function()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos.x += speed
	position = pos
#	rotation += test_rotation * delta
#	scale += Vector2(test_scale*delta, test_scale*delta)
	if position.x > 1000:
		pos.x = 0
		
