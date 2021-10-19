extends Node


onready var X = $"../X"
onready var Y = $"../Y"
onready var Z = $"../Z"
var Vec3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	Vec3 = Vector3.ZERO

func _physics_process(delta):
	
	#Check any ports are connected, if not output null
	if X.InValue != null or Y.InValue != null or Z.InValue !=null:
		
		# These are zeroed if they are null since we don't want (13,Null,Null) or (13,Oldvalue,Oldvalue)
		
		if X.InValue != null:
			Vec3.x = X.InValue
		else:
			Vec3.x = 0
			
		if Y.InValue != null:
			Vec3.y = Y.InValue
		else:
			Vec3.y = 0
			
		if Z.InValue != null:
			Vec3.z = Z.InValue
		else:
			Vec3.z = 0
			
			
		Y.OutValue = Vec3
		
	else:
		Y.OutValue = null
	print(Y.OutValue)
