extends CharacterBody2D
@export  var obstacle_speed = 175.0
@onready var cast_check_ground:RayCast2D = $RayCast2D
func _ready():
	pass
	
func _physics_process(delta):
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = -1
	if direction:
		velocity.x = direction * obstacle_speed
	else:
		velocity.x = move_toward(velocity.x, 0, obstacle_speed)
	
	move_and_slide()
	


func _on_timer_timeout():
	if not cast_check_ground.is_colliding():
		$"..".queue_free()
		print("脱离区域,删除地面障碍")
