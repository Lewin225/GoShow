extends Node

onready var multiply = $"../MultiplyPort"
onready var multiplier = $"../multiplier"
onready var manual = $"../multiplier/manual"

func _ready():
	multiply.OutValue = 0

func _physics_process(_delta):
	if multiplier.InValue != null:
		manual.value = multiplier.InValue
	
	if multiply.InValue:
		multiply.OutValue = (multiply.InValue * manual.value)
