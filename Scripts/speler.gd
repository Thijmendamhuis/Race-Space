extends CharacterBody2D

class_name Speler

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum SpelerMode {
	SMALL,
	NORMAL,
	BIG,
}



@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var area_collision_shape = $Area2D/AreaCollisionShape
@onready var body_collision_shape = $BodyCollisionShape
@onready var area_2d = $Area2D

@export_group("locomotion")
@export var run_speed_damping = 0.5
@export var speed = 200
@export var jump_velocity = -400
@export_group("")

@export_group("Dood Enemy")
@export var min_dood_degree = 35
@export var max_dood_degree = 145
@export var dood_y_velocity = -150
@export_group("")

@export_group("Death Threshold")
@export var death_y_threshold = 200
@export_group("")

var player_mode = SpelerMode.SMALL
var is_dead = false

func _ready():
	Global.player = self

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity

	if Input.is_action_just_released("ui_up") and velocity.y < 0:
		velocity.y *= 0.5

	var direction = Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = lerp(velocity.x, speed * direction, run_speed_damping * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta)

	var collision = get_last_slide_collision()
	if collision != null: 
		handle_movement_collision(collision)

	move_and_slide()
	
	if position.y >= 200:
		die()

func _on_area_2d_area_entered(area):
	if area is slime:
		handle_enemy_collision(area)

func handle_enemy_collision(enemy: slime):
	if enemy == null or is_dead:
		return

	var angle_of_collision = rad_to_deg((enemy.global_position - global_position).angle())

	if angle_of_collision >= min_dood_degree and angle_of_collision <= max_dood_degree:
		enemy.die()
		on_enemy_stopped()
	else:
		die()

func on_enemy_stopped():
	velocity.y = dood_y_velocity

func die():
<<<<<<< HEAD
	if player_mode == SpelerMode.SMALL:
		is_dead = true
		animated_sprite_2d.play("death")

		area_2d.set_collision_layer_value(1, false)
		area_2d.set_collision_mask_value(3, false)
		set_collision_layer_value(1, false)
		set_collision_mask_value(3, false)

		set_physics_process(false)

		var death_tween = get_tree().create_tween()
		death_tween.tween_callback(func (): get_tree().reload_current_scene())


func handle_movement_collision(collision: KinematicCollision2D):
	if collision.get_collider() is Block:
		var collision_angle = rad_to_deg(collision.get_angle())
		if roundf(collision_angle) == 180:
			(collision.get_collider() as Block).bump(player_mode)
=======
	Global.respawn_player()
	Global.score -= 300
>>>>>>> c5777248005ccbc66b3fc9c1ec133e617021b3c3
