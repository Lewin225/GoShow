extends Node

onready var floatin = $"../float"
onready var booleanin = $"../boolean"
onready var vec3 = $"../vec3"
onready var output = $"../float/output"

func _physics_process(delta):
	var text = ""
	if floatin.InValue:
		text += str(floatin.InValue)
	if booleanin.InValue:
		text += "/n" + str(booleanin.InValue)
	if vec3.InValue:
		print(">?????")
		text += "/n" + str(vec3.InValue.x,vec3.InValue.y,vec3.InValue.z)
	output.text = text	
