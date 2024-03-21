extends Node2D
signal player_to_body_game_start
signal game_finished_score

var scores = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scene_start_game():
	player_to_body_game_start.emit()
	
	pass # Replace with function body.


func _on_bird_game_finished(score):
	scores = score
	game_finished_score.emit(score)
	
	pass # Replace with function body.
