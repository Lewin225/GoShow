extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.open_midi_inputs ()
	print(OS.get_connected_midi_inputs())


func _unhandled_input(event):
	pass

