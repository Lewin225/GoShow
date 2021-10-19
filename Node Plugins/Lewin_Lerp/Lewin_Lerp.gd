extends Node

onready var io = $"../IO"
onready var speed = $"../speed"

func _physics_process(delta):
	if io.InValue:
		if io.OutValue == null:
			io.OutValue = 0
		io.OutValue = lerp(io.OutValue, io.InValue, clamp(speed.value,0,1))
	else:
		io.OutValue = null
