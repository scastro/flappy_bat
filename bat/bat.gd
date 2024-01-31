extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var death_sound = $DeathSound
@onready var fly_sound = $FlySound

const GRAVITY: float = 1900.0
const POWER: float = -400.0

var is_alive = true

func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	
	processInput()
	
	move_and_slide()
	
	if is_on_floor() || is_on_ceiling():
		die()

func processInput():
	if is_alive && Input.is_action_just_pressed("Fly"):
		velocity.y = POWER

func die():
	if is_alive:
		set_physics_process(false)
		animated_sprite_2d.play("death")
		fly_sound.stop()
		death_sound.play()
	is_alive = false

func _on_animated_sprite_2d_animation_finished():
	GameManager.on_game_over.emit()
	queue_free()
