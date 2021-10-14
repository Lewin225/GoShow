extends Node

onready var multiply = $"../MultiplyPort"
onready var multiplier = $"../MultiplyPort/Multiplier"

func _ready():
	multiply.OutValue = 0

func _physics_process(delta):
	if multiply.InValue:
		multiply.OutValue = (multiply.InValue * multiplier.value)
