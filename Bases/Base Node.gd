tool
extends GraphNode


var store = {}
var x_pos = 0
var y_pos = 0
var x_size = 125
var y_size = 125
var notes = ""
var nodeType


var input_links = {}
var output_links = {}
var _slots = [] # Don't use this, It's just for getting the port InDeX right
var in_ports = []
var all_ports = []
var out_ports = []

var _tags = []
export(Array, Globals.GraphNodeCategories) var tags

func load_store(key):
	if store.has(key):
		return store[key]
	else:
		return null
		
func save_store(key, value):
	store[key] = value
	
func store_populated():
	return len(store) > 0

func _get_raw_save_data():
	return {
		'nodeType':self.filename,
		'sceneNodeId':self.name,
		'store':store,
		'x_pos':x_pos,
		'y_pos':y_pos,
		'x_size':self.rect_size.x,
		'y_size':self.rect_size.y,
		'notes':notes,
	}
	

func _load_save_data(data):
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
	
	
func update_port_data():
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
			
			all_ports.append(port_node)
			if port_node.HasOutPort:
				out_ports.append(port_node)
			if port_node.HasInPort:
				in_ports.append(port_node)

			set_slot (port_idx, #GraphNode Slot Index
			port_node.HasInPort, #Enable Left/ Inport
			port_node.InType,	   #Type Left
			Globals.GraphDataColors[port_node.InType], #Inport Color #TODO Actual Colors
			port_node.HasOutPort, #Enable Right / Outport
			port_node.OutType, #Out/Right Type
			Globals.GraphDataColors[port_node.OutType], #Out/Right Color #TODO Actual Colors
			null, #Left Texture
			null ) #Right Texture
	
func _ready():

	if Engine.editor_hint: # Code to execute in editor.
		update_port_data()
		_tags = []
		for port in all_ports:
			if port.HasInPort:
				_tags.append("in:"+Globals.GraphDataType.keys()[port.InType])
			if port.HasOutPort:
				_tags.append("out:"+Globals.GraphDataType.keys()[port.OutType])
		for tag in tags:
			_tags.append("tag:"+Globals.GraphNodeCategories.keys()[tag])
		
		
	if not Engine.editor_hint: # Code to execute in game.
		update_port_data()

