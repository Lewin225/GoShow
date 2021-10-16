extends Node


onready var length = $"../Length"
onready var manual = $"../Length/manual"
onready var vec3 = $"../Vec3"

var a = []
var n = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	if length.InValue != null:
		n = length.InValue
		manual.editable = false
		manual.value = length.InValue
	else:
		manual.editable = true
		n = manual.value

	if vec3.InPort:
		a = []
		for i in range(n):
			a.append(vec3.InValue)
		vec3.OutValue = a
		print(vec3.InValue, vec3.OutValue)
		
