extends Control


func _on_level_pressed():
	get_tree().change_scene_to_file("res://level1.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://level2.tscn")


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://level3.tscn")

func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://level4.tscn")