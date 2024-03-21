extends CanvasLayer

class_name UI
signal start_game
var scores = 0
var start_game_flag = false
@onready var score_text:Label = $ScoreLabel
@onready var message_text:Label = $MessageLabel
@onready var start_button:Button = $StartButton
@onready var timer:Timer = $ScoreTimer

func show_message(text):
	message_text.text = text
	message_text.show()
	#message_text.start()

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await timer.timeout

	message_text.text = "Bird Fly!"
	message_text.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	start_button.show()
	
func update_score(score):
	score_text.text = str(score)
	score_text.show()

	
func _on_start_button_pressed():
	scores = 0
	start_game_flag = true
	start_button.hide()
	message_text.hide()
	start_game.emit()
	pass # Replace with function body.


func _on_score_timer_timeout():
	
	pass # Replace with function body.


func _on_scene_scene_to_score(score):
	#update_score(score)
	show_game_over()
	pass # Replace with function body.


func _on_timer_timeout():
	if start_game_flag:
		scores +=1
	update_score(scores)
