extends CharacterBody2D

@export var speed := 300.0

@onready var input: PlayerInput = $PlayerInput
@onready var sprite := $CollisionShape2D/AnimatedSprite2D
@onready var hand := $Hand

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 10


func _physics_process(delta):
	var motion = input.get_action_strength("move_right") - input.get_action_strength("move_left")
	velocity.x = motion * speed
	
	if abs(motion) > 0:
		sprite.flip_h = sign(motion) == -1
		sprite.animation = "Walk"
	else:
		sprite.animation = "Idle"
	
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()


func _on_player_input_just_pressed(ev: InputEvent):
	if ev.is_action_pressed("interact"):
		hand.interact()
