extends Node

signal refill_change

var laser_amount : int = 20:
	set(value):
		laser_amount = value
		refill_change.emit()
	
var grenade_amount : int = 5:
	set(value):
		grenade_amount = value
		refill_change.emit()

var player_health : int = 50:
	set(value):
		player_health = value
		refill_change.emit()
