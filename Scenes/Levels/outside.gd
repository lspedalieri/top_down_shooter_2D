extends LevelParent

#var inside : PackedScene = preload("res://Scenes/Levels/inside.tscn")
#@export var inside_level_scene : PackedScene
var inside_scene_path : String = "res://Scenes/Levels/inside.tscn"

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionLayer.change_scene(inside_scene_path)
	#get_tree().change_scene_to_file("res://Scenes/Levels/inside.tscn")
	#get_tree().change_scene_to_packed(inside_level_scene)
	#get_tree().change_scene_to_packed(inside)

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1.5)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1.5)
