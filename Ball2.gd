extends KinematicBody2D

export var velocity = Vector2(0, 200);
var screen_size;
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
	var collision_info = move_and_collide(velocity * delta);
	print(collision_info)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		velocity.x *= 1.1
		velocity.y *= 1.1
	
