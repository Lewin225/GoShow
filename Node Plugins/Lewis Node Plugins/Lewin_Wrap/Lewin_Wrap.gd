extends "res://Bases/Base Node.gd"

onready var io = $io
onready var mx = $Max

func _physics_process(delta):
	if io.InValue:
		io.OutValue = int(io.InValue) % int(mx.value)
