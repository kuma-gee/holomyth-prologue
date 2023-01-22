extends Menu

@export var next_scene: PackedScene

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		SceneManager.change_scene(next_scene)
