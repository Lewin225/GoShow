extends Node

onready var channel = $"../channel"
onready var control = $"../control"
onready var device = $"../device"
onready var midiout = $"../midiout"
onready var behavour = $"../behavour"
onready var learn_toggle = $"../learn"

var toggle = false

func _ready():
	behavour.add_item("Limited Encoder")
	behavour.add_item("Endless Encoder")
	behavour.add_item("Push Button")
	behavour.add_item("Toggle Button")

func _unhandled_input(event):
	if event is InputEventMIDI:
		# Learn Mode
		if learn_toggle.pressed:
			channel.value = event.channel
			control.value = event.controller_number
			print(event)
			print("Event.value:", str(event.value))
			#return - Comment in to prevent learn values escaping the node
			
		# Output midi 
		if event.channel == channel.value-1: #Compare indexed at 0
			if event.controller_number == control.value:
				if behavour.selected == 0: #Limited Encoder
					midiout.OutValue = float(event.controller_value)
					
				if behavour.selected == 1: #Endless Encoder
					if event.controller_value > 64:
						midiout.OutValue += float(1)
					if event.controller_value <= 64:
						midiout.OutValue -= float(1)
					
					
				if behavour.selected == 2: #Push Button
					midiout.OutValue = float(event.controller_value)
					
				if behavour.selected == 3: #Toggle Button
					if toggle:
						midiout.OutValue = float(127)
					else:
						midiout.OutValue = float(0)
					toggle = not toggle


			
		
			
