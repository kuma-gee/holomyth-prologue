extends Panel

@export var dialog: Resource

@onready var name_label := $MarginContainer/Name
@onready var text_label := $MarginContainer2/Text

var current_dialog: Dialog 
var logger = Logger.new("DialogNode")

func _ready():
	_show_dialog(dialog)


func _input(event):
	if event.is_action_pressed("ui_accept"):
		if current_dialog.next_dialog:
			_show_dialog(current_dialog.next_dialog)
		else:
			queue_free()

	get_viewport().set_input_as_handled()

func _show_dialog(d: Dialog):
	if d == null:
		logger.warn("Trying to create dialog without data")
		return
	
	current_dialog = d
	name_label.text = d.character
	text_label.text = d.text
