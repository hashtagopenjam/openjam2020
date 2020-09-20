extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TapArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			$Blower.position = Vector2(event.position.x, 1400)
			$Blower.move_and_collide(Vector2(0,9.8))
	if event is InputEventScreenTouch:
		$Blower.position = Vector2(event.position.x, 1400)
		$Blower.move_and_collide(Vector2(0,-10))
