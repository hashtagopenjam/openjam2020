extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var velocity = Vector2(0, 10)
onready var Blower = preload("res://src/blower/Blower.tscn")
onready var Faller = preload("res://src/faller/Faller.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	addFaller()

func addFaller():
	var faller = Faller.instance()
	faller.global_position = $Start.global_position
	#faller.linear_velocity = Vector2(100,10)
	add_child(faller)
	faller.apply_impulse(Vector2(0,0), Vector2(200,-10))

func addPuff(pos:Vector2):
	var puff = Blower.instance()
	puff.position = Vector2(pos.x, pos.y)
	add_child(puff)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI.points = score
#	pass
	#var collision = $Blower.move_and_collide(velocity * delta)


func _on_TapArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			#print("Clicked: ",event.position)
			addPuff(event.position)
	if event is InputEventScreenTouch:
		#print("Tapped: ", event.position)
		addPuff(event.position)


func _on_SpawnTimer_timeout():
	addFaller()


func _on_Gate_body_entered(body):
	score += 10
	body.get_parent().remove_child(body)
