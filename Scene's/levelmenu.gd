extends Control


# Called when the node enters the scene tree for the first time.


func _on_pressed():
	get_tree().change_scene_to_file("res://Scene's/winkel.tscn")



func _on_level_1_pressed():
	get_tree().change_scene_to_file(("res://Scene's/level1.tscn"))
	



func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Scene's/level2.tscn")
	


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Scene's/level3.tscn")
	
	

func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://Scene's/level4.tscn")
	get_tree().
