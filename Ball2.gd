extends KinematicBody2D

export var velocity = Vector2(0, 150);
var screen_size;
export var GRAVITY_EFFECT = 5;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity.y += GRAVITY_EFFECT;
	var collision_info = move_and_collide(velocity * delta);
	if collision_info:
		print(collision_info)
		velocity = velocity.bounce(collision_info.normal);
		if (collision_info.get_instance_id() == 1208 && Input.is_action_pressed("ui_left")):
			velocity.y *= 1.1
	
