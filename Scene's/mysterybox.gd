extends Block

class_name MysteryBox

enum BonusType {
	COIN,
	SHROOM,
	FLOWER
}

#Bonus References
const COIN_SCENE = preload("res://coin.tscn")

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var bonus_type: BonusType = BonusType.COIN
@export var invisible: bool = false

var is_empty = false

func _ready():
	animated_sprite_2d.visible = !invisible

func bump(player_mode: Speler.SpelerMode):
	if is_empty:
		return
		
	if invisible:
		animated_sprite_2d.visible = true
		invisible = !invisible
	
	super.bump(player_mode)
	make_empty()
	
	match  bonus_type:
		BonusType.COIN:
			spawn_coin()

func make_empty():
	is_empty = true
	animated_sprite_2d.play("empty")

func spawn_coin():
	var coin = COIN_SCENE.instantiate()
	coin.global_position = global_position + Vector2(0, -16)
	get_tree().root.add_child(coin)
	get_tree().get_first_node_in_group("level_manager").on_coin_collected()
	
