extends Node2D

const end = preload("res://src/scenes/03_end.tscn")

func _on_interactable_interacted(pos):
	SceneManager.change_scene(end)
