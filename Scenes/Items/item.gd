extends Area2D

var rotation_speed : int = 5

var available_refills : Array = [
	"grenade",
	"laser",
	"health"
]

var available_primary_weapons : Array = [
	"vulcan",
	"laser",
	"pulse"
]

var available_powerups : Array = [
	"speed",
	"max_health",
	"weapon_power"
]

var refill :String = available_refills[randi() % available_refills.size()]
var powerup :String = available_powerups[randi() % available_powerups.size()]
var weapon :String = available_primary_weapons[randi() % available_primary_weapons.size()]

func _ready():
	print(refill, " ", powerup, " ", weapon)
	if refill == "laser":
		$Sprite2D.modulate = Color(0.4, 0.02, 0.82, 0.75)
	elif refill == "grenade":
		$Sprite2D.modulate = Color(0.4, 0.82, 0.02, 0.75)
	elif refill == "health":
		$Sprite2D.modulate = Color(0.84, 0.22, 0.12, 0.75)

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if refill == "laser":
		Globals.laser_amount += 5
	elif refill == "grenade":
		Globals.grenade_amount += 1
	elif refill == "health":
		Globals.player_health = clamp(Globals.player_health + 25, 0, 100)
	queue_free()
