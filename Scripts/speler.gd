extends CharacterBody2D

class_name Speler

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
enum SpelerMode {
	klein,
	Normaal,
	groot,
}

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var area_collision_shape = $Area2D/AreaCollisionShape
@onready var body_collision_shape = $BodyCollisionShape 

@export_group("locomotion")
@export var run_speed_damping = 0.5
@export var speed = 200
@export var jump_velocity = -400
@export_group("")



func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity
	
	if Input.is_action_just_released("ui_up") and velocity.y <0:
		velocity.y *= 0.5
		
		
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = lerpf(velocity.x, speed * direction, run_speed_damping * delta)
	else: 
		velocity.x = move_toward(velocity.x, 0, speed * delta)
		
		
	move_and_slide()
