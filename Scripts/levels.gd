extends Control

func _ready():
	# Ensure Global.levels is initialized properly
	Global.levels = []

	# Populate Global.levels with level numbers
	for i in range($Levels.get_child_count()):
		Global.levels.append(i + 1)

	# Enable or disable level buttons based on unlocked levels
	for level in $Levels.get_children():
		# Convert level name to a string and then to an integer
		var level_number = int(str(level.name))
		# Check if the level is within the unlocked levels
		if level_number <= Global.unlockedLevels:
			level.disabled = false
			level.pressed.connect(self.change_level.bind(level_number))
		else:
			level.disabled = true

func change_level(level_no):
	# Change the scene to the selected level
	get_tree().change_scene_to_file("res://Scene's/level" + str(level_no) + ".tscn")
