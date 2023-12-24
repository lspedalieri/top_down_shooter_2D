extends ItemContainer

func hit():
	#if opened == false:
	opened = true
	$LidSprite.hide()
	var pos = $SpawnPosition.get_child(randi() % $SpawnPosition.get_child_count()).global_position
	open.emit(pos, current_direction)
