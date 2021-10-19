extends Node


func _physics_process(delta):
	if $"../IO".InValue != null:
		$"../IO/texture".texture = $"../IO".InValue
