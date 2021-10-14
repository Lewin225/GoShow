extends Node

onready var floatin = $"../float"
onready var booleanin = $"../boolean"
onready var output = $"../float/output"

func _physics_process(delta):
	var text = ""
	if floatin.InValue:
		text += str(floatin.InValue)
	if booleanin.InValue:
		text += "/n" + str(booleanin.InValue)
	output.text = text	
