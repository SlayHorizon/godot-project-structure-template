extends Node


func _ready() -> void:
	# Test translation, feel free to delete.
	TranslationServer.set_locale("ja")
	print("GREET = ", tr("GREET"))
	TranslationServer.set_locale("en")
	print("GREET = ", tr("GREET"))
	
	apply_settings()
	
	get_tree().change_scene_to_file("res://source/main_scenes/main_menu.tscn")


func apply_settings() -> void:
	pass
