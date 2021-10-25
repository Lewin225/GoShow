extends Node

onready var pick = $"../color/picker"
onready var multi = $"../multi"
onready var io = $"../color"

func _physics_process(_delta):
	if io.InValue != null:
		pick.color.r = io.InValue.x
		pick.color.g = io.InValue.y
		pick.color.b = io.InValue.z
		multi.editable = false
	else:
		multi.editable = true
		io.OutValue = Vector3(pick.color.r, pick.color.g, pick.color.b) * multi.value
