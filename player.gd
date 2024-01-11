extends CharacterBody3D

var walking_speed = 8
var animation:AnimationPlayer

@export var camera:Camera3D
@onready var raycast:RayCast3D = $RayCast3D

func _init():
	print("Hello from the Player")

func _ready():
	print("Player is ready !")
	animation = $Character.get_node("AnimationPlayer")

func _process(delta):
	if (Input.is_action_pressed("player_forward")):
		velocity.z -= 5.0 * delta
		animation.play("walking")
	elif (Input.is_action_pressed("player_backward")):
		velocity.z += 5.0 * delta
		animation.play("walking")
	elif (Input.is_action_pressed("player_right")):
		velocity.x += 5.0 * delta
	elif (Input.is_action_pressed("player_left")):
		velocity.x -= 5.0 * delta
	else:
		velocity = Vector3.ZERO
		animation.play("standing")
	move_and_slide()

func _physics_process(delta):
	if (raycast.is_colliding()):
		# set collision layers ball & props
		var collider = raycast.get_collider()
		print(collider)
		print(collider.get_path())
		print(position.distance_to(collider.position))
