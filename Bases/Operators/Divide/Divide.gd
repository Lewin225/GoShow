extends GraphNode


var input_nodes = []
var output_nodes = []
var value = 0
func _ready():
	input_nodes.resize(get_connection_input_count())
	output_nodes.resize(get_connection_output_count())
	
func _process(delta):
	if input_nodes[0] != null:
		value = float(input_nodes[0].value) / float($A.value)
		
		
