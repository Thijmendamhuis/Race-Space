extends Control


func _on_spelen_pressed():
	get_tree().change_scene_to_file("res://levelmenu.tscn")


func _on_stoppen_pressed():
	get_tree().quit()
