extends Node

export (PackedScene) var ball_scene;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

signal decrement_score;
signal increment_score;


func _on_BallTimer_timeout():
	var ball = ball_scene.instance();
	var ball_spawn_location = get_node("BallPath/BallPathSpawn");
	ball_spawn_location.offset = randi();
	var direction = ball_spawn_location.rotation + PI / 2;
	ball.position = ball_spawn_location.position;
	direction += rand_range(-PI / 4, PI / 4);
	ball.rotation = direction;
	
	add_child(ball);
	pass # Replace with function body.


func new_game():
	$HUD.update_score(25);
	$HUD.show_message('Get ready!')
	
	pass # Replace with function body.

func game_over():
	$HUD.show_game_over()
	$BallTimer.stop();
	
func _on_ScoreTimer_timeout():
	$HUD.update_score(score)

func decrement_score(score):
	print("DFECRETMENTENWTWENTWET")

func _on_HUD_start_game():
	$BallTimer.start();
	$HUD.update_score(25);
	$HUD.show_message('Get ready!!!!')
	pass # Replace with function body.
