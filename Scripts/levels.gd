extends Control


func _ready():
	for i in range($Levels.get_child_count()):
		Global.levels.append(i+1)
		
	for level in $Levels.get_children():
		if str_to_var(level.name) in range(Global.unlockedLevels+1):
			level.disabled = false
			level.pressed.connect(self.change_level.bind(level.name))
			
			
		else:
			level.disabled = true 
			
			
func change_level(level_no):
	get_tree().change_scene_to_file("res://Scene's/level"+ level_no + ".tscn")
			
			
		







