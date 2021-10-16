extends Node


onready var X = $"../X"
onready var Y = $"../Y"
onready var Z = $"../Z"
var Vec3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	Y.OutValue = Vec3

func _physics_process(delta):
	if X.InPortConnection:
		Vec3.X = X.InValue
	if Y.InPortConnection:
		Vec3.Y = Y.InValue
	if Z.InPortConnection:
		Vec3.Z = Z.InValue
	Y.OutValue = Vec3
