extends Node2D

@export var dialog: Resource

@onready var sprite := $Sprite2D

func _on_interactable_interacted(pos: Vector2):
	sprite.scale.x = -sign(global_position.direction_to(pos)).x
	DialogManager.start_dialog(dialog)
