extends Node
class_name Scene
signal start_game
var scores  = 0
signal scene_to_score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ui_start_game():
	start_game.emit()
	pass # Replace with function body.


func _on_player_game_finished_score(score):
	scene_to_score.emit(score)
	pass # Replace with function body.
