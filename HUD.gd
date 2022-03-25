extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_game;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var score = 25;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show_message(text):
	$Message.text = text;
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout");
	
	$Message.text = "Place the creeps";
	$Message.show();
	
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score);

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	
func _on_MessageTimer_timeout():
	$Message.hide()

func _on_BouncyBall_decrement_score():
	score = clamp(score-1, 0, 1000);
	update_score(score) # Replace with function body.
	if(score == 0):
		emit_signal('game_over')


func _on_BouncyBall_increment_score():
	score = clamp(score+1, 0, 1000);
	update_score(score) # Replace with function body.
	if(score == 40):
		emit_signal('game_win')
