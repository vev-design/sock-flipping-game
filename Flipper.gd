extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var key = "ui_right";
export var rotation_speed = 45;
export var original_rotation = 0;
export var max_rotation = deg2rad(30);
export var min_rotation = deg2rad(-25);
export var velocity = 10;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;

var frame_when_pressed = null;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed(key)) :
		var current = get_node('.').rotation;
		var new_rotation = (delta * velocity) + current;
		get_node(".").rotation = clamp(new_rotation, min_rotation, max_rotation) 
	else :
		var current = get_node('.').rotation;

		get_node(".").rotation = clamp(min_rotation, min_rotation, max_rotation);
	pass
