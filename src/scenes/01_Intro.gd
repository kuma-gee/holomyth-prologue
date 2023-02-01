extends Control

@export var next_scene: PackedScene

@onready var timer := $Timer

func _on_fade_effect_2_finished():
	timer.start()


func _on_timer_timeout():
	SceneManager.change_scene(next_scene)
