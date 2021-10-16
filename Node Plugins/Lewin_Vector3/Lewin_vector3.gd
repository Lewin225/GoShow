extends Node


onready var X = $"../X"
onready var Y = $"../Y"
onready var Z = $"../Z"
var Vec3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	Vec3 = Vector3.UP
	Y.OutValue = Vec3

func _physics_process(delta):

	if X.InPort:
		Vec3.x = X.InValue
	if Y.InPort:
		Vec3.y = Y.InValue
	if Z.InPort:
		Vec3.z = Z.InValue
	Y.OutValue = Vec3
