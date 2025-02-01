extends Node

enum Trail { NONE, WHITE, RED, GREEN, BLUE, RAINBOW }

var score_left = 0
var score_right = 0

func add_point_left():
	score_left += 1
	check_winners()
	
func add_point_right() -> void:
	score_right += 1
	check_winners()
	
func check_winners() -> void:
	var label_title = $"../Label"	
	if score_left == 10 && score_right == 10:
		label_title.text = "Everyone wins!"
	elif score_left == 10:
		label_title.text == "Left wins!"
		reset_game(true)
	elif score_right == 10:
		label_title.text = "Right wins!"
		reset_game(false)
	else:		
		label_title.text = "Score " + str(score_left) + " : " + str(score_right)
	
func reset_game(is_winner_left: bool):
	score_left = 0
	score_right = 0
	if is_winner_left:
		$"../Label".text = "Left Wins!"
	else:
		$"../Label".text = "Right Wins!"
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Label".text = "Game Ready"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
