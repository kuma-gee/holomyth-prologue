extends Node

func start():
	for child in get_children():
		if child is Effect:
			child.start()
