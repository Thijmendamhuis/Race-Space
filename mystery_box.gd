extends StaticBody2D

class_name Block

enum BonusType {
	COIN, 
	SHROOM,
	FLOWER
}

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var bonus_type: BonusType = BonusType.COIN
@export var invisible: bool = false 

var is_empty = false

func _ready(): 
	animated_sprite_2d.visible = !invisible

func bump(player_mode: Player.PlayerMode): 
	if is_empty: 
		return 
		
	if invisible: 
		animated_sprite_2d.visible = true
		invisible = !invisible 
	
	super.bump(player_mode)

