extends CharacterBody2D

var Speed = 100.0
const DashSpeed = 140
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var dashCooldown = 0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	#if Input.is_action_pressed("crouch") :
		#animated_sprite.play("crouch")
		#Speed = 40
	#else :
		#Speed=100
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("dash") and dashCooldown == 0 :
		$dashTimer.start()
		Speed *= 6
		dashCooldown = 1
		$dashCooldown.start()
		animated_sprite.play("crouch")
	var direction := Input.get_axis("left", "right")
	
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0 :
		animated_sprite.flip_h = true
		
	if is_on_floor():
		
		if direction != 0 and Input.is_key_pressed(KEY_SHIFT) :
			animated_sprite.play("dash")
			
		elif direction != 0:
			animated_sprite.play("run")
		else :
			animated_sprite.play("idle")
	else:
		animated_sprite.play("jump")
	
	if Input.is_key_pressed(KEY_SHIFT) :
		velocity.x = direction * DashSpeed
	elif direction:
		velocity.x =direction * Speed
	else:
		velocity.x = move_toward(velocity.x, 0, DashSpeed)
	move_and_slide()


func _on_dash_timer_timeout() -> void:
	Speed = 100.0


func _on_dash_cooldown_timeout() -> void:
	if is_on_floor() :
		dashCooldown = 0
