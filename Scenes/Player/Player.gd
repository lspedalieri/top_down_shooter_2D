extends CharacterBody2D

@export var max_speed : int = 500
var speed : int = max_speed
var can_laser : bool = true
var can_grenade : bool = true

signal laser_shoot(position, direction)
signal grenade_launch(position, direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	#position += direction * speed * delta 
	velocity = speed * direction
	move_and_slide()
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary_action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$laser_cooldown.start()
		$gunblow.emitting = true
		laser_shoot.emit(selected_laser.global_position, player_direction)
	if Input.is_action_pressed("secondary_action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_grenade = false
		$grenade_cooldown.start()
		grenade_launch.emit($LaserStartPosition/Marker2D2.global_position, player_direction)

func _on_laser_cooldown_timeout():
	can_laser = true


func _on_grenade_cooldown_timeout():
	can_grenade = true
