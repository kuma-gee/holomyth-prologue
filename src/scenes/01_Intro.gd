extends Control

@export var next_scene: PackedScene

@onready var timer := $Timer
@onready var fade1 := $CenterContainer/HBoxContainer/Label/FadeEffect
@onready var fade2 := $CenterContainer/HBoxContainer/Label2/FadeEffect2

var skipped = false

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		if not skipped:
			fade1.finish()
			fade2.finish()
			skipped = true
			_on_fade_effect_2_finished()
		else:
			timer.stop()
			_on_timer_timeout()
			

func _on_fade_effect_2_finished():
	timer.start()


func _on_timer_timeout():
	SceneManager.change_scene(next_scene)
