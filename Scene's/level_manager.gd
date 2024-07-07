extends Node

class_name LevelManager


var points = 0
var coins = 0

@export var ui: UI
@export var speler: Speler


func on_points_scored(points_scored: int):
	points += points_scored
	ui.set_score(points)

func on_coin_collected():
	coins += 1
	ui.set_coins(coins)
