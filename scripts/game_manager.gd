extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	
	var label = $"../Label"
	label.text = "GAME LOADING"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed():
	set_process(not is_processing())


func _on_timer_timeout():	
	var label = $"../Label"
	label.text = "GAME READY"
