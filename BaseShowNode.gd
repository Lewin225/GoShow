extends GraphNode


var store = {}
var x_pos = 0
var y_pos = 0
var x_size = 125
var y_size = 125
var notes = ""
var nodeType

var colors = [Color('#97dfff'), Color('#e52557'), Color('#74ba4f'), Color('#36ba75')]

var input_links = {}
var output_links = {}
var _slots = [] # Don't use this, It's just for getting the port InDeX right
var in_ports = []
var out_ports = []

func get_save_data():
	return {
		'nodeType':nodeType,
		'store':store,
		'x_pos':x_pos,
		'y_pos':y_pos,
		'x_size':x_size,
		'y_size':y_size,
		'notes':notes,
	}
	
func load_save_data(data):
	nodeType = data['nodeType']
	store = data['store']
	x_pos = data['x_pos']
	y_pos = data['y_pos']
	nodeType = data['type']
	_ready()
	
func get_outport_for_slot(idx):
	return out_ports[idx]
	
func get_inport_for_slot(idx):
	return in_ports[idx]
	
func _ready():
	# Work out which children are ports
	# We still want to keep them all so the correct index
	# can be calculated when setting up the "slots" for graphnode
	var children = get_children()
	for i in children.size():
		_slots.append([children[i],i])
			
	for slot in _slots:
		if slot[0].has_method("_j0vfg5943wukfug54893qw0"): # It's a port
			var port_node = slot[0]
			var port_idx = slot[1]
			
			if port_node.HasOutPort:
				out_ports.append(port_node)
			if port_node.HasInPort:
				in_ports.append(port_node)

			set_slot (port_idx, #GraphNode Slot Index
			port_node.HasInPort, #Enable Left/ Inport
			port_node.InType,	   #Type Left
			colors[port_node.InType], #Inport Color #TODO Actual Colors
			port_node.HasOutPort, #Enable Right / Outport
			port_node.OutType, #Out/Right Type
			colors[port_node.OutType], #Out/Right Color #TODO Actual Colors
			null, #Left Texture
			null ) #Right Texture

