extends Area2D

class_name Slime

@export var horizontal_speed = 20
@export var vertical_speed = 100

@onready var ray_cast_2d = $RayCast2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	
	animated_sprite_2d.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _process(delta):
	position.x -= delta * horizontal_speed
		
	if not ray_cast_2d.is_colliding():
		position.y += delta * vertical_speed
		
func _on_wall_detector_body_entered(_body):
	print("geraakt")
	
	
func die():
	
	horizontal_speed = 0
	vertical_speed = 0
	
	animated_sprite_2d.play("die")

func _on_animation_finished():
	
	if animated_sprite_2d.animation == "die":
		
		queue_free()



