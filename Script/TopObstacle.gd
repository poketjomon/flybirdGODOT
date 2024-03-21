extends Node

#var cast_check:RayCast2D = $RayCast2DTop

@onready var chast_check:RayCast2D = $RayCast2DTop
# Called when the node enters the scene tree for the first time.
func _ready():

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func spawn_enemy():
	var enemy_scene1 = preload("res://obstacle.tscn").instantiate()
	var enemy_scene2 = preload("res://obstacle_2.tscn").instantiate()
	enemy_scene1.position = chast_check.global_position
	enemy_scene2.position = chast_check.global_position
	var num = randi_range(0,100)
	enemy_scene1.set_rotation_degrees(180)
	enemy_scene2.set_rotation_degrees(180)
	enemy_scene1.position.y -=0
	enemy_scene2.position.y -= 0
	if num >50:
		$"..".add_child(enemy_scene1)
	else:
		$"..".add_child(enemy_scene2)

func _on_timer_timeout():
	var num = randi_range(0,100)
	#print($RayCast2D.collide_with_bodies())
	if not chast_check.is_colliding():
		print("未检测到,准备生成")
		spawn_enemy()

	#else:
		#
		##print("检测到了")
		#print(chast_check.get_collider())
		##return
