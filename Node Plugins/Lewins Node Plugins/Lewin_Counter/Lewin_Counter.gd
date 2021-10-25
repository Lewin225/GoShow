extends "res://Bases/Base Node.gd"

onready var boolin = $bool
onready var floatin = $float
onready var label = $float/Label
onready var reset = $reset


var last_float = -1
var last_bool = false

func _physics_process(delta):
	if floatin.InValue != null:
		if floatin.OutValue == null:
			floatin.OutValue = 0
			
		if floatin.InValue != last_float:
			floatin.OutValue += 1
			last_float = floatin.InValue
			
	if boolin.InValue !=  null:
		if boolin.InValue != last_bool and boolin.InValue == false:
			floatin.OutValue += 1
			last_bool = boolin.InValue
	
	if reset.InValue:
		floatin.OutValue = null
		
	label.text = str(floatin.OutValue)
	
