extends Node


func _physics_process(_delta):
	if $"../IO".InValue != null:
		$"../IO/texture".texture = $"../IO".InValue
	else:
		$"../IO/texture".texture = null
