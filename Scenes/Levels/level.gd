extends Node2D
class_name LevelParent

var laser_scene : PackedScene = preload("res://Scenes/Projectiles/laser.tscn")
var grenade_scene : PackedScene = preload("res://Scenes/Projectiles/grenade.tscn")
var item_scene : PackedScene = preload("res://Scenes/Items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)

func _on_container_opened(pos, _direction):
	var item = item_scene.instantiate()
	item.position = pos
	$Items.call_deferred('add_child', item)


func _on_player_laser_shoot(laser_position, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = laser_position
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$PlayerProjectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_grenade_launch(grenade_position, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_position
	grenade.linear_velocity = direction * grenade.SPEED
	$PlayerProjectiles.add_child(grenade)
	$UI.update_grenade_text()
