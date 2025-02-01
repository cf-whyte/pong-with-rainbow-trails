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
	
signal winner_found(msg: String)
			
func check_winners() -> void:
	var label_title = $"../Label"	
	if score_left == 10:
		winner_found.emit("Left wins!")
		reset_game(true)
	elif score_right == 10:
		winner_found.emit("Right wins!")
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

func update_title(msg) -> void:
	$"../Label".text = msg

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
var chance := 0.2
var change_pct : int : 
	get: 
		return chance * 100
	set(value):
		chance = float(value) / 100.0
		
func _ready() -> void:
	winner_found.connect(update_title)
	print(change_pct)
	chance += 0.4
	print(change_pct)
		
