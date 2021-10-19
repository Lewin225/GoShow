extends Node

onready var vu = $"../vu"
onready var scale = $"../scale"
onready var needle = $"../vu/needle"

var value = 0
var oldval = 0
var needle_angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	needle_angle = clamp(needle_angle - 0.05, 0,1)
	needle_angle = lerp(needle_angle, value, 0.9)
	needle.rect_rotation = clamp((-90) + (needle_angle * 180), -90, 90)

func _physics_process(delta):
	if vu.InValue != null:
		value = vu.InValue / scale.value
		
	
		
	
