extends Node

onready var pick = $"../color/picker"
onready var multi = $"../multi"

func _physics_process(_delta):
	$"../color".OutValue = Vector3(pick.color.r, pick.color.g, pick.color.b) * multi.value
