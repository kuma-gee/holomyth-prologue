class_name ScaleEffect
extends Effect

@export var factor := 1.2

func setup():
	_interpolate("scale", get_parent().scale * factor)
