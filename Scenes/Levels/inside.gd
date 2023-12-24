extends LevelParent

#var outside : PackedScene = preload("res://Scenes/Levels/outside.tscn")
#@export var outside_level_scene : PackedScene
var outside_scene_path : String = "res://Scenes/Levels/outside.tscn"

func _on_exit_gate_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionLayer.change_scene(outside_scene_path)
	#get_tree().change_scene_to_file("res://Scenes/Levels/outside.tscn")
	#get_tree().change_scene_to_packed(outside_level_scene)
	#get_tree().change_scene_to_packed(outside)
