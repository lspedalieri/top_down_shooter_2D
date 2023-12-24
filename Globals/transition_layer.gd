extends CanvasLayer

func _ready():
	print("fade to scene")
	$AnimationPlayer.play("fade_to_scene")
	await $AnimationPlayer.animation_finished

func change_scene(target : String) -> void:
	$AnimationPlayer.play("fade_to_black")
	print("fade to black")
	await $AnimationPlayer.animation_finished
	print("animation finished")
	get_tree().change_scene_to_file(target)
	print("change scene")
	$AnimationPlayer.play("fade_to_scene")
	await $AnimationPlayer.animation_finished
	print("fade to scene")
	
