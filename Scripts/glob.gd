extends Node


var levels = []
var unlockedLevels = 1

var score = 0



var current_checkpoint : Checkpoint
var player : Speler

func respawn_player():
	if current_checkpoint != null:
		player.position = current_checkpoint.position
		
		

