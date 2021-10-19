extends Node


onready var frame =  $"../frame"
onready var sprite =  $"../frame/Sprite"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if frame.InValue != null:
		sprite.frame = frame.InValue

