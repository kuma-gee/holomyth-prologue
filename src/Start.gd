extends Menu

@export var next_scene: PackedScene

@onready var label := $MarginContainer/HBoxContainer/Label2

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		_start()

func _start():
	label.start()


func _on_fade_effect_finished():
	SceneManager.change_scene(next_scene)
