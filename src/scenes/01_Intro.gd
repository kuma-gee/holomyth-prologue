extends Control

@export var next_scene: PackedScene

@onready var timer := $Timer
@onready var fade1 := $CenterContainer/HBoxContainer/Label/FadeEffect
@onready var fade2 := $CenterContainer/HBoxContainer/Label2/FadeEffect

var skipped = false

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		if not skipped:
			if is_instance_valid(fade1):
				fade1.finish()
				
			if is_instance_valid(fade2):
				fade2.finish()
			skipped = true
			_on_fade_effect_finished()
		else:
			timer.stop()
			_on_timer_timeout()


func _on_timer_timeout():
	SceneManager.change_scene(next_scene, SceneManager.Transition.CURTAIN_H, 1)


func _on_fade_effect_finished():
	timer.start()
