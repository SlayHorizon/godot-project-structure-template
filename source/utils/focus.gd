class_name FocusUtils
## Utility for managing focus on Control nodes.
##
## Example use case:
## When displaying a submenu, you may want to restore focus to the last selected control after closing it.
##
## This implementation stores a single last-focused node. If you need to support multiple layers or contexts,
## you can extend it to use a stack or array.

static var last_focused_node: Control

## Stores the currently focused Control node and clears focus from it immediately.
static func set_last_focused_control(from: Node) -> void:
	last_focused_node = from.get_viewport().gui_get_focus_owner()
	if last_focused_node:
		last_focused_node.release_focus()

## Restores focus to the previously saved Control node, if any.
static func grab_focus_last_focused_control(from: Node) -> void:
	var current_focus: Control = from.get_viewport().gui_get_focus_owner()
	if current_focus:
		current_focus.release_focus()
	if last_focused_node:
		last_focused_node.grab_focus()
