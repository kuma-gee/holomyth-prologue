extends CanvasLayer

const DIALOG_NODE = preload("res://addons/dialog/DialogNode.tscn")

var logger = Logger.new("DialogManager")


func start_dialog(dialog: Resource) -> void:
	if _dialog_active():
		logger.warn("Trying to create dialog while another one is still active")
		return
	
	var node = DIALOG_NODE.instantiate()
	node.dialog = dialog
	add_child(node)


func _dialog_active() -> bool:
	return get_child_count() > 0
