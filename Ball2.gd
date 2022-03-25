extends RigidBody2D

export var velocity = Vector2(0, 550);
export var GRAVITY_EFFECT = 5;


signal increment_score
signal decrement_score

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play(str(randi() % 11 + 1))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _physics_process(delta):
#	velocity.y += GRAVITY_EFFECT;
#	var collision_info = move_and_collide(velocity * delta);	
#	if collision_info:
#		velocity = velocity.bounce(collision_info.normal);
#		if (collision_info.get_instance_id() == 1208 && Input.is_action_pressed("ui_left")):
#			velocity.y *= 1.1;
#		var current = get_node('.').rotation;
#		get_node(".").rotation = current + deg2rad(20);
			


func _on_BouncyBall_body_entered(body):
	print("test", body);
	pass # Replace with function body.



func _on_BottomPitArea_body_entered(body):
	emit_signal('decrement_score');
	print("DIE DIE DIE");
	
	body.hide()
	pass # Replace with function body.


func _on_WinArea_body_entered(body):
	emit_signal('increment_score');

	
	body.hide()
	pass # Replace with function body.
