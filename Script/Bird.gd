extends CharacterBody2D
@onready var cast_check:RayCast2D = $RayCast2D
@onready var cast_check_up:RayCast2D = $RayCast2DUP
const SPEED = 80.0
const JUMP_VELOCITY = -200.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity_num = 450
var gravity = 0
var score = 0
var is_game_over = false
var game_start = false
var positions
signal game_finished
func _ready():
	positions = global_position
	$AnimatedSprite2D.play("fly")
func _physics_process(delta):
	if not game_start:
		return
	if is_game_over:
		return
	# Add the gravity.
	if is_on_floor():
		is_game_over = true
		#bird_reset()
		
		game_finished.emit(str(score))
		print("游戏结束")
		return
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction <0:
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
func bird_reset():
	game_start = false
	gravity = 0
	score = 0
	is_game_over = true
	global_position = positions
	move_and_slide()
	
func cast_check_over():
	if (not cast_check.is_colliding()) and (not cast_check_up.is_colliding()):
		#is_game_over = true
		bird_reset()
		
		game_finished.emit(str(score))
		
		print("游戏结束")
	else:
		print("小鸟在区域内")

func _on_timer_timeout():
	cast_check_over()
	score += 1
	pass # Replace with function body.


func _on_player_player_to_body_game_start():
	bird_reset()
	is_game_over = false
	game_start = true
	gravity = gravity_num
	
	
