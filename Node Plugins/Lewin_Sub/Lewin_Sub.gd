extends Node

onready var A = $"../A"
onready var B = $"../B"
onready var manual = $"../B/manual"

func _physics_process(delta):
	if B.InPort and B.InValue:
		manual.value = B.InValue
	if A.InPort and A.InValue:
		A.OutValue = A.InValue - manual.value
	else:
		A.OutValue = null
		
