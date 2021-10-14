extends GraphNode


var input_nodes = []
var output_nodes = []

func _ready():
	input_nodes.resize(get_connection_input_count())
	output_nodes.resize(get_connection_output_count())
	
func _process(delta):
	if input_nodes[0] != null:
		$display.text = str(input_nodes[0].value)
