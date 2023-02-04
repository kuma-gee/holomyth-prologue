extends Node2D

@export var dialog: Resource

func _on_interactable_interacted():
	DialogManager.start_dialog(dialog)
