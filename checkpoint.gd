extends Node2D

class_name Checkpoint

@export var spawnpoint = false

var activated = false

func activate():
	Global.current_checkpoint = self
	activated = true
	$AnimationPlayer.play("Activated")

func _on_area_2d_area_entered(area):
	if area.get_parent() is Speler && !activated:
		activate()
