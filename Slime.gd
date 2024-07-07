extends Area2D

class_name slime

@export var horizontal_speed = 20
@export var vertical_speed = 100

@onready var ray_cast_2d = $RayCast2D
@onready var ray_cast_2d2 = $RayCast2D2
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	
	animated_sprite_2d.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _process(delta):
	position.x -= delta * horizontal_speed
	
	
	if ray_cast_2d2.is_colliding():
		horizontal_speed = -20
		ray_cast_2d2.position.x = -ray_cast_2d2.position.x
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		return

		
		
	if not ray_cast_2d.is_colliding():
		position.y += delta * vertical_speed

func die():
	
	horizontal_speed = 0
	vertical_speed = 0
	animated_sprite_2d.play("die")
	

func _on_animation_finished():
	
	if animated_sprite_2d.animation == "die":
		Global.score += 100
		queue_free()
