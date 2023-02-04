class_name Interactable
extends Area2D

signal interacted(pos: Vector2)

const OUTLINE = preload("res://shared/items/sprite_outline.tres")

@export var sprite_path: NodePath
@onready var sprite: Sprite2D = get_node(sprite_path)


func highlight():
	if sprite and not sprite.material:
		sprite.material = OUTLINE


func unhighlight():
	if sprite and sprite.material:
		sprite.material = null


func interact(pos: Vector2):
	interacted.emit(pos)
