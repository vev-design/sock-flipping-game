extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _h(delta):
	var velocity = Vector2.ZERO
	#if(Ball.collision_layer)
#	print (Collis)
	position += velocity
	pass
