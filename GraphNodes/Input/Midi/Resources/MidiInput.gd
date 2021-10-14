extends GraphNode

var input_nodes = []
var output_nodes = []

var value = -1

var data = {
	'pos':[0,0],
	'siz':[128,512],
	'dev':'',
	'dev_n':-1,
	'cha':0,
	'con':0,
}

var autodetecting = false

var last_midi_devices = []

# Called when the node enters the scene tree for the first time.
func _ready():
	input_nodes.resize(get_connection_input_count())
	output_nodes.resize(get_connection_output_count())

	update_midi_devices()
	for device in last_midi_devices:
		$Device.add_item(device)

func _unhandled_input(event):
	if event is InputEventMIDI:
		print(event.channel)
		if event.controller_number == data['cha']:
			value = event.controller_value


func update_midi_devices():
	last_midi_devices = OS.get_connected_midi_inputs()

func _on_Device_item_selected(index):
	data['dev'] = last_midi_devices[index]
	data['dev_n'] = index
	on_data_changed()

func _on_Channel_value_changed(value):
	data['cha'] = value
	on_data_changed()


func _on_Control_value_changed(value):
	data['con'] = value
	on_data_changed()


func on_data_changed():
	$Device.select(data['dev_n'])
	$Channel.value = data['cha']
	$Control.value = data['con']

