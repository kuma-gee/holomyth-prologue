class_name Effect
extends Node

@export var delay = 0.0
@export var duration = 0.5
@export var reverse = true

var transition = Tween.TRANS_LINEAR
var ease_type = Tween.EASE_IN_OUT
var tween: Tween

func _ready():
	tween = get_tree().create_tween()
	setup()
	tween.start()
	tween.connect("tween_all_completed", _on_tween_completed)

func _on_tween_completed():
	queue_free()


func _interpolate_node(node: Node, property: String, start_value, end_value):
	var start = node.get(start_value) if start_value is String else start_value
	var end = node.get(end_value) if end_value is String else end_value

	tween.interpolate_property(
		node, property, start, end, duration, transition, ease_type, delay
	)

	node.set(property, start)

func _interpolate(property: String, end_value):
	var node = get_parent()
	if reverse:
		_interpolate_node(node, property, end_value, property)
	else:
		_interpolate_node(node, property, property, end_value)

func setup():
	pass