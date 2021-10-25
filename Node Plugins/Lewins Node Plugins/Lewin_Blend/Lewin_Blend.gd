extends Node


onready var A = $"../A"
onready var B = $"../B"
onready var mode = $"../mode"


# Called when the node enters the scene tree for the first time.
func _ready():
	mode.add_item("Append")
	mode.add_item("Multiply")
	mode.add_item("Subtract")
	mode.add_item("Add")


func _physics_process(_delta):
	
	if A.InValue != null and B.InValue != null:
		if mode.selected == 0: # Append
			A.OutValue = A.InValue + B.InValue
			
		if mode.selected == 1: # Multiply
			A.OutValue = A.InValue
			var last_val = null
			var a_end = len(A.OutValue)
			for i in range(len(B.InValue)):
				if i >= a_end:
					A.OutValue[i] = A.OutValue[i] * last_val
				else:
					A.OutValue[i] = A.OutValue[i] * B.InValue[i]
					last_val = B.InValue[i]
			
	
	
	# If only one input is connected just output it
	if A.InValue != null and B.InValue == null:
		A.OutValue = A.InValue
	if B.InValue != null and A.InValue == null:
		A.OutValue = B.InValue
		
		
		
