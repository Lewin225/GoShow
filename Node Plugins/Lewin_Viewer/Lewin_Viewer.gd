extends Node

onready var floatin = $"../float"
onready var booleanin = $"../boolean"
onready var bool_label = $"../bool_label"
onready var float_label = $"../float_label"
onready var vec3 = $"../vec3"
onready var vec3_label = $"../vec_label"
onready var output = $"../float/output"

func _physics_process(delta):

	if floatin.InValue:
		float_label.text = str(floatin.InValue)
	if booleanin.InValue:
		bool_label.text  = str(booleanin.InValue)
	if vec3.InValue:
		vec3_label.text  = str(vec3.InValue)

