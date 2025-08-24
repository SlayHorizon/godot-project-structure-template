extends Node

# This file demonstrates the "entry point" pattern.
# It's placed at source/ root level to separate it clearly from other scenes

func _ready() -> void:
	# Apply potential saved / default settings like language, resolution, etc.
	apply_settings()
	
	get_tree().change_scene_to_file.call_deferred("res://source/ui/main_menu/main_menu.tscn")


func apply_settings() -> void:
	# Test translation, feel free to delete.
	TranslationServer.set_locale("ja")
	print("GREET = ", tr("GREET"))
	TranslationServer.set_locale("en")
	print("GREET = ", tr("GREET"))
