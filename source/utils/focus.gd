class_name FocusUtils
## Helper class for handling focus on Control nodes.
## Conrecrete example, you want to display a submenu
## and when closing it you want to select back the last focused node.
## For more complex setup you can expand it easily replace the variable by an array.

static var last_focused_node: Control


static func set_last_focused_control(from: Node) -> void:
	last_focused_node = from.get_viewport().gui_get_focus_owner()
	if last_focused_node:
		last_focused_node.release_focus()


static func grab_focus_last_focused_control(from: Node) -> void:
	var current_focus: Control = from.get_viewport().gui_get_focus_owner()
	if current_focus:
		current_focus.release_focus()
	if last_focused_node:
		last_focused_node.grab_focus()
